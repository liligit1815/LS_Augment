package ls.augment.com.hook;

import android.content.Context;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** Blocks BeautifyAdapter's local trial-expiry/reset paths. */
final class BeautifyAdapterHook {
    private static final String APPLY_SERVICE =
            "com.zte.beautifyadapter.ThemeApplyService";
    private static final String TRY_JOB =
            "com.zte.beautifyadapter.tryuse.TryResourceJobService";
    private static final String RESET_JOB =
            "com.zte.beautifyadapter.tryuse.ResetResourceJobService";

    private BeautifyAdapterHook() { }

    static int install(AugmentModule module, ClassLoader classLoader) {
        int installed = installCurrentApplyService(module, classLoader);
        installed += installJob(module, classLoader, TRY_JOB, "adapter_expiry_job");
        installed += installJob(module, classLoader, RESET_JOB, "adapter_reset_job");
        Context context = FeatureSettings.from(null);
        FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_ADAPTER_INSTALLED,
                "hooks=" + installed);
        if (installed > 0) {
            FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_ERROR, "");
        }
        return installed;
    }

    /**
     * Current firmware performs trial recovery in ThemeApplyService rather
     * than through the two JobService classes used by older firmware. Keep
     * both generations covered because the adapter APK is independently
     updated from Beautify.
     */
    private static int installCurrentApplyService(AugmentModule module,
            ClassLoader classLoader) {
        try {
            Class<?> service = Class.forName(APPLY_SERVICE, false, classLoader);
            int installed = 0;

            // Combined reset paths used after boot and when a trial expires.
            installed += installResetMethod(module, service, "X", int.class,
                    "adapter_reset_to_pre_or_default");
            installed += installResetMethod(module, service, "a0", void.class,
                    "adapter_reset_to_pre_or_default_async");

            // Direct resource reset paths used by the current adapter.
            installed += installResetMethod(module, service, "Y", int.class,
                    "adapter_reset_theme");
            installed += installResetMethod(module, service, "Z", int.class,
                    "adapter_reset_wallpaper");
            installed += installResetMethod(module, service, "U", int.class,
                    "adapter_reset_font");

            // The adapter clears trial_key before/alongside the reset. Keep
            // the bit intact while unlimited trial is enabled.
            installed += installTrialFlagReset(module, service);
            installed += installTrialStatus(module, service, "G",
                    "adapter_theme_trial_status");
            installed += installTrialStatus(module, service, "D",
                    "adapter_wallpaper_trial_status");

            if (installed > 0) {
                module.logFeatureInfo("BEAUTIFY_ADAPTER_CURRENT_SERVICE_INSTALLED "
                        + installed);
            }
            return installed;
        } catch (Throwable error) {
            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_ERROR,
                    "adapter_current_service:" + error.getClass().getSimpleName());
            module.logFeatureError("BEAUTIFY_ADAPTER_CURRENT_SERVICE", error);
            return 0;
        }
    }

    private static int installResetMethod(AugmentModule module, Class<?> type,
            String name, Class<?> returnType, String id) {
        Method method = findMethod(type, name, returnType, int.class);
        if (method == null && "Y".equals(name)) {
            method = findMethod(type, name, returnType);
        }
        if (method == null && "Z".equals(name)) {
            method = findMethod(type, name, returnType);
        }
        if (method == null && "U".equals(name)) {
            method = findMethod(type, name, returnType);
        }
        if (method == null) {
            return 0;
        }
        try {
            final Method targetMethod = method;
            targetMethod.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(targetMethod,
                            "beautify.unlimited_trial." + id, true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(null);
                        if (unlimitedEnabled(context)) {
                            hit(context, id + "_blocked");
                            return defaultReturn(targetMethod.getReturnType());
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(handle);
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("BEAUTIFY_ADAPTER_" + id, error);
            return 0;
        }
    }

    private static int installTrialFlagReset(AugmentModule module, Class<?> type) {
        Method method = findMethod(type, "b0", void.class, int.class);
        if (method == null) return 0;
        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(method,
                            "beautify.unlimited_trial.adapter_trial_flag_reset", true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(null);
                        Object value = chain.getArg(0);
                        int resetType = value instanceof Number
                                ? ((Number) value).intValue() : -1;
                        if (unlimitedEnabled(context) && isTrialResetType(resetType)) {
                            hit(context, "adapter_trial_flag_reset_blocked:type=" + resetType);
                            return null;
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(handle);
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("BEAUTIFY_ADAPTER_TRIAL_FLAG_RESET", error);
            return 0;
        }
    }

    private static int installTrialStatus(AugmentModule module, Class<?> type,
            String name, String id) {
        Method method = findMethod(type, name, boolean.class);
        if (method == null) return 0;
        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(method,
                            "beautify.unlimited_trial." + id, true)
                    .intercept(chain -> {
                        Context context = FeatureSettings.from(null);
                        if (unlimitedEnabled(context)) {
                            hit(context, id + "_forced");
                            return true;
                        }
                        return chain.proceed();
                    });
            module.registerFeatureHook(handle);
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("BEAUTIFY_ADAPTER_" + id, error);
            return 0;
        }
    }

    private static boolean isTrialResetType(int type) {
        return type == 1 || type == 4 || type == 6 || type == 7 || type == 0x111;
    }

    private static Method findMethod(Class<?> type, String name, Class<?> returnType,
            Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            for (Method method : current.getDeclaredMethods()) {
                if (!name.equals(method.getName())
                        || Modifier.isAbstract(method.getModifiers())
                        || method.getReturnType() != returnType) continue;
                Class<?>[] actual = method.getParameterTypes();
                if (actual.length != parameters.length) continue;
                boolean matches = true;
                for (int i = 0; i < actual.length; i++) {
                    if (!actual[i].equals(parameters[i])) {
                        matches = false;
                        break;
                    }
                }
                if (matches) return method;
            }
        }
        return null;
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

    private static Object defaultReturn(Class<?> type) {
        if (type == void.class || !type.isPrimitive()) return null;
        if (type == boolean.class) return false;
        if (type == long.class) return 0L;
        if (type == float.class) return 0f;
        if (type == double.class) return 0d;
        if (type == char.class) return '\0';
        return 0;
    }

    private static int installJob(AugmentModule module, ClassLoader classLoader,
            String className, String id) {
        try {
            Class<?> type = Class.forName(className, false, classLoader);
            for (Method method : type.getDeclaredMethods()) {
                if (!"onStartJob".equals(method.getName()) || method.getParameterCount() != 1) continue;
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(method,
                                "beautify.unlimited_trial." + id, true)
                        .intercept(chain -> {
                            Context context = FeatureSettings.from(chain.getThisObject());
                            if (FeatureSettings.enabled(context, FeatureSettings.APP_MASTER)
                                    && FeatureSettings.enabled(context,
                                    FeatureSettings.BEAUTIFY_UNLIMITED_TRIAL)) {
                                FeatureSettings.diagnostic(context,
                                        FeatureSettings.BEAUTIFY_ACTIVE, "1");
                                FeatureSettings.diagnostic(context,
                                        FeatureSettings.BEAUTIFY_LAST_HIT,
                                        id + "_blocked;ts=" + System.currentTimeMillis());
                                return false;
                            }
                            return chain.proceed();
                        });
                module.registerFeatureHook(handle);
                module.logFeatureInfo("BEAUTIFY_ADAPTER_INSTALLED " + className);
                return 1;
            }
            return 0;
        } catch (Throwable error) {
            Context context = FeatureSettings.from(null);
            FeatureSettings.diagnostic(context, FeatureSettings.BEAUTIFY_LAST_ERROR,
                    id + ":" + error.getClass().getSimpleName());
            module.logFeatureError("BEAUTIFY_ADAPTER_" + id, error);
            return 0;
        }
    }
}
