package ls.augment.com.hook;

import android.content.ContentResolver;
import android.content.Context;
import android.provider.Settings;

import java.lang.reflect.Method;

import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * Narrow GameAssist 17 compatibility hooks for Super Resolution and Biablo.
 *
 * <p>This deliberately changes only the qualification and OEM automatic-revert
 * paths reached from the two GameAssist tiles.  It never writes performance
 * mode databases, drives the GPU service, or prevents a user's explicit off
 * action.</p>
 */
final class SuperMirrorDiabloHook {
    private static final String PERFORMANCE =
            "cn.nubia.gameassist.performance.PerformanceModeController";
    private static final String SUPER_VIEW =
            "cn.nubia.plugin.superresolution.SuperResolutionViewController";
    private static final String SUPER_TILE =
            "cn.nubia.gameassist.plugin.tiles.SuperResolutionTile";
    private static final String BIABLO_TILE =
            "cn.nubia.gameassist.plugin.tiles.BiabloTile";

    private SuperMirrorDiabloHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        int installed = 0;
        StringBuilder resolved = new StringBuilder();
        installed += installLowPowerGate(module, resolved);
        installed += installPerformanceGate(module, loader, resolved);
        installed += installSuperResolutionRetention(module, loader, resolved);
        installed += installBiabloCoexistence(module, loader, resolved);

        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.SUPER_MIRROR_INSTALLED,
                "hooks=" + installed + ";resolved=" + resolved);
        if (installed > 0) {
            FeatureSettings.diagnostic(
                    context, FeatureSettings.SUPER_MIRROR_LAST_ERROR, "");
        }
        module.logFeatureInfo("SUPER_MIRROR_READY hooks=" + installed
                + " resolved=" + resolved);
        return installed;
    }

    private static int installLowPowerGate(AugmentModule module, StringBuilder resolved) {
        try {
            Method method = Settings.Global.class.getDeclaredMethod(
                    "getInt", ContentResolver.class, String.class, int.class);
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            method, "super_mirror.low_power", false)
                    .intercept(chain -> {
                        Object original = chain.proceed();
                        Context context = FeatureSettings.from(null);
                        if (!enabled(context, FeatureSettings.SUPER_MIRROR_LOW_MODE)) {
                            return original;
                        }
                        Object key = chain.getArg(1);
                        if (!"low_power".equals(key) || !inTileClick(SUPER_TILE)) {
                            return original;
                        }
                        hit(context, "SR-01|low_power=0");
                        return 0;
                    });
            module.registerFeatureHook(handle);
            addResolved(resolved, "SR-01");
            return 1;
        } catch (Throwable error) {
            report(module, "SR-01", error);
            return 0;
        }
    }

    private static int installPerformanceGate(
            AugmentModule module, ClassLoader loader, StringBuilder resolved) {
        try {
            Class<?> type = Class.forName(PERFORMANCE, false, loader);
            Method method = type.getDeclaredMethod("getPerformanceMode", String.class);
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            method, "super_mirror.performance_mode", false)
                    .intercept(chain -> {
                        Object original = chain.proceed();
                        if (!(original instanceof Number) || !inTileClick(SUPER_TILE)) {
                            return original;
                        }
                        Context context = FeatureSettings.from(chain.getThisObject());
                        int mode = ((Number) original).intValue();
                        boolean low = enabled(context, FeatureSettings.SUPER_MIRROR_LOW_MODE);
                        boolean coexist = enabled(context, FeatureSettings.SUPER_MIRROR_DIABLO_COEXIST);
                        if ((low && (mode == 1 || mode == 2))
                                || (coexist && mode == 5)) {
                            hit(context, "SR-02|mode=" + mode + "->3");
                            return 3;
                        }
                        return original;
                    });
            module.registerFeatureHook(handle);
            addResolved(resolved, "SR-02");
            return 1;
        } catch (Throwable error) {
            report(module, "SR-02", error);
            return 0;
        }
    }

    private static int installSuperResolutionRetention(
            AugmentModule module, ClassLoader loader, StringBuilder resolved) {
        try {
            Class<?> type = Class.forName(SUPER_VIEW, false, loader);
            Method method = type.getDeclaredMethod("L", String.class, boolean.class);
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(
                            method, "super_mirror.super_retention", true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(chain.getThisObject());
                        boolean enable = Boolean.TRUE.equals(chain.getArg(1));
                        if (!enable
                                && enabled(context, FeatureSettings.SUPER_MIRROR_LOW_MODE)
                                && calledFrom(SUPER_VIEW, "i")) {
                            hit(context, "SR-03|blocked_auto_remove");
                            return null;
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(handle);
            addResolved(resolved, "SR-03");
            return 1;
        } catch (Throwable error) {
            report(module, "SR-03", error);
            return 0;
        }
    }

    private static int installBiabloCoexistence(
            AugmentModule module, ClassLoader loader, StringBuilder resolved) {
        int installed = 0;
        try {
            Class<?> type = Class.forName(PERFORMANCE, false, loader);
            Method gate = type.getDeclaredMethod("a0");
            gate.setAccessible(true);
            HookHandle gateHandle = module.prepareFeatureHook(
                            gate, "super_mirror.biablo_gate", true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(chain.getThisObject());
                        if (enabled(context, FeatureSettings.SUPER_MIRROR_DIABLO_COEXIST)
                                && (inTileClick(BIABLO_TILE)
                                || calledFrom(PERFORMANCE, "J0"))) {
                            hit(context, "DB-01|super_resolution_gate=false");
                            return false;
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(gateHandle);
            installed++;
            addResolved(resolved, "DB-01");

            Method setter = type.getDeclaredMethod(
                    "C0", String.class, boolean.class, boolean.class);
            setter.setAccessible(true);
            HookHandle setterHandle = module.prepareFeatureHook(
                            setter, "super_mirror.biablo_auto_reset", true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(chain.getThisObject());
                        boolean enable = Boolean.TRUE.equals(chain.getArg(1));
                        boolean userAction = Boolean.TRUE.equals(chain.getArg(2));
                        if (!enable && !userAction
                                && enabled(context, FeatureSettings.SUPER_MIRROR_DIABLO_COEXIST)
                                && calledFrom(PERFORMANCE, "J0")) {
                            hit(context, "DB-02|blocked_auto_reset");
                            return null;
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(setterHandle);
            installed++;
            addResolved(resolved, "DB-02");
        } catch (Throwable error) {
            report(module, "DB", error);
        }
        return installed;
    }

    private static boolean inTileClick(String className) {
        return calledFrom(className, "T");
    }

    private static boolean enabled(Context context, String key) {
        return FeatureSettings.enabled(context, FeatureSettings.GAME_MASTER)
                && FeatureSettings.enabled(context, key);
    }

    private static boolean calledFrom(String className, String methodName) {
        StackTraceElement[] stack = Thread.currentThread().getStackTrace();
        for (StackTraceElement frame : stack) {
            if (className.equals(frame.getClassName())
                    && methodName.equals(frame.getMethodName())) return true;
        }
        return false;
    }

    private static void hit(Context context, String detail) {
        FeatureSettings.diagnostic(context, FeatureSettings.SUPER_MIRROR_ACTIVE, "1");
        FeatureSettings.diagnostic(context, FeatureSettings.SUPER_MIRROR_LAST_HIT,
                detail + ";ts=" + System.currentTimeMillis());
    }

    private static void addResolved(StringBuilder value, String id) {
        if (value.length() > 0) value.append(',');
        value.append(id);
    }

    private static void report(AugmentModule module, String id, Throwable error) {
        Context context = FeatureSettings.from(null);
        String detail = id + ':' + safeMessage(error);
        FeatureSettings.diagnostic(
                context, FeatureSettings.SUPER_MIRROR_LAST_ERROR, detail);
        module.logFeatureError("SUPER_MIRROR_" + id, error);
    }

    private static String safeMessage(Throwable error) {
        String message = error == null ? "" : error.getMessage();
        if (message == null || message.isEmpty()) {
            return error == null ? "unknown" : error.getClass().getSimpleName();
        }
        return message.replace('\n', ' ').replace('\r', ' ');
    }
}
