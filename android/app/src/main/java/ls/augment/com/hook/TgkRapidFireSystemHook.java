package ls.augment.com.hook;

import android.content.Context;

import java.lang.reflect.Method;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Bridges the GameSpace TGK request into the native EventProducer profile in
 * system_server. The native layer is loaded only when a target above the OEM
 * 10 CPS ceiling is actually requested.
 */
final class TgkRapidFireSystemHook {
    private static final String INPUT_MANAGER_SERVICE =
            "com.android.server.input.InputManagerService";
    private static final int LEFT_KEY = 137;
    private static final int RIGHT_KEY = 138;
    private static final int OEM_MAX_CPS = 10;
    private static final int MAX_CPS = 50;

    private static volatile long lastDiagnostic;

    private TgkRapidFireSystemHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        try {
            Class<?> service = Class.forName(INPUT_MANAGER_SERVICE, false, classLoader);
            Method method = findMethod(service, "setTgkRapidFireCount",
                    int.class, int.class);
            if (method == null) throw new NoSuchMethodException(
                    INPUT_MANAGER_SERVICE + ".setTgkRapidFireCount");
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            method, "tgk.rapid_fire_system", true)
                    .intercept(chain -> intercept(module, chain));
            module.registerFeatureHook(handle);
            module.logFeatureInfo("TGK_RAPID_FIRE_SYSTEM_INSTALLED "
                    + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeDiagnostic(FeatureSettings.from(null),
                    FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                    "java_install=" + error.getClass().getSimpleName()
                            + ":" + safe(error.getMessage()));
            module.logFeatureError("TGK_RAPID_FIRE_SYSTEM_FAILED", error);
            return 0;
        }
    }

    private static Object intercept(AugmentModule module, Chain chain) throws Throwable {
        Object keyValue = chain.getArg(1);
        int keyCode = keyValue instanceof Number ? ((Number) keyValue).intValue() : -1;
        if (keyCode != LEFT_KEY && keyCode != RIGHT_KEY) return chain.proceed();

        Context context = FeatureSettings.from(chain.getThisObject());
        Object countValue = chain.getArg(0);
        int requested = countValue instanceof Number ? ((Number) countValue).intValue() : 0;
        requested = Math.max(0, Math.min(MAX_CPS, requested));

        boolean enabled = FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                && FeatureSettings.enabled(context, FeatureSettings.TGK_RAPID_FIRE_ENABLED,
                false);
        if (!enabled || requested <= OEM_MAX_CPS) {
            // Clearing the native target is enough to restore the OEM path.
            // The inline hook remains installed for the lifetime of
            // system_server to avoid an unsafe concurrent unhook.
            TgkRapidFireNative.setTarget(context, keyCode, 0);
            return chain.proceed();
        }

        writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_STATE,
                "java_hit|key=" + keyCode + "|requested=" + requested);

        if (!TgkRapidFireNative.ensureInstalled(module, context)) {
            writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_ERROR,
                    "fallback|state=" + safe(TgkRapidFireNative.state(context)));
            return chain.proceed();
        }

        TgkRapidFireNative.setTarget(context, keyCode, requested);
        hit(context, keyCode, requested);
        return chain.proceed();
    }

    private static void hit(Context context, int keyCode, int cps) {
        long now = System.currentTimeMillis();
        if (now - lastDiagnostic < 500L) return;
        lastDiagnostic = now;
        writeDiagnostic(context, FeatureSettings.TGK_RAPID_FIRE_NATIVE_LAST_HIT,
                "key=" + keyCode + "|cps=" + cps + "|" + now);
    }

    private static Method findMethod(Class<?> type, String name, Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try { return current.getDeclaredMethod(name, parameters); }
            catch (NoSuchMethodException ignored) { }
        }
        return null;
    }

    private static void writeDiagnostic(Context context, String key, String value) {
        try { FeatureSettings.diagnostic(context, key, value); }
        catch (Throwable ignored) { }
    }

    private static String safe(String value) {
        return value == null ? "" : value.replace('|', '_').replace('\n', ' ');
    }
}
