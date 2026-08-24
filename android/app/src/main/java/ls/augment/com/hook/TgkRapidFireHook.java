package ls.augment.com.hook;

import android.content.Context;

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

    private TgkRapidFireHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        try {
            Class<?> proxy = Class.forName(PROXY, false, classLoader);
            Method method = proxy.getDeclaredMethod(
                    "setTgkRapidFireCount", int.class, int.class);
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                    method, "tgk.rapid_fire_count", true)
                    .intercept(chain -> intercept(module, chain));
            module.registerFeatureHook(handle);
            writeDiagnostic("installed", method.toGenericString());
            module.logFeatureInfo("TGK_RAPID_FIRE_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            writeDiagnostic("last_error", error.getClass().getSimpleName()
                    + ":" + safe(error.getMessage()));
            module.logFeatureError("TGK_RAPID_FIRE_FAILED", error);
            return 0;
        }
    }

    private static Object intercept(AugmentModule module, Chain chain) throws Throwable {
        Object keyValue = chain.getArg(1);
        int keyCode = keyValue instanceof Number ? ((Number) keyValue).intValue() : -1;
        if (keyCode != 136 && keyCode != 137 && keyCode != 138) return chain.proceed();

        Context context = FeatureSettings.from(chain.getThisObject());
        if (!FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER, false)
                || !FeatureSettings.enabled(context, ENABLED, false)) {
            return chain.proceed();
        }
        int count = FeatureSettings.integer(context, COUNT, 20, 10, 50);
        Object original = chain.getArg(0);
        int old = original instanceof Number ? ((Number) original).intValue() : -1;
        // The OEM sends zero (or a negative sentinel on some builds) when a
        // rapid-fire mapping is being cleared.  Preserve that lifecycle
        // signal; only positive mode values are transport requests.
        if (old <= 0) return chain.proceed();
        // Always send the current value.  The OEM TGK cache can still contain
        // a previous higher value after the user lowers the slider; retaining
        // the old >= count shortcut would make the system_server layer see a
        // stale target and keep the previous speed active.
        if (old == count) return chain.proceed();
        hit("key=" + keyCode + "|" + old + "->" + count);
        return chain.proceed(new Object[]{count, keyCode});
    }

    private static void hit(String value) {
        long now = System.currentTimeMillis();
        if (now - lastDiagnostic < 500L) return;
        lastDiagnostic = now;
        writeDiagnostic("last_hit", value + "|" + now);
    }

    private static void writeDiagnostic(String suffix, String value) {
        try {
            FeatureSettings.diagnostic(FeatureSettings.from(null),
                    "ls_augment_tgk_rapid_fire_" + suffix, value);
        } catch (Throwable ignored) { }
    }

    private static String safe(String value) {
        return value == null ? "" : value.replace('|', '_').replace('\n', ' ');
    }
}
