package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import ls.augment.com.RecentsCardRadiusOptions;

/** Adjusts only native Recents snapshot/live-task radii; no global View clipping. */
final class LauncherRecentsCardRadiusHook {
    private static boolean installed;

    private LauncherRecentsCardRadiusHook() { }

    static synchronized void install(AugmentModule module, ClassLoader loader) {
        if (installed) return;
        try {
            Binding binding = new Binding(module, loader);
            binding.install();
            installed = true;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            module.logFeatureError("LAUNCHER_RECENTS_RADIUS_INSTALL", error);
        }
    }

    private static final class Scope {
        final Object params;
        final View task;
        final Object simulator;
        final Context context;
        float progress, recentsScale, taskScale;
        boolean computed;

        Scope(Object params, View task, Object simulator, Context context) {
            this.params = params;
            this.task = task;
            this.simulator = simulator;
            this.context = context;
        }
    }

    private static final class Binding {
        final AugmentModule module;
        final Class<?> paramsType;
        final Method progress, taskUpdate, taskRefresh, containers, snapshotView, recentsView, redrawLiveTile;
        final Method simulatorApply;
        final Field radius, simulatorParams, simulatorContext, simulatorRect;
        final ThreadLocal<Scope> drawing = new ThreadLocal<>();
        final Map<View, Boolean> tasks = new WeakHashMap<>();
        Context context;
        boolean listening;
        int lastOffset;
        LauncherRecentsRadiusSampler sampler;


        // Injected OEM/framework boundary: runtime reflection is required; retain capability validation and the caller's failure path.
        //noinspection PrivateApi
        Binding(AugmentModule module, ClassLoader loader) throws ReflectiveOperationException {
            this.module = module;
            Class<?> params;
            boolean named;
            try { params = Class.forName("com.android.quickstep.FullscreenDrawParams", false, loader); named = false; }
            catch (ClassNotFoundException absent) {
                params = Class.forName("com.android.quickstep.views.TaskView$FullscreenDrawParams", false, loader);
                named = true;
            }
            paramsType = params;
            Class<?> task = Class.forName("com.android.quickstep.views.TaskView", false, loader);
            Class<?> container = Class.forName(named ? "com.android.quickstep.views.TaskView$TaskContainer"
                    : "com.android.quickstep.views.TaskContainer", false, loader);
            Class<?> recents = Class.forName("com.android.quickstep.views.RecentsView", false, loader);
            Class<?> simulator = Class.forName("com.android.quickstep.util.TaskViewSimulator", false, loader);
            Class<?> transform = Class.forName("com.android.quickstep.util.TransformParams", false, loader);
            Class<?> transaction = Class.forName("com.android.quickstep.util.SurfaceTransaction", false, loader);
            if (!View.class.isAssignableFrom(task) || !View.class.isAssignableFrom(recents))
                throw new ClassNotFoundException("Recents owners are not Views");
            progress = method(paramsType, void.class, "setProgress", float.class, float.class, float.class);
            radius = HookCompatibility.field(paramsType, float.class, false,
                    named ? "currentDrawnCornerRadius" : "currentCornerRadius");
            taskUpdate = method(task, void.class, "updateFullscreenParams", paramsType);
            // The named build also republishes the recomputed params to native
            // thumbnails and invalidates them in updateSnapshotRadius().
            taskRefresh = method(task, void.class, named ? "updateSnapshotRadius" : "updateFullscreenParams");
            containers = method(task, java.util.List.class, "getTaskContainers");
            snapshotView = method(container, View.class, "getSnapshotView");
            recentsView = method(task, recents, "getRecentsView");
            redrawLiveTile = method(recents, void.class, "redrawLiveTile");
            simulatorApply = method(simulator, void.class, "apply", transform, transaction, boolean.class);
            simulatorParams = HookCompatibility.field(simulator, paramsType, false, "mCurrentFullscreenParams");
            simulatorContext = HookCompatibility.field(simulator, Context.class, false, "mContext");
            simulatorRect = HookCompatibility.field(simulator, Rect.class, false, "mTaskRect");
        }

        void install() {
            try { sampler = new LauncherRecentsRadiusSampler(recentsView, containers, snapshotView); }
            catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) {
                module.logFeatureError("LAUNCHER_RECENTS_RADIUS_RANGE_INSTALL", unavailable);
            }
            module.registerFeatureHook(module.prepareFeatureHook(progress,
                    "launcher.recents.radius.progress", false).intercept(chain -> {
                Object result = chain.proceed();
                Scope scope = drawing.get();
                if (scope == null || scope.params != chain.getThisObject()
                        || scope.params.getClass() != paramsType) return result;
                scope.progress = (Float) chain.getArg(0);
                scope.recentsScale = (Float) chain.getArg(1);
                scope.taskScale = (Float) chain.getArg(2);
                scope.computed = true;
                // Live surface rendering consumes this radius inside apply(),
                // before that method returns. Task snapshots are adjusted later.
                if (scope.simulator != null) adjustSafely(scope);
                return result;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(taskUpdate,
                    "launcher.recents.radius.task", false).intercept(chain -> {
                View view = (View) chain.getThisObject();
                remember(view);
                Scope scope = new Scope(chain.getArg(0), view, null, view.getContext());
                Scope previous = drawing.get();
                drawing.set(scope);
                try {
                    Object result = chain.proceed();
                    // 260027's fan mode caps the radius AFTER setProgress().
                    // Use that final OEM result as the baseline, so + values
                    // can round fan cards as well as the stock carousel cards.
                    if (scope.computed) {
                        if (sampler != null) {
                            try { sampler.observe(view, radius.getFloat(scope.params), scope.progress,
                                    scope.recentsScale, scope.taskScale); }
                            catch (ReflectiveOperationException | RuntimeException ignored) { }
                        }
                        adjustSafely(scope);
                    }
                    return result;
                } finally {
                    restoreScope(previous);
                }
            }));
            module.registerFeatureHook(module.prepareFeatureHook(simulatorApply,
                    "launcher.recents.radius.live", false).intercept(chain -> {
                Object simulator = chain.getThisObject();
                Scope scope;
                try {
                    scope = new Scope(simulatorParams.get(simulator), null, simulator,
                            (Context) simulatorContext.get(simulator));
                } catch (ReflectiveOperationException error) {
                    module.logFeatureError("LAUNCHER_RECENTS_RADIUS_LIVE", error);
                    return chain.proceed();
                }
                Scope previous = drawing.get();
                drawing.set(scope);
                try { return chain.proceed(); }
                finally { restoreScope(previous); }
            }));
            // These small native methods may already be inlined in the desktop.
            module.deoptimize(taskRefresh);
            module.deoptimize(taskUpdate);
            module.deoptimize(simulatorApply);
        }

        void restoreScope(Scope previous) {
            if (previous == null) drawing.remove();
            else drawing.set(previous);
        }

        void adjustSafely(Scope scope) {
            try {
                int offset = offset(scope.context);
                if (offset == 0 || scope.params.getClass() != paramsType || scope.progress >= 1f) return;
                float shortSide;
                if (scope.task != null) {
                    shortSide = Float.POSITIVE_INFINITY;
                    for (Object container : (java.util.List<?>) containers.invoke(scope.task)) {
                        View view = (View) snapshotView.invoke(container);
                        if (view != null && view.getWidth() > 0 && view.getHeight() > 0)
                            shortSide = Math.min(shortSide, Math.min(view.getWidth(), view.getHeight()));
                    }
                } else {
                    // calculateTaskSize() has completed before the native setter.
                    Rect bounds = (Rect) simulatorRect.get(scope.simulator);
                    shortSide = bounds == null ? 0f : Math.min(bounds.width(), bounds.height());
                }
                float nativeRadius = radius.getFloat(scope.params);
                float adjusted = RecentsCardRadiusPolicy.adjust(nativeRadius, offset,
                        scope.context.getResources().getDisplayMetrics().density,
                        scope.progress, scope.recentsScale, scope.taskScale, shortSide);
                if (adjusted != nativeRadius) radius.setFloat(scope.params, adjusted);
            } catch (ReflectiveOperationException | RuntimeException error) {
                module.logFeatureError("LAUNCHER_RECENTS_RADIUS_APPLY", error);
            }
        }

        void remember(View view) {
            tasks.put(view, Boolean.TRUE);
            if (listening) return;
            Context application = view.getContext().getApplicationContext();
            context = application == null ? view.getContext() : application;
            lastOffset = offset(context);
            listening = FeatureSettings.addSnapshotListener(context, this::settingsChanged);
        }

        void settingsChanged() {
            int next = offset(context);
            if (next == lastOffset) return;
            lastOffset = next;
            Set<Object> recents = Collections.newSetFromMap(new IdentityHashMap<>());
            for (View view : new ArrayList<>(tasks.keySet())) {
                if (view == null || !view.isAttachedToWindow()) continue;
                try {
                    // Always let native code recompute first: turning off/zero
                    // restores OEM values without any stale saved radius.
                    taskRefresh.invoke(view);
                    view.invalidate();
                    Object owner = recentsView.invoke(view);
                    if (owner != null) recents.add(owner);
                } catch (ReflectiveOperationException | RuntimeException error) {
                    module.logFeatureError("LAUNCHER_RECENTS_RADIUS_REFRESH", error);
                }
            }
            for (Object owner : recents) {
                try { redrawLiveTile.invoke(owner); }
                catch (ReflectiveOperationException | RuntimeException error) {
                    module.logFeatureError("LAUNCHER_RECENTS_RADIUS_REFRESH_LIVE", error);
                }
            }
        }

        static int offset(Context context) {
            if (context == null || !FeatureSettings.enabled(context, RecentsCardRadiusOptions.ENABLED)) return 0;
            return FeatureSettings.integer(context, RecentsCardRadiusOptions.OFFSET, 0,
                    RecentsCardRadiusOptions.MIN, RecentsCardRadiusOptions.MAX);
        }

        static Method method(Class<?> owner, Class<?> result, String name, Class<?>... args)
                throws NoSuchMethodException {
            return HookCompatibility.method(owner, result, false, new String[]{name}, args);
        }
    }
}
