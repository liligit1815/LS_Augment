package ls.augment.com.hook;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.InputEvent;
import android.view.MotionEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Hands physical-bottom and injected-main gestures to the authenticated main display.
 * The ROM still owns recognition, input pilfering, animation and the actual Recents UI. */
final class AtomicWorkbenchQuickstepInputHook {
    private static final Uri TARGET = Uri.parse("content://ls.augment.com.workbench");
    private static final ComponentName HOST = new ComponentName("ls.augment.com", "ls.augment.com.AtomicWorkbenchActivity");
    private static final WeakHashMap<Object, Map<Integer, Route>> STREAMS = new WeakHashMap<>();
    private static final ThreadLocal<Route> DISPATCH = new ThreadLocal<>();
    private static boolean installed;
    static boolean ready(){return installed;}

    static final class Route {
        final WeakReference<Object> service;
        final int source, target, user, hostTask;
        final long downTime, session;
        final List<ActivityManager.RunningTaskInfo> tasks;
        final String unique;
        volatile String failure = "";
        volatile WeakReference<Object> selectedContainer = new WeakReference<>(null);
        boolean nativeReset, dispatched, completed;
        Bundle nativeGestureRequest;
        boolean nativeGestureHeld;
        boolean hierarchyAfterDownObserved, hierarchyBeforeUpObserved;
        Route(Object service, int source, int target, long downTime, long session, int user,
                List<ActivityManager.RunningTaskInfo> tasks, int hostTask, String unique) {
            this.service = new WeakReference<>(service); this.source = source; this.target = target;
            this.downTime = downTime; this.session = session; this.user = user; this.tasks = tasks;
            this.hostTask = hostTask; this.unique = unique;
        }
    }

    private AtomicWorkbenchQuickstepInputHook() { }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        AtomicWorkbenchLauncherCrashHook.install(module, loader);
        try {
            Class<?> service = AtomicWorkbenchQuickstepCapabilities.resolve(loader);
            Class<?> tracker = Class.forName("com.android.quickstep.TopTaskTracker", false, loader);
            Class<?> observer = Class.forName("com.android.quickstep.OverviewComponentObserver", false, loader);
            Class<?> launcher = Class.forName("com.android.quickstep.LauncherActivityInterface", false, loader);
            boolean modern=AtomicWorkbenchQuickstepCapabilities.modern;
            Method input = method(service, "onInputEvent", InputEvent.class);
            Method monitor = modern?null:method(service, "getInputMonitorCompat", int.class);
            Method receiver = modern?null:method(service, "getInputEventReceiver", int.class);
            Method task = method(tracker, "getCachedTopTask", boolean.class, int.class);
            Method container = method(observer, "getContainerInterface", int.class);
            method(InputEvent.class, "getDisplayId");
            method(InputEvent.class, "setDisplayId", int.class);
            if(!modern)method(Class.forName("com.android.quickstep.fallback.window.RecentsDisplayModel",false,loader), "storeDisplayResource", int.class);
            AtomicWorkbenchQuickstepTargetHook.install(module, loader);
            if(modern)AtomicWorkbenchQuickstepCapabilities.installInputResources(module,loader);
            for (Method resource : modern?new Method[0]:new Method[]{monitor, receiver}) {
                module.deoptimize(resource);
                module.registerFeatureHook(module.prepareFeatureHook(resource,
                        "atomic_workbench.native_home.input_resource." + resource.getName(), true).intercept(chain -> {
                    Route route = DISPATCH.get();
                    if (route != null && route.source == 0 && route.service.get() == chain.getThisObject() && (Integer) chain.getArg(0) == route.target)
                        return chain.proceed(new Object[]{0});
                    return chain.proceed();
                }));
            }
            module.deoptimize(task);
            module.registerFeatureHook(module.prepareFeatureHook(task, "atomic_workbench.native_home.input_task", true).intercept(chain -> {
                Route route = DISPATCH.get();
                if (route == null) route = AtomicWorkbenchQuickstepTargetHook.windowRoute();
                if (route != null && ((Integer) chain.getArg(1) == 0 || (Integer) chain.getArg(1) == route.target))
                    return AtomicWorkbenchQuickstepTargetHook.cachedTask(route, chain.getThisObject(),modern?chain.proceed():null);
                return chain.proceed();
            }));
            module.deoptimize(container);
            module.registerFeatureHook(module.prepareFeatureHook(container, "atomic_workbench.native_home.input_container", true).intercept(chain -> {
                int display = (Integer) chain.getArg(0);
                Route route = DISPATCH.get();
                if (route == null) route = AtomicWorkbenchQuickstepTargetHook.windowRoute();
                if (route != null && display == route.target)
                    return AtomicWorkbenchQuickstepTargetHook.container(module, route, chain.getThisObject());
                if (display > 0) {
                    try {
                        Object owner = chain.getThisObject();
                        Context context = (Context) field(owner, "mContext");
                        if (AtomicWorkbenchQuickstepHook.authenticated(context, display)) {
                            Object registered = AtomicWorkbenchQuickstepTargetHook.registeredContainer(owner, display);
                            if (registered != null) return registered;
                        }
                        Object nativeInterface = field(owner, "mDefaultDisplayContainerInterface");
                        if (launcher.isInstance(nativeInterface) && AtomicWorkbenchQuickstepHook.authenticated(context, display)) {
                            Object activity = call(nativeInterface, "getCreatedContainer", new Class<?>[0]);
                            if (activity instanceof Context && (Integer) call(activity, "getDisplayId", new Class<?>[0]) == display) {
                                module.logFeatureInfo("ATOMIC_NATIVE_HOME_CONTAINER source_display=" + display
                                        + ";target_display=" + display + ";auth=true;phase=container_routed;container=launcher");
                                return nativeInterface;
                            }
                        }
                    } catch (Throwable failure) {
                        module.logFeatureError("ATOMIC_NATIVE_HOME_CONTAINER source_display=" + display
                                + ";target_display=" + display + ";phase=native_passthrough;reason=container_unavailable", failure);
                    }
                }
                return chain.proceed();
            }));
            module.deoptimize(input);
            deoptimizeInputCallers(module, loader, service);
            module.registerFeatureHook(module.prepareFeatureHook(input, "atomic_workbench.native_home.input_display", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Object value = chain.getArg(0), owner = chain.getThisObject();
                if (!(value instanceof MotionEvent)) return chain.proceed();
                MotionEvent event = (MotionEvent) value;
                int action = event.getActionMasked();
                int source = (Integer) call(event, "getDisplayId", new Class<?>[0]);
                Route route;
                synchronized (STREAMS) { route = stream(owner, source); }
                if (action == MotionEvent.ACTION_DOWN) {
                    synchronized (STREAMS) { removeStream(owner, source); }
                    route = null;
                    try { route = begin(module, owner, event, source); }
                    catch (Throwable failure) {
                        module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=-1;auth=false;phase=native_passthrough;reason=target_unavailable", failure);
                    }
                    if (route != null) {
                        synchronized (STREAMS) {
                            Map<Integer, Route> streams = STREAMS.get(owner);
                            if (streams == null) { streams = new HashMap<>(); STREAMS.put(owner, streams); }
                            // Eight owned slots plus physical input; do not retain arbitrary displays.
                            if (streams.size() >= 9) streams.entrySet().removeIf(entry -> entry.getKey() != 0);
                            streams.put(source, route);
                        }
                        if (route.failure.isEmpty()) module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + route.target
                                + ";auth=true;phase=input_routed;branch=" + branch(source) + ";route_session=" + route.session);
                    }
                }
                if (route == null && source > 0 && owner instanceof Context) {
                    try {
                        String unique = ownedSourceUnique((Context) owner, source);
                        if (!unique.isEmpty()) {
                            // InputMonitor may attach halfway through an injected
                            // stream. Do not create a consumer without its DOWN.
                            route = blocked(owner, event, source, unique, "orphan_input");
                            synchronized (STREAMS) {
                                Map<Integer, Route> streams = STREAMS.get(owner);
                                if (streams == null) { streams = new HashMap<>(); STREAMS.put(owner, streams); }
                                if (streams.size() >= 9) streams.entrySet().removeIf(entry -> entry.getKey() != 0);
                                streams.put(source, route);
                            }
                        }
                    } catch (Throwable unavailable) { /* No ownership proof: leave external displays alone. */ }
                }
                if (route == null) return chain.proceed();
                if (route.completed) return null;
                // Keep completed/rejected streams until the next DOWN. A late MOVE/UP
                // must not create a physical consumer after a workbench route ended.
                if (route.downTime != event.getDownTime()) return null;
                if (route.failure.isEmpty() && action != MotionEvent.ACTION_DOWN && action != MotionEvent.ACTION_CANCEL) {
                    try { route.failure = revalidateInput(route); }
                    catch (Throwable failure) {
                        route.failure = "route_target_unavailable";
                        module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + route.target
                                + ";auth=false;phase=route_failed;reason=" + route.failure, failure);
                    }
                    if (!route.failure.isEmpty()) module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source
                            + ";target_display=" + route.target + ";auth=false;phase=route_cancelled;reason=" + route.failure);
                }
                if (!route.failure.isEmpty()) {
                    cancelNativeStream(module, owner, route);
                    if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) route.completed = true;
                    return null; // An authenticated failed route must not animate the physical host.
                }
                MotionEvent copy = MotionEvent.obtain(event);
                Route previous = DISPATCH.get();
                try {
                    call(copy, "setDisplayId", new Class<?>[]{int.class}, route.target);
                } catch (Throwable failure) {
                    copy.recycle();
                    route.failure = "event_display_unavailable";
                    cancelNativeStream(module, owner, route);
                    if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) route.completed = true;
                    module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + route.target
                            + ";auth=true;phase=route_failed;reason=event_display_unavailable", failure);
                    return null;
                }
                boolean observeNativeEdge = action == MotionEvent.ACTION_DOWN
                        || action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL;
                if (action == MotionEvent.ACTION_DOWN && !beginNativeGesture(route)) {
                    route.failure = "native_gesture_coordination_unavailable";
                    module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + route.target
                            + ";auth=false;phase=route_failed;reason=" + route.failure);
                    copy.recycle(); cancelNativeStream(module, owner, route); return null;
                }
                try {
                    DISPATCH.set(route);
                    route.dispatched = true;
                    if (observeNativeEdge) observeNativeConsumer(module, owner, route, "consumer_before", action, copy);
                    // This is the only native dispatch. Never retry the physical stream after a partial animation.
                    return chain.proceed(new Object[]{copy});
                } catch (Throwable failure) {
                    try {
                        module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT phase=native_dispatch_failure;source_display=" + source
                                + ";target_display=" + route.target + ";route_session=" + route.session + ";input_action=" + action, failure);
                    } catch (Throwable ignored) { /* Preserve the native failure even when diagnostics are unavailable. */ }
                    endNativeGesture(route); throw failure;
                } finally {
                    // Read the actual native copy before recycle; the ROM may have changed UP to CANCEL.
                    if (observeNativeEdge) observeNativeConsumer(module, owner, route, "consumer_after", action, copy);
                    if (previous == null) DISPATCH.remove(); else DISPATCH.set(previous);
                    copy.recycle();
                    if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                        endNativeGesture(route);
                        route.completed = true;
                        module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + route.target
                                + ";auth=true;phase=input_finished;branch=" + branch(source) + ";reason=" + (action == MotionEvent.ACTION_CANCEL ? "cancel" : "up"));
                    }
                }
            }));
            installed = true;
            module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT_INSTALLED phase=ready;reason=rom_entrypoints_matched");
        } catch (Throwable failure) {
            module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT_UNAVAILABLE phase=install_failed", failure);
        }
    }

    /** Cached boundary evidence only. A route UP is not proof that the ROM consumed an UP. */
    private static void observeNativeConsumer(AugmentModule module, Object owner, Route route,
            String phase, int originalAction, MotionEvent nativeCopy) {
        try {
            module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + route.source
                    + ";target_display=" + route.target + ";route_session=" + route.session
                    + ";auth=true;phase=" + phase + ";input_action=" + originalAction
                    + ";copy_action=" + observedNativeAction(nativeCopy)
                    + ";consumer_class=" + observedConsumerClass(owner, "mConsumer")
                    + ";unchecked_consumer_class=" + observedConsumerClass(owner, "mUncheckedConsumer")
                    + ";in_swipe_region=" + observedSwipeRegion(owner)
                    + ";gesture_state_present=" + observedGestureState(owner)
                    + observedDelegateHierarchy(owner, route, phase, originalAction));
        } catch (Throwable ignored) { /* Observation must never alter native dispatch or its exception. */ }
    }

    /** Structural fields only; never invokes a native consumer method or dispatches an event. */
    private static String observedDelegateHierarchy(Object owner, Route route, String phase, int action) {
        boolean afterDown = "consumer_after".equals(phase) && action == MotionEvent.ACTION_DOWN;
        boolean beforeUp = "consumer_before".equals(phase) && action == MotionEvent.ACTION_UP;
        if (!afterDown && !beforeUp) return "";
        if (afterDown) {
            if (route.hierarchyAfterDownObserved) return "";
            route.hierarchyAfterDownObserved = true;
        } else {
            if (route.hierarchyBeforeUpObserved) return "";
            route.hierarchyBeforeUpObserved = true;
        }
        String prefix = ";stream_down_time=" + route.downTime;
        String unknown = prefix + ";delegate_chain_status=unknown;delegate_chain_classes=unknown"
                + ";delegate_chain_states=unknown;delegate_leaf_class=unknown"
                + ";first_active_delegate_state_class=unknown";
        try {
            Object current = field(owner, "mConsumer");
            if (current == null) return unknown;
            Class<?> delegateType = current.getClass();
            int ancestry = 0;
            while (delegateType != null && !"com.android.quickstep.inputconsumers.DelegateInputConsumer".equals(delegateType.getName())) {
                if (++ancestry > 8) return unknown;
                delegateType = delegateType.getSuperclass();
            }
            Field delegate = null, state = null;
            if (delegateType != null) {
                delegate = delegateType.getDeclaredField("mDelegate");
                state = delegateType.getDeclaredField("mState");
                if (!"com.android.quickstep.InputConsumer".equals(delegate.getType().getName())
                        || state.getType() != int.class
                        || java.lang.reflect.Modifier.isStatic(delegate.getModifiers())
                        || java.lang.reflect.Modifier.isStatic(state.getModifiers())
                        || !java.lang.reflect.Modifier.isFinal(delegate.getModifiers())) return unknown;
                delegate.setAccessible(true); state.setAccessible(true);
            }
            Object[] seen = new Object[4];
            StringBuilder classes = new StringBuilder(), states = new StringBuilder();
            String firstActive = "none";
            for (int index = 0; index < 4; index++) {
                if (current == null) return unknown;
                for (int prior = 0; prior < index; prior++) if (seen[prior] == current) return unknown;
                seen[index] = current;
                String name = current.getClass().getName();
                if (!name.matches("[A-Za-z0-9_.$]{1,160}")) return unknown;
                if (index != 0) { classes.append(','); states.append(','); }
                classes.append(name);
                if (delegateType == null || !delegateType.isInstance(current)) {
                    states.append("leaf");
                    return prefix + ";delegate_chain_status=complete;delegate_chain_classes=" + classes
                            + ";delegate_chain_states=" + states + ";delegate_leaf_class=" + name
                            + ";first_active_delegate_state_class=" + firstActive + observedOtherActivityState(current);
                }
                int value = state.getInt(current);
                if (value < 0 || value > 2) return unknown;
                states.append(value);
                if (value == 1 && "none".equals(firstActive)) firstActive = name;
                current = delegate.get(current);
            }
            return unknown; // Four nodes without a non-Delegate leaf is not a complete hierarchy.
        } catch (Throwable unavailable) {
            return unknown; // Observation failures never authorize or alter native dispatch.
        }
    }

    /** Fixed primitive gates only, at the existing authenticated DOWN/UP witnesses. */
    private static String observedOtherActivityState(Object consumer) {
        Class<?> type = consumer.getClass(); int depth = 0;
        while (type != null && !"com.android.quickstep.inputconsumers.OtherActivityInputConsumer".equals(type.getName())) {
            if (++depth > 8) return "";
            type = type.getSuperclass();
        }
        if (type == null) return "";
        String gates = ";reason=defer" + observedBoolean(consumer, "mIsDeferredDownTarget")
                + "_ignore" + observedBoolean(consumer, "mIfIgnoreOtherActivityGesture")
                + "_started" + observedBoolean(consumer, "mIsRecentsStared")
                + "_min" + observedBoolean(consumer, "mPassedMinimumMoveSlop")
                + "_pilfer" + observedBoolean(consumer, "mPassedPilferInputSlop");
        try {
            Object manager = field(consumer, "mTaskAnimationManager");
            return gates + ";state=handler" + (field(consumer, "mInteractionHandler") == null ? 0 : 1)
                    + ";manager_display=" + (Integer) field(manager, "mDisplayId")
                    + ";native_result=controller" + (field(manager, "mController") == null ? 0 : 1)
                    + "_pending" + observedBoolean(manager, "mRecentsAnimationStartPending")
                    + "_callbacks" + (field(manager, "mCallbacks") == null ? 0 : 1);
        } catch (Throwable unavailable) { return gates + ";native_result=consumer_state_capability_missing"; }
    }

    private static String observedBoolean(Object owner, String name) {
        try { Object value = field(owner, name); return value instanceof Boolean ? ((Boolean) value ? "1" : "0") : "x"; }
        catch (Throwable unavailable) { return "x"; }
    }

    private static String observedNativeAction(MotionEvent event) {
        try { return Integer.toString(event.getActionMasked()); }
        catch (Throwable unavailable) { return "unknown"; }
    }

    private static String observedConsumerClass(Object owner, String fieldName) {
        try {
            Object value = field(owner, fieldName);
            if (value == null) return "none";
            String name = value.getClass().getName();
            return name.matches("[A-Za-z0-9_.$]{1,160}") ? name : "unknown";
        } catch (Throwable unavailable) { return "unknown"; }
    }

    private static String observedSwipeRegion(Object owner) {
        try {
            Object value = field(owner, "mIsInSwipeUpTouchRegion");
            return value instanceof Boolean ? value.toString() : "unknown";
        } catch (Throwable unavailable) { return "unknown"; }
    }

    private static String observedGestureState(Object owner) {
        try { return field(owner, "mGestureState") == null ? "false" : "true"; }
        catch (Throwable unavailable) { return "unknown"; }
    }

    private static Route begin(AugmentModule module, Object owner, MotionEvent event, int source) throws Throwable {
        if (!(owner instanceof Context)) return null;
        Context context = (Context) owner;
        String sourceUnique = "";
        if (source > 0) {
            sourceUnique = ownedSourceUnique(context, source);
            if (sourceUnique.isEmpty()) return null;
        } else if (source != 0) return null;
        boolean physicalHost = false;
        try {
        if (event.getPointerCount() != 1
                || (event.getSource() & InputDevice.SOURCE_TOUCHSCREEN) != InputDevice.SOURCE_TOUCHSCREEN)
            return source == 0 ? null : blocked(owner, event, source, sourceUnique, "unsupported_touch_source");
        Object rotation = AtomicWorkbenchQuickstepCapabilities.modern
                ?AtomicWorkbenchQuickstepCapabilities.rotation(owner,source):field(owner, "mRotationTouchHelper");
        MotionEvent probe = MotionEvent.obtain(event);
        boolean bottom;
        try {
            call(rotation, "setOrientationTransformIfNeeded", new Class<?>[]{MotionEvent.class}, probe);
            bottom = Boolean.TRUE.equals(call(rotation, "isInSwipeUpTouchRegion", new Class<?>[]{MotionEvent.class}, probe));
        } finally { probe.recycle(); }
        if (!bottom) return source == 0 ? null : blocked(owner, event, source, sourceUnique, "outside_navigation_region");
        module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source
                + ";target_display=-1;auth=false;phase=bottom_observed;reason=rom_touch_region");
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        List<ActivityManager.RunningTaskInfo> tasks = manager == null ? null : manager.getRunningTasks(128);
        int user = android.os.Process.myUid() / 100000;
        ActivityManager.RunningTaskInfo foreground = physicalForeground(tasks, user);
        if (foreground == null || !HOST.equals(foreground.topActivity)) {
            module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=-1;auth=false"
                    + ";phase=host_snapshot;reason=physical_host_not_foreground;scanned=" + (tasks == null ? 0 : tasks.size())
                    + ";task=" + (foreground == null ? -1 : foreground.taskId)
                    + ";component=" + (foreground == null || foreground.topActivity == null ? "none" : foreground.topActivity.flattenToString()));
            return denied(module, owner, event, source, sourceUnique, -1, "physical_host_not_foreground");
        }
        physicalHost = source == 0;
        Bundle target = context.getContentResolver().call(TARGET, "gesture_target", null, null);
        if (target == null || !target.getBoolean("active", false))
            return denied(module, owner, event, source, sourceUnique, -1, "no_active_main");
        int display = target.getInt("display_id", -1);
        if (source > 0 && source != display)
            return denied(module, owner, event, source, sourceUnique, display, "source_not_current_main");
        if (target.getInt("user", -1) != user
                || target.getInt("host_task_id", -1) != foreground.taskId
                || target.getInt("owner_uid", -1) != context.getPackageManager().getApplicationInfo("ls.augment.com", 0).uid)
            return denied(module, owner, event, source, sourceUnique, display, "main_owner_or_host_mismatch");
        long age = SystemClock.elapsedRealtime() - target.getLong("updated_elapsed", -1);
        long session = target.getLong("session", -1);
        if (age < 0 || age > 2500L || session <= 0) return denied(module, owner, event, source, sourceUnique, display, "stale_main_session");
        if (!AtomicWorkbenchQuickstepHook.authenticated(context, display, tasks)) return denied(module, owner, event, source, sourceUnique, display, "main_display_not_authenticated");
        ArrayList<ActivityManager.RunningTaskInfo> selected = new ArrayList<>();
        for (ActivityManager.RunningTaskInfo task : tasks) if (task != null
                && (Integer) field(task, "displayId") == display && (Integer) field(task, "userId") == user) selected.add(task);
        if (selected.isEmpty()) return denied(module, owner, event, source, sourceUnique, display, "main_tasks_missing");
        android.hardware.display.DisplayManager displayManager = (android.hardware.display.DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        String unique = (String) call(displayManager.getDisplay(display), "getUniqueId", new Class<?>[0]);
        if (!unique.equals(target.getString("display_unique_id", "")))
            return denied(module, owner, event, source, sourceUnique, display, "main_display_identity_changed");
        Route route = new Route(owner, source, display, event.getDownTime(), session, user, selected, foreground.taskId, unique);
        Bundle stream = new Bundle();
        for (String key : new String[]{"display_id", "window_id", "host_task_id", "owner_uid", "user"})
            stream.putInt(key, target.getInt(key, -1));
        stream.putLong("session", session); stream.putLong("down_time", event.getDownTime());
        stream.putString("display_unique_id", unique); route.nativeGestureRequest = stream;
        try { AtomicWorkbenchQuickstepTargetHook.prepare(module, route); }
        catch (Throwable failure) {
            route.failure = "native_display_resources_unavailable";
            module.logFeatureError("ATOMIC_NATIVE_RECENTS source_display=" + source + ";target_display=" + display
                    + ";auth=true;phase=failed;reason=" + route.failure, failure);
            return route;
        }
        Object model = field(owner, "mRecentsDisplayModel");
        if(AtomicWorkbenchQuickstepCapabilities.modern)AtomicWorkbenchQuickstepCapabilities.verifyInput(owner,display);
        if (call(model, "getTaskAnimationManager", new Class<?>[]{int.class}, display) == null) {
            // Some ROM flags initialize only display 0. Use the ROM's own bounded resource
            // factory for this authenticated live display, never a manager built by the module.
            call(model, "storeDisplayResource", new Class<?>[]{int.class}, display);
            if (call(model, "getTaskAnimationManager", new Class<?>[]{int.class}, display) == null)
                return denied(module, owner, event, source, sourceUnique, display, "native_display_manager_missing");
        }
        return route;
        } catch (Throwable failure) {
            if (source == 0 && !physicalHost) throw failure;
            module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + source
                    + ";auth=false;phase=route_failed;branch=" + branch(source) + ";reason=target_unavailable", failure);
            return blocked(owner, event, source, sourceUnique, "target_unavailable");
        }
    }

    static Route dispatchRoute() { return DISPATCH.get(); }

    private static void deoptimizeInputCallers(AugmentModule module, ClassLoader loader, Class<?> service) {
        int count = 0;
        // ART can keep an already compiled synthetic listener/bridge at its old
        // direct-call entrypoint after the private service method is hooked.
        java.util.ArrayList<Class<?>> bridges = new java.util.ArrayList<>(); bridges.add(service);
        try { bridges.add(Class.forName(service.getName() + "$InputMonitorResource", false, loader)); }
        catch (ClassNotFoundException optionalVariant) { }
        for (Class<?> bridge : bridges) for (Method candidate : bridge.getDeclaredMethods()) {
            Class<?>[] parameters = candidate.getParameterTypes();
            if (candidate.getReturnType() == void.class && java.lang.reflect.Modifier.isStatic(candidate.getModifiers())
                    && parameters.length == 2 && parameters[0] == service && parameters[1] == InputEvent.class) {
                module.deoptimize(candidate); count++;
            }
        }
        for (String name : new String[]{"com.android.quickstep.i6", "com.android.quickstep.q6"}) try {
            Class<?> listener = Class.forName(name, false, loader);
            Method callback = listener.getDeclaredMethod("onInputEvent", InputEvent.class);
            boolean ownsService = false;
            for (Field member : listener.getDeclaredFields()) if (member.getType() == service) ownsService = true;
            if (!ownsService || callback.getReturnType() != void.class) continue;
            module.deoptimize(callback); count++;
        } catch (ReflectiveOperationException optionalVariant) { /* The named ROM does not use these obfuscated listeners. */ }
        module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT phase=callers_prepared;count=" + count + ";reason=compiled_input_bridges");
    }

    /** Called only by the ROM's uncaught-exception automatic data-clear path. */
    static String crashProtectionReason(Context context) throws Exception {
        if (context == null || context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).uid
                != android.os.Process.myUid()) return "launcher_uid_mismatch";
        android.content.pm.ResolveInfo home = context.getPackageManager().resolveActivity(
                new android.content.Intent(android.content.Intent.ACTION_MAIN).addCategory(android.content.Intent.CATEGORY_HOME),
                android.content.pm.PackageManager.MATCH_DEFAULT_ONLY);
        if (home == null || home.activityInfo == null || !context.getPackageName().equals(home.activityInfo.packageName))
            return "primary_launcher_mismatch";
        int user = android.os.Process.myUid() / 100000;
        Bundle target = context.getContentResolver().call(TARGET, "gesture_target", null, null);
        if (target == null || !target.getBoolean("active", false)) return "no_active_main";
        if (target.getInt("user", -1) != user || target.getLong("session", -1) <= 0
                || target.getInt("owner_uid", -1) != context.getPackageManager().getApplicationInfo("ls.augment.com", 0).uid)
            return "main_owner_or_user_mismatch";
        long age = SystemClock.elapsedRealtime() - target.getLong("updated_elapsed", -1);
        if (age < 0 || age > 2500) return "stale_main_session";
        int display = target.getInt("display_id", -1);
        // This identity was published from the Root-confirmed slot, not inferred
        // from the current Display object after an ID might have been reused.
        if (!AtomicWorkbenchQuickstepHook.ownedDisplayIdentity(context, display, target.getString("display_unique_id", "")))
            return "main_display_identity_changed";
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        List<ActivityManager.RunningTaskInfo> tasks = manager == null ? null : manager.getRunningTasks(128);
        ActivityManager.RunningTaskInfo physical = physicalForeground(tasks, user);
        if (physical == null) return "physical_host_missing";
        return physical.taskId == target.getInt("host_task_id", -1) && HOST.equals(physical.topActivity)
                ? "" : "physical_host_mismatch";
    }

    private static void cancelNativeStream(AugmentModule module, Object owner, Route route) {
        endNativeGesture(route);
        if (!route.dispatched || route.nativeReset) return;
        route.nativeReset = true;
        Route previous = DISPATCH.get();
        try {
            DISPATCH.set(route);
            AtomicWorkbenchQuickstepTargetHook.cancel(module, route);
            call(owner, "reset", new Class<?>[]{int.class}, route.target);
        } catch (Throwable failure) {
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=native_stream_reset_failed;target_display=" + route.target, failure);
        } finally { if (previous == null) DISPATCH.remove(); else DISPATCH.set(previous); }
    }

    private static boolean beginNativeGesture(Route route) {
        try {
            Object owner = route.service.get();
            if (!(owner instanceof Context) || route.nativeGestureRequest == null) return false;
            Bundle reply = ((Context) owner).getContentResolver().call(TARGET, "native_gesture", "begin", route.nativeGestureRequest);
            return route.nativeGestureHeld = reply != null && reply.getBoolean("success", false);
        } catch (RuntimeException unavailable) { return false; }
    }

    private static void endNativeGesture(Route route) {
        if (!route.nativeGestureHeld) return;
        route.nativeGestureHeld = false;
        try {
            Object owner = route.service.get();
            if (owner instanceof Context) ((Context) owner).getContentResolver().call(TARGET, "native_gesture", "end", route.nativeGestureRequest);
        } catch (RuntimeException unavailable) { /* Expiry and target retirement also release the deferral. */ }
    }

    static String revalidate(Route route) throws Exception {
        return revalidate(route, true);
    }

    static String revalidate(Route route, boolean requireRunningTask) throws Exception {
        Object owner = route.service.get();
        if (!(owner instanceof Context) || android.os.Process.myUid() / 100000 != route.user) return "route_user_changed";
        Context context = (Context) owner;
        String metadata = revalidateInput(route);
        if (!metadata.isEmpty()) return metadata;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        List<ActivityManager.RunningTaskInfo> tasks = manager == null ? null : manager.getRunningTasks(128);
        if (!AtomicWorkbenchQuickstepHook.authenticated(context, route.target, tasks)) return "route_display_unconfirmed";
        android.hardware.display.DisplayManager displays = (android.hardware.display.DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        if (!route.unique.equals(call(displays.getDisplay(route.target), "getUniqueId", new Class<?>[0]))) return "route_display_reused";
        ActivityManager.RunningTaskInfo physical = physicalForeground(tasks, route.user);
        if (physical == null || physical.taskId != route.hostTask || !HOST.equals(physical.topActivity)) return "route_host_changed";
        boolean top = false;
        for (ActivityManager.RunningTaskInfo task : tasks) if (task != null && (Integer) field(task, "userId") == route.user) {
            int display = (Integer) field(task, "displayId");
            if (display == route.target && !top) {
                if (requireRunningTask && task.taskId != route.tasks.get(0).taskId) return "route_running_task_changed";
                top = true;
            }
        }
        return top ? "" : "route_tasks_missing";
    }

    static ActivityManager.RunningTaskInfo physicalForeground(List<ActivityManager.RunningTaskInfo> tasks, int user) throws Exception {
        if (tasks == null) return null;
        for (int i = 0; i < tasks.size() && i < 128; i++) {
            ActivityManager.RunningTaskInfo task = tasks.get(i);
            if (task == null || (Integer) field(task, "displayId") != 0 || (Integer) field(task, "userId") != user) continue;
            // getRunningTasks includes hidden HOME/app tasks. A recently active
            // hidden HOME must not displace the still visible physical host.
            if (!Boolean.TRUE.equals(field(task, "isVisible"))) continue;
            return task;
        }
        return null;
    }

    /** Check the live pane role before every continuation, without fetching the task stack per frame. */
    private static String revalidateInput(Route route) throws Exception {
        Object owner = route.service.get();
        if (!(owner instanceof Context) || android.os.Process.myUid() / 100000 != route.user) return "route_user_changed";
        Context context = (Context) owner;
        Bundle target = context.getContentResolver().call(TARGET, "gesture_target", null, null);
        if (target == null || !target.getBoolean("active", false)) return "route_inactive";
        if (target.getLong("session", -1) != route.session || target.getInt("display_id", -1) != route.target
                || target.getInt("host_task_id", -1) != route.hostTask || target.getInt("user", -1) != route.user
                || target.getInt("owner_uid", -1) != context.getPackageManager().getApplicationInfo("ls.augment.com", 0).uid)
            return "route_session_changed";
        if (!route.unique.equals(target.getString("display_unique_id", ""))) return "route_display_reused";
        long age = SystemClock.elapsedRealtime() - target.getLong("updated_elapsed", -1);
        if (age < 0 || age > 2500L) return "route_session_expired";
        return "";
    }

    static boolean retainedWindowValid(Route route) throws Exception {
        Object owner = route.service.get();
        if (!(owner instanceof Context) || android.os.Process.myUid() / 100000 != route.user) return false;
        Context context = (Context) owner;
        Bundle target = context.getContentResolver().call(TARGET, "gesture_target", null, null);
        if (target == null || !target.getBoolean("active", false) || target.getLong("session", -1) != route.session
                || target.getInt("host_task_id", -1) != route.hostTask || target.getInt("user", -1) != route.user
                || target.getInt("owner_uid", -1) != context.getPackageManager().getApplicationInfo("ls.augment.com", 0).uid) return false;
        long age = SystemClock.elapsedRealtime() - target.getLong("updated_elapsed", -1);
        // A retained side window need not contain HOME or remain the main
        // display. Its original session and actual VD identity must still live.
        return age >= 0 && age <= 2500L && AtomicWorkbenchQuickstepHook.ownedDisplayIdentity(context, route.target, route.unique);
    }

    private static Route denied(AugmentModule module, Object owner, MotionEvent event, int source, String unique, int display, String reason) {
        // Only the dedicated foreground host owns physical-bottom gestures. Once
        // confirmed, a missing/stale target must cancel this stream, never navigate
        // the host itself HOME and trigger its stopped-session cleanup.
        if (source == 0 && "physical_host_not_foreground".equals(reason)) return null;
        module.logFeatureInfo("ATOMIC_NATIVE_HOME_INPUT source_display=" + source + ";target_display=" + display
                + ";auth=false;phase=route_rejected"
                + ";branch=" + branch(source) + ";reason=" + reason);
        return blocked(owner, event, source, unique, reason);
    }

    private static Route blocked(Object owner, MotionEvent event, int source, String unique, String reason) {
        Route route = new Route(owner, source, source, event.getDownTime(), -1,
                android.os.Process.myUid() / 100000, new ArrayList<>(), -1, unique);
        route.failure = reason;
        return route;
    }

    private static String branch(int source) { return source == 0 ? "physical_bottom" : "injected_main"; }
    private static String ownedSourceUnique(Context context, int source) throws Exception {
        android.hardware.display.DisplayManager displays = (android.hardware.display.DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
        Object display = displays == null ? null : displays.getDisplay(source);
        String unique = display == null ? "" : (String) call(display, "getUniqueId", new Class<?>[0]);
        return AtomicWorkbenchQuickstepHook.ownedDisplayIdentity(context, source, unique) ? unique : "";
    }
    private static Route stream(Object owner, int source) {
        Map<Integer, Route> streams = STREAMS.get(owner);
        return streams == null ? null : streams.get(source);
    }
    private static void removeStream(Object owner, int source) {
        Map<Integer, Route> streams = STREAMS.get(owner);
        if (streams != null) { streams.remove(source); if (streams.isEmpty()) STREAMS.remove(owner); }
    }

    private static Object field(Object object, String name) throws Exception {
        if(AtomicWorkbenchQuickstepCapabilities.modern&&name.equals("mRecentsDisplayModel"))return AtomicWorkbenchQuickstepCapabilities.model(object);
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(object); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Method method(Class<?> type, String name, Class<?>... parameters) throws Exception {
        for (; type != null; type = type.getSuperclass()) {
            try { Method m = type.getDeclaredMethod(name, parameters); m.setAccessible(true); return m; }
            catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(name);
    }
    private static Object call(Object object, String name, Class<?>[] parameters, Object... arguments) throws Exception {
        return method(object.getClass(), name, parameters).invoke(object, arguments);
    }
}
