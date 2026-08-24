package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.database.ContentObserver;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import io.github.libxposed.api.XposedInterface.Chain;
import io.github.libxposed.api.XposedInterface.HookHandle;

/**
 * System-server side freeform policy hooks.  The OEM has three separate
 * gates: a hard count check, an application/component eligibility check, and
 * the normal ActivityRecord/Task freeform capability checks.  They are hooked
 * centrally and read a volatile configuration snapshot; no provider or
 * Settings I/O occurs while WindowManager holds its global lock.
 */
final class FreeformHook {
    private static final String ATM_SERVICE = "com.android.server.wm.ActivityTaskManagerService";
    private static final String ACTIVITY_TASK_SUPERVISOR =
            "com.android.server.wm.ActivityTaskSupervisor";
    private static final String ACTIVITY_CLIENT_CONTROLLER =
            "com.android.server.wm.ActivityClientController";
    private static final String ACTIVITY_RECORD = "com.android.server.wm.ActivityRecord";
    private static final String TASK = "com.android.server.wm.Task";
    private static final String TASK_FRAGMENT = "com.android.server.wm.TaskFragment";
    private static final String TASK_DISPLAY_AREA = "com.android.server.wm.TaskDisplayArea";
    private static final String TDA_MIFAVOR = "com.android.server.wm.TaskDisplayAreaMifavor";
    private static final String TASK_NOT_SUPPORT_WINDOW_REPLY_STATE =
            "com.android.server.wm.TaskNotSupportWindowReplyStateWr";
    private static final String WINDOW_REPLY_ICON_MANAGER =
            "com.zte.wr.WindowReplyIconManager";
    private static final String WINDOW_REPLY_GARBAGE_MANAGER =
            "com.zte.wr.GarbageManager";
    private static final String WINDOW_REPLY_SERVICE =
            "com.zte.wr.WindowReplyService";

    private static final Set<String> PROTECTED_PACKAGES = new HashSet<>();
    static {
        String[] values = {
                "android", "com.android.systemui", "com.android.keyguard",
                "com.android.permissioncontroller", "com.google.android.permissioncontroller",
                "com.android.packageinstaller", "com.google.android.packageinstaller",
                "com.android.shell", "com.android.server.telecom", "com.android.incallui",
                "com.android.documentsui", "com.android.providers.settings",
                "com.android.providers.downloads", "com.zte.mifavor.launcher",
                "com.android.launcher3", "com.google.android.apps.nexuslauncher",
                "ls.augment.com", "io.github.lsf.augment", "org.lsposed.manager",
                "me.weishu.kernelsu", "me.weishu.kernelsu.debug", "com.rifsxd.ksunext",
                "com.topjohnwu.magisk", "me.bmax.apatch"
        };
        for (String value : values) PROTECTED_PACKAGES.add(value);
    }

    private static volatile Config config = Config.DISABLED;
    private static volatile Context context;
    private static volatile boolean observerInstalled;
    private static volatile long lastDiagnostic;
    private static final ThreadLocal<Integer> LIMIT_BYPASS_DEPTH = new ThreadLocal<>();
    private static volatile Method limitGateMethod;
    private static volatile Method windowReplySizeMethod;
    private static volatile Method supervisorStartMethod;
    private static volatile Method supervisorFallbackMethod;
    private static volatile Method oemActivityStateMethod;
    private static volatile Method oemTaskStateMethod;
    private static volatile Method oemTaskStateForTaskMethod;
    private static volatile Method oemResizeableMethod;
    private static volatile Method oemSupportResizeMethod;
    private static volatile Method transitionInnerMethod;
    private static volatile Method transitionDelayMethod;
    private static volatile boolean entryBypassLogged;
    private static volatile boolean entryObservedLogged;
    private static volatile boolean supervisorBypassLogged;
    private static volatile boolean supervisorObservedLogged;
    private static volatile boolean supervisorFallbackLogged;
    private static volatile boolean listBypassLogged;
    private static volatile boolean alertBypassLogged;
    private static volatile boolean iconLimitObservedLogged;
    private static volatile boolean iconServiceObservedLogged;
    private static volatile Handler diagnosticHandler;
    private static volatile String pendingInstalledDiagnostic;

    private FreeformHook() { }

    /**
     * The RedMagic icon host has a second, independent hard limit: its private
     * iconShowIsError method rejects a fourth minimized window when the icon
     * map reaches three entries.  This process is outside system_server, so it
     * needs its own package-scope hook and configuration snapshot.
     */
    static int installIconHost(AugmentModule module, ClassLoader classLoader) {
        if (module == null || classLoader == null) return 0;
        bindContext(findSystemContext(classLoader));
        int installed = 0;
        int deoptimized = 0;
        try {
            Class<?> manager = Class.forName(
                    WINDOW_REPLY_ICON_MANAGER, false, classLoader);
            Class<?> garbageManager = Class.forName(
                    WINDOW_REPLY_GARBAGE_MANAGER, false, classLoader);
            Class<?> service = Class.forName(
                    WINDOW_REPLY_SERVICE, false, classLoader);

            Method limit = findMethod(manager, "iconShowIsError", boolean.class, int.class);
            if (limit == null) {
                module.logFeatureInfo("FREEFORM_ICON_METHOD_MISSING limit");
                return 0;
            }
            limit.setAccessible(true);
            if (module.deoptimize(limit)) deoptimized++;
            HookHandle handle = module.prepareFeatureHook(
                    limit, "freeform.unlimited_icon_count", true)
                    .intercept(chain -> interceptIconLimit(module, chain));
            module.registerFeatureHook(handle);
            installed++;

            // ART can inline the tiny size >= 3 method into either creation
            // path. Deoptimizing both callers makes the hook deterministic on
            // vendor builds that precompile this system application.
            Method outScreen = findMethod(manager, "iconShowOutScreen", void.class,
                    Bundle.class, garbageManager, boolean.class, boolean.class);
            if (outScreen != null && module.deoptimize(outScreen)) deoptimized++;
            Method inScreen = findMethod(manager, "iconInScreenCreate", void.class,
                    Bundle.class, garbageManager);
            if (inScreen != null && module.deoptimize(inScreen)) deoptimized++;

            // The service entry is deliberately hooked as well as the tiny
            // private gate. RedMagic ships this application AOT-compiled and
            // can inline iconShowIsError into its callers. While handling a
            // fourth (or later) icon request, temporarily park enough existing
            // map entries for the stock creation path to run, then restore
            // them. This preserves all vendor icon/animation behavior without
            // depending on whether ART retained the private method call.
            Method onStartCommand = findMethod(service, "onStartCommand", int.class,
                    Intent.class, int.class, int.class);
            if (onStartCommand != null) {
                onStartCommand.setAccessible(true);
                if (module.deoptimize(onStartCommand)) deoptimized++;
                HookHandle serviceHandle = module.prepareFeatureHook(
                        onStartCommand, "freeform.unlimited_icon_service", true)
                        .intercept(chain -> interceptIconServiceStart(module, chain));
                module.registerFeatureHook(serviceHandle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_ICON_METHOD_MISSING service_entry");
            }

            module.logFeatureInfo("FREEFORM_ICON_HOOK_READY installed=" + installed
                    + " deoptimized=" + deoptimized);
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_ICON_HOOK_FAILED", error);
        }
        return installed;
    }

    static int install(AugmentModule module, ClassLoader classLoader) {
        if (module == null || classLoader == null) return 0;
        bindContext(findSystemContext(classLoader));
        int installed = 0;
        int deoptimized = 0;
        try {
            Class<?> service = Class.forName(ATM_SERVICE, false, classLoader);
            Method limit = findMethod(service, "isReachWrMaxSizeForMulti", boolean.class);
            if (limit != null) {
                limitGateMethod = limit;
                limit.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        limit, "freeform.unlimited_count", true)
                        .intercept(chain -> interceptLimit(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING count");
            }

            Method size = findMethod(service, "windowReplySizeForMulti", int.class);
            if (size != null) {
                windowReplySizeMethod = size;
                size.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        size, "freeform.unlimited_size", true)
                        .intercept(chain -> interceptWindowReplySize(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING size");
            }

            Method visibleList = findMethod(service,
                    "getFreeformRootTasksVisibleListWrForMulti", ArrayList.class);
            if (visibleList != null) {
                visibleList.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        visibleList, "freeform.unlimited_visible_list", true)
                        .intercept(chain -> interceptVisibleList(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING visible_list");
            }

            Method entry = findMethod(service, "startActivityFromRecentsForWR", int.class,
                    int.class, int.class, Bundle.class);
            if (entry != null) {
                entry.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        entry, "freeform.unlimited_entry", true)
                        .intercept(chain -> interceptStartFromRecents(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING entry");
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_COUNT_FAILED", error);
        }

        try {
            Class<?> supervisor = Class.forName(
                    ACTIVITY_TASK_SUPERVISOR, false, classLoader);
            Class<?> safeOptions = Class.forName(
                    "com.android.server.wm.SafeActivityOptions", false, classLoader);
            Method vendorStart = findMethod(supervisor,
                    "startActivityFromRecentsForWR", int.class,
                    int.class, int.class, int.class, int.class, safeOptions);
            if (vendorStart != null) {
                supervisorStartMethod = vendorStart;
                vendorStart.setAccessible(true);
                boolean success = module.deoptimize(vendorStart);
                module.logFeatureInfo("FREEFORM_DEOPTIMIZE result=" + success
                        + " caller=" + vendorStart.toGenericString());
                if (success) deoptimized++;
                HookHandle handle = module.prepareFeatureHook(
                        vendorStart, "freeform.unlimited_supervisor_entry", true)
                        .intercept(chain -> interceptSupervisorStart(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING supervisor_entry");
            }

            Method fallback = findMethod(supervisor,
                    "startActivityFromRecents", int.class,
                    int.class, int.class, int.class, safeOptions);
            if (fallback != null) {
                fallback.setAccessible(true);
                supervisorFallbackMethod = fallback;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING supervisor_fallback");
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_SUPERVISOR_FAILED", error);
        }

        try {
            Class<?> tdaMifavor = Class.forName(TDA_MIFAVOR, false, classLoader);
            Class<?> task = Class.forName(TASK, false, classLoader);
            Class<?> service = Class.forName(ATM_SERVICE, false, classLoader);
            Class<?> activityRecord = Class.forName(ACTIVITY_RECORD, false, classLoader);
            Method alert = findMethod(tdaMifavor,
                    "alertMessageForReachMultiWrMaxSizeWr", void.class, service);
            if (alert != null) {
                alert.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        alert, "freeform.unlimited_limit_alert", true)
                        .intercept(chain -> interceptLimitAlert(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING limit_alert");
            }
            Method component = findMethod(tdaMifavor, "checkTaskSupportForCompWr", boolean.class,
                    Context.class, ComponentName.class);
            if (component != null) {
                component.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        component, "freeform.component_eligibility", true)
                        .intercept(chain -> interceptComponent(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
            Method taskCheck = findMethod(tdaMifavor, "checkTaskSupportWr", boolean.class,
                    Context.class, task);
            if (taskCheck != null) {
                taskCheck.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        taskCheck, "freeform.task_eligibility", true)
                        .intercept(chain -> interceptTaskCheck(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }

            // RedMagicOS checks WindowReply eligibility before the normal
            // ActivityRecord/Task freeform checks.  A non-resizable app is
            // rejected here with state=2 and the user-facing "not allowed to
            // resize" toast, so the later standard hooks never get a chance
            // to allow it.  Keep these hooks package-aware and only force
            // ordinary third-party apps when the explicit all-apps switch is
            // enabled.
            Method activityState = findMethod(tdaMifavor,
                    "isSupportWindowReplyState", int.class, activityRecord, Context.class);
            if (activityState != null) {
                oemActivityStateMethod = activityState;
                activityState.setAccessible(true);
                boolean success = module.deoptimize(activityState);
                if (success) deoptimized++;
                module.logFeatureInfo("FREEFORM_OEM_STATE activity result=" + success);
                HookHandle handle = module.prepareFeatureHook(
                        activityState, "freeform.oem_activity_state", true)
                        .intercept(chain -> interceptOemActivityState(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING oem_activity_state");
            }

            Class<?> taskState = Class.forName(
                    TASK_NOT_SUPPORT_WINDOW_REPLY_STATE, false, classLoader);
            Method taskStateObject = findMethod(tdaMifavor,
                    "isSupportWindowReplyState", taskState, task, Context.class);
            if (taskStateObject != null) {
                oemTaskStateMethod = taskStateObject;
                taskStateObject.setAccessible(true);
                boolean success = module.deoptimize(taskStateObject);
                if (success) deoptimized++;
                module.logFeatureInfo("FREEFORM_OEM_STATE task result=" + success);
                HookHandle handle = module.prepareFeatureHook(
                        taskStateObject, "freeform.oem_task_state", true)
                        .intercept(chain -> interceptOemTaskState(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING oem_task_state");
            }

            Method taskStateForTask = findMethod(tdaMifavor,
                    "isSupportWindowReplyStateForTask", int.class, task, Context.class);
            if (taskStateForTask != null) {
                oemTaskStateForTaskMethod = taskStateForTask;
                taskStateForTask.setAccessible(true);
                boolean success = module.deoptimize(taskStateForTask);
                if (success) deoptimized++;
                module.logFeatureInfo("FREEFORM_OEM_STATE task_int result=" + success);
                HookHandle handle = module.prepareFeatureHook(
                        taskStateForTask, "freeform.oem_task_state_int", true)
                        .intercept(chain -> interceptOemTaskStateForTask(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING oem_task_state_int");
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_OEM_GATE_FAILED", error);
        }

        // The OEM transition also consults the raw resize/multi-window
        // capability methods.  Returning a supported WindowReply state alone
        // is not enough for apps whose ActivityInfo and Task still carry
        // resizeMode=UNRESIZEABLE; the subsequent surface transaction can
        // otherwise finish with a black surface.  Keep the underlying
        // capability answers consistent for the same eligible app.
        try {
            Class<?> tdaMifavor = Class.forName(TDA_MIFAVOR, false, classLoader);
            Class<?> taskFragment = Class.forName(TASK_FRAGMENT, false, classLoader);
            Class<?> task = Class.forName(TASK, false, classLoader);
            Class<?> activityRecord = Class.forName(ACTIVITY_RECORD, false, classLoader);
            Class<?> tda = Class.forName(TASK_DISPLAY_AREA, false, classLoader);

            Method resizeable = findMethod(tdaMifavor, "isResizeable", boolean.class,
                    activityRecord);
            if (resizeable != null) {
                oemResizeableMethod = resizeable;
                resizeable.setAccessible(true);
                boolean success = module.deoptimize(resizeable);
                if (success) deoptimized++;
                HookHandle handle = module.prepareFeatureHook(
                        resizeable, "freeform.oem_resizeable", true)
                        .intercept(chain -> interceptOemResizeable(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING oem_resizeable");
            }

            Method supportResize = findMethod(tdaMifavor, "isSupportResize", boolean.class,
                    Context.class, ComponentName.class);
            if (supportResize != null) {
                oemSupportResizeMethod = supportResize;
                supportResize.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        supportResize, "freeform.oem_support_resize", true)
                        .intercept(chain -> interceptOemSupportResize(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING oem_support_resize");
            }

            Method activityMultiWindow = findMethod(activityRecord,
                    "supportsMultiWindow", boolean.class);
            if (activityMultiWindow != null) {
                HookHandle handle = module.prepareFeatureHook(
                        activityMultiWindow, "freeform.activity_multi_window", true)
                        .intercept(chain -> interceptMultiWindow(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
            Method activityMultiWindowArea = findMethod(activityRecord,
                    "supportsMultiWindowInDisplayArea", boolean.class, tda);
            if (activityMultiWindowArea != null) {
                HookHandle handle = module.prepareFeatureHook(
                        activityMultiWindowArea, "freeform.activity_multi_window_area", true)
                        .intercept(chain -> interceptMultiWindow(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }

            for (String methodName : new String[]{"supportsMultiWindow",
                    "supportsMultiWindowCheckForOtherMultifromWr"}) {
                Method method = findMethod(taskFragment, methodName, boolean.class);
                if (method == null) {
                    module.logFeatureInfo("FREEFORM_METHOD_MISSING " + methodName);
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        method, "freeform.task_fragment_" + methodName, true)
                        .intercept(chain -> interceptMultiWindow(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
            for (String methodName : new String[]{"supportsMultiWindowInDisplayArea",
                    "supportsMultiWindowInDisplayAreaCheckForOtherMultifromWr"}) {
                Method method = findMethod(taskFragment, methodName, boolean.class, tda);
                if (method == null) {
                    module.logFeatureInfo("FREEFORM_METHOD_MISSING " + methodName);
                    continue;
                }
                method.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        method, "freeform.task_fragment_" + methodName, true)
                        .intercept(chain -> interceptMultiWindow(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_CAPABILITY_FAILED", error);
        }

        // GameAssist/Launcher also reach the OEM gate through ActivityClient.
        // Hook its component/package overloads so a package-only query cannot
        // remain on the old whitelist after the server-side TDA check passes.
        try {
            Class<?> controller = Class.forName(ACTIVITY_CLIENT_CONTROLLER, false, classLoader);
            Method component = findMethod(controller, "checkTaskSupportForCompWr", boolean.class,
                    ComponentName.class);
            if (component != null) {
                component.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        component, "freeform.client_component", true)
                        .intercept(chain -> interceptClientComponent(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
            Method pkg = findMethod(controller, "checkTaskSupportForPkgWr", boolean.class,
                    String.class);
            if (pkg != null) {
                pkg.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        pkg, "freeform.client_package", true)
                        .intercept(chain -> interceptClientPackage(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }

            // The launcher/SystemUI action used for "adjust to small window"
            // normally reaches this binder-side path, not the recents launch
            // entry above.  Observe and deoptimize both synchronous and
            // delayed variants so the capability hooks are applied before
            // the OEM surface transaction runs.
            Method inner = findMethod(controller,
                    "toggleSwitchFromFullScreenToFreeformWrInner", boolean.class,
                    int.class, int.class);
            if (inner != null) {
                transitionInnerMethod = inner;
                inner.setAccessible(true);
                boolean success = module.deoptimize(inner);
                if (success) deoptimized++;
                HookHandle handle = module.prepareFeatureHook(
                        inner, "freeform.transition_inner", true)
                        .intercept(chain -> interceptTransitionInner(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING transition_inner");
            }
            Method delayed = findMethod(controller,
                    "toggleSwitchFromFullScreenToFreeformWrDelay", boolean.class,
                    int.class, int.class, boolean.class, boolean.class);
            if (delayed != null) {
                transitionDelayMethod = delayed;
                delayed.setAccessible(true);
                boolean success = module.deoptimize(delayed);
                if (success) deoptimized++;
                HookHandle handle = module.prepareFeatureHook(
                        delayed, "freeform.transition_delay", true)
                        .intercept(chain -> interceptTransitionDelay(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            } else {
                module.logFeatureInfo("FREEFORM_METHOD_MISSING transition_delay");
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_CLIENT_GATE_FAILED", error);
        }

        try {
            Class<?> record = Class.forName(ACTIVITY_RECORD, false, classLoader);
            Class<?> tda = Class.forName(TASK_DISPLAY_AREA, false, classLoader);
            Method support = findMethod(record, "supportsFreeformInDisplayArea", boolean.class, tda);
            if (support != null) {
                support.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        support, "freeform.activity_record", true)
                        .intercept(chain -> interceptActivity(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_ACTIVITY_FAILED", error);
        }

        try {
            Class<?> task = Class.forName(TASK, false, classLoader);
            Class<?> tda = Class.forName(TASK_DISPLAY_AREA, false, classLoader);
            Method support = findMethod(task, "supportsFreeformInDisplayArea", boolean.class, tda);
            if (support != null) {
                support.setAccessible(true);
                HookHandle handle = module.prepareFeatureHook(
                        support, "freeform.task", true)
                        .intercept(chain -> interceptTask(module, chain));
                module.registerFeatureHook(handle);
                installed++;
            }
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_TASK_FAILED", error);
        }

        writeDiagnostic("installed", "hooks=" + installed + ";deoptimized=" + deoptimized);
        pendingInstalledDiagnostic = "hooks=" + installed + ";deoptimized=" + deoptimized;
        module.logFeatureInfo("FREEFORM_READY installed=" + installed
                + " deoptimized=" + deoptimized);
        return installed;
    }

    private static Object interceptStartFromRecents(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        // This public ATM binder entry runs before the vendor acquires its
        // global WindowManager lock.  Refresh here so a boot-time "provider
        // not ready" result can never remain cached for the whole boot.
        refreshConfig();
        flushPendingInstalledDiagnostic();
        if (!entryObservedLogged) {
            entryObservedLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_ENTRY observed enabled="
                    + config.enabled + " unlimited=" + config.unlimited);
            writeDiagnostic("runtime", "atm_entry;enabled=" + config.enabled
                    + ";unlimited=" + config.unlimited);
        }
        if (!config.unlimited) return chain.proceed();

        rearmLimitPath(module);
        Integer previous = LIMIT_BYPASS_DEPTH.get();
        int depth = previous == null ? 0 : previous;
        LIMIT_BYPASS_DEPTH.set(depth + 1);
        if (!entryBypassLogged) {
            entryBypassLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_ENTRY_BYPASS");
        }
        try {
            return chain.proceed();
        } finally {
            if (depth == 0) LIMIT_BYPASS_DEPTH.remove();
            else LIMIT_BYPASS_DEPTH.set(depth);
        }
    }

    private static Object interceptIconLimit(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        refreshConfig();
        Object original = chain.proceed();
        if (!config.unlimited || !Boolean.TRUE.equals(original)) return original;

        int taskId = chain.getArg(0) instanceof Integer ? (Integer) chain.getArg(0) : -1;
        Object icons = field(chain.getThisObject(), "mIconList");
        int count = icons instanceof Map ? ((Map<?, ?>) icons).size() : -1;
        if (!iconLimitObservedLogged) {
            iconLimitObservedLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_ICON_LIMIT_BYPASS task="
                    + taskId + " count=" + count);
        }
        hit("unlimited_icon_count;task=" + taskId + ";count=" + count);
        return false;
    }

    private static Object interceptIconServiceStart(AugmentModule module, Chain chain)
            throws Throwable {
        Object service = chain.getThisObject();
        if (service instanceof Context) bindContext((Context) service);
        else ensureContext(service);
        refreshConfig();

        Intent intent = chain.getArg(0) instanceof Intent ? (Intent) chain.getArg(0) : null;
        String reason = intent == null ? null : intent.getStringExtra("reason");
        Bundle extras = intent == null ? null : intent.getExtras();
        int taskId = extras == null ? -1 : extras.getInt("taskId", -1);
        Object manager = field(service, "mManager");
        Object iconObject = field(manager, "mIconList");
        if (!iconServiceObservedLogged) {
            iconServiceObservedLogged = true;
            int count = iconObject instanceof Map ? ((Map<?, ?>) iconObject).size() : -1;
            module.logFeatureInfo("FREEFORM_RUNTIME_ICON_SERVICE reason=" + reason
                    + " task=" + taskId + " count=" + count
                    + " enabled=" + config.enabled + " unlimited=" + config.unlimited);
        }

        boolean createsIcon = "create_icon".equals(reason) || "show_icon".equals(reason);
        if (!config.unlimited || !createsIcon || !(iconObject instanceof Map)
                || manager == null || taskId < 0) {
            return chain.proceed();
        }

        @SuppressWarnings("unchecked")
        Map<Object, Object> icons = (Map<Object, Object>) iconObject;
        Integer taskKey = taskId;
        if (icons.containsKey(taskKey) || icons.size() < 3) return chain.proceed();

        // The stock gate is `mIconList.size() >= 3`. Keep two entries visible
        // to it for the duration of this one service request. Existing icon
        // views stay alive while their map entries are parked for a few ms.
        Map<Object, Object> parked = new java.util.LinkedHashMap<>();
        while (icons.size() >= 3) {
            Object key = icons.keySet().iterator().next();
            parked.put(key, icons.remove(key));
        }

        if (!iconLimitObservedLogged) {
            iconLimitObservedLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_ICON_SERVICE_BYPASS task="
                    + taskId + " parked=" + parked.size());
        }
        hit("unlimited_icon_service;task=" + taskId + ";parked=" + parked.size());
        try {
            return chain.proceed();
        } finally {
            icons.putAll(parked);
            invokeNoArg(manager, "iconProviderUpdate");
        }
    }

    private static Object interceptSupervisorStart(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        if (!supervisorObservedLogged) {
            supervisorObservedLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_SUPERVISOR observed enabled="
                    + config.enabled + " unlimited=" + config.unlimited);
            writeDiagnostic("runtime", "supervisor_entry;enabled=" + config.enabled
                    + ";unlimited=" + config.unlimited);
        }
        if (!config.unlimited) return chain.proceed();

        rearmLimitPath(module);
        Integer previous = LIMIT_BYPASS_DEPTH.get();
        int depth = previous == null ? 0 : previous;
        LIMIT_BYPASS_DEPTH.set(depth + 1);
        if (!supervisorBypassLogged) {
            supervisorBypassLogged = true;
            module.logFeatureInfo("FREEFORM_RUNTIME_SUPERVISOR_BYPASS");
        }
        try {
            Object result = chain.proceed();
            if (!(result instanceof Integer) || ((Integer) result) != 102) return result;

            // RedMagicOS AOT can retain the tiny `size >= 3` branch even after
            // its callee is hooked.  Returning 102 is the vendor's dedicated
            // limit result, so retry through the adjacent standard recents
            // implementation with the same caller, task and SafeOptions.
            Method fallback = supervisorFallbackMethod;
            if (fallback == null) return result;
            try {
                Object fallbackResult = fallback.invoke(chain.getThisObject(),
                        chain.getArg(0), chain.getArg(1), chain.getArg(2), chain.getArg(4));
                if (!supervisorFallbackLogged) {
                    supervisorFallbackLogged = true;
                    module.logFeatureInfo("FREEFORM_RUNTIME_SUPERVISOR_FALLBACK result="
                            + String.valueOf(fallbackResult));
                }
                hit("unlimited_supervisor_fallback");
                return fallbackResult;
            } catch (Throwable error) {
                Throwable cause = error.getCause() == null ? error : error.getCause();
                module.logFeatureError("FREEFORM_RUNTIME_SUPERVISOR_FALLBACK_FAILED", cause);
                writeDiagnostic("last_error", "supervisor_fallback:"
                        + cause.getClass().getSimpleName() + ":"
                        + String.valueOf(cause.getMessage()));
                return result;
            }
        } finally {
            if (depth == 0) LIMIT_BYPASS_DEPTH.remove();
            else LIMIT_BYPASS_DEPTH.set(depth);
        }
    }

    private static Object interceptLimitAlert(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getArg(0));
        if (shouldBypassLimit()) {
            if (!alertBypassLogged) {
                alertBypassLogged = true;
                module.logFeatureInfo("FREEFORM_RUNTIME_LIMIT_ALERT_SUPPRESSED");
            }
            return null;
        }
        return chain.proceed();
    }

    private static Object interceptOemActivityState(AugmentModule module, Chain chain)
            throws Throwable {
        Object activity = chain.getArg(0);
        if (config.allApps && isEligibleActivity(activity)) {
            forceResizeMetadata(activity);
            String packageName = packageFromActivity(activity);
            Object result = chain.proceed();
            if (result instanceof Integer && ((Integer) result) != 0) {
                hit("force_activity_state=" + packageName + ";from=" + result
                        + ";forced=0");
                return 0;
            }
            hit("activity_state=" + packageName + ";result=" + String.valueOf(result));
            return result;
        }
        return chain.proceed();
    }

    private static Object interceptOemTaskState(AugmentModule module, Chain chain)
            throws Throwable {
        Object task = chain.getArg(0);
        if (config.allApps && isEligibleTask(task)) {
            forceResizeMetadata(task);
            String packageName = packageFromTask(task);
            Object result = chain.proceed();
            if (result != null) {
                Object state = field(result, "isNotSupportWindowReplyState");
                hit("force_task_state=" + packageName + ";from=" + String.valueOf(state)
                        + ";forced=supported");
                // The OEM wrapper treats null as "no unsupported activity/task
                // state" and therefore continues with the freeform transition.
                return null;
            }
            hit("task_state=" + packageName + ";result=null");
            return null;
        }
        return chain.proceed();
    }

    private static Object interceptOemTaskStateForTask(AugmentModule module, Chain chain)
            throws Throwable {
        Object task = chain.getArg(0);
        if (config.allApps && isEligibleTask(task)) {
            forceResizeMetadata(task);
            String packageName = packageFromTask(task);
            Object result = chain.proceed();
            if (result instanceof Integer && ((Integer) result) != 0) {
                hit("force_task_state_int=" + packageName + ";from=" + result
                        + ";forced=0");
                return 0;
            }
            hit("task_state_int=" + packageName + ";result=" + String.valueOf(result));
            return result;
        }
        return chain.proceed();
    }

    private static Object interceptOemResizeable(AugmentModule module, Chain chain)
            throws Throwable {
        Object activity = chain.getArg(0);
        if (config.allApps && isEligibleActivity(activity)) {
            forceResizeMetadata(activity);
            hit("oem_resizeable=" + packageFromActivity(activity) + ";forced=true");
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptOemSupportResize(AugmentModule module, Chain chain)
            throws Throwable {
        Object component = chain.getArg(1);
        String packageName = component instanceof ComponentName
                ? ((ComponentName) component).getPackageName() : null;
        if (config.allApps && isEligiblePackage(packageName)) {
            hit("oem_support_resize=" + packageName + ";forced=true");
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptMultiWindow(AugmentModule module, Chain chain)
            throws Throwable {
        Object owner = chain.getThisObject();
        if (config.allApps && isEligibleTaskFragment(owner)) {
            forceResizeMetadata(owner);
            hit("multi_window=" + packageFromOwner(owner) + ";forced=true");
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptTransitionInner(AugmentModule module, Chain chain)
            throws Throwable {
        refreshConfig();
        if (config.allApps) {
            hit("transition_inner=task" + String.valueOf(chain.getArg(0))
                    + ";startMode=" + String.valueOf(chain.getArg(1)));
        }
        return chain.proceed();
    }

    private static Object interceptTransitionDelay(AugmentModule module, Chain chain)
            throws Throwable {
        refreshConfig();
        if (config.allApps) {
            hit("transition_delay=task" + String.valueOf(chain.getArg(0))
                    + ";startMode=" + String.valueOf(chain.getArg(1))
                    + ";visible=" + String.valueOf(chain.getArg(2))
                    + ";delay=" + String.valueOf(chain.getArg(3)));
        }
        return chain.proceed();
    }

    private static Object interceptWindowReplySize(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        if (shouldBypassLimit()) {
            hit("unlimited_size");
            return 0;
        }
        return chain.proceed();
    }

    private static Object interceptVisibleList(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        if (shouldBypassLimit()) {
            if (!listBypassLogged) {
                listBypassLogged = true;
                module.logFeatureInfo("FREEFORM_RUNTIME_VISIBLE_LIST_BYPASS");
            }
            hit("unlimited_visible_list");
            return new ArrayList<>();
        }
        return chain.proceed();
    }

    private static boolean shouldBypassLimit() {
        if (!config.unlimited) return false;
        Integer depth = LIMIT_BYPASS_DEPTH.get();
        if (depth != null && depth > 0) return true;
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            if (!frame.getClassName().startsWith("com.android.server.wm.")) continue;
            String method = frame.getMethodName();
            if ("startActivityFromRecentsForWR".equals(method)
                    || "toggleSwitchFromFullScreenToFreeformWrDelay".equals(method)
                    || "startActivityInner".equals(method)) {
                return true;
            }
        }
        return false;
    }

    private static void rearmLimitPath(AugmentModule module) {
        try {
            Method method = supervisorStartMethod;
            if (method != null) module.deoptimize(method);
            method = limitGateMethod;
            if (method != null) module.deoptimize(method);
            method = windowReplySizeMethod;
            if (method != null) module.deoptimize(method);
            method = transitionInnerMethod;
            if (method != null) module.deoptimize(method);
            method = transitionDelayMethod;
            if (method != null) module.deoptimize(method);
            method = oemResizeableMethod;
            if (method != null) module.deoptimize(method);
        } catch (Throwable error) {
            module.logFeatureError("FREEFORM_RUNTIME_DEOPTIMIZE_FAILED", error);
        }
    }

    private static Object interceptLimit(AugmentModule module, Chain chain) throws Throwable {
        ensureContext(chain.getThisObject());
        if (config.unlimited) {
            hit("unlimited_count");
            return false;
        }
        return chain.proceed();
    }

    private static Object interceptComponent(AugmentModule module, Chain chain) throws Throwable {
        ensureContext(chain.getArg(0));
        if (config.allApps) {
            ComponentName component = chain.getArg(1) instanceof ComponentName
                    ? (ComponentName) chain.getArg(1) : null;
            if (isEligiblePackage(component == null ? null : component.getPackageName())) {
                hit("component=" + component.getPackageName());
                return true;
            }
        }
        return chain.proceed();
    }

    private static Object interceptTaskCheck(AugmentModule module, Chain chain) throws Throwable {
        ensureContext(chain.getArg(0));
        if (config.allApps && isEligiblePackage(packageFromTask(chain.getArg(1)))) {
            hit("task_check=" + packageFromTask(chain.getArg(1)));
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptClientComponent(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        ComponentName component = chain.getArg(0) instanceof ComponentName
                ? (ComponentName) chain.getArg(0) : null;
        if (config.allApps && isEligiblePackage(component == null
                ? null : component.getPackageName())) {
            hit("client_component=" + component.getPackageName());
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptClientPackage(AugmentModule module, Chain chain)
            throws Throwable {
        ensureContext(chain.getThisObject());
        Object value = chain.getArg(0);
        String packageName = value instanceof String ? (String) value : null;
        if (config.allApps && isEligiblePackage(packageName)) {
            hit("client_package=" + packageName);
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptActivity(AugmentModule module, Chain chain) throws Throwable {
        ensureContext(chain.getThisObject());
        if (config.allApps && isEligibleActivity(chain.getThisObject())) {
            hit("activity=" + packageFromActivity(chain.getThisObject()));
            return true;
        }
        return chain.proceed();
    }

    private static Object interceptTask(AugmentModule module, Chain chain) throws Throwable {
        ensureContext(chain.getThisObject());
        if (config.allApps && isEligibleTask(chain.getThisObject())) {
            hit("task=" + packageFromTask(chain.getThisObject()));
            return true;
        }
        return chain.proceed();
    }

    private static boolean isEligibleActivity(Object owner) {
        if (owner == null || !isStandard(owner)) return false;
        Object infoObject = field(owner, "info");
        String packageName = infoObject instanceof ActivityInfo
                ? ((ActivityInfo) infoObject).packageName : packageFromObject(infoObject);
        if (packageName == null) packageName = packageFromObject(field(owner, "mActivityComponent"));
        return isEligiblePackage(packageName);
    }

    private static boolean isEligibleTask(Object owner) {
        if (owner == null || !isStandard(owner)) return false;
        return isEligiblePackage(packageFromTask(owner));
    }

    private static boolean isEligibleTaskFragment(Object owner) {
        if (owner == null || !isStandard(owner)) return false;
        return isEligiblePackage(packageFromOwner(owner));
    }

    private static String packageFromOwner(Object owner) {
        String value = packageFromActivity(owner);
        if (value == null) value = packageFromTask(owner);
        if (value == null) value = packageFromObject(field(owner, "realActivity"));
        return value;
    }

    /**
     * Keep ActivityInfo and Task's cached resize mode aligned with the forced
     * policy.  RedMagic's WindowReply path checks both values at different
     * points in the same transition; changing only the returned state can
     * leave a task marked nonResizable and its surface black.
     */
    private static boolean forceResizeMetadata(Object owner) {
        if (owner == null) return false;
        boolean changed = false;
        Object info = field(owner, "info");
        if (info instanceof ActivityInfo) {
            changed |= putIntField(info, "resizeMode", 2);
        }
        if (putIntField(owner, "mResizeMode", 2)) changed = true;
        return changed;
    }

    private static boolean isStandard(Object owner) {
        try {
            Method method = findNoArg(owner.getClass(), "isActivityTypeStandard");
            if (method != null) {
                method.setAccessible(true);
                Object value = method.invoke(owner);
                return !(value instanceof Boolean) || (Boolean) value;
            }
        } catch (Throwable ignored) { }
        return true;
    }

    private static String packageFromTask(Object owner) {
        if (owner == null) return null;
        String value = packageFromObject(field(owner, "realActivity"));
        if (value == null) value = packageFromObject(field(owner, "mRealActivity"));
        if (value == null) value = packageFromActivity(field(owner, "mLastNonFinishingActivity"));
        if (value == null) value = packageFromActivity(field(owner, "mLastPausedActivity"));
        if (value == null) value = packageFromActivity(field(owner, "mResumedActivity"));
        if (value == null) {
            try {
                Method method = findNoArg(owner.getClass(), "topRunningActivity");
                if (method != null) value = packageFromActivity(method.invoke(owner));
            } catch (Throwable ignored) { }
        }
        return value;
    }

    private static String packageFromActivity(Object owner) {
        if (owner == null) return null;
        Object info = field(owner, "info");
        if (info instanceof ActivityInfo) return ((ActivityInfo) info).packageName;
        String value = packageFromObject(field(owner, "mActivityComponent"));
        if (value == null) value = packageFromObject(field(owner, "componentName"));
        return value;
    }

    private static String packageFromObject(Object value) {
        if (value instanceof ComponentName) return ((ComponentName) value).getPackageName();
        if (value instanceof ActivityInfo) return ((ActivityInfo) value).packageName;
        if (value instanceof ApplicationInfo) return ((ApplicationInfo) value).packageName;
        return null;
    }

    private static boolean isEligiblePackage(String packageName) {
        return packageName != null
                && packageName.matches("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z0-9_]+)+")
                && !PROTECTED_PACKAGES.contains(packageName);
    }

    private static void bindContext(Context value) {
        if (value == null) return;
        context = value;
        refreshConfig();
        if (observerInstalled) return;
        synchronized (FreeformHook.class) {
            if (observerInstalled) return;
            try {
                Handler handler = new Handler(Looper.getMainLooper());
                // onSystemServerStarting is earlier than SettingsProvider on
                // this ROM.  Retry after boot services settle even when the
                // mirrored values themselves did not change and therefore do
                // not emit a ContentObserver notification.
                handler.postDelayed(FreeformHook::refreshConfig, 2_000L);
                handler.postDelayed(FreeformHook::refreshConfig, 8_000L);
                ContentObserver observer = new ContentObserver(handler) {
                    @Override public void onChange(boolean selfChange) { refreshConfig(); }
                };
                for (String key : new String[]{FeatureSettings.FREEFORM_ENABLED,
                        FeatureSettings.FREEFORM_UNLIMITED, FeatureSettings.FREEFORM_ALL_APPS}) {
                    value.getContentResolver().registerContentObserver(
                            Settings.Global.getUriFor(key), false, observer);
                }
                observerInstalled = true;
            } catch (Throwable ignored) {
                // The initial snapshot is still safe; a later process restart reloads it.
            }
        }
    }

    private static void ensureContext(Object owner) {
        if (context != null || owner == null) return;
        Context value = owner instanceof Context ? (Context) owner : null;
        if (value == null) {
            Object nested = field(owner, "mContext");
            if (nested instanceof Context) value = (Context) nested;
        }
        if (value == null) {
            Object service = field(owner, "mAtmService");
            Object nested = field(service, "mContext");
            if (nested instanceof Context) value = (Context) nested;
        }
        if (value != null) bindContext(value);
    }

    private static void refreshConfig() {
        Context value = context;
        if (value == null) {
            config = Config.DISABLED;
            return;
        }
        try {
            boolean enabled = readBoolean(value, FeatureSettings.FREEFORM_ENABLED);
            config = new Config(enabled,
                    enabled && readBoolean(value, FeatureSettings.FREEFORM_UNLIMITED),
                    enabled && readBoolean(value, FeatureSettings.FREEFORM_ALL_APPS));
        } catch (Throwable ignored) {
            config = Config.DISABLED;
        }
    }

    private static boolean readBoolean(Context value, String key) {
        // system_server owns this hook and the Root-written Global value is
        // its stable runtime source.  Reading it first also avoids depending
        // on the app provider during early boot or while WindowManager is
        // handling a launch.
        try {
            String raw = Settings.Global.getString(value.getContentResolver(), key);
            if (raw != null && !raw.isEmpty() && !"null".equals(raw)) {
                return "1".equals(raw) || "true".equalsIgnoreCase(raw)
                        || "yes".equalsIgnoreCase(raw) || "on".equalsIgnoreCase(raw);
            }
        } catch (Throwable ignored) {
            // Fall through to the app-side provider bridge.
        }
        return FeatureSettings.enabled(value, key, false);
    }

    private static Context findSystemContext(ClassLoader classLoader) {
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread", false, classLoader);
            Method current = threadClass.getDeclaredMethod("currentActivityThread");
            current.setAccessible(true);
            Object thread = current.invoke(null);
            if (thread == null) return null;
            Method system = threadClass.getDeclaredMethod("getSystemContext");
            system.setAccessible(true);
            Object value = system.invoke(thread);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object field(Object owner, String name) {
        if (owner == null) return null;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field value = type.getDeclaredField(name);
                value.setAccessible(true);
                return value.get(owner);
            } catch (NoSuchFieldException ignored) {
                // Walk the vendor superclass hierarchy.
            } catch (Throwable ignored) {
                return null;
            }
        }
        return null;
    }

    private static boolean putIntField(Object owner, String name, int value) {
        if (owner == null) return false;
        for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field target = type.getDeclaredField(name);
                target.setAccessible(true);
                if (target.getType() != int.class) return false;
                if (target.getInt(owner) == value) return false;
                target.setInt(owner, value);
                return true;
            } catch (NoSuchFieldException ignored) {
                // Walk the server class hierarchy.
            } catch (Throwable ignored) {
                return false;
            }
        }
        return false;
    }

    private static Method findNoArg(Class<?> type, String name) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    if (name.equals(method.getName()) && method.getParameterTypes().length == 0) {
                        return method;
                    }
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static void invokeNoArg(Object owner, String name) {
        if (owner == null) return;
        try {
            Method method = findNoArg(owner.getClass(), name);
            if (method == null) return;
            method.setAccessible(true);
            method.invoke(owner);
        } catch (Throwable ignored) {
            // The vendor path has already completed; diagnostics must never
            // turn an icon request into a system-app crash.
        }
    }

    private static Method findMethod(Class<?> type, String name, Class<?> returnType,
            Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                for (Method method : current.getDeclaredMethods()) {
                    if (!name.equals(method.getName()) || method.getReturnType() != returnType
                            || method.getParameterTypes().length != parameters.length) continue;
                    Class<?>[] actual = method.getParameterTypes();
                    boolean match = true;
                    for (int i = 0; i < actual.length; i++) {
                        if (!actual[i].isAssignableFrom(parameters[i])
                                && !parameters[i].isAssignableFrom(actual[i])) {
                            match = false;
                            break;
                        }
                    }
                    if (match) return method;
                }
            } catch (Throwable ignored) { }
        }
        return null;
    }

    private static void hit(String value) {
        long now = System.currentTimeMillis();
        if (now - lastDiagnostic < 800L) return;
        lastDiagnostic = now;
        writeDiagnostic("last_hit", value + "|" + now);
    }

    private static void writeDiagnostic(String suffix, String value) {
        if ("installed".equals(suffix)) pendingInstalledDiagnostic = value;
        Context valueContext = context;
        if (valueContext == null) return;
        try {
            Handler handler = diagnosticHandler;
            if (handler == null) {
                handler = new Handler(Looper.getMainLooper());
                diagnosticHandler = handler;
            }
            Handler target = handler;
            target.post(() -> FeatureSettings.diagnostic(valueContext,
                    "ls_augment_freeform_" + suffix, value));
        } catch (Throwable ignored) { }
    }

    private static void flushPendingInstalledDiagnostic() {
        String value = pendingInstalledDiagnostic;
        if (value == null || context == null) return;
        pendingInstalledDiagnostic = null;
        writeDiagnostic("installed", value);
    }

    private static final class Config {
        static final Config DISABLED = new Config(false, false, false);
        final boolean enabled;
        final boolean unlimited;
        final boolean allApps;

        Config(boolean enabled, boolean unlimited, boolean allApps) {
            this.enabled = enabled;
            this.unlimited = unlimited;
            this.allApps = allApps;
        }
    }
}
