package ls.augment.com.hook;

import android.content.Context;
import android.os.SystemClock;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

import io.github.libxposed.api.XposedInterface.HookHandle;

/** Blocks BeautifyAdapter's local trial-expiry/reset paths. */
final class BeautifyAdapterHook {
    private static final String APPLY_SERVICE =
            "com.zte.beautifyadapter.ThemeApplyService";
    private static final String TRY_JOB =
            "com.zte.beautifyadapter.tryuse.TryResourceJobService";
    private static final String RESET_JOB =
            "com.zte.beautifyadapter.tryuse.ResetResourceJobService";
    private static final AtomicBoolean BOOT_RESET_PENDING = new AtomicBoolean();
    private static final ThreadLocal<Boolean> REPLAY_BOOT_RESET =
            ThreadLocal.withInitial(() -> false);
    private static final ThreadLocal<Boolean> APPLYING_RESOURCE =
            ThreadLocal.withInitial(() -> false);
    private static final AtomicLong RESOURCE_APPLICATIONS = new AtomicLong();
    private static final ScheduledExecutorService STARTUP = Executors.newSingleThreadScheduledExecutor(task -> {
        Thread thread = new Thread(task, "LS-theme-startup");
        thread.setDaemon(true);
        return thread;
    });

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
            installed += installResourceApplication(module, service);

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
                        if (!APPLYING_RESOURCE.get() && unlimitedEnabled(context)) {
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
                        // A deliberate native resource replacement must leave the prior
                        // trial normally. Only expiry and startup resets are suppressed.
                        if (APPLYING_RESOURCE.get()) return chain.proceed();
                        // b0(0x111) resets all existing trials during adapter startup.
                        // Its first call can precede the async configuration read; treating
                        // the placeholder defaults as an explicit off setting destroys the
                        // theme before the font reset reaches the now-loaded configuration.
                        if (resetType == 0x111 && !REPLAY_BOOT_RESET.get()
                                && (BOOT_RESET_PENDING.get()
                                || !FeatureSettings.hasVerifiedSnapshot(context))) {
                            deferBootReset(module, method, resetType, context);
                            return null;
                        }
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

    private static void deferBootReset(AugmentModule module, Method method, int resetType,
            Context context) {
        if (!BOOT_RESET_PENDING.compareAndSet(false, true)) return;
        long started = SystemClock.elapsedRealtime();
        long applicationGeneration = RESOURCE_APPLICATIONS.get();
        FeatureSettings.diagnostic(context, "ls_augment_beautify_boot_guard", "waiting_for_saved_config");
        STARTUP.execute(new Runnable() {
            @Override public void run() {
                Context application = FeatureSettings.from(null);
                if (RESOURCE_APPLICATIONS.get() != applicationGeneration) {
                    FeatureSettings.diagnostic(application, "ls_augment_beautify_boot_guard",
                            "native_reset_superseded_by_resource_application");
                    BOOT_RESET_PENDING.set(false);
                    return;
                }
                boolean ready = FeatureSettings.hasVerifiedSnapshot(application);
                long elapsed = SystemClock.elapsedRealtime() - started;
                // Never block a Binder caller or the app main thread. If every source is
                // unavailable, eventually preserve the native default behavior.
                if (!ready && elapsed < 10000) {
                    STARTUP.schedule(this, 100, TimeUnit.MILLISECONDS);
                    return;
                }
                try {
                    REPLAY_BOOT_RESET.set(true);
                    FeatureSettings.diagnostic(application, "ls_augment_beautify_boot_guard",
                            (ready ? "saved_config_ready" : "native_fallback_timeout")
                                    + ";wait_ms=" + elapsed + ";enabled=" + unlimitedEnabled(application));
                    // Invoke a new call through the installed hook; never retain a hook chain.
                    // The verified setting now decides whether the original reset proceeds.
                    method.invoke(null, resetType);
                } catch (Throwable error) {
                    module.logFeatureError("BEAUTIFY_ADAPTER_BOOT_RESET_REPLAY", error);
                } finally {
                    REPLAY_BOOT_RESET.remove();
                    BOOT_RESET_PENDING.set(false);
                }
            }
        });
    }

    private static int installResourceApplication(AugmentModule module, Class<?> type) {
        // x(int, path, id) is the verified applyResourceInternal entry. It contains
        // the native stopTrial calls for the resource being deliberately replaced.
        Method method = findMethod(type, "x", int.class, int.class, String.class, String.class);
        if (method == null) return 0;
        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareFeatureHook(method,
                            "beautify.unlimited_trial.native_resource_application", true)
                    .intercept(chain -> {
                        boolean previous = APPLYING_RESOURCE.get();
                        if (!previous) RESOURCE_APPLICATIONS.incrementAndGet();
                        APPLYING_RESOURCE.set(true);
                        try {
                            return chain.proceed();
                        } finally {
                            if (previous) APPLYING_RESOURCE.set(true);
                            else APPLYING_RESOURCE.remove();
                        }
                    });
            module.registerFeatureHook(handle);
            return 1;
        } catch (Throwable error) {
            module.logFeatureError("BEAUTIFY_ADAPTER_RESOURCE_APPLICATION", error);
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
