package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Canvas;
import android.view.View;
import android.view.ViewGroup;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.LauncherOptions;

/** An extra draw gate for the OEM workspace dots; all native geometry/markers remain owned by Launcher. */
final class LauncherPageIndicatorHook {
    static final String DIAGNOSTIC = "ls_augment_launcher_page_indicator_runtime";
    private static boolean attempted;

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (attempted) return;
        attempted = true;
        try {
            Targets targets;
            try { targets = new Targets(loader, false); }
            catch (ReflectiveOperationException | IllegalStateException oldMissing) {
                try { targets = new Targets(loader, true); }
                catch (ReflectiveOperationException | IllegalStateException namedMissing) {
                    namedMissing.addSuppressed(oldMissing);
                    throw namedMissing;
                }
            }
            Controller controller = new Controller(module, targets);
            controller.drawHook(targets.draw);
            controller.lifecycleHook(targets.start);
            controller.lifecycleHook(targets.end);
            controller.lifecycleHook(targets.resume);
            module.registerFeatureHook(module.prepareFeatureHook(targets.bind, "launcher.indicator.bind", false).intercept(chain -> {
                Object result = chain.proceed();
                controller.capture(chain.getThisObject());
                return result;
            }));
            module.deoptimize(targets.bind);
            module.registerFeatureHook(module.prepareFeatureHook(targets.attach, "launcher.indicator.attach", false).intercept(chain -> {
                Object result = chain.proceed();
                // A subclass may override drawing without calling super. Register its actual
                // declaration before the first frame, even if it overrides the workspace binder.
                if (controller.t.workspace.isInstance(chain.getArg(0))) {
                    View view = (View) chain.getThisObject();
                    try { controller.prepareIndicator(view); }
                    catch (ReflectiveOperationException | RuntimeException error) { controller.failure(view.getContext(), "subclass", error); }
                    WeakReference<View> reference = new WeakReference<>(view);
                    view.post(() -> {
                        View current = reference.get();
                        if (current != null) controller.captureIndicator(current);
                    });
                }
                return result;
            }));
            module.deoptimize(targets.attach);
            controller.ready = true;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            module.logFeatureError("LAUNCHER_PAGE_INDICATOR_CAPABILITY", error);
        }
    }

    static final class Binding {
        final WeakReference<Object> workspace;
        final WeakReference<View> layout;
        Binding(Object owner, View parent) { workspace = new WeakReference<>(owner); layout = new WeakReference<>(parent); }
    }

    static final class Controller {
        final AugmentModule module;
        final Targets t;
        final Map<View, Binding> bindings = new WeakHashMap<>();
        final Set<Method> draws = new HashSet<>(), lifecycle = new HashSet<>();
        final Set<String> failures = new HashSet<>();
        final Runnable changed = () -> {
            for (View view : new ArrayList<>(bindings.keySet())) if (view != null) view.postInvalidateOnAnimation();
        };
        boolean ready, listening, reported;
        Controller(AugmentModule module, Targets targets) { this.module = module; t = targets; }

        void drawHook(Method method) {
            if (draws.contains(method)) return;
            module.registerFeatureHook(module.prepareFeatureHook(method, "launcher.indicator.draw." + draws.size(), true).intercept(chain -> {
                Object receiver = chain.getThisObject();
                if (t.indicator.isInstance(receiver)) {
                    View view = (View) receiver;
                    try { if (suppress(view)) return null; }
                    catch (ReflectiveOperationException | RuntimeException error) { failure(view.getContext(), "draw", error); }
                }
                return chain.proceed();
            }));
            module.deoptimize(method);
            draws.add(method);
        }

        void prepareIndicator(View view) throws ReflectiveOperationException {
            Method actual = method(view.getClass(), "onDraw", void.class, Canvas.class);
            if (!t.indicator.isAssignableFrom(actual.getDeclaringClass())) throw new NoSuchMethodException("Indicator drawing owner: " + actual);
            drawHook(actual);
        }

        void lifecycleHook(Method method) {
            if (lifecycle.contains(method)) return;
            module.registerFeatureHook(module.prepareFeatureHook(method, "launcher.indicator.lifecycle." + lifecycle.size(), false).intercept(chain -> {
                Object result = chain.proceed();
                Object launcher = chain.getThisObject();
                if (t.launcher.isInstance(launcher)) {
                    try { capture(t.getWorkspace.invoke(launcher)); }
                    catch (ReflectiveOperationException | RuntimeException error) { failure(null, "lifecycle", error); }
                }
                return result;
            }));
            module.deoptimize(method);
            lifecycle.add(method);
        }

        void captureIndicator(View view) {
            try { capture(t.bound.get(view)); }
            catch (ReflectiveOperationException | RuntimeException error) { failure(view.getContext(), "binding", error); }
        }

        void capture(Object workspace) {
            if (!ready || !t.workspace.isInstance(workspace)) return;
            Context context = ((View) workspace).getContext();
            try {
                View dots = (View) t.dots.get(workspace), miboard = (View) t.miboard.get(workspace);
                View layout = (View) t.getLayout.invoke(workspace);
                if (dots == null || miboard == null || layout == null) return; // Inflation not complete yet.
                Binding previous = bindings.get(dots);
                if (previous != null && previous == bindings.get(miboard)
                        && previous.workspace.get() == workspace && previous.layout.get() == layout
                        && owns(dots, previous) && owns(miboard, previous)) {
                    dots.postInvalidateOnAnimation(); miboard.postInvalidateOnAnimation(); return;
                }
                if (!t.layout.isInstance(layout) || !t.indicator.isInstance(dots) || !t.indicator.isInstance(miboard)
                        || dots == miboard || t.bound.get(dots) != workspace || t.bound.get(miboard) != workspace
                        || dots.getParent() != layout || miboard.getParent() != layout)
                    throw new IllegalStateException("Workspace MFV indicator ownership mismatch");
                int layoutId = resource(context, "page_indicator_mfv");
                int dotsId = resource(context, "mfv_page_indicator_launcher");
                int miboardId = resource(context, "mfv_page_indicator_miboard");
                if (layout.getId() != layoutId || dots.getId() != dotsId || miboard.getId() != miboardId
                        || layout.findViewById(dotsId) != dots || layout.findViewById(miboardId) != miboard)
                    throw new IllegalStateException("Workspace MFV indicator resources mismatch");
                Object launcher = t.owner.get(workspace);
                if (!t.launcher.isInstance(launcher) || t.getWorkspace.invoke(launcher) != workspace)
                    throw new IllegalStateException("Workspace Launcher identity mismatch");
                prepareIndicator(dots); prepareIndicator(miboard);
                lifecycleHook(method(launcher.getClass(), t.start.getName(), void.class, t.state));
                lifecycleHook(method(launcher.getClass(), t.end.getName(), void.class, t.state));
                lifecycleHook(method(launcher.getClass(), "onResume", void.class));
                Binding binding = new Binding(workspace, layout);
                bindings.put(dots, binding); bindings.put(miboard, binding);
                if (!listening) listening = FeatureSettings.addSnapshotListener(context, changed);
                dots.postInvalidateOnAnimation(); miboard.postInvalidateOnAnimation();
                if (!reported) {
                    reported = true;
                    FeatureSettings.diagnostic(context, DIAGNOSTIC, "bound:" + t.profile + ";edit_only;device_acceptance=pending");
                }
            } catch (ReflectiveOperationException | RuntimeException error) {
                // No override for unrecognized ownership; never reuse a previous binding on this workspace.
                bindings.entrySet().removeIf(entry -> entry.getValue().workspace.get() == workspace);
                failure(context, "binding", error);
            }
        }

        boolean owns(View view, Binding binding) throws ReflectiveOperationException {
            Object workspace = binding.workspace.get();
            View parent = binding.layout.get();
            return workspace != null && parent != null && t.bound.get(view) == workspace
                    && t.getLayout.invoke(workspace) == parent && view.getParent() == parent
                    && (t.dots.get(workspace) == view || t.miboard.get(workspace) == view);
        }

        boolean suppress(View view) throws ReflectiveOperationException {
            if (!ready) return false;
            Binding binding = bindings.get(view);
            if (binding == null || !owns(view, binding)) return false;
            ConfigSnapshot snapshot = FeatureSettings.snapshot(view.getContext());
            if (snapshot == null || !"1".equals(snapshot.get(LauncherOptions.PAGE_INDICATOR_EDIT_ONLY))) return false;
            Object workspace = binding.workspace.get();
            if (workspace == null) return false;
            Object launcher = t.owner.get(workspace);
            if (!t.launcher.isInstance(launcher) || t.getWorkspace.invoke(launcher) != workspace) return false;
            Object manager = t.getManager.invoke(launcher);
            if (!t.manager.isInstance(manager)) throw new IllegalStateException("Missing Launcher StateManager");
            Object current = t.getState.invoke(manager);
            if (!t.state.isInstance(current)) throw new IllegalStateException("Unknown Launcher state type");
            return current != t.editState;
        }

        void failure(Context context, String phase, Throwable error) {
            if (!failures.add(phase)) return;
            module.logFeatureError("LAUNCHER_PAGE_INDICATOR_" + phase, error);
            if (context != null) FeatureSettings.diagnostic(context, DIAGNOSTIC, "unavailable:" + phase + ":" + error);
        }
    }

    static final class Targets {
        final String profile;
        final Class<?> launcher, workspace, indicator, layout, state, manager;
        final Method draw, attach, bind, getWorkspace, getLayout, getManager, getState, start, end, resume;
        final Field bound, owner, dots, miboard;
        final Object editState;

        Targets(ClassLoader loader, boolean named) throws ReflectiveOperationException {
            profile = named ? "named_mfv" : "obfuscated_mfv";
            String p = "com.android.launcher3.";
            launcher = Class.forName(p + (named ? "Launcher" : "C2"), false, loader);
            workspace = Class.forName(p + "Workspace", false, loader);
            Class<?> paged = Class.forName(p + (named ? "PagedView" : "V4"), false, loader);
            state = Class.forName(p + (named ? "LauncherState" : "V3"), false, loader);
            manager = Class.forName(p + "statemanager." + (named ? "StateManager" : "d"), false, loader);
            Class<?> base = Class.forName(p + "statemanager." + (named ? "BaseState" : "a"), false, loader);
            Class<?> menu = Class.forName(p + "menu." + (named ? "MenuOverviewState" : "l"), false, loader);
            indicator = Class.forName(p + "pageindicators.MfvPageIndicatorImpl", false, loader);
            layout = Class.forName(p + "pageindicators.MfvPageIndicatorLayout", false, loader);
            if (!ViewGroup.class.isAssignableFrom(workspace) || !paged.isAssignableFrom(workspace)
                    || !View.class.isAssignableFrom(indicator) || !ViewGroup.class.isAssignableFrom(layout)
                    || !base.isAssignableFrom(state) || !state.isAssignableFrom(menu))
                throw new IllegalStateException("MFV class inheritance mismatch: " + profile);
            draw = method(indicator, "onDraw", void.class, Canvas.class);
            if (!indicator.isAssignableFrom(draw.getDeclaringClass())) throw new NoSuchMethodException("OEM indicator onDraw missing");
            attach = method(indicator, named ? "attach" : "g", void.class, ViewGroup.class);
            bound = field(indicator, named ? "mPagedView" : "v", ViewGroup.class, false);
            owner = field(workspace, named ? "mLauncher" : "x", launcher, false);
            dots = field(paged, "mMfvPageIndicator", indicator, false);
            miboard = field(paged, "mMfvPageIndicatorMiboard", indicator, false);
            bind = method(paged, "iniMfvPageIndicator", void.class, View.class);
            getLayout = method(paged, "getMfvPageIndicatorLayout", layout);
            getWorkspace = method(launcher, named ? "getWorkspace" : "B2", workspace);
            getManager = method(launcher, "getStateManager", manager);
            getState = method(manager, named ? "getState" : "C", base);
            start = method(launcher, named ? "onStateSetStart" : "d4", void.class, state);
            end = method(launcher, named ? "onStateSetEnd" : "c4", void.class, state);
            resume = method(launcher, "onResume", void.class);
            if (!launcher.isAssignableFrom(resume.getDeclaringClass())) throw new NoSuchMethodException("OEM Launcher.onResume missing");
            editState = field(state, named ? "MENU_OVERVIEW" : "A", state, true).get(null);
            if (!menu.isInstance(editState)) throw new IllegalStateException("MENU_OVERVIEW singleton type mismatch");
        }
    }

    private static int resource(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
        if (id == 0) throw new IllegalStateException("Missing MFV resource id/" + name);
        return id;
    }

    private static Method method(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            try {
                Method method = at.getDeclaredMethod(name, args);
                if (method.getReturnType() != result || Modifier.isStatic(method.getModifiers()) || Modifier.isAbstract(method.getModifiers()))
                    throw new IllegalStateException("MFV method signature mismatch: " + method);
                method.setAccessible(true); return method;
            } catch (NoSuchMethodException missing) { /* Try its actual superclass, not a different API family. */ }
        }
        throw new NoSuchMethodException(type.getName() + "." + name);
    }

    private static Field field(Class<?> type, String name, Class<?> value, boolean isStatic) throws NoSuchFieldException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            try {
                Field field = at.getDeclaredField(name);
                if (field.getType() != value || Modifier.isStatic(field.getModifiers()) != isStatic)
                    throw new IllegalStateException("MFV field signature mismatch: " + field);
                field.setAccessible(true); return field;
            } catch (NoSuchFieldException missing) { /* Retain subclass-compatible inherited fields. */ }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
