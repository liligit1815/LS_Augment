package ls.augment.com.hook;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import ls.augment.com.BuildConfig;
import ls.augment.com.ConfigSchema;
import ls.augment.com.RapidFireCompatibility;
import ls.augment.com.RapidFireRouteEvidence;

import java.lang.reflect.Method;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Transports the user-selected target CPS from GameSpace to InputManager.
 * The OEM UI exposes only 2/5/10; the system_server native hook performs the
 * actual interval adjustment after the OEM EventProducer calculation.
 */
final class TgkRapidFireHook {
    private static final String PROXY = "cn.nubia.tgk.proxy.InputManagerProxy";
    private static final String ENABLED = FeatureSettings.TGK_RAPID_FIRE_ENABLED;
    private static final String COUNT = FeatureSettings.TGK_RAPID_FIRE_COUNT;
    private static volatile long lastDiagnostic;
    private static volatile long lastInstalledPublish;
    private static volatile String installedDescriptor;
    private static volatile String installError;
    private static volatile int contextReadyAttempts;
    private static final RapidFireRouteEvidence.Calls ROUTE_CALLS = new RapidFireRouteEvidence.Calls();

    private TgkRapidFireHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        try {
            Class<?> proxy = Class.forName(PROXY, false, classLoader);
            Method method = proxy.getDeclaredMethod(
                    "setTgkRapidFireCount", int.class, int.class);
            method.setAccessible(true);
            // This is the actual outgoing Binder proxy, after any vendor translation.
            // A ThreadLocal ties its code to the enclosing upper call, even when the
            // OEM refreshes both keys sequentially or concurrently.
            Class<?> transport = Class.forName("android.hardware.input.IInputManager$Stub$Proxy",
                    false, classLoader);
            Method transportMethod = transport.getDeclaredMethod("setTgkRapidFireCount", int.class, int.class);
            transportMethod.setAccessible(true);
            boolean transportDeoptimized = module.deoptimize(transportMethod);
            module.deoptimize(method);
            HookHandle transportHandle = module.prepareFeatureHook(transportMethod,
                            "tgk.rapid_fire_route", true)
                    .intercept(chain -> {
                        RapidFireRouteEvidence.Trace trace = ROUTE_CALLS.current();
                        try {
                            Object result = chain.proceed();
                            if (trace != null) {
                                Object key = chain.getArg(1);
                                trace.observe(key instanceof Number ? ((Number) key).intValue() : -1);
                            }
                            return result;
                        } catch (Throwable error) {
                            if (trace != null) trace.reject();
                            throw error;
                        }
                    });
            module.registerFeatureHook(transportHandle);
            HookHandle handle = module.prepareFeatureHook(
                    method, "tgk.rapid_fire_count", true)
                    .intercept(chain -> intercept(module, chain));
            module.registerFeatureHook(handle);
            installedDescriptor = method.toGenericString()
                    + "|route=binder_proxy|route_deopt=" + transportDeoptimized
                    + "|module=" + BuildConfig.VERSION_NAME
                    + "|schema=" + ConfigSchema.VERSION;
            publishInstalledWhenContextReady();
            module.logFeatureInfo("TGK_RAPID_FIRE_INSTALLED " + method.toGenericString());
            return 2;
        } catch (Throwable error) {
            installError = "module=" + BuildConfig.VERSION_NAME + "|"
                    + error.getClass().getSimpleName() + ":" + safe(error.getMessage());
            publishInstalledWhenContextReady();
            module.logFeatureError("TGK_RAPID_FIRE_FAILED", error);
            return 0;
        }
    }

    private static Object intercept(AugmentModule module, Chain chain) throws Throwable {
        Object keyValue = chain.getArg(1);
        int keyCode = keyValue instanceof Number ? ((Number) keyValue).intValue() : -1;
        if (keyCode <= 0 || keyCode > 65535) return chain.proceed();

        Context context = FeatureSettings.from(chain.getThisObject());
        publishInstalled(context);
        Object original = chain.getArg(0);
        int old = original instanceof Number ? ((Number) original).intValue() : -1;
        // The OEM sends zero (or a negative sentinel on some builds) when a
        // rapid-fire mapping is being cleared.  Preserve that lifecycle
        // signal; only positive mode values are transport requests.
        if (old <= 0) return chain.proceed();

        long now = System.currentTimeMillis();
        RapidFireCompatibility.Session session = RapidFireCompatibility.Session.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_TEST_SESSION, ""));
        if (testWindowActive(session, now, context)) {
            if (session.state == RapidFireCompatibility.State.WAIT_LEFT
                    || session.state == RapidFireCompatibility.State.WAIT_RIGHT) {
                try (RapidFireRouteEvidence.Calls.Scope call = ROUTE_CALLS.begin()) {
                    Object result = old == RapidFireCompatibility.TEST_CPS ? chain.proceed()
                            : chain.proceed(new Object[]{RapidFireCompatibility.TEST_CPS, keyCode});
                    int systemCode = call.trace.resolvedSystem();
                    if (systemCode > 0) {
                        FeatureSettings.recordRapidRoute(context, session.id, session.state.name(), keyCode, systemCode);
                    } else {
                        writeDiagnostic(context, "test_route_error", "id=" + session.id
                                + "|phase=" + session.state.name() + "|upper=" + keyCode
                                + "|reason=no_unique_synchronous_transport");
                    }
                    return result;
                }
            }
            if (sideForUpper(session, keyCode) != null) {
                return old == RapidFireCompatibility.TEST_CPS ? chain.proceed()
                        : chain.proceed(new Object[]{RapidFireCompatibility.TEST_CPS, keyCode});
            }
        }

        RapidFireCompatibility.Token token = RapidFireCompatibility.Token.parse(
                FeatureSettings.text(context,
                        FeatureSettings.TGK_RAPID_FIRE_COMPAT_TOKEN, ""));
        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                && FeatureSettings.enabled(context, ENABLED, false);
        if (!enabled || token == null
                || !token.validFor(RapidFireCompatibility.currentFingerprint(context))
                || !token.acceptsUpper(keyCode)) {
            return chain.proceed();
        }
        int count = FeatureSettings.integer(context, COUNT, 20, 10, 50);
        // Always send the current value.  The OEM TGK cache can still contain
        // a previous higher value after the user lowers the slider; retaining
        // the old >= count shortcut would make the system_server layer see a
        // stale target and keep the previous speed active.
        if (old == count) return chain.proceed();
        hit(context, "key=" + keyCode + "|" + old + "->" + count);
        return chain.proceed(new Object[]{count, keyCode});
    }

    private static String sideForUpper(RapidFireCompatibility.Session session, int keyCode) {
        if (keyCode == session.upperLeft) return "left";
        if (keyCode == session.upperRight) return "right";
        return null;
    }

    private static boolean testWindowActive(RapidFireCompatibility.Session session, long now,
            Context context) {
        return session != null && session.active(now)
                && session.validFor(RapidFireCompatibility.currentFingerprint(context))
                && (session.state != RapidFireCompatibility.State.VERIFYING
                || now - session.verifyingSince
                <= RapidFireCompatibility.STABILITY_REQUIRED_MS);
    }

    private static void hit(Context context, String value) {
        long now = System.currentTimeMillis();
        if (now - lastDiagnostic < 500L) return;
        lastDiagnostic = now;
        writeDiagnostic(context, "last_hit", value + "|" + now);
    }

    private static void publishInstalled(Context context) {
        String descriptor = installedDescriptor;
        if (context != null && installError != null) {
            writeDiagnostic(context, "last_error", installError);
            return;
        }
        if (context == null || descriptor == null) return;
        long now = System.currentTimeMillis();
        if (now - lastInstalledPublish < 5_000L) return;
        lastInstalledPublish = now;
        writeDiagnostic(context, "installed", descriptor);
    }

    /** Vendor app processes can install the Hook before their Application exists. */
    private static void publishInstalledWhenContextReady() {
        Context context = FeatureSettings.from(null);
        // ActivityThread may expose only its system Context before Application
        // creation. That context cannot attribute a Provider call to the vendor UID.
        if (context != null && ("cn.nubia.gamelauncher".equals(context.getPackageName())
                || "cn.nubia.gameassist".equals(context.getPackageName()))) {
            contextReadyAttempts = 0;
            publishInstalled(context);
            return;
        }
        int attempt = ++contextReadyAttempts;
        if (attempt > 60) return;
        try {
            Looper looper = Looper.getMainLooper();
            if (looper == null) return;
            new Handler(looper).postDelayed(
                    TgkRapidFireHook::publishInstalledWhenContextReady, 1_000L);
        } catch (Throwable ignored) { }
    }

    private static void writeDiagnostic(String suffix, String value) {
        writeDiagnostic(FeatureSettings.from(null), suffix, value);
    }

    private static void writeDiagnostic(Context context, String suffix, String value) {
        try {
            FeatureSettings.diagnostic(context,
                    "ls_augment_tgk_rapid_fire_" + suffix, value);
        } catch (Throwable ignored) { }
    }

    private static String safe(String value) {
        return value == null ? "" : value.replace('|', '_').replace('\n', ' ');
    }
}
