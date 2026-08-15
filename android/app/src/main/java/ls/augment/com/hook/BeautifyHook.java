package ls.augment.com.hook;

import android.content.Context;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** Keeps confirmed local trial resources active without changing paid entitlements. */
final class BeautifyHook {
    private BeautifyHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        int installed = installUnlimitedTrial(module, classLoader);
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_INSTALLED,
                "hooks=" + installed);
        if (installed > 0) {
            FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_ERROR, "");
        }
        return installed;
    }

    private static int installUnlimitedTrial(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        try {
            Class<?> helper = Class.forName(
                    "com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper",
                    false, classLoader);
            for (Method method : helper.getDeclaredMethods()) {
                if (!"schedule".equals(method.getName()) || method.getParameterCount() != 2) continue;
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "beautify.unlimited_trial.schedule", true)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getArg(0));
                            Object type = chain.getArg(1);
                            if (FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                    && FeatureSettings.enabled(context,
                                    FeatureSettings.BEAUTIFY_UNLIMITED_TRIAL)
                                    && type instanceof Integer && ((Integer) type) == 0) {
                                FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_ACTIVE, "1");
                                FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_HIT,
                                        "trial_reset_schedule_blocked;ts=" + System.currentTimeMillis());
                                return null;
                            }
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                installed++;
            }
        } catch (Throwable error) {
            report(module, "TRIAL_SCHEDULE_HOOK_FAILED", error);
        }
        try {
            Class<?> service = Class.forName(
                    "com.zte.beautify.view.common.preview.tryuse.RealResetResourceJobService",
                    false, classLoader);
            for (Method method : service.getDeclaredMethods()) {
                if (!"onStartJob".equals(method.getName()) || method.getParameterCount() != 1) continue;
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "beautify.unlimited_trial.expiry_job", true)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getThisObject());
                            if (FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                    && FeatureSettings.enabled(context,
                                    FeatureSettings.BEAUTIFY_UNLIMITED_TRIAL)) {
                                FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_ACTIVE, "1");
                                FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_HIT,
                                        "trial_expiry_job_blocked;ts=" + System.currentTimeMillis());
                                return false;
                            }
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                installed++;
            }
        } catch (Throwable error) {
            report(module, "TRIAL_JOB_HOOK_FAILED", error);
        }
        installed += installMainTrialEntry(module, classLoader);
        installed += installMainResetProcesses(module, classLoader);
        installed += installExpiredDialogs(module, classLoader);
        return installed;
    }

    /**
     * Main themes, fonts and live wallpapers use StartTryResourcePage rather
     * than the outer-display schedule(int=0) path. The type filter is kept
     * deliberately narrow so unrelated vendor jobs remain untouched.
     */
    private static int installMainTrialEntry(AugmentModule module, ClassLoader classLoader) {
        try {
            Class<?> helper = Class.forName(
                    "com.zte.beautify.view.common.preview.tryuse.TryUseJobHelper",
                    false, classLoader);
            int installed = 0;
            for (Method method : helper.getDeclaredMethods()) {
                if (!"StartTryResourcePage".equals(method.getName())
                        || method.getParameterCount() != 1
                        || Modifier.isAbstract(method.getModifiers())) continue;
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "beautify.unlimited_trial.main_expiry_entry", true)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getThisObject());
                            Object value = chain.getArg(0);
                            int type = value instanceof Number ? ((Number) value).intValue() : -1;
                            if (unlimitedEnabled(context) && (type == 1 || type == 4 || type == 6)) {
                                hit(context, "main_expiry_entry_blocked:type=" + type);
                                return defaultReturn(method.getReturnType());
                            }
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                installed++;
            }
            return installed;
        } catch (Throwable error) {
            report(module, "TRIAL_MAIN_ENTRY_HOOK_FAILED", error);
            return 0;
        }
    }

    /** Blocks the dedicated local reset methods for theme/font/live wallpaper trials. */
    private static int installMainResetProcesses(AugmentModule module, ClassLoader classLoader) {
        String className = "com.zte.beautify.view.common.preview.tryuse.ResetResourceJobService";
        String[] names = {"processTheme", "processFont", "processLiveWallpaper"};
        try {
            Class<?> service = Class.forName(className, false, classLoader);
            int installed = 0;
            for (Method method : service.getDeclaredMethods()) {
                if (!contains(names, method.getName()) || method.getParameterCount() != 0
                        || Modifier.isAbstract(method.getModifiers())) continue;
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                                method, "beautify.unlimited_trial." + method.getName(), true)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getThisObject());
                            if (unlimitedEnabled(context)) {
                                hit(context, "trial_reset_blocked:" + method.getName());
                                return defaultReturn(method.getReturnType());
                            }
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                installed++;
            }
            return installed;
        } catch (Throwable error) {
            report(module, "TRIAL_MAIN_RESET_HOOK_FAILED", error);
            return 0;
        }
    }

    /** Suppresses only the two known local trial-expired dialogs. */
    private static int installExpiredDialogs(AugmentModule module, ClassLoader classLoader) {
        String[] classes = {
                "com.zte.beautify.view.common.preview.BeautyPreviewActivity",
                "com.zte.beautify.view.common.preview.online.OnlineThemePreviewFragment"
        };
        int installed = 0;
        for (String className : classes) {
            try {
                Class<?> type = Class.forName(className, false, classLoader);
                for (Method method : type.getDeclaredMethods()) {
                    if (!"popTryUseExpiredDialog".equals(method.getName())
                            || method.getParameterCount() != 0
                            || Modifier.isAbstract(method.getModifiers())) continue;
                    method.setAccessible(true);
                    HookHandle handle = module.prepareFeatureHook(
                                    method, "beautify.unlimited_trial.expired_dialog", true)
                            .intercept(chain -> {
                                Context context = FeatureSettings.from(chain.getThisObject());
                                if (unlimitedEnabled(context)) {
                                    hit(context, "trial_expired_dialog_blocked");
                                    return defaultReturn(method.getReturnType());
                                }
                                return chain.proceed();
                            });
                    module.registerFeatureHook(handle);
                    installed++;
                }
            } catch (Throwable error) {
                report(module, "TRIAL_DIALOG_HOOK_FAILED", error);
            }
        }
        return installed;
    }

    private static boolean unlimitedEnabled(Context context) {
        return FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                && FeatureSettings.enabled(context, FeatureSettings.BEAUTIFY_UNLIMITED_TRIAL);
    }

    private static void hit(Context context, String event) {
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_ACTIVE, "1");
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_HIT,
                event + ";ts=" + System.currentTimeMillis());
    }

    private static boolean contains(String[] values, String expected) {
        for (String value : values) if (value.equals(expected)) return true;
        return false;
    }

    private static Object defaultReturn(Class<?> type) {
        if (type == void.class || !type.isPrimitive()) return null;
        if (type == boolean.class) return false;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;
        if (type == char.class) return '\0';
        return 0;
    }

    private static void report(AugmentModule module, String stage, Throwable error) {
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_ERROR,
                stage + ":" + error.getClass().getSimpleName());
        module.logFeatureError("BEAUTIFY_" + stage, error);
    }
}
