package ls.augment.com.hook;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface.ExceptionMode;

/** Keeps the ROM's real per-display Recents window and task state together.
 * Merely passing a display argument is insufficient: this ROM ignores it when
 * its connected-display flag is disabled. No process-wide flag is changed. */
final class AtomicWorkbenchQuickstepTargetHook {
    private static final ThreadLocal<AtomicWorkbenchQuickstepInputHook.Route> WINDOW = new ThreadLocal<>();
    private static final WeakHashMap<Object, State> GESTURES = new WeakHashMap<>(), CALLBACKS = new WeakHashMap<>(), CONTROLLERS = new WeakHashMap<>();
    private static final WeakHashMap<Object, AtomicWorkbenchQuickstepInputHook.Route> WINDOWS = new WeakHashMap<>();
    private static final WeakHashMap<Object, LauncherView> LAUNCHER_VIEWS = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> RETIRED_WINDOWS = new WeakHashMap<>();
    // A native view may draw once more after its task/input authority is retired.
    // Keep its last native palette until that Context is collected, without
    // retaining any route or granting the retired window further authority.
    private static final WeakHashMap<Object, Integer> FOREGROUNDS = new WeakHashMap<>();
    private static Constructor<?> cached;
    private static HomeLauncher homeLauncher;
    private static boolean installed;

    private static final class State {
        final AtomicWorkbenchQuickstepInputHook.Route route;
        final long started = SystemClock.elapsedRealtime();
        Object window, callback;
        volatile boolean targets, presented, terminal, finishToLauncher;
        State(AtomicWorkbenchQuickstepInputHook.Route route) { this.route = route; }
    }

    /** Optional native HOME path; every member is checked before it is selected. */
    private static final class HomeLauncher {
        Class<?> launcherInterface, launcher, recentsView;
        Field serviceObserver, serviceModel, observerModel, defaultContainer, viewOwner;
        Method created, resumed, activityResumed, finishing, destroyed, task, component, overview, root, dragLayer, plan, reload;
    }

    private static final class CardOptions {
        Class<?> taskView, taskContainer, task, wrapper;
        Method recents, containers, taskValue, factory;
        Field key, id, display, user, options;
        CardRoot root;
    }

    /** Optional framework capability; the older per-display factory remains available. */
    private static final class CardRoot {
        Object service;
        Class<?> info, token;
        Method roots, setRoot, binder, activityType;
        Field id, display, user, children, taskToken;
    }

    private static final class CardRootTarget {
        final int id;
        final Object token;
        final android.os.IBinder binder;
        CardRootTarget(int id, Object token, android.os.IBinder binder) {
            this.id = id; this.token = token; this.binder = binder;
        }
    }

    private static final class LauncherView {
        final AtomicWorkbenchQuickstepInputHook.Route route;
        final java.lang.ref.WeakReference<Object> owner;
        LauncherView(AtomicWorkbenchQuickstepInputHook.Route route, Object owner) {
            this.route = route; this.owner = new java.lang.ref.WeakReference<>(owner);
        }
    }

    static final class Scope implements AutoCloseable {
        private final AtomicWorkbenchQuickstepInputHook.Route previous;
        boolean allowed = true;
        Scope(AtomicWorkbenchQuickstepInputHook.Route route) { previous = WINDOW.get(); if (route != null) WINDOW.set(route); }
        @Override public void close() { if (previous == null) WINDOW.remove(); else WINDOW.set(previous); }
    }

    private AtomicWorkbenchQuickstepTargetHook() { }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    static synchronized void install(AugmentModule module, ClassLoader loader) throws Exception {
        if (installed) return;
        homeLauncher = null;
        Class<?> tracker = Class.forName("com.android.quickstep.TopTaskTracker$CachedTaskInfo", false, loader);
        cached = tracker.getDeclaredConstructor(List.class, boolean.class, int.class); cached.setAccessible(true);
        Class<?> flags = Class.forName("com.android.quickstep.fallback.window.RecentsWindowFlags$Companion", false, loader);
        Class<?> service = Class.forName("com.android.quickstep.TouchInteractionService", false, loader);
        Class<?> callbacks = Class.forName("com.android.quickstep.RecentsAnimationCallbacks", false, loader);
        Class<?> controller = Class.forName("com.android.quickstep.RecentsAnimationController", false, loader);
        Class<?> result = Class.forName("com.android.quickstep.RecentsAnimationController$1", false, loader);
        Class<?> view = Class.forName("com.android.quickstep.views.RecentsView", false, loader);
        Class<?> handler = Class.forName("com.android.quickstep.AbsSwipeUpHandler", false, loader);
        Class<?> resource = Class.forName("com.android.quickstep.fallback.window.RecentsDisplayModel$RecentsDisplayResource", false, loader);
        Class<?> windowContext = Class.forName("com.android.quickstep.fallback.window.RecentsWindowContext", false, loader);
        Class<?> windowManager = Class.forName("com.android.quickstep.fallback.window.RecentsWindowManager", false, loader);
        Class<?> stateType = Class.forName("com.android.launcher3.statemanager.a", false, loader);
        Method foreground = method(windowContext, "getForeColor");
        Method stateQuery = method(windowManager, "isInState", stateType);
        Method synthetic = method(Class.forName("com.android.quickstep.GestureState", false, loader), "useSyntheticRecentsTransition");
        Method flag = method(flags, "getEnableOverviewInWindow");
        Method gesture = named(service, "createGestureState", 4);
        Method start = named(callbacks, "onAnimationStart", 7);
        Method delivered = named(callbacks, "lambda$onAnimationStart$2", 2);
        Method cancel = method(callbacks, "onAnimationCanceled", java.util.HashMap.class);
        Method finish = method(controller, "finishController", boolean.class, boolean.class, Runnable.class, boolean.class, boolean.class);
        Method completed = method(result, "send", int.class, Bundle.class);
        Method plan = method(view, "applyLoadPlan", List.class);
        Method intent = method(handler, "getLaunchIntent");
        Class<?> homeListener = Class.forName("com.android.quickstep.AbsSwipeUpHandler$AppToHomeAnimationSuccessListener", false, loader);
        Method homeEnd = method(homeListener, "onAnimationEnd", android.animation.Animator.class);
        Method nativeHomeEnd = method(homeListener.getSuperclass(), "onAnimationEnd", android.animation.Animator.class);
        for (Method m : new Method[]{flag, gesture, start, delivered, cancel, finish, completed, plan, intent, foreground, stateQuery, homeEnd}) module.deoptimize(m);
        // These callers may otherwise retain an ART-inlined flag-off branch.
        module.deoptimize(resource.getDeclaredConstructor(int.class, Context.class, int.class));
        module.deoptimize(method(Class.forName("com.android.quickstep.fallback.window.RecentsWindowFlags", false, loader), "getEnableOverviewInWindow"));
        module.deoptimize(synthetic);
        module.deoptimize(method(view, "setContentAlpha", float.class));
        module.deoptimize(method(handler, "onLauncherStart"));
        module.deoptimize(method(Class.forName("com.android.quickstep.TaskShortcutFactory$SplitSelectSystemShortcut", false, loader),
                "onClick", android.view.View.class));
        // The small getLaunchIntent method can itself be inlined into this
        // upstream caller; it chooses HOME/overview before animation dispatch.
        Method tracking = method(Class.forName("com.android.quickstep.inputconsumers.OtherActivityInputConsumer", false, loader),
                "startTouchTrackingForWindowAnimation", long.class);
        module.deoptimize(tracking);
        module.registerFeatureHook(module.prepareFeatureHook(tracking, "atomic_workbench.recents.tracking_failure", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            try { return chain.proceed(); }
            catch (Throwable failure) {
                AtomicWorkbenchQuickstepInputHook.Route route = AtomicWorkbenchQuickstepInputHook.dispatchRoute();
                if (route != null) try {
                    module.logFeatureError("ATOMIC_NATIVE_HOME_INPUT phase=native_tracking_failure;source_display="
                            + route.source + ";target_display=" + route.target, failure);
                } catch (Throwable ignored) { }
                // The ROM may catch this inside onMotionEvent. Keep that native handling unchanged.
                throw failure;
            }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(flag, "atomic_workbench.recents.window_scope", true).intercept(chain -> {
            AtomicWorkbenchQuickstepInputHook.Route route = WINDOW.get();
            if (route == null) route = AtomicWorkbenchQuickstepInputHook.dispatchRoute();
            return route != null && !usesHomeLauncher(route) ? true : chain.proceed();
        }));
        module.registerFeatureHook(module.prepareFeatureHook(foreground, "atomic_workbench.recents.foreground_color", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object owner = chain.getThisObject();
            Integer previous; synchronized (FOREGROUNDS) { previous = FOREGROUNDS.get(owner); }
            AtomicWorkbenchQuickstepInputHook.Route route; synchronized (WINDOWS) { route = WINDOWS.get(owner); }
            if (route == null) route = WINDOW.get();
            boolean owned;
            try { owned = route != null && windowIdentity(owner, route); }
            catch (Exception unavailable) { if (previous != null) return previous; throw unavailable; }
            if (!owned) return previous == null ? chain.proceed() : previous;
            // This ROM leaves RecentsWindowContext.getForeColor as Kotlin TODO.
            // Its own Recents view calls it during inflation/draw; reuse the live
            // primary launcher's real foreground color for our authenticated window.
            int color;
            try { color = foregroundColor(module, route, (Context) owner); }
            catch (Exception unavailable) { if (previous != null) return previous; throw unavailable; }
            synchronized (FOREGROUNDS) { FOREGROUNDS.put(owner, color); }
            return color;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(stateQuery, "atomic_workbench.recents.native_state_query", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object owner = chain.getThisObject();
            AtomicWorkbenchQuickstepInputHook.Route route; synchronized (WINDOWS) { route = WINDOWS.get(owner); }
            boolean known = route != null;
            if (route == null) route = WINDOW.get();
            boolean retired; synchronized (RETIRED_WINDOWS) { retired = RETIRED_WINDOWS.containsKey(owner); }
            if (!known && !retired && (route == null || !windowIdentity(owner, route))) return chain.proceed();
            // The Kotlin bridge casts every BaseState query to RecentsState.
            // Vendor Recents controls also query LauncherState through the same
            // StatefulContainer interface. Follow that interface's own default
            // implementation: compare the window's actual StateManager state.
            // This reads native state without inventing a cross-family mapping.
            Object nativeManager = call(owner, "getStateManager", new Class<?>[0]);
            return call(nativeManager, "C", new Class<?>[0]) == chain.getArg(0);
        }));
        module.registerFeatureHook(module.prepareFeatureHook(homeEnd, "atomic_workbench.recents.home_animation_end", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object listener = chain.getThisObject();
            Object owner = field(field(listener, "this$0"), "mContainer");
            boolean known; synchronized (WINDOWS) { known = WINDOWS.containsKey(owner); }
            if (!known) synchronized (RETIRED_WINDOWS) { known = RETIRED_WINDOWS.containsKey(owner); }
            if (!known) return chain.proceed();
            // Preserve the real success/cancel callback in AnimationSuccessListener.
            // Only the OEM tail assumes every container is a StatefulActivity;
            // a RecentsWindowManager is a Context with its own native state.
            try { module.getInvoker(nativeHomeEnd).invokeSpecial(listener, chain.getArg(0)); }
            catch (java.lang.reflect.InvocationTargetException failure) { throw failure.getCause(); }
            call(field(listener, "$homeAnimationFactory"), "getWorkspaceView", new Class<?>[0]);
            Object applier = call(field(listener, "$transformParams"), "getApplier", new Class<?>[0]);
            if (applier != null) call(applier, "setAsyncAnimStarted", new Class<?>[]{boolean.class}, false);
            return null;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(synthetic, "atomic_workbench.recents.target_transition", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (GESTURES) { state = GESTURES.get(chain.getThisObject()); }
            if (state == null) return chain.proceed();
            if (usesHomeLauncher(state.route)) return chain.proceed();
            Object requested = chain.proceed();
            Object top = call(call(chain.getThisObject(), "getRunningTask", new Class<?>[0]), "getTopTask", new Class<?>[0]);
            module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=transition_source;source_display=" + state.route.source
                    + ";target_display=" + state.route.target + ";requested_synthetic=" + Boolean.TRUE.equals(requested)
                    + ";running_task=" + (top == null ? -1 : field(top, "taskId"))
                    + ";running_display=" + (top == null ? -1 : field(top, "displayId"))
                    + ";transition=real");
            // Shell's synthetic transition drops launch options and constructs
            // default-display HOME targets. Our per-display window must use the
            // real transition so its authenticated display options reach Shell.
            return false;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(intent, "atomic_workbench.recents.launch_intent", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (GESTURES) { state = GESTURES.get(field(chain.getThisObject(), "mGestureState")); }
            if (state == null) return chain.proceed();
            // OtherActivityInputConsumer selects the intent before entering
            // TaskAnimationManager. This scope must begin at that earlier step.
            try (Scope ignored = new Scope(state.route)) { return chain.proceed(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(plan, "atomic_workbench.recents.native_task_cards", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object owner = field(chain.getThisObject(), "mContainer");
            AtomicWorkbenchQuickstepInputHook.Route route; synchronized (WINDOWS) { route = WINDOWS.get(owner); }
            LauncherView launcherView = null;
            if (route == null) synchronized (LAUNCHER_VIEWS) {
                launcherView = LAUNCHER_VIEWS.get(chain.getThisObject());
                if (launcherView != null) route = launcherView.route;
            }
            if (route == null) {
                synchronized (RETIRED_WINDOWS) { if (RETIRED_WINDOWS.containsKey(owner)) return chain.proceed(new Object[]{java.util.List.of()}); }
                return chain.proceed();
            }
            if (!(launcherView != null ? launcherView.owner.get() == owner && retainedLauncherValid(route, owner, chain.getThisObject()) : retainedWindowValid(route, owner))) {
                if (launcherView != null) synchronized (LAUNCHER_VIEWS) {
                    if (LAUNCHER_VIEWS.get(chain.getThisObject()) != launcherView) return null;
                    // The same native Activity may be returned to the phone. It
                    // then owns ordinary Recents again, without the old VD lease.
                    if (actualDisplay(owner) == 0 && actualDisplay(chain.getThisObject()) == 0) {
                        LAUNCHER_VIEWS.remove(chain.getThisObject());
                        return chain.proceed();
                    }
                }
                if (launcherView == null) retireWindow(owner);
                module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=failed;reason=retained_window_identity_changed;target_display=" + route.target);
                return chain.proceed(new Object[]{java.util.List.of()});
            }
            // Do not modify the shared RecentsModel cache. A native per-display
            // view receives only complete groups belonging to its display/user.
            java.util.ArrayList<Object> selected = new java.util.ArrayList<>();
            if (chain.getArg(0) instanceof List<?> groups) for (Object group : groups) {
                List<?> tasks = (List<?>) call(group, "getTasks", new Class<?>[0]);
                boolean owned = !tasks.isEmpty();
                for (Object task : tasks) {
                    Object key = field(task, "key");
                    if ((Integer) field(key, "displayId") != route.target || (Integer) field(key, "userId") != route.user
                            || (Integer) field(key, "id") == route.hostTask) { owned = false; break; }
                }
                if (owned) selected.add(group);
            }
            if (launcherView != null) synchronized (LAUNCHER_VIEWS) {
                if (LAUNCHER_VIEWS.get(chain.getThisObject()) != launcherView) return null;
            }
            try (Scope ignored = new Scope(route)) { return chain.proceed(new Object[]{selected}); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(gesture, "atomic_workbench.recents.gesture_identity", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object value = chain.proceed();
            AtomicWorkbenchQuickstepInputHook.Route route = AtomicWorkbenchQuickstepInputHook.dispatchRoute();
            if (route != null && (Integer) chain.getArg(0) == route.target && value != null)
                synchronized (GESTURES) { GESTURES.put(value, new State(route)); }
            return value;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(start, "atomic_workbench.recents.animation_targets", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (CALLBACKS) { state = CALLBACKS.get(chain.getThisObject()); }
            if (state == null) return chain.proceed();
            String reason;
            try {
                reason = AtomicWorkbenchQuickstepInputHook.revalidate(state.route, false);
                if (reason.isEmpty()) reason = checkTargets(module, state, chain.getArg(1));
            } catch (Throwable failure) {
                module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=animation_target_observation_failed", failure);
                reason = "animation_target_observation_failed";
            }
            if (!reason.isEmpty()) {
                state.route.failure = reason;
                state.terminal = true; log(module, state, "failed", reason, -1, -1); clear(state);
                // Return the native animation to its original app. Never replay
                // a partly started physical stream or present the wrong display.
                try (Scope ignored = new Scope(state.route)) {
                    call(chain.getThisObject(), "notifyAnimationCanceled", new Class<?>[0]);
                    for (Method m : chain.getArg(0).getClass().getMethods()) if (m.getName().equals("finish") && m.getParameterCount() == 3
                            && m.getParameterTypes()[0] == boolean.class && m.getParameterTypes()[1] == boolean.class) {
                        m.invoke(chain.getArg(0), false, false, null); break;
                    }
                } catch (Throwable failure) { module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=animation_cancel_failed", failure); }
                return null;
            }
            state.targets = true;
            try (Scope ignored = new Scope(state.route)) { return chain.proceed(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(delivered, "atomic_workbench.recents.animation_delivered", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (CALLBACKS) { state = CALLBACKS.get(chain.getThisObject()); }
            if (state == null) return chain.proceed();
            Object nativeController = field(chain.getThisObject(), "mController");
            synchronized (CONTROLLERS) { CONTROLLERS.put(nativeController, state); }
            try (Scope ignored = new Scope(state.route)) { return chain.proceed(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(cancel, "atomic_workbench.recents.animation_cancelled", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (CALLBACKS) { state = CALLBACKS.get(chain.getThisObject()); }
            if (state == null) return chain.proceed();
            if (!state.terminal) { state.terminal = true; log(module, state, "cancelled", "native_cancelled", -1, -1); clear(state); }
            try (Scope ignored = new Scope(state.route)) { return chain.proceed(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(finish, "atomic_workbench.recents.finish_request", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            State state; synchronized (CONTROLLERS) { state = CONTROLLERS.get(chain.getThisObject()); }
            if (state == null) return chain.proceed();
            state.finishToLauncher = Boolean.TRUE.equals(chain.getArg(0));
            String reason;
            try { reason = AtomicWorkbenchQuickstepInputHook.revalidate(state.route, false); }
            catch (Throwable unavailable) { reason = "finish_target_unavailable"; }
            if (!reason.isEmpty()) {
                // A pane can become a side pane after the remote animation started.
                // Release its original app leash instead of sending that old pane HOME.
                state.route.failure = reason;
                state.finishToLauncher = false;
                log(module, state, "finish_cancelled", reason, actualDisplay(state.window), -1);
                try (Scope ignored = new Scope(state.route)) {
                    return chain.proceed(new Object[]{false, chain.getArg(1), chain.getArg(2), chain.getArg(3), chain.getArg(4)});
                }
            }
            log(module, state, "finish_requested", Boolean.TRUE.equals(chain.getArg(0)) ? "to_recents_or_home" : "to_app", actualDisplay(state.window), -1);
            try (Scope ignored = new Scope(state.route)) { return chain.proceed(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(completed, "atomic_workbench.recents.finish_acknowledged", true)
                .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
            Object value = chain.proceed(); State state;
            synchronized (CONTROLLERS) { state = CONTROLLERS.remove(field(chain.getThisObject(), "this$0")); }
            if (state != null) new Handler(Looper.getMainLooper()).post(() -> finishObserved(module, state));
            return value;
        }));
        installed = true;
        installWindowInitialization(module, loader);
        installWindowHomeIdentity(module, loader);
    }

    /** The ROM tracker is shared by displays; its factory drops the callback's Context argument. */

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installWindowInitialization(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> container = Class.forName("com.android.quickstep.FallbackWindowInterface", false, loader);
            Class<?> listener = Class.forName("com.android.quickstep.util.ContextInitListener", false, loader);
            Method create = method(container, "createActivityInitListener", java.util.function.Predicate.class);
            if (!listener.isAssignableFrom(create.getReturnType())) throw new NoSuchMethodException("window_init_listener_return");
            Field callback = listener.getDeclaredField("mOnInitListener");
            if (callback.getType() != java.util.function.BiPredicate.class) throw new NoSuchFieldException("window_init_callback_type");
            callback.setAccessible(true);
            module.deoptimize(create);
            for (Constructor<?> caller : Class.forName("com.android.quickstep.AbsSwipeUpHandler", false, loader).getDeclaredConstructors())
                module.deoptimize(caller);
            module.registerFeatureHook(module.prepareFeatureHook(create, "atomic_workbench.recents.window_initialization", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Object result = chain.proceed();
                AtomicWorkbenchQuickstepInputHook.Route route = AtomicWorkbenchQuickstepInputHook.dispatchRoute();
                if (route == null || usesHomeLauncher(route)) return result;
                try {
                    Object expected = call(chain.getThisObject(), "getCreatedContainer", new Class<?>[0]);
                    AtomicWorkbenchQuickstepInputHook.Route registered; synchronized (WINDOWS) { registered = WINDOWS.get(expected); }
                    if (registered != route || !listener.isInstance(result) || !retainedWindowValid(route, expected)) return result;
                    Object original = callback.get(result);
                    if (!(original instanceof java.util.function.BiPredicate)) throw new NoSuchFieldException("window_init_callback_missing");
                    @SuppressWarnings("unchecked") java.util.function.BiPredicate<Object, Boolean> nativeCallback =
                            (java.util.function.BiPredicate<Object, Boolean>) original;
                    boolean[] observedWait = {false};
                    java.util.function.BiPredicate<Object, Boolean> guarded = (created, started) -> {
                        if (!retainedWindowValid(route, expected)) return false;
                        final Object panel;
                        try { panel = call(expected, "getOverviewPanel", new Class<?>[0]); }
                        catch (Exception unavailable) {
                            // Unknown later structure keeps the native callback and its native exception behavior.
                            return nativeCallback.test(created, started);
                        }
                        if (created != expected || panel == null) {
                            if (!observedWait[0]) {
                                observedWait[0] = true;
                                try {
                                    module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=window_init_wait;target_display=" + route.target
                                            + ";reason=" + (created != expected ? "foreign_context" : "overview_not_created"));
                                } catch (Throwable ignored) { }
                            }
                            // ContextTracker retains callbacks returning true until native handleCreate arrives.
                            return true;
                        }
                        return nativeCallback.test(created, started);
                    };
                    callback.set(result, guarded);
                } catch (Throwable unavailable) {
                    try { module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=window_init_unavailable;target_display=" + route.target, unavailable); }
                    catch (Throwable ignored) { }
                }
                return result;
            }));
        } catch (Throwable unavailable) {
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=window_init_capability_missing", unavailable);
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installWindowHomeIdentity(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> observer = Class.forName("com.android.quickstep.OverviewComponentObserver", false, loader);
            Class<?> service = Class.forName("com.android.quickstep.TouchInteractionService", false, loader);
            Class<?> model = Class.forName("com.android.quickstep.fallback.window.RecentsDisplayModel", false, loader);
            Class<?> fallback = Class.forName("com.android.quickstep.FallbackWindowInterface", false, loader);
            Class<?> manager = Class.forName("com.android.quickstep.fallback.window.RecentsWindowManager", false, loader);
            Method sameActivity = method(observer, "isHomeAndOverviewSameActivity");
            Method window = method(model, "getRecentsWindowManager", int.class);
            Method container = method(model, "getFallbackWindowInterface", int.class);
            Method created = method(fallback, "getCreatedContainer");
            Field serviceObserver = service.getDeclaredField("mOverviewComponentObserver");
            Field serviceModel = service.getDeclaredField("mRecentsDisplayModel");
            Field observerModel = observer.getDeclaredField("mRecentsDisplayModel");
            Field containerWindow = fallback.getDeclaredField("mRecentsWindowManager");
            if (sameActivity.getReturnType() != boolean.class
                    || java.lang.reflect.Modifier.isStatic(sameActivity.getModifiers())
                    || window.getReturnType() != manager || container.getReturnType() != fallback
                    || created.getReturnType() != manager
                    || java.lang.reflect.Modifier.isStatic(window.getModifiers())
                    || java.lang.reflect.Modifier.isStatic(container.getModifiers())
                    || java.lang.reflect.Modifier.isStatic(created.getModifiers())
                    || serviceObserver.getType() != observer || serviceModel.getType() != model
                    || observerModel.getType() != model || containerWindow.getType() != manager
                    || !java.lang.reflect.Modifier.isFinal(containerWindow.getModifiers()))
                throw new NoSuchMethodException("window_home_identity_profile_mismatch");
            for (Field member : new Field[]{serviceObserver, serviceModel, observerModel, containerWindow}) {
                if (java.lang.reflect.Modifier.isStatic(member.getModifiers()))
                    throw new NoSuchFieldException("window_home_identity_static_field");
                member.setAccessible(true);
            }
            Class<?> selectors = Class.forName("com.android.quickstep.InputConsumerUtils", false, loader);
            Method base = consumerSelector(selectors, "newBaseConsumer", "android.content.Context", "boolean",
                    "com.android.launcher3.taskbar.g3", "com.android.quickstep.OverviewComponentObserver",
                    "com.android.quickstep.RecentsAnimationDeviceState", "com.android.quickstep.GestureState",
                    "com.android.quickstep.GestureState", "com.android.quickstep.TaskAnimationManager",
                    "com.android.systemui.shared.system.InputMonitorCompat", "com.android.quickstep.AbsSwipeUpHandler$Factory",
                    "java.util.function.Consumer", "com.android.systemui.shared.system.InputChannelCompat$InputEventReceiver",
                    "android.view.MotionEvent", "com.android.quickstep.util.ActiveGestureLog$CompoundString");
            Method selection = consumerSelector(selectors, "newConsumer", "android.content.Context", "boolean",
                    "com.android.quickstep.OverviewComponentObserver", "com.android.quickstep.RecentsAnimationDeviceState",
                    "com.android.quickstep.GestureState", "com.android.quickstep.GestureState",
                    "com.android.quickstep.TaskAnimationManager", "com.android.systemui.shared.system.InputMonitorCompat",
                    "com.android.quickstep.AbsSwipeUpHandler$Factory", "java.util.function.Consumer",
                    "com.android.systemui.shared.system.InputChannelCompat$InputEventReceiver", "com.android.launcher3.taskbar.g3",
                    "java.util.function.Function", "com.android.quickstep.OverviewCommandHelper",
                    "android.view.MotionEvent", "com.android.quickstep.RotationTouchHelper");
            for (Method caller : new Method[]{sameActivity, base, selection}) module.deoptimize(caller);
            module.registerFeatureHook(module.prepareFeatureHook(sameActivity,
                    "atomic_workbench.recents.window_home_identity", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                AtomicWorkbenchQuickstepInputHook.Route route = AtomicWorkbenchQuickstepInputHook.dispatchRoute();
                if (route != null && route.target > 0 && route.failure.isEmpty()) try {
                    Object owner = route.service.get(), observed = chain.getThisObject();
                    if (owner != null && serviceObserver.get(owner) == observed) {
                        Object nativeModel = serviceModel.get(owner);
                        if (nativeModel != null && nativeModel == observerModel.get(observed)) {
                            Object nativeWindow = window.invoke(nativeModel, route.target);
                            Object nativeContainer = container.invoke(nativeModel, route.target);
                            AtomicWorkbenchQuickstepInputHook.Route registered;
                            synchronized (WINDOWS) { registered = WINDOWS.get(nativeWindow); }
                            if (registered == route && route.selectedContainer.get() == nativeContainer && fallback.isInstance(nativeContainer)
                                    && containerWindow.get(nativeContainer) == nativeWindow
                                    && created.invoke(nativeContainer) == nativeWindow
                                    && windowIdentity(nativeWindow, route)) {
                                // HOME is an Activity, while this authenticated native
                                // Overview is a per-display window. Keep that pairing
                                // consistent without changing the ROM's admission or
                                // consumer selection, including its Reset branches.
                                return false;
                            }
                        }
                    }
                } catch (Throwable unavailable) {
                    module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=home_identity_passthrough;reason=window_identity_unavailable", unavailable);
                }
                return chain.proceed();
            }));
            module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=home_identity_ready;reason=typed_window_and_selector_capabilities");
            installHomeLauncher(module, loader);
        } catch (Throwable unavailable) {
            // Optional capability: older/unknown selectors keep the existing path.
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=home_identity_unavailable;reason=window_home_identity_capability_missing", unavailable);
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installHomeLauncher(AugmentModule module, ClassLoader loader) {
        try {
            HomeLauncher profile = new HomeLauncher();
            Class<?> observer = Class.forName("com.android.quickstep.OverviewComponentObserver", false, loader);
            Class<?> service = Class.forName("com.android.quickstep.TouchInteractionService", false, loader);
            Class<?> model = Class.forName("com.android.quickstep.fallback.window.RecentsDisplayModel", false, loader);
            Class<?> base = Class.forName("com.android.quickstep.BaseContainerInterface", false, loader);
            profile.launcherInterface = Class.forName("com.android.quickstep.LauncherActivityInterface", false, loader);
            profile.launcher = Class.forName("com.android.launcher3.uioverrides.QuickstepLauncher", false, loader);
            profile.recentsView = Class.forName("com.android.quickstep.views.RecentsView", false, loader);
            Class<?> activity = Class.forName("android.app.Activity", false, loader);
            if (!activity.isAssignableFrom(profile.launcher) || !android.view.View.class.isAssignableFrom(profile.recentsView))
                throw new NoSuchMethodException("native_home_launcher_types");
            profile.serviceObserver = typedField(service, "mOverviewComponentObserver", observer);
            profile.serviceModel = typedField(service, "mRecentsDisplayModel", model);
            profile.observerModel = typedField(observer, "mRecentsDisplayModel", model);
            profile.defaultContainer = typedField(observer, "mDefaultDisplayContainerInterface", base);
            profile.viewOwner = methodField(profile.recentsView, "mContainer");
            if (!profile.viewOwner.getType().isAssignableFrom(profile.launcher))
                throw new NoSuchFieldException("native_home_recents_owner");
            profile.created = typedMethod(profile.launcherInterface, "getCreatedContainer", profile.launcher);
            profile.resumed = typedMethod(profile.launcherInterface, "isResumed", boolean.class);
            profile.activityResumed = typedMethod(activity, "isResumed", boolean.class);
            profile.finishing = typedMethod(activity, "isFinishing", boolean.class);
            profile.destroyed = typedMethod(activity, "isDestroyed", boolean.class);
            profile.task = typedMethod(activity, "getTaskId", int.class);
            profile.component = typedMethod(activity, "getComponentName", android.content.ComponentName.class);
            profile.overview = method(profile.launcher, "getOverviewPanel");
            profile.root = method(profile.launcher, "getRootView");
            profile.dragLayer = method(profile.launcher, "getDragLayer");
            profile.plan = method(profile.recentsView, "applyLoadPlan", List.class);
            profile.reload = method(profile.recentsView, "reloadIfNeeded", boolean.class);
            if (profile.plan.getReturnType() != void.class || profile.reload.getReturnType() != void.class
                    || java.lang.reflect.Modifier.isStatic(profile.plan.getModifiers()) || java.lang.reflect.Modifier.isStatic(profile.reload.getModifiers()))
                throw new NoSuchMethodException("native_home_recents_reload");
            for (Method member : new Method[]{profile.overview, profile.root, profile.dragLayer})
                if (!android.view.View.class.isAssignableFrom(member.getReturnType()) || java.lang.reflect.Modifier.isStatic(member.getModifiers()))
                    throw new NoSuchMethodException("native_home_launcher_views");
            homeLauncher = profile;
            module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=home_launcher_ready;reason=typed_resumed_launcher_and_recents_view");
            installHomeCardOptions(module, loader, profile);
        } catch (Throwable unavailable) {
            homeLauncher = null;
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=home_launcher_unavailable;reason=native_home_launcher_capability_missing", unavailable);
        }
    }


    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    private static void installHomeCardOptions(AugmentModule module, ClassLoader loader, HomeLauncher home) {
        try {
            CardOptions profile = new CardOptions();
            profile.taskView = Class.forName("com.android.quickstep.views.TaskView", false, loader);
            profile.taskContainer = Class.forName("com.android.quickstep.views.TaskContainer", false, loader);
            profile.task = Class.forName("com.android.systemui.shared.recents.model.Task", false, loader);
            Class<?> key = Class.forName("com.android.systemui.shared.recents.model.Task$TaskKey", false, loader);
            Class<?> window = Class.forName("com.android.quickstep.fallback.window.RecentsWindowManager", false, loader);
            profile.recents = typedMethod(profile.taskView, "getRecentsView", home.recentsView);
            profile.containers = typedMethod(profile.taskView, "getTaskContainers", List.class);
            profile.taskValue = typedMethod(profile.taskContainer, "getTask", profile.task);
            profile.key = typedField(profile.task, "key", key);
            profile.id = typedField(key, "id", int.class);
            profile.display = typedField(key, "displayId", int.class);
            profile.user = typedField(key, "userId", int.class);
            Method launcherFactory = null;
            for (Method candidate : home.launcher.getDeclaredMethods()) {
                Class<?>[] args = candidate.getParameterTypes();
                if (candidate.getName().equals("getActivityLaunchOptions") && args.length == 2
                        && args[0] == android.view.View.class && !args[1].isPrimitive()
                        && !java.lang.reflect.Modifier.isStatic(candidate.getModifiers()) && !candidate.getReturnType().isPrimitive()) {
                    if (launcherFactory != null) throw new NoSuchMethodException("ambiguous_native_card_factory");
                    launcherFactory = candidate;
                }
            }
            if (launcherFactory == null) throw new NoSuchMethodException("native_card_factory");
            launcherFactory.setAccessible(true); profile.wrapper = launcherFactory.getReturnType();
            profile.factory = method(window, "getActivityLaunchOptions", launcherFactory.getParameterTypes());
            if (profile.factory.getReturnType() != profile.wrapper || java.lang.reflect.Modifier.isStatic(profile.factory.getModifiers()))
                throw new NoSuchMethodException("native_window_card_factory");
            for (Field candidate : profile.wrapper.getDeclaredFields()) {
                if (candidate.getType() == android.app.ActivityOptions.class && !java.lang.reflect.Modifier.isStatic(candidate.getModifiers())) {
                    if (profile.options != null) throw new NoSuchFieldException("ambiguous_native_card_options");
                    candidate.setAccessible(true); profile.options = candidate;
                }
            }
            if (profile.options == null) throw new NoSuchFieldException("native_card_options");
            try { profile.root = cardRootCapability(loader); }
            catch (Throwable unavailable) {
                module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=card_root_unavailable;reason=framework_root_token_capability_missing", unavailable);
            }
            module.deoptimize(launcherFactory);
            module.deoptimize(method(profile.taskView, "launchAsStaticTile"));
            module.registerFeatureHook(module.prepareFeatureHook(launcherFactory, "atomic_workbench.recents.card_launch_options", true)
                    .setExceptionMode(ExceptionMode.PASSTHROUGH).intercept(chain -> {
                Object options = null;
                try { options = homeCardOptions(module, home, profile, chain.getThisObject(), chain.getArg(0), chain.getArg(1)); }
                catch (Throwable unavailable) {
                    module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=card_options_unavailable;reason=owned_window_factory_unavailable", unavailable);
                }
                return options == null ? chain.proceed() : options;
            }));
            module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=card_options_ready;reason=typed_native_window_factory");
        } catch (Throwable unavailable) {
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=card_options_unavailable;reason=native_card_factory_capability_missing", unavailable);
        }
    }

    private static Object homeCardOptions(AugmentModule module, HomeLauncher home, CardOptions profile,
            Object owner, Object card, Object item) throws Exception {
        if (!profile.taskView.isInstance(card)) return null;
        Object view = profile.recents.invoke(card);
        LauncherView registration;
        synchronized (LAUNCHER_VIEWS) { registration = LAUNCHER_VIEWS.get(view); }
        if (registration == null || registration.owner.get() != owner) return null;
        AtomicWorkbenchQuickstepInputHook.Route route = registration.route;
        if (!retainedLauncherValid(route, owner, view) || !ownedView(card, route)) return null;
        Object parent = call(card, "getParent", new Class<?>[0]);
        for (int depth = 0; parent != null && parent != view && depth < 16; depth++)
            parent = call(parent, "getParent", new Class<?>[0]);
        if (parent != view || !AtomicWorkbenchQuickstepInputHook.revalidate(route, false).isEmpty()) return null;
        Object values = profile.containers.invoke(card);
        if (!(values instanceof List<?> containers) || containers.isEmpty() || containers.size() > 2) return null;
        Object service = route.service.get();
        if (!(service instanceof Context)) return null;
        android.app.ActivityManager manager = (android.app.ActivityManager) ((Context) service).getSystemService(Context.ACTIVITY_SERVICE);
        List<android.app.ActivityManager.RunningTaskInfo> tasks = manager == null ? null : manager.getRunningTasks(128);
        if (tasks == null || tasks.size() > 128) return null;
        java.util.HashSet<Integer> ids = new java.util.HashSet<>();
        for (Object container : containers) {
            if (!profile.taskContainer.isInstance(container)) return null;
            Object task = profile.taskValue.invoke(container), key = task == null ? null : profile.key.get(task);
            if (key == null || profile.display.getInt(key) != route.target || profile.user.getInt(key) != route.user) return null;
            int id = profile.id.getInt(key);
            if (id <= 0 || id == route.hostTask || !ids.add(id)) return null;
            boolean found = false;
            for (android.app.ActivityManager.RunningTaskInfo live : tasks)
                if (live != null && live.taskId == id && (Integer) field(live, "displayId") == route.target
                        && (Integer) field(live, "userId") == route.user) { found = true; break; }
            if (!found) return null;
        }
        Object model = field(service, "mRecentsDisplayModel");
        Object window = call(model, "getRecentsWindowManager", new Class<?>[]{int.class}, route.target);
        AtomicWorkbenchQuickstepInputHook.Route registered;
        synchronized (WINDOWS) { registered = WINDOWS.get(window); }
        if (registered != route || !windowIdentity(window, route)) return null;
        CardRootTarget root = null;
        if (profile.root != null) {
            try { root = cardRootTarget(profile.root, route, ids); }
            catch (Exception unavailable) {
                module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=card_root_unavailable;reason=framework_root_snapshot_unavailable", unavailable);
                return null;
            }
            if (root == null) {
                module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=card_options_passthrough;reason=task_root_not_confirmed;target_display=" + route.target);
                return null;
            }
        }
        // The borrowed Launcher was originally created on display 0. Use the ROM's
        // existing per-display window factory for this card, preserving its wrapper
        // and completion list instead of the primary Launcher's remote animation.
        Object wrapper = profile.factory.invoke(window, card, item);
        if (!profile.wrapper.isInstance(wrapper)) return null;
        Object options = profile.options.get(wrapper);
        if (!(options instanceof android.app.ActivityOptions)) return null;
        ((android.app.ActivityOptions) options).setLaunchDisplayId(route.target);
        if (root != null) {
            // This ROM otherwise raises/creates HOME on display 0 before launching
            // a Recents card, even when launchDisplayId points at our owned display.
            // A real matching root token selects the framework's existing path that
            // keeps that root in place; no HOME/front-task operation is intercepted.
            if (!AtomicWorkbenchQuickstepInputHook.revalidate(route, false).isEmpty()) return null;
            CardRootTarget current = cardRootTarget(profile.root, route, ids);
            if (current == null || current.id != root.id || !current.binder.equals(root.binder)) return null;
            profile.root.setRoot.invoke(options, current.token);
        }
        module.logFeatureInfo("ATOMIC_NATIVE_RECENTS phase=card_options_routed;target_display=" + route.target
                + ";launch_display=" + route.target + ";task=" + ids.iterator().next() + ";auth=true;container=rom_window"
                + ";target_task=" + (root == null ? -1 : root.id));
        return wrapper;
    }

    // Probed in the hooked OEM Launcher; the caller rejects an unavailable contract.

    // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
    //noinspection PrivateApi
    @android.annotation.SuppressLint({"BlockedPrivateApi", "PrivateApi"})
    private static CardRoot cardRootCapability(ClassLoader loader) throws Exception {
        CardRoot result = new CardRoot();
        Class<?> manager = Class.forName("android.app.ActivityTaskManager", false, loader);
        result.info = Class.forName("android.app.ActivityTaskManager$RootTaskInfo", false, loader);
        result.token = Class.forName("android.window.WindowContainerToken", false, loader);
        Method service = manager.getDeclaredMethod("getService"); service.setAccessible(true);
        if (!java.lang.reflect.Modifier.isStatic(service.getModifiers())) throw new NoSuchMethodException("task_service_static");
        result.service = service.invoke(null);
        if (result.service == null) throw new IllegalStateException("task_service_missing");
        result.roots = method(result.service.getClass(), "getAllRootTaskInfosOnDisplay", int.class);
        if (!List.class.isAssignableFrom(result.roots.getReturnType())) throw new NoSuchMethodException("root_task_list_type");
        result.id = typedField(result.info, "taskId", int.class);
        result.display = typedField(result.info, "displayId", int.class);
        result.user = typedField(result.info, "userId", int.class);
        result.children = typedField(result.info, "childTaskIds", int[].class);
        result.taskToken = typedField(result.info, "token", result.token);
        result.activityType = method(result.info, "getActivityType");
        if (result.activityType.getReturnType() != int.class) throw new NoSuchMethodException("root_activity_type");
        result.binder = method(result.token, "asBinder");
        if (result.binder.getReturnType() != android.os.IBinder.class) throw new NoSuchMethodException("root_token_binder_type");
        result.setRoot = method(android.app.ActivityOptions.class, "setLaunchRootTask", result.token);
        if (result.setRoot.getReturnType() != android.app.ActivityOptions.class) throw new NoSuchMethodException("launch_root_return_type");
        return result;
    }

    private static CardRootTarget cardRootTarget(CardRoot profile,
            AtomicWorkbenchQuickstepInputHook.Route route, java.util.Set<Integer> tasks) throws Exception {
        Object snapshot = profile.roots.invoke(profile.service, route.target);
        if (!(snapshot instanceof List<?> roots) || roots.isEmpty() || roots.size() > 128) return null;
        CardRootTarget selected = null;
        for (Object info : roots) {
            if (!profile.info.isInstance(info)) return null;
            if (profile.display.getInt(info) != route.target || profile.user.getInt(info) != route.user) continue;
            int id = profile.id.getInt(info);
            if (id <= 0 || id == route.hostTask) continue;
            int type = (Integer) profile.activityType.invoke(info);
            if (type != 0 && type != 1) continue;
            int[] children = (int[]) profile.children.get(info);
            if (children != null && children.length > 128) return null;
            boolean contains = true;
            for (int task : tasks) {
                boolean found = task == id;
                if (children != null) for (int child : children) if (child == task) { found = true; break; }
                if (!found) { contains = false; break; }
            }
            if (!contains) continue;
            // Only the real framework root snapshot confers root authority. A
            // RunningTaskInfo.parentTaskId of -1 is also used by nested tasks.
            Object token = profile.taskToken.get(info);
            if (!profile.token.isInstance(token)) return null;
            Object binder = profile.binder.invoke(token);
            if (!(binder instanceof android.os.IBinder handle) || !handle.isBinderAlive() || selected != null) return null;
            selected = new CardRootTarget(id, token, handle);
        }
        return selected;
    }

    private static Field methodField(Class<?> type, String name) throws Exception {
        for (; type != null; type = type.getSuperclass()) try {
            Field field = type.getDeclaredField(name); field.setAccessible(true);
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) throw new NoSuchFieldException(name);
            return field;
        } catch (NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(name);
    }

    private static Field typedField(Class<?> type, String name, Class<?> expected) throws Exception {
        Field field = methodField(type, name);
        if (field.getType() != expected) throw new NoSuchFieldException(name);
        return field;
    }

    private static Method typedMethod(Class<?> type, String name, Class<?> expected) throws Exception {
        // Covariant native methods also have bridge methods with the same arguments.
        for (; type != null; type = type.getSuperclass()) for (Method method : type.getDeclaredMethods())
            if (method.getName().equals(name) && method.getParameterCount() == 0 && method.getReturnType() == expected
                    && !java.lang.reflect.Modifier.isStatic(method.getModifiers())) { method.setAccessible(true); return method; }
        throw new NoSuchMethodException(name);
    }

    private static Method consumerSelector(Class<?> type, String name, String... parameters) throws NoSuchMethodException {
        for (Method candidate : type.getDeclaredMethods()) {
            if (!candidate.getName().equals(name) || !java.lang.reflect.Modifier.isStatic(candidate.getModifiers())
                    || !candidate.getReturnType().getName().equals("com.android.quickstep.InputConsumer")) continue;
            Class<?>[] actual = candidate.getParameterTypes();
            if (actual.length != parameters.length) continue;
            boolean matched = true;
            for (int index = 0; index < actual.length; index++)
                if (!actual[index].getName().equals(parameters[index])) { matched = false; break; }
            if (matched) return candidate;
        }
        throw new NoSuchMethodException(name);
    }

    static Object cachedTask(AtomicWorkbenchQuickstepInputHook.Route route, Object tracker) throws Exception {
        // The constructor's first item becomes mTopTask even when its display
        // parameter differs. Filter the actual bounded snapshot before calling it.
        return cached.newInstance(route.tasks, field(tracker, "mCanEnterDesktopMode"), route.target);
    }

    private static int foregroundColor(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route, Context window) throws Exception {
        try {
            Object observer = field(route.service.get(), "mOverviewComponentObserver");
            Object nativeInterface = field(observer, "mDefaultDisplayContainerInterface");
            Object launcher = call(nativeInterface, "getCreatedContainer", new Class<?>[0]);
            if (launcher != null && launcher != window) return (Integer) call(launcher, "getForeColor", new Class<?>[0]);
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            module.logFeatureInfo("ATOMIC_NATIVE_RECENTS target_display=" + route.target
                    + ";phase=foreground_color;reason=native_theme_fallback");
        }
        android.util.TypedValue value = new android.util.TypedValue();
        if (window.getTheme().resolveAttribute(android.R.attr.textColorPrimary, value, true)) {
            if (value.resourceId != 0) return window.getColor(value.resourceId);
            if (value.type >= android.util.TypedValue.TYPE_FIRST_COLOR_INT
                    && value.type <= android.util.TypedValue.TYPE_LAST_COLOR_INT) return value.data;
        }
        throw new IllegalStateException("native_foreground_color_unavailable");
    }

    static void prepare(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route) throws Exception {
        if (!installed) throw new IllegalStateException("recents_target_hook_unavailable");
        Object owner = route.service.get(), model = field(owner, "mRecentsDisplayModel");
        Object window = call(model, "getRecentsWindowManager", new Class<?>[]{int.class}, route.target);
        if (window == null) {
            Object manager = call(model, "getTaskAnimationManager", new Class<?>[]{int.class}, route.target);
            if (manager != null && (Boolean.TRUE.equals(call(manager, "isRecentsAnimationRunning", new Class<?>[0]))
                    || Boolean.TRUE.equals(field(manager, "mRecentsAnimationStartPending")) || field(manager, "mCallbacks") != null))
                throw new IllegalStateException("native_display_animation_busy");
            try (Scope ignored = new Scope(route)) {
                // Resource construction is performed by the ROM, with its real
                // createDisplayContext / WindowManager / cleanup ownership.
                call(model, "deleteDisplayResource", new Class<?>[]{int.class}, route.target);
                call(model, "storeDisplayResource", new Class<?>[]{int.class}, route.target);
            }
            window = call(model, "getRecentsWindowManager", new Class<?>[]{int.class}, route.target);
        }
        if (!windowIdentity(window, route)) throw new IllegalStateException("native_window_display_mismatch");
        AtomicWorkbenchQuickstepInputHook.Route previous; synchronized (WINDOWS) { previous = WINDOWS.get(window); }
        if (previous != null && !previous.unique.equals(route.unique)) throw new IllegalStateException("native_window_display_reused");
        synchronized (WINDOWS) { WINDOWS.put(window, route); }
        synchronized (RETIRED_WINDOWS) { RETIRED_WINDOWS.remove(window); }
        module.logFeatureInfo("ATOMIC_NATIVE_RECENTS source_display=" + route.source + ";target_display=" + route.target
                + ";observed_display=" + actualDisplay(window) + ";auth=true;phase=resource_ready;container=rom_window;route_session=" + route.session);
    }

    static Object container(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route, Object observer) throws Exception {
        Object launcher = homeContainer(module, route, observer);
        if (launcher != null) {
            route.selectedContainer = new java.lang.ref.WeakReference<>(launcher);
            return launcher;
        }
        Object model = field(observer, "mRecentsDisplayModel");
        Object value = call(model, "getFallbackWindowInterface", new Class<?>[]{int.class}, route.target);
        Object window = value == null ? null : call(value, "getCreatedContainer", new Class<?>[0]);
        if (actualDisplay(window) != route.target) throw new IllegalStateException("native_container_display_mismatch");
        route.selectedContainer = new java.lang.ref.WeakReference<>(value);
        return value;
    }

    private static Object homeContainer(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route, Object observer) {
        HomeLauncher profile = homeLauncher;
        if (profile == null || !route.failure.isEmpty() || route.tasks.isEmpty()) return null;
        java.lang.ref.WeakReference<Object> previousSelection = route.selectedContainer;
        Object selected = null;
        try {
            Object service = route.service.get();
            if (service == null || profile.serviceObserver.get(service) != observer
                    || profile.serviceModel.get(service) == null
                    || profile.serviceModel.get(service) != profile.observerModel.get(observer))
                return homePassthrough(module, route, "home_observer_identity_mismatch");
            ActivityManager.RunningTaskInfo top = route.tasks.get(0);
            if ((Integer) call(top, "getActivityType", new Class<?>[0]) != 2
                    || (Integer) field(top, "displayId") != route.target || (Integer) field(top, "userId") != route.user) return null;
            Object nativeInterface = profile.defaultContainer.get(observer);
            if (!profile.launcherInterface.isInstance(nativeInterface))
                return homePassthrough(module, route, "home_launcher_interface_missing");
            Object activity = profile.created.invoke(nativeInterface);
            if (!profile.launcher.isInstance(activity)) return homePassthrough(module, route, "home_launcher_activity_missing");
            if (!Boolean.TRUE.equals(profile.resumed.invoke(nativeInterface)) || !Boolean.TRUE.equals(profile.activityResumed.invoke(activity)))
                return homePassthrough(module, route, "home_launcher_not_resumed");
            if (!launcherIdentity(profile, route, activity)) return homePassthrough(module, route, "home_activity_identity_mismatch");
            Object root = profile.root.invoke(activity), dragLayer = profile.dragLayer.invoke(activity), view = profile.overview.invoke(activity);
            if (!profile.recentsView.isInstance(view) || profile.viewOwner.get(view) != activity
                    || !ownedView(root, route) || !ownedView(dragLayer, route) || !ownedView(view, route))
                return homePassthrough(module, route, "home_view_identity_mismatch");
            if (!Boolean.TRUE.equals(call(root, "hasWindowFocus", new Class<?>[0])))
                return homePassthrough(module, route, "home_window_focus_missing");
            if (profile.created.invoke(nativeInterface) != activity) return homePassthrough(module, route, "home_launcher_activity_replaced");
            String current = AtomicWorkbenchQuickstepInputHook.revalidate(route);
            if (!current.isEmpty()) return homePassthrough(module, route, current);
            selected = nativeInterface;
            route.selectedContainer = new java.lang.ref.WeakReference<>(nativeInterface);
            LauncherView previous;
            synchronized (LAUNCHER_VIEWS) { previous = LAUNCHER_VIEWS.put(view, new LauncherView(route, activity)); }
            if (previous == null || previous.owner.get() != activity || previous.route.session != route.session
                    || previous.route.user != route.user || !previous.route.unique.equals(route.unique)) {
                // The shared native model may already have populated this Activity.
                // Clear those cards before selecting it, then use the ROM's forced
                // reload so every asynchronous load passes the owner-scoped filter.
                profile.plan.invoke(view, List.of());
                profile.reload.invoke(view, true);
            }
            module.logFeatureInfo("ATOMIC_NATIVE_HOME_CONTAINER source_display=" + route.source
                    + ";target_display=" + route.target + ";auth=true;phase=container_routed;container=launcher");
            return nativeInterface;
        } catch (Throwable unavailable) {
            if (selected != null && route.selectedContainer.get() == selected) route.selectedContainer = previousSelection;
            module.logFeatureError("ATOMIC_NATIVE_HOME_CONTAINER source_display=" + route.source + ";target_display=" + route.target
                    + ";phase=native_passthrough;reason=home_launcher_identity_unavailable", unavailable);
            return null;
        }
    }

    private static Object homePassthrough(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route, String reason) {
        module.logFeatureInfo("ATOMIC_NATIVE_HOME_CONTAINER source_display=" + route.source + ";target_display=" + route.target
                + ";phase=home_launcher_passthrough;reason=" + reason);
        return null;
    }

    private static boolean usesHomeLauncher(AtomicWorkbenchQuickstepInputHook.Route route) {
        HomeLauncher profile = homeLauncher;
        return profile != null && profile.launcherInterface.isInstance(route.selectedContainer.get());
    }

    private static boolean launcherIdentity(HomeLauncher profile, AtomicWorkbenchQuickstepInputHook.Route route, Object activity) throws Exception {
        ActivityManager.RunningTaskInfo top = route.tasks.get(0);
        return !Boolean.TRUE.equals(profile.finishing.invoke(activity)) && !Boolean.TRUE.equals(profile.destroyed.invoke(activity))
                && (Integer) profile.task.invoke(activity) == top.taskId
                && top.topActivity != null && top.topActivity.equals(profile.component.invoke(activity))
                && windowIdentity(activity, route);
    }

    private static boolean ownedView(Object view, AtomicWorkbenchQuickstepInputHook.Route route) throws Exception {
        return view instanceof android.view.View && Boolean.TRUE.equals(call(view, "isAttachedToWindow", new Class<?>[0]))
                && windowIdentity(view, route);
    }

    private static boolean retainedLauncherValid(AtomicWorkbenchQuickstepInputHook.Route route, Object owner, Object view) {
        try {
            HomeLauncher profile = homeLauncher;
            return profile != null && profile.launcher.isInstance(owner) && profile.recentsView.isInstance(view)
                    && profile.viewOwner.get(view) == owner && profile.overview.invoke(owner) == view
                    && launcherIdentity(profile, route, owner) && ownedView(view, route)
                    && AtomicWorkbenchQuickstepInputHook.retainedWindowValid(route);
        } catch (Throwable unavailable) { return false; }
    }

    static Object registeredContainer(Object observer, int display) throws Exception {
        Object model = field(observer, "mRecentsDisplayModel");
        Object window = call(model, "getRecentsWindowManager", new Class<?>[]{int.class}, display);
        AtomicWorkbenchQuickstepInputHook.Route route; synchronized (WINDOWS) { route = WINDOWS.get(window); }
        if (route == null) return null;
        if (!retainedWindowValid(route, window)) { retireWindow(window); return null; }
        return call(model, "getFallbackWindowInterface", new Class<?>[]{int.class}, display);
    }

    private static boolean retainedWindowValid(AtomicWorkbenchQuickstepInputHook.Route route, Object window) {
        try { return windowIdentity(window, route) && AtomicWorkbenchQuickstepInputHook.retainedWindowValid(route); }
        catch (Throwable unavailable) { return false; }
    }

    private static boolean windowIdentity(Object window, AtomicWorkbenchQuickstepInputHook.Route route) throws Exception {
        if (actualDisplay(window) != route.target) return false;
        Object display = call(window, "getDisplay", new Class<?>[0]);
        return display != null && route.unique.equals(call(display, "getUniqueId", new Class<?>[0]));
    }

    static void cancel(AugmentModule module, AtomicWorkbenchQuickstepInputHook.Route route) {
        State state = null;
        synchronized (GESTURES) { for (State candidate : GESTURES.values()) if (candidate.route == route) { state = candidate; break; } }
        if (state == null) return;
        state.terminal = true; clear(state);
        finishNativeToApp(module, state);
    }

    private static void finishNativeToApp(AugmentModule module, State state) {
        try (Scope ignored = new Scope(state.route)) {
            Object owner = state.route.service.get(), model = field(owner, "mRecentsDisplayModel");
            Object manager = call(model, "getTaskAnimationManager", new Class<?>[]{int.class}, state.route.target);
            if (state.callback != null && manager != null && field(manager, "mCallbacks") == state.callback) {
                // Cancellation listeners may clear the manager's controller. Finish
                // that controller while it is still reachable, then notify listeners.
                call(manager, "finishRunningRecentsAnimation", new Class<?>[]{boolean.class, boolean.class, Runnable.class}, false, true, null);
                call(state.callback, "notifyAnimationCanceled", new Class<?>[0]);
            }
        } catch (Throwable failure) { module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=native_stream_cancel_failed", failure); }
    }

    private static void abort(AugmentModule module, State state, String reason, int display) {
        if (state.terminal) return;
        state.route.failure = reason;
        state.terminal = true;
        log(module, state, "failed", reason, display, -1);
        clear(state);
        // Forgetting Java bookkeeping leaves the ROM's remote-animation surfaces
        // alive. Always complete the native controller before abandoning this state.
        finishNativeToApp(module, state);
    }

    private static void retireWindow(Object window) {
        synchronized (WINDOWS) { WINDOWS.remove(window); }
        synchronized (RETIRED_WINDOWS) { RETIRED_WINDOWS.put(window, true); }
    }

    static AtomicWorkbenchQuickstepInputHook.Route windowRoute() { return WINDOW.get(); }

    static Scope launch(AugmentModule module, Object manager, Object container, Object gesture) {
        State state; synchronized (GESTURES) { state = GESTURES.get(gesture); }
        if (state == null) return new Scope(null);
        try {
        state.callback = field(manager, "mCallbacks");
        String current = AtomicWorkbenchQuickstepInputHook.revalidate(state.route);
        if (!current.isEmpty()) return rejectLaunch(module, state, current);
        Object running = call(gesture, "getRunningTask", new Class<?>[0]);
        Object top = call(running, "getTopTask", new Class<?>[0]);
        state.window = call(container, "getCreatedContainer", new Class<?>[0]);
        if ((Integer) field(top, "displayId") != state.route.target || (Integer) field(top, "userId") != state.route.user
                || (Integer) field(manager, "mDisplayId") != state.route.target || actualDisplay(state.window) != state.route.target)
            return rejectLaunch(module, state, "native_gesture_target_mismatch");
        synchronized (CALLBACKS) { CALLBACKS.put(state.callback, state); }
        log(module, state, "animation_requested", "native_window", actualDisplay(state.window), (Integer) field(top, "taskId"));
        new Handler(Looper.getMainLooper()).postDelayed(() -> observe(module, state), 100L);
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            abort(module, state, "native_finish_ack_timeout", -1);
        }, 10000L);
        return new Scope(state.route);
        } catch (Throwable failure) {
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=launch_preflight_unavailable", failure);
            return rejectLaunch(module, state, "launch_preflight_unavailable");
        }
    }

    private static Scope rejectLaunch(AugmentModule module, State state, String reason) {
        state.route.failure = reason;
        state.terminal = true; log(module, state, "failed", reason, -1, -1); clear(state);
        try { if (state.callback != null) call(state.callback, "notifyAnimationCanceled", new Class<?>[0]); }
        catch (Throwable failure) { module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=preflight_cancel_failed", failure); }
        Scope scope = new Scope(null); scope.allowed = false; return scope;
    }

    private static String checkTargets(AugmentModule module, State state, Object array) throws Exception {
        int length = array == null ? 0 : Array.getLength(array);
        if (length == 0 || length > 128) return "animation_targets_missing";
        boolean expected = false;
        String failure = "";
        int task = state.route.tasks.get(0).taskId;
        for (int i = 0; i < length; i++) {
            Object target = Array.get(array, i), info = target == null ? null : field(target, "taskInfo");
            if (info == null) { failure = "animation_task_unverified"; continue; }
            int display = (Integer) field(info, "displayId"), id = (Integer) field(info, "taskId");
            if (i < 16) log(module, state, "animation_target", "native_observed", display, id);
            if (display != state.route.target || (Integer) field(info, "userId") != state.route.user)
                failure = "animation_display_or_user_mismatch";
            if (id == task) expected = true;
        }
        return !failure.isEmpty() ? failure : expected ? "" : "animation_running_task_missing";
    }

    private static void observe(AugmentModule module, State state) {
        if (state.terminal) return;
        try {
            Object view = field(state.window, "windowView");
            int display = view == null ? -1 : actualDisplay(view);
            boolean attached = view != null && Boolean.TRUE.equals(call(view, "isAttachedToWindow", new Class<?>[0]));
            if (state.targets && attached && display == state.route.target) {
                state.presented = true; log(module, state, "presented", "native_window_and_targets_verified", display, -1); return;
            }
            if (SystemClock.elapsedRealtime() - state.started >= 5000L) {
                abort(module, state, "native_presentation_timeout", display); return;
            }
            new Handler(Looper.getMainLooper()).postDelayed(() -> observe(module, state), 100L);
        } catch (Throwable error) {
            module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=container_observation_failed", error);
            abort(module, state, "container_observation_failed", -1);
        }
    }

    private static void finishObserved(AugmentModule module, State state) {
        state.terminal = true;
        try {
            Context context = (Context) state.route.service.get();
            ActivityManager manager = context == null ? null : (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
            List<ActivityManager.RunningTaskInfo> tasks = manager == null ? null : manager.getRunningTasks(128);
            ActivityManager.RunningTaskInfo physical = AtomicWorkbenchQuickstepInputHook.physicalForeground(tasks, state.route.user);
            boolean host = physical != null && physical.taskId == state.route.hostTask && physical.topActivity != null
                    && "ls.augment.com".equals(physical.topActivity.getPackageName())
                    && "ls.augment.com.AtomicWorkbenchActivity".equals(physical.topActivity.getClassName());
            int top = -1;
            if (tasks != null) for (ActivityManager.RunningTaskInfo task : tasks) if (task != null
                    && (Integer) field(task, "displayId") == state.route.target && (Integer) field(task, "userId") == state.route.user) { top = task.taskId; break; }
            boolean identity = context != null && AtomicWorkbenchQuickstepHook.authenticated(context, state.route.target, tasks)
                    && android.os.Process.myUid() / 100000 == state.route.user && actualDisplay(state.window) == state.route.target;
            if (identity) identity = AtomicWorkbenchQuickstepInputHook.revalidate(state.route, false).isEmpty();
            if (identity) {
                android.hardware.display.DisplayManager displays = (android.hardware.display.DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
                identity = state.route.unique.equals(call(displays.getDisplay(state.route.target), "getUniqueId", new Class<?>[0]));
            }
            log(module, state, host && identity && top >= 0 && state.targets ? "finish_observed" : "failed",
                    host && identity && top >= 0 && state.targets ? "native_ack_host_and_display_retained" : "native_finish_host_or_targets_mismatch", actualDisplay(state.window), top);
        } catch (Throwable error) { module.logFeatureError("ATOMIC_NATIVE_RECENTS phase=failed;reason=finish_observation_failed", error); }
        finally { clear(state); }
    }

    private static void clear(State state) {
        for (WeakHashMap<Object, State> map : java.util.List.of(GESTURES, CALLBACKS, CONTROLLERS))
            synchronized (map) { map.values().removeIf(value -> value == state); }
    }

    private static void log(AugmentModule module, State state, String phase, String reason, int display, int task) {
        module.logFeatureInfo("ATOMIC_NATIVE_RECENTS source_display=" + state.route.source + ";target_display=" + state.route.target
                + ";observed_display=" + display + ";task=" + task + ";user=" + state.route.user
                + ";route_session=" + state.route.session + ";phase=" + phase + ";reason=" + reason
                + ";elapsed_ms=" + (SystemClock.elapsedRealtime() - state.started) + ";container=rom_window;auth=true"
                + (phase.startsWith("finish") ? ";branch=" + (state.finishToLauncher ? "to_launcher" : "to_app") : ""));
    }

    private static int actualDisplay(Object object) throws Exception {
        if (object == null) return -1;
        if (object instanceof Context) return (Integer) call(object, "getDisplayId", new Class<?>[0]);
        Object display = call(object, "getDisplay", new Class<?>[0]);
        return display == null ? -1 : (Integer) call(display, "getDisplayId", new Class<?>[0]);
    }
    private static Object field(Object value, String name) throws Exception {
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) try {
            Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(value);
        } catch (NoSuchFieldException ignored) { }
        throw new NoSuchFieldException(name);
    }
    private static Method method(Class<?> type, String name, Class<?>... parameters) throws Exception {
        for (; type != null; type = type.getSuperclass()) try {
            Method method = type.getDeclaredMethod(name, parameters); method.setAccessible(true); return method;
        } catch (NoSuchMethodException ignored) { }
        throw new NoSuchMethodException(name);
    }
    private static Method named(Class<?> type, String name, int count) throws Exception {
        for (Method method : type.getDeclaredMethods()) if (method.getName().equals(name) && method.getParameterCount() == count) { method.setAccessible(true); return method; }
        throw new NoSuchMethodException(name);
    }
    private static Object call(Object value, String name, Class<?>[] parameters, Object... arguments) throws Exception {
        return method(value.getClass(), name, parameters).invoke(value, arguments);
    }
}
