package ls.augment.com.hook;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.libxposed.api.XposedInterface.HookHandle;
import ls.augment.com.RecentsRecommendedConfig;

/**
 * Visual-only Quickstep Recents augmentation for RedMagic 11S Pro.
 *
 * <p>Native scrollX, page selection, fling, snap, task launch and dismiss are
 * deliberately left in charge of Launcher3. This hook composes a horizontal
 * visual offset onto direct TaskView children after native layout/scroll
 * callbacks, producing a large horizontal overlap without changing the page
 * interval used by Quickstep.</p>
 */
final class LauncherRecentsStackHook {
    static final String LAUNCHER_PACKAGE = "com.zte.mifavor.launcher";

    private static final String RECENTS_VIEW_CLASS =
            "com.android.quickstep.views.RecentsView";
    private static final String LAUNCHER_RECENTS_VIEW_CLASS =
            "com.android.quickstep.views.LauncherRecentsView";
    private static final String TASK_VIEW_CLASS =
            "com.android.quickstep.views.TaskView";

    private static final String ENABLED_KEY = "ls_augment_recents_enabled";
    private static final String COMPRESSION_KEY = "ls_augment_recents_compression";
    private static final String FRONT_OVERLAP_KEY = "ls_augment_recents_front_overlap";
    private static final String MEMORY_ENABLED_KEY = "ls_augment_recents_memory_enabled";
    private static final String MEMORY_TEXT_SP_KEY = "ls_augment_recents_memory_text_sp";
    private static final String MEMORY_GAP_DP_KEY = "ls_augment_recents_memory_gap_dp";
    private static final String ACTIVE_KEY = "ls_augment_recents_active";
    private static final String INSTALLED_KEY = "ls_augment_recents_installed";
    private static final String LAST_LAYOUT_KEY = "ls_augment_recents_last_layout";
    private static final String LAST_ERROR_KEY = "ls_augment_recents_last_error";

    private static final float DEFAULT_COMPRESSION =
            RecentsRecommendedConfig.COMPRESSION;
    private static final float MIN_COMPRESSION = 0.12f;
    private static final float MAX_COMPRESSION = 0.90f;
    private static final float Z_RANGE_PX = 12.0f;
    private static final float EPSILON = 0.5f;
    private static final long CONFIG_REFRESH_MS = 750L;
    private static final long DIAGNOSTIC_REFRESH_MS = 1500L;
    private static final long MEMORY_REFRESH_MS = 1000L;
    private static final long ERROR_LOG_REFRESH_MS = 5000L;
    private static final long ENTRY_BLEND_DURATION_MS = 220L;
    private static final long ENTRY_READINESS_FALLBACK_MS = 900L;
    private static final long ENTRY_FRAME_SAFETY_MS = 400L;
    private static final float ENTRY_READY_CONTENT_ALPHA = 0.88f;
    private static final float ENTRY_READY_CARD_WIDTH_RATIO = 0.42f;
    private static final float ENTRY_READY_CENTER_DISTANCE_RATIO = 0.24f;
    private static final float MEMORY_REVEAL_START = 0.86f;
    private static final int MEMORY_HORIZONTAL_MARGIN_DP = 24;
    private static final int MEMORY_CARD_GAP_DP =
            RecentsRecommendedConfig.MEMORY_GAP_DP;
    private static final int MEMORY_BOTTOM_RESERVE_DP = 88;
    private static final int HEADER_THUMBNAIL_OVERLAP_DP = 48;
    private static final int HEADER_TEXT_SAFETY_DP = 4;
    private static final long DISMISS_TIMEOUT_MS = 550L;
    private static final int DISMISS_SETTLE_FRAMES = 2;
    private static final int TRANSIENT_HOLD_FRAMES = 24;
    private static final int COMPOSE_TRANSLATION_X = 1;
    private static final int COMPOSE_TRANSLATION_Y = 2;
    private static final int COMPOSE_SCALE = 3;

    private static final Map<View, AppliedState> APPLIED = new WeakHashMap<>();
    private static final Map<View, ClipState> HEADER_CLIPS = new WeakHashMap<>();
    private static final Map<TextView, TextAlphaState> HEADER_TEXT_ALPHA =
            new WeakHashMap<>();
    private static final Map<ImageView, IconVisibilityState> HEADER_ICON_VISIBILITY =
            new WeakHashMap<>();
    private static final Map<ViewGroup, OverviewEntryState> OVERVIEW_ENTRIES =
            new WeakHashMap<>();
    private static final Map<ViewGroup, DismissSettleTracker> DISMISS_TRACKERS =
            new WeakHashMap<>();
    private static final Map<View, View> TASK_THUMBNAILS = new WeakHashMap<>();
    private static final Map<View, Boolean> NATIVE_ACTION_VIEWS = new WeakHashMap<>();
    private static final Map<ImageView, Boolean> APP_ICON_VIEWS = new WeakHashMap<>();
    private static final Map<Class<?>, Method> CONTENT_ALPHA_GETTERS = new WeakHashMap<>();
    private static final Set<Class<?>> MISSING_CONTENT_ALPHA_GETTERS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<Class<?>, Method> RUNNING_TASK_INDEX_GETTERS =
            new WeakHashMap<>();
    private static final Set<Class<?>> MISSING_RUNNING_TASK_INDEX_GETTERS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<Class<?>, Method> SWITCH_TO_SCREENSHOT_METHODS =
            new WeakHashMap<>();
    private static final Set<Class<?>> MISSING_SWITCH_TO_SCREENSHOT_METHODS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<Method> HOOKED_METHODS = new HashSet<>();
    private static final Set<View> DISMISSING_TASKS =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Comparator<CardPosition> CARD_POSITION_COMPARATOR =
            new Comparator<CardPosition>() {
                @Override
                public int compare(CardPosition left, CardPosition right) {
                    return Float.compare(left.contentCenter, right.contentCenter);
                }
            };

    private static long lastConfigRead;
    private static boolean cachedEnabled = true;
    private static float cachedCompression = DEFAULT_COMPRESSION;
    private static float cachedFrontOverlapRatio =
            RecentsRecommendedConfig.FRONT_OVERLAP;
    private static boolean cachedMemoryEnabled = true;
    private static int cachedMemoryTextSp =
            RecentsRecommendedConfig.MEMORY_TEXT_SP;
    private static int cachedMemoryGapDp = MEMORY_CARD_GAP_DP;
    private static long lastDiagnostic;
    private static String lastDiagnosticState = "";
    private static long lastLayoutErrorLog;
    private static int taskCompositionHooksInstalled;
    // A single overlay prevents duplicate memory labels across the two OEM
    // RecentsView subclasses. It is removed as soon as overview is left or the
    // feature is disabled, so the Launcher activity is not retained.
    @SuppressLint("StaticFieldLeak")
    private static MemoryOverlayState memoryOverlay;

    private LauncherRecentsStackHook() { }

    static synchronized int install(AugmentModule module, ClassLoader classLoader) {
        int installed = 0;
        installed += installForClass(module, classLoader, RECENTS_VIEW_CLASS, "recents");
        installed += installForClass(
                module, classLoader, LAUNCHER_RECENTS_VIEW_CLASS, "launcher_recents");
        installed += installTaskViewHooks(module, classLoader);
        return installed;
    }

    private static int installForClass(
            AugmentModule module, ClassLoader classLoader, String className, String idPrefix) {
        final Class<?> recentsClass;
        try {
            recentsClass = Class.forName(className, false, classLoader);
        } catch (Throwable error) {
            module.logRecentsInfo("CLASS_MISSING " + className + " " + safeMessage(error));
            return 0;
        }

        int installed = 0;
        installed += installMethod(module, recentsClass, idPrefix, "onLayout",
                boolean.class, int.class, int.class, int.class, int.class);
        installed += installMethod(module, recentsClass, idPrefix, "onSizeChanged",
                int.class, int.class, int.class, int.class);
        installed += installMethod(module, recentsClass, idPrefix, "onScrollChanged",
                int.class, int.class, int.class, int.class);
        installed += installMethod(module, recentsClass, idPrefix, "setContentAlpha",
                float.class);
        installed += installOverviewEnabledMethod(module, recentsClass, idPrefix);
        installed += installStateTransitionMethod(
                module, recentsClass, idPrefix, "onStateTransitionStart", false);
        installed += installStateTransitionMethod(
                module, recentsClass, idPrefix, "onStateTransitionComplete", true);
        installed += installDismissHooks(module, recentsClass, idPrefix);
        return installed;
    }

    /**
     * Composes the deck on the same final TaskView methods used by this OEM's
     * dismiss, resistance, grid and page-offset properties. A raw View
     * translation written only from RecentsView is otherwise replaced the next
     * time TaskView recomputes its native transform, which is what made adjacent
     * frames alternate between the native row and the requested deck.
     */
    private static int installTaskViewHooks(
            AugmentModule module, ClassLoader classLoader) {
        final Class<?> taskViewClass;
        try {
            taskViewClass = Class.forName(TASK_VIEW_CLASS, false, classLoader);
        } catch (Throwable error) {
            module.logRecentsInfo("CLASS_MISSING " + TASK_VIEW_CLASS + " "
                    + safeMessage(error));
            return 0;
        }

        int installed = 0;
        int compositionInstalled = 0;
        compositionInstalled += installTaskCompositionMethod(
                module, taskViewClass, "applyTranslationX", COMPOSE_TRANSLATION_X);
        compositionInstalled += installTaskCompositionMethod(
                module, taskViewClass, "applyTranslationY", COMPOSE_TRANSLATION_Y);
        compositionInstalled += installTaskCompositionMethod(
                module, taskViewClass, "applyScale", COMPOSE_SCALE);
        taskCompositionHooksInstalled += compositionInstalled;
        installed += compositionInstalled;

        // OEM title/action state is rebound independently of RecentsView. These
        // lightweight post-hooks re-evaluate only the affected card header, so
        // a late menu/mini-window visibility write cannot leak above the deck.
        installed += installTaskHeaderRefreshMethod(
                module, taskViewClass, "onLayout",
                boolean.class, int.class, int.class, int.class, int.class);
        installed += installTaskHeaderRefreshMethod(
                module, taskViewClass, "setTitleHidden", boolean.class);
        installed += installTaskHeaderRefreshMethod(
                module, taskViewClass, "updateMiniWindowButtonState");
        installed += installTaskHeaderRefreshMethod(
                module, taskViewClass, "updateSplitButtonState");
        installed += installTaskRecycleMethod(module, taskViewClass);
        module.logRecentsInfo("TASK_COMPOSITION_READY installed="
                + taskCompositionHooksInstalled);
        return installed;
    }

    private static int installTaskCompositionMethod(
            AugmentModule module, Class<?> owner, String name, int transformKind) {
        Method method = findMethod(owner, name, void.class);
        if (method == null) {
            module.logRecentsInfo("METHOD_MISSING " + owner.getName() + "." + name);
            return 0;
        }
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents.task.compose." + name)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            Object ownerView = chain.getThisObject();
                            if (ownerView instanceof View) {
                                composeAfterNativeTransform(
                                        (View) ownerView, transformKind);
                            }
                        } catch (Throwable error) {
                            reportSafeLayoutFailure(chain.getThisObject(), error);
                        }
                        return result;
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static int installTaskHeaderRefreshMethod(
            AugmentModule module, Class<?> owner, String name, Class<?>... parameters) {
        Method method = findMethod(owner, name, void.class, parameters);
        if (method == null) return 0;
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents.task.header." + name)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            Object ownerView = chain.getThisObject();
                            if (ownerView instanceof View) {
                                refreshTaskHeader((View) ownerView);
                            }
                        } catch (Throwable error) {
                            reportSafeLayoutFailure(chain.getThisObject(), error);
                        }
                        return result;
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static int installTaskRecycleMethod(
            AugmentModule module, Class<?> owner) {
        Method method = findMethod(owner, "onRecycle", void.class);
        if (method == null) return 0;
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents.task.onRecycle")
                    .intercept(chain -> {
                        Object ownerView = chain.getThisObject();
                        if (ownerView instanceof View) {
                            clearTaskBeforeRecycle((View) ownerView);
                        }
                        return chain.proceed();
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static void composeAfterNativeTransform(View task, int transformKind) {
        AppliedState state = APPLIED.get(task);
        if (state == null || !state.deckActive) return;

        if (transformKind == COMPOSE_TRANSLATION_X) {
            // chain.proceed() has just produced the complete OEM translation.
            // Keep it as the native base and add only our deck channel.
            state.baseTranslationX = task.getTranslationX();
            task.setTranslationX(RecentsTransformComposition.translation(
                    state.baseTranslationX, state.deckTranslationX));
            state.lastTranslationX = task.getTranslationX();
            return;
        }

        if (transformKind == COMPOSE_TRANSLATION_Y) {
            state.baseTranslationY = task.getTranslationY();
            if (isDismissing(task)) {
                // The outgoing task's upward gesture remains fully native.
                state.lastTranslationY = state.baseTranslationY;
                return;
            }
            task.setTranslationY(RecentsTransformComposition.translation(
                    state.baseTranslationY, state.deckTranslationY));
            state.lastTranslationY = task.getTranslationY();
            return;
        }

        if (transformKind == COMPOSE_SCALE) {
            state.baseScaleX = task.getScaleX();
            state.baseScaleY = task.getScaleY();
            task.setScaleX(RecentsTransformComposition.scale(
                    state.baseScaleX, state.deckScaleX));
            task.setScaleY(RecentsTransformComposition.scale(
                    state.baseScaleY, state.deckScaleY));
            state.lastScaleX = task.getScaleX();
            state.lastScaleY = task.getScaleY();
        }
    }

    private static void refreshTaskHeader(View task) {
        AppliedState state = APPLIED.get(task);
        if (state == null || !state.deckActive || state.exposedHeaderWidth < 0) return;
        if (isDismissing(task)) {
            hideNativeTaskActions(task);
            return;
        }
        applyHeaderExposedClip(task, state.exposedHeaderWidth);
    }

    /**
     * TaskView.onRecycle() resets its native transform properties by calling
     * the same composition methods hooked above. Remove our state first so the
     * recycled object cannot carry a deck offset into the next bound task.
     */
    private static void clearTaskBeforeRecycle(View task) {
        AppliedState state = APPLIED.remove(task);
        if (state != null) {
            state.deckActive = false;
            if (close(task.getTranslationX(), state.lastTranslationX)) {
                task.setTranslationX(state.baseTranslationX);
            }
            if (close(task.getTranslationY(), state.lastTranslationY)) {
                task.setTranslationY(state.baseTranslationY);
            }
            if (close(task.getTranslationZ(), state.lastTranslationZ)) {
                task.setTranslationZ(state.baseTranslationZ);
            }
            if (closeScale(task.getScaleX(), state.lastScaleX)) {
                task.setScaleX(state.baseScaleX);
            }
            if (closeScale(task.getScaleY(), state.lastScaleY)) {
                task.setScaleY(state.baseScaleY);
            }
        }
        synchronized (DISMISSING_TASKS) {
            DISMISSING_TASKS.remove(task);
        }
        TASK_THUMBNAILS.remove(task);
        restoreHeaderClips(task);
    }

    private static int installDismissHooks(
            AugmentModule module, Class<?> owner, String idPrefix) {
        int installed = 0;
        for (Class<?> current = owner; current != null; current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                String name = method.getName();
                if (!RecentsDismissPolicy.shouldHook(
                        owner.getName(),
                        name,
                        method.getReturnType() == void.class,
                        hasTaskViewParameter(method))) continue;
                synchronized (HOOKED_METHODS) {
                    if (!HOOKED_METHODS.add(method)) continue;
                }
                try {
                    method.setAccessible(true);
                    HookHandle handle = module.prepareRecentsHook(method)
                            .setId("ls_augment.api102.recents." + idPrefix
                                    + ".dismiss." + installed)
                            .intercept(chain -> {
                                List<?> args = chain.getArgs();
                                View dismissing = dismissalView(chain.getThisObject(), args);
                                ViewGroup recents = dismissalParent(chain.getThisObject(), args);
                                markDismissalTargets(chain.getThisObject(), args);
                                Object result = chain.proceed();
                                // Do no full deck traversal on the gesture's
                                // first dismiss frame. The outgoing TaskView
                                // keeps its composed pose, and survivors are
                                // laid out only after detach/timeout below.
                                scheduleDismissSettle(recents, dismissing);
                                return result;
                            });
                    module.registerRecentsHook(handle);
                    module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
                    installed++;
                } catch (Throwable error) {
                    synchronized (HOOKED_METHODS) {
                        HOOKED_METHODS.remove(method);
                    }
                    module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
                }
            }
        }
        return installed;
    }

    private static void markDismissalTargets(Object owner, List<?> args) {
        if (owner instanceof View && isTaskView((View) owner)) {
            markDismissing((View) owner);
        }
        if (args != null) {
            for (Object arg : args) {
                if (arg instanceof View && isTaskView((View) arg)) {
                    markDismissing((View) arg);
                }
            }
        }
        // Never guess by marking the entire RecentsView.  If this OEM path does
        // not expose its target, the next layout pass is safer than dropping the
        // visual transform from every surviving card.
    }

    private static boolean hasTaskViewParameter(Method method) {
        for (Class<?> parameter : method.getParameterTypes()) {
            if (TASK_VIEW_CLASS.equals(parameter.getName())
                    || TASK_VIEW_CLASS.equals(parameter.getSuperclass() == null
                    ? "" : parameter.getSuperclass().getName())) return true;
        }
        return false;
    }

    private static void markDismissing(View task) {
        synchronized (DISMISSING_TASKS) {
            DISMISSING_TASKS.add(task);
        }
        hideNativeTaskActions(task);
    }

    private static boolean isDismissing(View task) {
        synchronized (DISMISSING_TASKS) {
            return DISMISSING_TASKS.contains(task);
        }
    }

    private static View dismissalView(Object owner, List<?> args) {
        if (owner instanceof View && isTaskView((View) owner)) return (View) owner;
        if (args != null) {
            for (Object arg : args) {
                if (arg instanceof View && isTaskView((View) arg)) return (View) arg;
            }
        }
        return null;
    }

    private static ViewGroup dismissalParent(Object owner, List<?> args) {
        if (owner instanceof ViewGroup && isRecentsView((View) owner)) {
            return (ViewGroup) owner;
        }
        View task = dismissalView(owner, args);
        if (task != null) return findRecentsParent(task);
        return owner instanceof View ? findRecentsParent((View) owner) : null;
    }

    private static void scheduleDismissSettle(ViewGroup recents, View task) {
        if (recents == null || task == null) return;
        DismissSettleTracker tracker;
        synchronized (DISMISS_TRACKERS) {
            DismissSettleTracker current = DISMISS_TRACKERS.get(recents);
            if (current != null && current.task == task && !current.cancelled) {
                return;
            }
            if (current != null) current.cancel();
            tracker = new DismissSettleTracker(recents, task);
            DISMISS_TRACKERS.put(recents, tracker);
        }
        tracker.start();
    }

    /**
     * Quickstep's own TaskView properties now retain the deck transform during
     * the active dismiss animation. There is no need to force a complete deck
     * traversal on every display frame. Wait for the outgoing view to detach,
     * then run only a short survivor settle; the timeout handles cancellation
     * and OEM paths that recycle without a detach callback.
     */
    private static final class DismissSettleTracker
            implements Runnable, View.OnAttachStateChangeListener {
        final ViewGroup recents;
        final View task;
        int settleRemaining;
        boolean detached;
        boolean cancelled;

        DismissSettleTracker(ViewGroup recents, View task) {
            this.recents = recents;
            this.task = task;
        }

        void start() {
            task.addOnAttachStateChangeListener(this);
            if (task.getParent() == null) {
                beginSettle();
                return;
            }
            recents.postDelayed(this, DISMISS_TIMEOUT_MS);
        }

        @Override public void run() {
            if (cancelled) return;
            if (!detached) {
                // The dismiss was cancelled or this OEM retained/recycled the
                // view without detaching it. One final event-driven layout is
                // sufficient; continuous polling only consumes frame budget.
                finish(true);
                return;
            }
            runSettleFrame();
        }

        @Override public void onViewAttachedToWindow(View view) { }

        @Override public void onViewDetachedFromWindow(View view) {
            beginSettle();
        }

        private void beginSettle() {
            if (cancelled || detached) return;
            detached = true;
            recents.removeCallbacks(this);
            task.removeOnAttachStateChangeListener(this);
            clearDismissed(recents, task);
            settleRemaining = DISMISS_SETTLE_FRAMES;
            runSettleFrame();
        }

        private void runSettleFrame() {
            if (cancelled) return;
            if (!recents.isAttachedToWindow()) {
                finish(false);
                return;
            }
            requestVisualLayout(recents);
            settleRemaining--;
            if (settleRemaining > 0) {
                recents.postOnAnimation(this);
            } else {
                finish(false);
            }
        }

        void cancel() {
            finish(false);
        }

        void finish(boolean requestFinalLayout) {
            if (cancelled) return;
            cancelled = true;
            recents.removeCallbacks(this);
            task.removeOnAttachStateChangeListener(this);
            clearDismissed(recents, task);
            synchronized (DISMISS_TRACKERS) {
                if (DISMISS_TRACKERS.get(recents) == this) {
                    DISMISS_TRACKERS.remove(recents);
                }
            }
            if (requestFinalLayout) requestVisualLayout(recents);
        }
    }

    private static void clearDismissed(ViewGroup recents, View task) {
        synchronized (DISMISSING_TASKS) {
            if (task != null) {
                DISMISSING_TASKS.remove(task);
            } else {
                for (int index = 0; index < recents.getChildCount(); index++) {
                    DISMISSING_TASKS.remove(recents.getChildAt(index));
                }
            }
        }
    }

    private static int installMethod(
            AugmentModule module,
            Class<?> owner,
            String idPrefix,
            String name,
            Class<?>... parameters) {
        Method method = findMethod(owner, name, void.class, parameters);
        if (method == null) {
            module.logRecentsInfo("METHOD_MISSING " + owner.getName() + "." + name);
            return 0;
        }
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents." + idPrefix + "." + name)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        requestVisualLayout(chain.getThisObject());
                        return result;
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static int installOverviewEnabledMethod(
            AugmentModule module, Class<?> owner, String idPrefix) {
        Method method = findMethod(
                owner, "setOverviewStateEnabled", void.class, boolean.class);
        if (method == null) return 0;
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents." + idPrefix
                            + ".setOverviewStateEnabled")
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            Object enabled = chain.getArg(0);
                            if (enabled instanceof Boolean) {
                                handleOverviewEnabled(
                                        chain.getThisObject(), (Boolean) enabled);
                            }
                        } catch (Throwable error) {
                            recoverLastStack(chain.getThisObject());
                            logLayoutFailure(module, owner, error);
                        }
                        return result;
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static int installStateTransitionMethod(
            AugmentModule module,
            Class<?> owner,
            String idPrefix,
            String name,
            boolean complete) {
        Method method = findSingleArgumentMethod(owner, name, void.class);
        if (method == null) return 0;
        synchronized (HOOKED_METHODS) {
            if (!HOOKED_METHODS.add(method)) return 0;
        }

        try {
            method.setAccessible(true);
            HookHandle handle = module.prepareRecentsHook(method)
                    .setId("ls_augment.api102.recents." + idPrefix + "." + name)
                    .intercept(chain -> {
                        Object result = chain.proceed();
                        try {
                            handleStateTransition(
                                    chain.getThisObject(), chain.getArg(0), complete);
                        } catch (Throwable error) {
                            recoverLastStack(chain.getThisObject());
                            logLayoutFailure(module, owner, error);
                        }
                        return result;
                    });
            module.registerRecentsHook(handle);
            module.logRecentsInfo("HOOK_INSTALLED " + method.toGenericString());
            return 1;
        } catch (Throwable error) {
            synchronized (HOOKED_METHODS) {
                HOOKED_METHODS.remove(method);
            }
            module.logRecentsError("HOOK_FAILED " + method.toGenericString(), error);
            return 0;
        }
    }

    private static void requestVisualLayout(Object owner) {
        ViewGroup recents = resolveRecentsView(owner);
        if (recents == null) return;
        OverviewEntryState state = entryStateFor(recents);
        state.layoutRequested = true;
        if (!recents.isAttachedToWindow()) {
            ensureAttachedLayout(recents, state);
            return;
        }
        ensurePreDrawLayout(recents, state);
        recents.postInvalidateOnAnimation();
    }

    private static void ensureAttachedLayout(
            ViewGroup recents, OverviewEntryState state) {
        if (state.attachListener != null) return;
        View.OnAttachStateChangeListener listener =
                new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View view) {
                        if (state.attachListener != this) return;
                        view.removeOnAttachStateChangeListener(this);
                        state.attachListener = null;
                        if (state.layoutRequested) requestVisualLayout(recents);
                    }

                    @Override public void onViewDetachedFromWindow(View view) { }
                };
        state.attachListener = listener;
        recents.addOnAttachStateChangeListener(listener);
    }

    /**
     * Applies the visual deck after Quickstep has completed this frame's
     * layout and animation writes, but before the frame is drawn.  A normal
     * postOnAnimation callback runs before traversal, which allowed the OEM to
     * overwrite our translations later in the same frame and made adjacent
     * frames alternate between grid and stack geometry.
     */
    private static void ensurePreDrawLayout(
            ViewGroup recents, OverviewEntryState state) {
        ViewTreeObserver observer = recents.getViewTreeObserver();
        if (!observer.isAlive()) return;
        if (state.preDrawObserver == observer && state.preDrawListener != null) return;

        removePreDrawLayout(state, false);
        ViewTreeObserver.OnPreDrawListener listener =
                new ViewTreeObserver.OnPreDrawListener() {
                    @Override public boolean onPreDraw() {
                        if (state.preDrawListener != this) return true;
                        if (!recents.isAttachedToWindow()) {
                            removePreDrawLayout(state, false);
                            state.layoutRequested = true;
                            ensureAttachedLayout(recents, state);
                            return true;
                        }
                        boolean requested = state.layoutRequested;
                        state.layoutRequested = false;
                        if (requested || shouldDriveEntryFrame(state)) {
                            applyVisualLayoutSafely(recents);
                        }

                        // applyVisualLayout() requests another frame while the
                        // entry blend is active.  The bounded fallback also
                        // keeps early no-card/transparent frames alive until
                        // Quickstep finishes binding its TaskViews.
                        if (state.layoutRequested || shouldDriveEntryFrame(state)) {
                            recents.postInvalidateOnAnimation();
                        } else {
                            removePreDrawLayout(state, false);
                        }
                        return true;
                    }
                };
        state.preDrawObserver = observer;
        state.preDrawListener = listener;
        observer.addOnPreDrawListener(listener);
    }

    private static boolean shouldDriveEntryFrame(OverviewEntryState state) {
        if (!state.overviewEnabled || !state.entering || state.disabledRestored) {
            return false;
        }
        long elapsed = SystemClock.uptimeMillis() - state.entryStartedAt;
        return elapsed <= ENTRY_READINESS_FALLBACK_MS
                + ENTRY_BLEND_DURATION_MS
                + ENTRY_FRAME_SAFETY_MS;
    }

    private static void removePreDrawLayout(
            OverviewEntryState state, boolean clearRequest) {
        ViewTreeObserver observer = state.preDrawObserver;
        ViewTreeObserver.OnPreDrawListener listener = state.preDrawListener;
        state.preDrawObserver = null;
        state.preDrawListener = null;
        if (clearRequest) state.layoutRequested = false;
        if (observer == null || listener == null || !observer.isAlive()) return;
        try {
            observer.removeOnPreDrawListener(listener);
        } catch (Throwable ignored) {
            // The observer may die between isAlive() and removal on detach.
        }
    }

    private static void cancelVisualLayout(
            ViewGroup recents, OverviewEntryState state) {
        removePreDrawLayout(state, true);
        View.OnAttachStateChangeListener listener = state.attachListener;
        state.attachListener = null;
        if (listener == null) return;
        try {
            recents.removeOnAttachStateChangeListener(listener);
        } catch (Throwable ignored) {
            // Cancellation is best-effort during Launcher teardown.
        }
    }

    private static void applyVisualLayoutSafely(Object owner) {
        try {
            applyVisualLayout(owner);
        } catch (Throwable error) {
            reportSafeLayoutFailure(owner, error);
            recoverLastStack(owner);
        }
    }

    private static synchronized void reportSafeLayoutFailure(
            Object owner, Throwable error) {
        long now = SystemClock.uptimeMillis();
        if (now - lastLayoutErrorLog < ERROR_LOG_REFRESH_MS) return;
        lastLayoutErrorLog = now;
        ViewGroup recents = resolveRecentsView(owner);
        if (recents == null) return;
        String location = "";
        StackTraceElement[] stack = error.getStackTrace();
        if (stack != null && stack.length > 0) location = "@" + stack[0];
        writeDiagnostic(
                recents.getContext().getContentResolver(),
                LAST_ERROR_KEY,
                error.getClass().getSimpleName() + ":" + safeMessage(error) + location);
    }

    private static void recoverLastStack(Object owner) {
        ViewGroup recents = resolveRecentsView(owner);
        if (recents == null) return;
        OverviewEntryState state = entryStateFor(recents);
        if (!state.overviewEnabled || !state.stackEstablished) return;
        try {
            holdDismissingTaskPoses(recents);
            holdLastStack(recents);
        } catch (Throwable ignored) {
            // Recovery is best-effort and must never crash Launcher.
        }
    }

    private static void applyVisualLayout(Object owner) {
        ViewGroup recents = resolveRecentsView(owner);
        if (recents == null) return;
        if (recents.getWidth() <= 0) return;

        OverviewEntryState entry = prepareOverviewEntry(recents);
        Config config = readConfig(recents.getContext());
        if (!config.enabled) {
            entry.entering = false;
            if (!entry.disabledRestored) {
                clearStackContinuity(entry);
                restoreChildren(recents);
                removeMemoryOverlay();
                entry.disabledRestored = true;
                writeDiagnostics(recents, 0, "disabled");
            }
            return;
        }
        entry.disabledRestored = false;

        float center = (recents.getPaddingLeft()
                + recents.getWidth() - recents.getPaddingRight()) / 2.0f;
        int scrollX = recents.getScrollX();
        List<CardPosition> cards = collectCards(recents, scrollX);
        holdDismissingTaskPoses(recents);
        if (cards.isEmpty()) {
            if (holdEstablishedStack(recents, entry, 0, "hold_no_cards")) {
                hideMemoryOverlay();
                return;
            }
            restoreChildren(recents);
            hideMemoryOverlay();
            writeDiagnostics(recents, 0, "no_cards");
            return;
        }

        float contentAlpha = readContentAlpha(recents);
        if (!entry.overviewEnabled) {
            restoreChildren(recents);
            removeMemoryOverlay();
            writeDiagnostics(recents, cards.size(), "not_visible");
            return;
        }

        resolveEntrySource(recents, entry);
        float stackBlend = resolveStackBlend(recents, cards, entry, contentAlpha);
        if (stackBlend <= 0.001f) {
            // The native Quickstep transition remains authoritative while the
            // current task is entering from the edge. Applying final stack
            // coordinates here creates the early white slivers seen over Home.
            restoreChildren(recents);
            hideMemoryOverlay();
            writeDiagnostics(recents, cards.size(), "entering");
            return;
        }

        entry.ensureCardCapacity(cards.size());
        float pageInterval = resolvePageInterval(
                recents, entry, estimatePageInterval(cards, entry.scratch));
        if (pageInterval <= 0.0f) {
            if (holdEstablishedStack(
                    recents, entry, cards.size(), "hold_no_interval")) {
                return;
            }
            restoreChildren(recents);
            updateMemoryOverlay(
                    recents, cards,
                    RecentsStackMath.revealProgress(stackBlend, MEMORY_REVEAL_START));
            writeDiagnostics(recents, cards.size(), "no_interval");
            return;
        }

        // Derive continuous progress from the real laid-out card centers.
        // This also handles OEM start padding and page spacing without
        // assuming that the first page lives at scrollX == 0.
        float[] cardCenters = entry.cardCenters;
        for (int index = 0; index < cards.size(); index++) {
            cardCenters[index] = cards.get(index).contentCenter;
        }
        float nativePageFloat = RecentsStackMath.pagePosition(
                scrollX + center, cardCenters, cards.size(), pageInterval);
        float pageFloat = RecentsStackMath.visualPagePosition(
                nativePageFloat, cards.size(), entry.runningTaskEntry);
        entry.lastNativePagePosition = nativePageFloat;
        entry.lastVisualPagePosition = pageFloat;
        entry.lastViewportCenterInContent = scrollX + center;
        entry.lastFirstCardCenter = cardCenters[0];
        entry.lastFinalCardCenter = cardCenters[cards.size() - 1];
        prepareAppliedStates(cards);
        float frontDistanceRatio = RecentsStackMath.frontDistanceRatio(
                estimateCardWidth(cards, entry.scratch),
                pageInterval,
                config.frontOverlapRatio);

        float[] targetCenters = entry.targetCenters;
        for (int index = 0; index < cards.size(); index++) {
            targetCenters[index] = center + RecentsStackMath.visualOffset(
                    index - pageFloat,
                    pageInterval,
                    config.compression,
                    frontDistanceRatio);
        }
        entry.lastFirstTargetCenter = targetCenters[0];
        entry.lastFinalTargetCenter = targetCenters[cards.size() - 1];

        float[] renderedLefts = entry.renderedLefts;
        float[] renderedRights = entry.renderedRights;
        for (int index = 0; index < cards.size(); index++) {
            CardPosition card = cards.get(index);
            View child = card.view;
            float relativePage = index - pageFloat;

            AppliedState state = stateFor(child);
            absorbExternalTransforms(child, state);
            // A live running task keeps an OEM gesture translation even after
            // its laid-out page is centered. Resolve our deck offset against
            // that complete native pose; otherwise the current app inherits
            // the translation a second time and lands beyond the right edge.
            float visualOffset = RecentsTransformComposition.deckOffsetForTarget(
                    card.nativeCenter,
                    state.baseTranslationX,
                    targetCenters[index],
                    stackBlend);
            float targetScale = RecentsStackMath.visualScale(relativePage);
            float scaleFactor = 1.0f - stackBlend * (1.0f - targetScale);
            float verticalOffset = child.getHeight()
                    * RecentsStackMath.verticalOffsetRatio(relativePage)
                    * stackBlend;

            // Store a distinct deck channel. The TaskView composition hooks use
            // these values whenever Quickstep recomputes its native properties,
            // so the row cannot overwrite a settled deck between pre-draws.
            state.deckTranslationX = visualOffset;
            state.deckTranslationY = verticalOffset;
            state.deckScaleX = scaleFactor;
            state.deckScaleY = scaleFactor;
            state.deckActive = true;
            child.setTranslationX(RecentsTransformComposition.translation(
                    state.baseTranslationX, state.deckTranslationX));
            child.setScaleX(RecentsTransformComposition.scale(
                    state.baseScaleX, state.deckScaleX));
            child.setScaleY(RecentsTransformComposition.scale(
                    state.baseScaleY, state.deckScaleY));
            child.setTranslationY(RecentsTransformComposition.translation(
                    state.baseTranslationY, state.deckTranslationY));

            // Cover order is directional and stable: a card on the right is
            // always above the cards to its left. Never flip Z at a midpoint.
            float depth = RecentsStackMath.layerDepth(
                    index, cards.size(), Z_RANGE_PX) * stackBlend;
            child.setTranslationZ(state.baseTranslationZ + depth);

            state.lastTranslationX = child.getTranslationX();
            state.lastTranslationY = child.getTranslationY();
            state.lastTranslationZ = child.getTranslationZ();
            state.lastScaleX = child.getScaleX();
            state.lastScaleY = child.getScaleY();

            float nativeLeft = card.nativeCenter - child.getWidth() / 2.0f;
            renderedLefts[index] = nativeLeft
                    + child.getTranslationX()
                    + child.getPivotX() * (1.0f - child.getScaleX());
            renderedRights[index] = renderedLefts[index]
                    + child.getWidth() * Math.max(0.01f, child.getScaleX());
        }

        // Keep the two front edges physically joined at snapped endpoints as
        // well as during an active page exchange. The shared visual slot above
        // normally provides the requested overlap; this is a final guard for
        // OEM tasks whose rendered widths differ.
        if (stackBlend >= 0.999f) {
            int leftFrontIndex = (int) Math.floor(pageFloat);
            float pageProgress = pageFloat - leftFrontIndex;
            int rightFrontIndex = leftFrontIndex + 1;
            if (leftFrontIndex >= 0 && rightFrontIndex < cards.size()) {
                float smallerWidth = Math.min(
                        renderedRights[leftFrontIndex] - renderedLefts[leftFrontIndex],
                        renderedRights[rightFrontIndex] - renderedLefts[rightFrontIndex]);
                float correction = RecentsStackMath.frontPairCorrection(
                        pageProgress,
                        renderedRights[leftFrontIndex],
                        renderedLefts[rightFrontIndex],
                        smallerWidth,
                        pageInterval,
                        config.frontOverlapRatio);
                if (correction > 0.0f) {
                    View rightFront = cards.get(rightFrontIndex).view;
                    AppliedState rightState = stateFor(rightFront);
                    rightState.deckTranslationX -= correction;
                    rightFront.setTranslationX(RecentsTransformComposition.translation(
                            rightState.baseTranslationX,
                            rightState.deckTranslationX));
                    rightState.lastTranslationX = rightFront.getTranslationX();
                    renderedLefts[rightFrontIndex] -= correction;
                    renderedRights[rightFrontIndex] -= correction;
                }
            }
        }

        captureRunningTaskPose(recents, cards, targetCenters, entry);

        // From this point a complete deck pose exists. Mark it before
        // auxiliary header/overlay work so a vendor-specific child hierarchy
        // failure cannot make the next frame fall back to native spacing.
        entry.stackEstablished = true;
        entry.transientHoldFrames = 0;

        // The card body must keep its native rounded outline and shadow. Only
        // clip branches in the transparent title/action strip above the task
        // thumbnail; clipping the whole TaskView creates hard vertical slices.
        for (int index = 0; index < cards.size(); index++) {
            View child = cards.get(index).view;
            int exposedWidth = child.getWidth();
            if (index + 1 < cards.size()) {
                float visiblePixels = renderedLefts[index + 1] - renderedLefts[index];
                float localScale = Math.max(0.01f, child.getScaleX());
                exposedWidth = Math.round(visiblePixels / localScale);
            }
            AppliedState state = APPLIED.get(child);
            if (state != null) state.exposedHeaderWidth = exposedWidth;
            applyHeaderExposedClip(child, exposedWidth);
        }
        updateMemoryOverlay(
                recents, cards,
                RecentsStackMath.revealProgress(stackBlend, MEMORY_REVEAL_START));
        writeDiagnostics(recents, cards.size(),
                stackBlend >= 0.999f ? "active" : "stack_blend");
        if (stackBlend >= 0.999f) {
            scheduleRunningTaskScreenshot(recents, entry);
        }
    }

    private static void captureRunningTaskPose(
            ViewGroup recents,
            List<CardPosition> cards,
            float[] targetCenters,
            OverviewEntryState entry) {
        entry.lastRunningSortedIndex = -1;
        entry.lastRunningNativeCenter = Float.NaN;
        entry.lastRunningTargetCenter = Float.NaN;
        entry.lastRunningBaseTranslationX = Float.NaN;
        entry.lastRunningDeckTranslationX = Float.NaN;
        entry.lastRunningActualTranslationX = Float.NaN;
        entry.lastRunningRenderedCenter = Float.NaN;
        entry.lastRunningWidth = 0;
        if (entry.runningTaskIndex < 0
                || entry.runningTaskIndex >= recents.getChildCount()) return;

        View runningTask = recents.getChildAt(entry.runningTaskIndex);
        for (int index = 0; index < cards.size(); index++) {
            CardPosition card = cards.get(index);
            if (card.view != runningTask) continue;
            AppliedState state = APPLIED.get(runningTask);
            if (state == null) return;
            entry.lastRunningSortedIndex = index;
            entry.lastRunningNativeCenter = card.nativeCenter;
            entry.lastRunningTargetCenter = targetCenters[index];
            entry.lastRunningBaseTranslationX = state.baseTranslationX;
            entry.lastRunningDeckTranslationX = state.deckTranslationX;
            entry.lastRunningActualTranslationX = runningTask.getTranslationX();
            entry.lastRunningRenderedCenter =
                    card.nativeCenter + runningTask.getTranslationX();
            entry.lastRunningWidth = runningTask.getWidth();
            return;
        }
    }

    private static void handleOverviewEnabled(Object owner, boolean enabled) {
        if (!(owner instanceof ViewGroup)) return;
        ViewGroup recents = (ViewGroup) owner;
        OverviewEntryState state = entryStateFor(recents);
        state.lifecycleKnown = true;

        if (enabled) {
            if (!state.overviewEnabled) beginOverviewEntry(recents, state);
        } else {
            state.overviewEnabled = false;
            state.entering = false;
            state.transitionComplete = false;
            state.stackBlend = 0.0f;
            state.blendStartedAt = 0L;
            clearStackContinuity(state);
            cancelVisualLayout(recents, state);
            restoreChildren(recents);
            hideMemoryOverlay();
        }
    }

    private static void handleStateTransition(
            Object owner, Object launcherState, boolean complete) {
        if (!(owner instanceof ViewGroup)) return;
        ViewGroup recents = (ViewGroup) owner;
        OverviewEntryState state = entryStateFor(recents);
        Boolean visible = readRecentsVisible(launcherState);
        if (visible != null) handleOverviewEnabled(owner, visible);
        if (!complete || Boolean.FALSE.equals(visible)) return;

        // On this OEM build LauncherState is obfuscated, so the optional
        // visibility reflection can return null.  setOverviewStateEnabled()
        // remains authoritative: a transition-complete callback for Home must
        // never manufacture a new overview entry after that callback disabled
        // Recents.
        if (!state.overviewEnabled) return;
        state.transitionComplete = true;
        scheduleEntryFrame(recents, state);
    }

    private static OverviewEntryState prepareOverviewEntry(ViewGroup recents) {
        OverviewEntryState state = entryStateFor(recents);
        if (state.lifecycleKnown) return state;

        float contentAlpha = readContentAlpha(recents);
        if (recents.isShown() && contentAlpha > 0.01f) {
            if (!state.overviewEnabled) beginOverviewEntry(recents, state);
        } else if (!state.stackEstablished) {
            // Before the first valid deck pose, an invisible RecentsView is a
            // genuine inactive state. After establishment, a one-frame alpha
            // or visibility dip is treated as transient and the last deck is
            // retained until an explicit overview-exit callback arrives.
            state.overviewEnabled = false;
            state.entering = false;
            state.stackBlend = 0.0f;
            state.blendStartedAt = 0L;
        }
        return state;
    }

    private static OverviewEntryState entryStateFor(ViewGroup recents) {
        synchronized (OVERVIEW_ENTRIES) {
            OverviewEntryState state = OVERVIEW_ENTRIES.get(recents);
            if (state == null) {
                state = new OverviewEntryState();
                OVERVIEW_ENTRIES.put(recents, state);
            }
            return state;
        }
    }

    private static void beginOverviewEntry(
            ViewGroup recents, OverviewEntryState state) {
        clearStackContinuity(state);
        state.overviewEnabled = true;
        state.entering = true;
        state.transitionComplete = false;
        state.entryStartedAt = SystemClock.uptimeMillis();
        state.blendStartedAt = 0L;
        state.stackBlend = 0.0f;
        restoreChildren(recents);
        hideMemoryOverlay();
        scheduleEntryFrame(recents, state);
    }

    private static float resolveStackBlend(
            ViewGroup recents,
            List<CardPosition> cards,
            OverviewEntryState state,
            float contentAlpha) {
        if (!state.entering) return 1.0f;

        long now = SystemClock.uptimeMillis();
        if (state.blendStartedAt == 0L) {
            boolean visuallyReady = contentAlpha >= ENTRY_READY_CONTENT_ALPHA
                    && isCurrentTaskVisuallyReady(recents, cards);
            boolean fallbackReady = now - state.entryStartedAt
                    >= ENTRY_READINESS_FALLBACK_MS;
            // setOverviewStateEnabled(true) arrives at gesture start on this
            // Quickstep build, often more than 900 ms before the user releases
            // their finger.  Starting from that timestamp lets the fallback
            // finish while the OEM transition is still running; Quickstep then
            // overwrites the final deck with its native row.  When lifecycle
            // callbacks are available, transition-complete is authoritative.
            boolean ready = RecentsStackMath.shouldStartEntryBlend(
                    state.lifecycleKnown,
                    state.transitionComplete,
                    visuallyReady,
                    fallbackReady);
            if (ready) {
                state.blendStartedAt = now;
            } else {
                scheduleEntryFrame(recents, state);
                return 0.0f;
            }
        }

        state.stackBlend = RecentsStackMath.entryBlend(
                now - state.blendStartedAt, ENTRY_BLEND_DURATION_MS);
        if (state.stackBlend >= 0.999f) {
            state.stackBlend = 1.0f;
            state.entering = false;
        } else {
            scheduleEntryFrame(recents, state);
        }
        return state.stackBlend;
    }

    private static boolean isCurrentTaskVisuallyReady(
            ViewGroup recents, List<CardPosition> cards) {
        Rect recentsRect = new Rect();
        if (!recents.getGlobalVisibleRect(recentsRect) || recentsRect.isEmpty()) {
            return false;
        }

        float viewportCenter = (recentsRect.left + recentsRect.right) / 2.0f;
        float minimumWidth = recentsRect.width() * ENTRY_READY_CARD_WIDTH_RATIO;
        float centerTolerance = recentsRect.width()
                * ENTRY_READY_CENTER_DISTANCE_RATIO;
        Rect cardRect = new Rect();
        for (CardPosition card : cards) {
            View child = card.view;
            if (child.getVisibility() != View.VISIBLE || child.getAlpha() < 0.65f) {
                continue;
            }
            cardRect.setEmpty();
            if (!child.getGlobalVisibleRect(cardRect) || cardRect.isEmpty()) continue;
            float cardCenter = (cardRect.left + cardRect.right) / 2.0f;
            if (cardRect.width() >= minimumWidth
                    && Math.abs(cardCenter - viewportCenter) <= centerTolerance) {
                return true;
            }
        }
        return false;
    }

    private static void scheduleEntryFrame(
            ViewGroup recents, OverviewEntryState state) {
        if (!state.overviewEnabled) return;
        requestVisualLayout(recents);
    }

    private static List<CardPosition> collectCards(ViewGroup recents, int scrollX) {
        ArrayList<CardPosition> cards = new ArrayList<>();
        for (int index = 0; index < recents.getChildCount(); index++) {
            View child = recents.getChildAt(index);
            if (!isTaskView(child)) continue;
            // Quickstep owns the outgoing card's vertical/alpha animation. It
            // must not participate in survivor slot calculation while exiting.
            if (isDismissing(child)) continue;
            float contentCenter = (child.getLeft() + child.getRight()) / 2.0f;
            cards.add(new CardPosition(child, contentCenter, contentCenter - scrollX));
        }
        Collections.sort(cards, CARD_POSITION_COMPARATOR);
        return cards;
    }

    private static float estimatePageInterval(
            List<CardPosition> cards, float[] scratch) {
        if (cards.size() < 2) return 0.0f;
        int count = 0;
        for (int index = 1; index < cards.size(); index++) {
            float interval = cards.get(index).contentCenter
                    - cards.get(index - 1).contentCenter;
            if (interval > 1.0f) scratch[count++] = interval;
        }
        if (count == 0) return 0.0f;
        Arrays.sort(scratch, 0, count);
        return scratch[count / 2];
    }

    private static float resolvePageInterval(
            ViewGroup recents, OverviewEntryState state, float measuredInterval) {
        float previousInterval = state.lastPageInterval;
        int currentWidth = recents.getWidth();
        if (previousInterval > 1.0f
                && state.lastViewportWidth > 0
                && currentWidth > 0
                && currentWidth != state.lastViewportWidth) {
            previousInterval *= currentWidth / (float) state.lastViewportWidth;
        }

        // A temporarily detached/rebound task can make the median interval
        // collapse or double for one layout pass. Preserve the last valid page
        // geometry instead of allowing the visual deck to explode.
        float resolved = RecentsStackMath.stablePageInterval(
                measuredInterval, previousInterval);

        if (resolved > 1.0f) {
            state.lastPageInterval = resolved;
            state.lastViewportWidth = currentWidth;
        }
        return resolved;
    }

    private static float estimateCardWidth(
            List<CardPosition> cards, float[] scratch) {
        int count = 0;
        for (CardPosition card : cards) {
            if (card.view.getWidth() <= 1) continue;
            AppliedState state = APPLIED.get(card.view);
            float baseScale = state == null ? card.view.getScaleX() : state.baseScaleX;
            scratch[count++] = card.view.getWidth() * Math.max(0.01f, baseScale);
        }
        if (count == 0) return 0.0f;
        Arrays.sort(scratch, 0, count);
        return scratch[count / 2];
    }

    private static void prepareAppliedStates(List<CardPosition> cards) {
        for (CardPosition card : cards) {
            AppliedState state = stateFor(card.view);
            absorbExternalTransforms(card.view, state);
        }
    }

    private static boolean holdEstablishedStack(
            ViewGroup recents,
            OverviewEntryState state,
            int cardCount,
            String diagnosticState) {
        if (!state.overviewEnabled || !state.stackEstablished) return false;

        holdLastStack(recents);
        if (state.transientHoldFrames++ < TRANSIENT_HOLD_FRAMES) {
            scheduleEntryFrame(recents, state);
        }
        writeDiagnostics(recents, cardCount, diagnosticState);
        return true;
    }

    private static void holdLastStack(ViewGroup recents) {
        for (int index = 0; index < recents.getChildCount(); index++) {
            View child = recents.getChildAt(index);
            if (isDismissing(child)) continue;
            AppliedState state = APPLIED.get(child);
            if (state == null) continue;

            // Native layout/rebind work may have replaced our transform before
            // this post-hook runs. Remember that new native base, then repaint
            // the last valid deck pose for this transient frame.
            if (!close(child.getTranslationX(), state.lastTranslationX)) {
                state.baseTranslationX = child.getTranslationX();
            }
            if (!close(child.getTranslationY(), state.lastTranslationY)) {
                state.baseTranslationY = child.getTranslationY();
            }
            if (!close(child.getTranslationZ(), state.lastTranslationZ)) {
                state.baseTranslationZ = child.getTranslationZ();
            }
            if (!closeScale(child.getScaleX(), state.lastScaleX)) {
                state.baseScaleX = child.getScaleX();
            }
            if (!closeScale(child.getScaleY(), state.lastScaleY)) {
                state.baseScaleY = child.getScaleY();
            }

            child.setTranslationX(state.lastTranslationX);
            child.setTranslationY(state.lastTranslationY);
            child.setTranslationZ(state.lastTranslationZ);
            child.setScaleX(state.lastScaleX);
            child.setScaleY(state.lastScaleY);
            holdHeaderState(child);
        }
    }

    private static void holdDismissingTaskPoses(ViewGroup recents) {
        for (int index = 0; index < recents.getChildCount(); index++) {
            View child = recents.getChildAt(index);
            if (!isDismissing(child)) continue;
            AppliedState state = APPLIED.get(child);
            if (state == null) continue;

            // Quickstep remains authoritative for the upward translation and
            // alpha of the outgoing task. Keep only the last horizontal/depth
            // deck pose so the card does not jump back to its native page
            // before leaving the screen.
            if (!close(child.getTranslationX(), state.lastTranslationX)) {
                state.baseTranslationX = child.getTranslationX();
            }
            if (!close(child.getTranslationZ(), state.lastTranslationZ)) {
                state.baseTranslationZ = child.getTranslationZ();
            }
            if (!closeScale(child.getScaleX(), state.lastScaleX)) {
                state.baseScaleX = child.getScaleX();
            }
            if (!closeScale(child.getScaleY(), state.lastScaleY)) {
                state.baseScaleY = child.getScaleY();
            }
            child.setTranslationX(state.lastTranslationX);
            child.setTranslationZ(state.lastTranslationZ);
            child.setScaleX(state.lastScaleX);
            child.setScaleY(state.lastScaleY);
            holdHeaderState(child);
        }
    }

    private static void clearStackContinuity(OverviewEntryState state) {
        state.stackEstablished = false;
        state.transientHoldFrames = 0;
        state.lastPageInterval = 0.0f;
        state.lastViewportWidth = 0;
        state.runningTaskEntryResolved = false;
        state.runningTaskEntry = false;
        state.runningTaskIndex = -1;
        state.screenshotSwitchScheduled = false;
        state.screenshotSwitchRequested = false;
        state.screenshotSwitchComplete = false;
        state.screenshotSwitchFailed = false;
    }

    private static void restoreChildren(ViewGroup recents) {
        for (int index = 0; index < recents.getChildCount(); index++) {
            View child = recents.getChildAt(index);
            AppliedState state = APPLIED.remove(child);
            if (state != null) {
                if (close(child.getTranslationX(), state.lastTranslationX)) {
                    child.setTranslationX(state.baseTranslationX);
                }
                if (close(child.getTranslationY(), state.lastTranslationY)) {
                    child.setTranslationY(state.baseTranslationY);
                }
                if (close(child.getTranslationZ(), state.lastTranslationZ)) {
                    child.setTranslationZ(state.baseTranslationZ);
                }
                if (closeScale(child.getScaleX(), state.lastScaleX)) {
                    child.setScaleX(state.baseScaleX);
                }
                if (closeScale(child.getScaleY(), state.lastScaleY)) {
                    child.setScaleY(state.baseScaleY);
                }
            }
            restoreHeaderClips(child);
        }
    }

    private static AppliedState stateFor(View child) {
        AppliedState state = APPLIED.get(child);
        if (state == null) {
            state = new AppliedState(
                    child.getTranslationX(), child.getTranslationY(),
                    child.getTranslationZ(), child.getScaleX(), child.getScaleY());
            APPLIED.put(child, state);
        }
        return state;
    }

    private static void absorbExternalTransforms(View child, AppliedState state) {
        if (!close(child.getTranslationX(), state.lastTranslationX)) {
            // Native animations may replace the previous value. Rebase the
            // next visual offset on that value rather than blocking the native
            // animation path.
            state.baseTranslationX = child.getTranslationX();
        }
        if (!close(child.getTranslationY(), state.lastTranslationY)) {
            state.baseTranslationY = child.getTranslationY();
        }
        if (!close(child.getTranslationZ(), state.lastTranslationZ)) {
            state.baseTranslationZ = child.getTranslationZ();
        }
        if (!closeScale(child.getScaleX(), state.lastScaleX)) {
            state.baseScaleX = child.getScaleX();
        }
        if (!closeScale(child.getScaleY(), state.lastScaleY)) {
            state.baseScaleY = child.getScaleY();
        }
    }

    private static void applyHeaderExposedClip(View task, int exposedWidth) {
        if (!(task instanceof ViewGroup) || exposedWidth >= task.getWidth()) {
            restoreHeaderClips(task);
            return;
        }

        View thumbnail = findTaskThumbnail(task);
        if (thumbnail == null) {
            restoreHeaderClips(task);
            return;
        }
        int thumbnailTop = descendantTop(task, thumbnail);
        clipHeaderTree(
                task,
                (ViewGroup) task,
                thumbnail,
                thumbnailTop,
                Math.max(0, exposedWidth),
                0,
                0);
    }

    private static void clipHeaderTree(
            View task,
            ViewGroup parent,
            View thumbnail,
            int thumbnailTop,
            int exposedWidth,
            int parentLeft,
            int parentTop) {
        int overlapAllowance = dp(task.getContext(), HEADER_THUMBNAIL_OVERLAP_DP);
        for (int index = 0; index < parent.getChildCount(); index++) {
            View child = parent.getChildAt(index);
            if (child == thumbnail) continue;

            int childLeft = parentLeft + child.getLeft()
                    + Math.round(child.getTranslationX());
            int childTop = parentTop + child.getTop()
                    + Math.round(child.getTranslationY());
            int childBottom = childTop + child.getHeight();
            boolean ownsThumbnail = child instanceof ViewGroup
                    && containsView((ViewGroup) child, thumbnail);

            if (ownsThumbnail) {
                clipHeaderTree(
                        task,
                        (ViewGroup) child,
                        thumbnail,
                        thumbnailTop,
                        exposedWidth,
                        childLeft,
                        childTop);
                continue;
            }

            boolean headerBranch = childTop < thumbnailTop
                    && childBottom <= thumbnailTop + overlapAllowance;
            if (headerBranch) {
                if (isNativeActionView(child)) {
                    boolean complete = childLeft >= 0
                            && childLeft + child.getWidth() <= exposedWidth;
                    // Keep OEM lock/split/menu controls untouched on an
                    // exposed card, but hide the complete branch when another
                    // card covers it. A clipped half-icon reads as a detached
                    // control floating above the deck.
                    if (child instanceof ImageView) {
                        applyIconVisibility((ImageView) child, complete);
                    } else {
                        applyViewClip(child, complete ? child.getWidth() : 0);
                    }
                    continue;
                }
                if (child instanceof TextView) {
                    applyViewClip(child, exposedWidth - childLeft);
                }
                updateHeaderTextVisibility(child, exposedWidth, childLeft);
                updateHeaderIconVisibility(child, exposedWidth, childLeft);
            } else if (child instanceof ViewGroup) {
                clipHeaderTree(
                        task,
                        (ViewGroup) child,
                        thumbnail,
                        thumbnailTop,
                        exposedWidth,
                        childLeft,
                        childTop);
            }
        }
    }

    private static View findTaskThumbnail(View root) {
        View cached = TASK_THUMBNAILS.get(root);
        if (cached != null && isDescendant(root, cached)) return cached;
        View found = findTaskThumbnailUncached(root);
        if (found != null) TASK_THUMBNAILS.put(root, found);
        else TASK_THUMBNAILS.remove(root);
        return found;
    }

    private static View findTaskThumbnailUncached(View root) {
        if (root.getClass().getName().contains("TaskThumbnail")) return root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            View found = findTaskThumbnailUncached(group.getChildAt(index));
            if (found != null) return found;
        }
        return null;
    }

    private static boolean isDescendant(View root, View candidate) {
        View current = candidate;
        while (current != null) {
            if (current == root) return true;
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return false;
    }

    private static void updateHeaderTextVisibility(
            View root, int exposedWidth, int rootLeft) {
        if (isNativeActionView(root)) return;
        if (root instanceof TextView) {
            TextView text = (TextView) root;
            if (text.length() > 0) {
                float measuredText = text.getPaint().measureText(text.getText().toString());
                float availableTextWidth = Math.max(
                        0, text.getWidth() - text.getTotalPaddingLeft()
                                - text.getTotalPaddingRight());
                float requiredTextWidth = Math.min(measuredText, availableTextWidth);
                float textLeft = rootLeft + text.getTotalPaddingLeft();
                float textRight = textLeft
                        + requiredTextWidth;
                int safety = dp(text.getContext(), HEADER_TEXT_SAFETY_DP);
                // A covered task title is binary: show the complete label or
                // hide it. Leaving a clipped fragment makes neighbouring app
                // names look like one broken title while the deck is moving.
                applyTextVisibility(
                        text,
                        textLeft >= 0.0f && textRight + safety <= exposedWidth);
            }
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            int childLeft = rootLeft + child.getLeft()
                    + Math.round(child.getTranslationX());
            updateHeaderTextVisibility(child, exposedWidth, childLeft);
        }
    }

    private static void updateHeaderIconVisibility(
            View root, int exposedWidth, int rootLeft) {
        if (isNativeActionView(root)) return;
        if (root instanceof ImageView && isAppIconView((ImageView) root)) {
            boolean complete = rootLeft >= 0
                    && rootLeft + root.getWidth() <= exposedWidth;
            applyIconVisibility((ImageView) root, complete);
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            int childLeft = rootLeft + child.getLeft()
                    + Math.round(child.getTranslationX());
            updateHeaderIconVisibility(child, exposedWidth, childLeft);
        }
    }

    private static boolean isAppIconView(ImageView view) {
        Boolean cached = APP_ICON_VIEWS.get(view);
        if (cached != null) return cached;
        String name = "";
        try {
            if (view.getId() != View.NO_ID) {
                name = view.getResources().getResourceEntryName(view.getId());
            }
        } catch (Throwable ignored) { }
        String description = String.valueOf(view.getContentDescription());
        String value = (name + " " + description).toLowerCase(Locale.ROOT);
        boolean result = !(value.contains("menu") || value.contains("more")
                || value.contains("lock") || value.contains("split")
                || value.contains("multi") || value.contains("window")
                || value.contains("action") || value.contains("close"));
        if (view.getId() != View.NO_ID) APP_ICON_VIEWS.put(view, result);
        return result;
    }

    private static boolean isNativeActionView(View view) {
        Boolean cached = NATIVE_ACTION_VIEWS.get(view);
        if (cached != null) return cached;
        String name = "";
        try {
            if (view.getId() != View.NO_ID) {
                name = view.getResources().getResourceEntryName(view.getId());
            }
        } catch (Throwable ignored) { }
        String description = String.valueOf(view.getContentDescription());
        String value = (name + " " + description).toLowerCase(Locale.ROOT);
        boolean result = value.contains("menu") || value.contains("more") || value.contains("lock")
                || value.contains("split") || value.contains("multi")
                || value.contains("window") || value.contains("action");
        if (view.getId() != View.NO_ID) NATIVE_ACTION_VIEWS.put(view, result);
        return result;
    }

    private static void hideNativeTaskActions(View root) {
        if (isNativeActionView(root)) {
            if (root instanceof ImageView) {
                applyIconVisibility((ImageView) root, false);
            } else {
                applyViewClip(root, 0);
            }
            return;
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            hideNativeTaskActions(group.getChildAt(index));
        }
    }

    private static void applyIconVisibility(ImageView view, boolean visible) {
        IconVisibilityState state = HEADER_ICON_VISIBILITY.get(view);
        if (state == null) {
            state = new IconVisibilityState(view.getVisibility());
            HEADER_ICON_VISIBILITY.put(view, state);
        } else if (view.getVisibility() != state.lastVisibility) {
            state.baseVisibility = view.getVisibility();
        }
        int desired = visible ? state.baseVisibility : View.INVISIBLE;
        view.setVisibility(desired);
        state.lastVisibility = desired;
    }

    private static void restoreHeaderIconVisibility(View root) {
        if (root instanceof ImageView) {
            IconVisibilityState state = HEADER_ICON_VISIBILITY.remove((ImageView) root);
            if (state != null && root.getVisibility() == state.lastVisibility) {
                root.setVisibility(state.baseVisibility);
            }
        }
    }

    private static void applyTextVisibility(TextView text, boolean visible) {
        TextAlphaState state = HEADER_TEXT_ALPHA.get(text);
        if (state == null) {
            state = new TextAlphaState(text.getAlpha());
            HEADER_TEXT_ALPHA.put(text, state);
        } else if (!closeAlpha(text.getAlpha(), state.lastAlpha)) {
            state.baseAlpha = text.getAlpha();
        }
        text.setAlpha(visible ? state.baseAlpha : 0.0f);
        state.lastAlpha = text.getAlpha();
    }

    private static boolean containsView(ViewGroup root, View target) {
        for (int index = 0; index < root.getChildCount(); index++) {
            View child = root.getChildAt(index);
            if (child == target) return true;
            if (child instanceof ViewGroup && containsView((ViewGroup) child, target)) {
                return true;
            }
        }
        return false;
    }

    private static int descendantTop(View ancestor, View descendant) {
        int top = 0;
        View current = descendant;
        while (current != ancestor) {
            top += current.getTop() + Math.round(current.getTranslationY());
            ViewParent parent = current.getParent();
            if (!(parent instanceof View)) break;
            current = (View) parent;
        }
        return top;
    }

    private static void applyViewClip(View view, int exposedRight) {
        ClipState state = HEADER_CLIPS.get(view);
        if (state == null) {
            state = new ClipState(view.getClipBounds());
            HEADER_CLIPS.put(view, state);
        } else if (!sameRect(view.getClipBounds(), state.lastClipBounds)) {
            // Preserve a native animation that replaced our previous clip.
            state.baseClipBounds = copyRect(view.getClipBounds());
        }

        int safeRight = Math.max(0, Math.min(view.getWidth(), exposedRight));
        Rect desired;
        if (state.baseClipBounds == null) {
            desired = safeRight >= view.getWidth()
                    ? null : new Rect(0, 0, safeRight, view.getHeight());
        } else {
            desired = new Rect(state.baseClipBounds);
            desired.right = Math.max(
                    desired.left, Math.min(desired.right, safeRight));
        }
        view.setClipBounds(desired);
        state.lastClipBounds = copyRect(desired);
    }

    private static void restoreHeaderClips(View root) {
        restoreHeaderIconVisibility(root);
        ClipState state = HEADER_CLIPS.remove(root);
        if (state != null && sameRect(root.getClipBounds(), state.lastClipBounds)) {
            root.setClipBounds(copyRect(state.baseClipBounds));
        }
        if (root instanceof TextView) {
            TextAlphaState textState = HEADER_TEXT_ALPHA.remove((TextView) root);
            if (textState != null
                    && closeAlpha(root.getAlpha(), textState.lastAlpha)) {
                root.setAlpha(textState.baseAlpha);
            }
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            restoreHeaderClips(group.getChildAt(index));
        }
    }

    private static void holdHeaderState(View root) {
        ClipState clipState = HEADER_CLIPS.get(root);
        if (clipState != null) {
            root.setClipBounds(copyRect(clipState.lastClipBounds));
        }
        if (root instanceof TextView) {
            TextAlphaState textState = HEADER_TEXT_ALPHA.get((TextView) root);
            if (textState != null) root.setAlpha(textState.lastAlpha);
        }
        if (root instanceof ImageView) {
            IconVisibilityState iconState =
                    HEADER_ICON_VISIBILITY.get((ImageView) root);
            if (iconState != null) root.setVisibility(iconState.lastVisibility);
        }
        if (!(root instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            holdHeaderState(group.getChildAt(index));
        }
    }

    private static synchronized void updateMemoryOverlay(
            ViewGroup recents, List<CardPosition> cards, float revealProgress) {
        if (!cachedMemoryEnabled) {
            removeMemoryOverlay();
            return;
        }
        if (cards.isEmpty() || revealProgress <= 0.001f) {
            hideMemoryOverlay();
            return;
        }
        Rect visibleArea = new Rect();
        if (!recents.isAttachedToWindow()
                || !recents.isShown()
                || !recents.getGlobalVisibleRect(visibleArea)
                || visibleArea.isEmpty()) {
            return;
        }

        MemoryOverlayState state = memoryOverlay;
        if (state == null) {
            state = new MemoryOverlayState(createMemoryLabel(recents.getContext()));
            memoryOverlay = state;
        }
        if (state.host != recents) {
            if (state.host != null) state.host.getOverlay().remove(state.label);
            recents.getOverlay().add(state.label);
            state.host = recents;
        }

        long now = SystemClock.uptimeMillis();
        if (now - state.lastRefresh >= MEMORY_REFRESH_MS || state.label.length() == 0) {
            state.lastRefresh = now;
            ActivityManager manager = (ActivityManager) recents.getContext()
                    .getSystemService(Context.ACTIVITY_SERVICE);
            if (manager != null) {
                ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
                manager.getMemoryInfo(info);
                String value = RecentsMemoryFormatter.format(info.availMem, info.totalMem);
                if (!value.isEmpty()) state.label.setText(value);
            }
        }

        if (state.label.length() == 0) {
            state.label.setVisibility(View.GONE);
            return;
        }
        state.label.setVisibility(View.VISIBLE);
        state.label.setAlpha(clamp(revealProgress, 0.0f, 1.0f));

        int horizontalMargin = dp(recents.getContext(), MEMORY_HORIZONTAL_MARGIN_DP);
        int maxWidth = Math.max(1, recents.getWidth() - horizontalMargin * 2);
        String currentText = state.label.getText().toString();
        boolean needsMeasure = state.measuredTextSp != cachedMemoryTextSp
                || state.measuredMaxWidth != maxWidth
                || !currentText.equals(state.measuredText);
        if (state.measuredTextSp != cachedMemoryTextSp) {
            state.label.setTextSize(TypedValue.COMPLEX_UNIT_SP, cachedMemoryTextSp);
        }
        if (needsMeasure) {
            state.label.measure(
                    View.MeasureSpec.makeMeasureSpec(maxWidth, View.MeasureSpec.AT_MOST),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            state.measuredText = currentText;
            state.measuredTextSp = cachedMemoryTextSp;
            state.measuredMaxWidth = maxWidth;
        }

        int bottomInset = 0;
        WindowInsets insets = recents.getRootWindowInsets();
        if (insets != null) bottomInset = insets.getSystemWindowInsetBottom();
        int cardBottom = 0;
        for (CardPosition card : cards) {
            cardBottom = Math.max(cardBottom, Math.round(
                    card.view.getBottom()
                            + card.view.getTranslationY()
                            - recents.getScrollY()));
        }
        int desiredTop = cardBottom > 0
                ? cardBottom + dp(recents.getContext(), cachedMemoryGapDp)
                : recents.getHeight() / 2;
        int latestTop = recents.getHeight()
                - bottomInset
                - dp(recents.getContext(), MEMORY_BOTTOM_RESERVE_DP)
                - state.label.getMeasuredHeight();
        int screenTop = Math.max(0, Math.min(desiredTop, latestTop));

        // ViewGroupOverlay is drawn inside RecentsView's scrolled canvas.
        // Offset by the native scroll values so the label stays screen-fixed.
        int left = recents.getScrollX()
                + (recents.getWidth() - state.label.getMeasuredWidth()) / 2;
        int top = recents.getScrollY() + screenTop;
        int right = left + state.label.getMeasuredWidth();
        int bottom = top + state.label.getMeasuredHeight();
        if (state.label.getLeft() != left || state.label.getTop() != top
                || state.label.getRight() != right || state.label.getBottom() != bottom) {
            state.label.layout(left, top, right, bottom);
        }
    }

    private static TextView createMemoryLabel(Context context) {
        TextView label = new TextView(context);
        label.setTextColor(Color.WHITE);
        label.setTextSize(
                TypedValue.COMPLEX_UNIT_SP,
                RecentsRecommendedConfig.MEMORY_TEXT_SP);
        label.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        label.setGravity(Gravity.CENTER);
        label.setSingleLine(true);
        label.setClickable(false);
        label.setFocusable(false);
        label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        label.setPadding(dp(context, 12), dp(context, 5),
                dp(context, 12), dp(context, 5));
        label.setShadowLayer(dp(context, 1), 0.0f, dp(context, 1), 0x99000000);

        GradientDrawable background = new GradientDrawable();
        background.setColor(0x66000000);
        background.setCornerRadius(dp(context, 14));
        label.setBackground(background);
        return label;
    }

    private static synchronized void removeMemoryOverlay() {
        MemoryOverlayState state = memoryOverlay;
        memoryOverlay = null;
        if (state != null && state.host != null) {
            state.host.getOverlay().remove(state.label);
        }
    }

    private static synchronized void hideMemoryOverlay() {
        MemoryOverlayState state = memoryOverlay;
        if (state == null) return;
        state.label.setAlpha(0.0f);
        state.label.setVisibility(View.GONE);
    }

    private static synchronized void logLayoutFailure(
            AugmentModule module, Class<?> owner, Throwable error) {
        long now = SystemClock.uptimeMillis();
        if (now - lastLayoutErrorLog < ERROR_LOG_REFRESH_MS) return;
        lastLayoutErrorLog = now;
        module.logRecentsError("LAYOUT_FAILED " + owner.getName(), error);
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static ViewGroup resolveRecentsView(Object owner) {
        if (!(owner instanceof View)) return null;
        View view = (View) owner;
        if (view instanceof ViewGroup && isRecentsView(view)) {
            return (ViewGroup) view;
        }
        return findRecentsParent(view);
    }

    private static ViewGroup findRecentsParent(View view) {
        View current = view;
        while (current != null) {
            if (current instanceof ViewGroup && isRecentsView(current)) {
                return (ViewGroup) current;
            }
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    private static boolean isRecentsView(View view) {
        for (Class<?> current = view.getClass(); current != null;
                current = current.getSuperclass()) {
            String name = current.getName();
            if (RECENTS_VIEW_CLASS.equals(name)
                    || LAUNCHER_RECENTS_VIEW_CLASS.equals(name)
                    || name.endsWith("RecentsView")) return true;
        }
        return false;
    }

    private static boolean isTaskView(View child) {
        return child.getClass().getName().contains("TaskView");
    }

    private static Config readConfig(Context context) {
        long now = System.currentTimeMillis();
        if (now - lastConfigRead < CONFIG_REFRESH_MS) {
            return new Config(cachedEnabled, cachedCompression, cachedFrontOverlapRatio);
        }
        lastConfigRead = now;

        boolean enabled = FeatureSettings.enabled(context, ENABLED_KEY, false);
        float compression = FeatureSettings.decimal(
                context, COMPRESSION_KEY, DEFAULT_COMPRESSION, MIN_COMPRESSION, MAX_COMPRESSION);
        float frontOverlapRatio = FeatureSettings.decimal(
                context, FRONT_OVERLAP_KEY,
                RecentsRecommendedConfig.FRONT_OVERLAP, 0.20f, 0.60f);
        cachedMemoryEnabled = FeatureSettings.enabled(context, MEMORY_ENABLED_KEY, false);
        cachedMemoryTextSp = Math.round(clamp(
                FeatureSettings.decimal(
                        context,
                        MEMORY_TEXT_SP_KEY,
                        RecentsRecommendedConfig.MEMORY_TEXT_SP,
                        10.0f,
                        20.0f),
                10.0f, 20.0f));
        cachedMemoryGapDp = Math.round(clamp(
                FeatureSettings.decimal(context, MEMORY_GAP_DP_KEY, MEMORY_CARD_GAP_DP, 0.0f, 32.0f),
                0.0f, 32.0f));
        cachedEnabled = enabled;
        cachedCompression = clamp(compression, MIN_COMPRESSION, MAX_COMPRESSION);
        cachedFrontOverlapRatio = clamp(frontOverlapRatio, 0.20f, 0.60f);
        return new Config(cachedEnabled, cachedCompression, cachedFrontOverlapRatio);
    }

    private static void writeDiagnostics(ViewGroup recents, int cards, String state) {
        long now = System.currentTimeMillis();
        if (state.equals(lastDiagnosticState)
                && now - lastDiagnostic < DIAGNOSTIC_REFRESH_MS) return;
        lastDiagnostic = now;
        lastDiagnosticState = state;
        try {
            OverviewEntryState entry = entryStateFor(recents);
            ContentResolver resolver = recents.getContext().getContentResolver();
            writeDiagnostic(resolver, ACTIVE_KEY, "1");
            writeDiagnostic(resolver, INSTALLED_KEY, "1");
            writeDiagnostic(resolver, LAST_LAYOUT_KEY,
                    "state=" + state + ";cards=" + cards
                            + ";compression=" + cachedCompression
                            + ";view="
                            + Integer.toHexString(System.identityHashCode(recents))
                            + ";overview=" + entry.overviewEnabled
                            + ";entering=" + entry.entering
                            + ";requested=" + entry.layoutRequested
                            + ";predraw=" + (entry.preDrawListener != null)
                            + ";taskCompose=" + taskCompositionHooksInstalled
                            + ";entrySource=" + (entry.runningTaskEntryResolved
                                    ? (entry.runningTaskEntry ? "app" : "home")
                                    : "pending")
                            + ";runningIndex=" + entry.runningTaskIndex
                            + ";nativePage=" + entry.lastNativePagePosition
                            + ";visualPage=" + entry.lastVisualPagePosition
                            + ";viewport=" + entry.lastViewportCenterInContent
                            + ";centers=" + entry.lastFirstCardCenter
                            + "," + entry.lastFinalCardCenter
                            + ";targets=" + entry.lastFirstTargetCenter
                            + "," + entry.lastFinalTargetCenter
                            + ";runningPose=" + entry.lastRunningSortedIndex
                            + "," + entry.lastRunningNativeCenter
                            + "," + entry.lastRunningTargetCenter
                            + "," + entry.lastRunningBaseTranslationX
                            + "," + entry.lastRunningDeckTranslationX
                            + "," + entry.lastRunningActualTranslationX
                            + "," + entry.lastRunningRenderedCenter
                            + "," + entry.lastRunningWidth
                            + ";runningVisual=" + runningVisualState(entry)
                            + ";ts=" + now);
            writeDiagnostic(resolver, LAST_ERROR_KEY, "");
        } catch (Throwable ignored) {
            // Diagnostics must never affect Launcher rendering.
        }
    }

    private static void writeDiagnostic(ContentResolver resolver, String key, String value) {
        try {
            Bundle extras = new Bundle();
            extras.putString("value", value);
            Bundle result = resolver.call(Uri.parse("content://ls.augment.com.config"),
                    "diagnostic", key, extras);
            if (result != null && result.getBoolean("ok", false)) return;
        } catch (Throwable ignored) { }
        try { Settings.Global.putString(resolver, key, value); } catch (Throwable ignored) { }
    }

    private static Method findMethod(
            Class<?> type, String name, Class<?> returnType, Class<?>... parameters) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (!name.equals(method.getName()) || method.getReturnType() != returnType) {
                    continue;
                }
                Class<?>[] actual = method.getParameterTypes();
                if (actual.length != parameters.length) continue;
                boolean matches = true;
                for (int index = 0; index < actual.length; index++) {
                    if (actual[index] != parameters[index]) {
                        matches = false;
                        break;
                    }
                }
                if (matches) return method;
            }
        }
        return null;
    }

    private static Method findSingleArgumentMethod(
            Class<?> type, String name, Class<?> returnType) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            Method[] methods;
            try {
                methods = current.getDeclaredMethods();
            } catch (Throwable ignored) {
                continue;
            }
            for (Method method : methods) {
                if (name.equals(method.getName())
                        && method.getReturnType() == returnType
                        && method.getParameterTypes().length == 1) {
                    return method;
                }
            }
        }
        return null;
    }

    private static float readContentAlpha(ViewGroup recents) {
        try {
            Method getter = contentAlphaGetter(recents.getClass());
            if (getter != null) {
                Object value = getter.invoke(recents);
                if (value instanceof Number) {
                    return clamp(((Number) value).floatValue(), 0.0f, 1.0f);
                }
            }
        } catch (Throwable ignored) {
            // Fall back to the public View alpha on OEM variants.
        }
        return clamp(recents.getAlpha(), 0.0f, 1.0f);
    }

    private static Method contentAlphaGetter(Class<?> type) {
        synchronized (CONTENT_ALPHA_GETTERS) {
            Method cached = CONTENT_ALPHA_GETTERS.get(type);
            if (cached != null) return cached;
            if (MISSING_CONTENT_ALPHA_GETTERS.contains(type)) return null;
            Method getter = findMethod(type, "getContentAlpha", float.class);
            if (getter == null) {
                MISSING_CONTENT_ALPHA_GETTERS.add(type);
                return null;
            }
            try {
                getter.setAccessible(true);
            } catch (Throwable ignored) {
                MISSING_CONTENT_ALPHA_GETTERS.add(type);
                return null;
            }
            CONTENT_ALPHA_GETTERS.put(type, getter);
            return getter;
        }
    }

    private static void resolveEntrySource(
            ViewGroup recents, OverviewEntryState state) {
        if (state.runningTaskEntryResolved) return;
        Integer runningIndex = readRunningTaskIndex(recents);
        if (runningIndex != null && runningIndex >= 0) {
            state.runningTaskEntry = true;
            state.runningTaskEntryResolved = true;
            state.runningTaskIndex = runningIndex;
            return;
        }
        if (state.transitionComplete || !state.entering) {
            state.runningTaskEntry = false;
            state.runningTaskEntryResolved = true;
            state.runningTaskIndex = runningIndex == null ? -1 : runningIndex;
        }
    }

    private static Integer readRunningTaskIndex(ViewGroup recents) {
        try {
            Method getter = runningTaskIndexGetter(recents.getClass());
            if (getter == null) return null;
            Object value = getter.invoke(recents);
            return value instanceof Number ? ((Number) value).intValue() : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method runningTaskIndexGetter(Class<?> type) {
        synchronized (RUNNING_TASK_INDEX_GETTERS) {
            Method cached = RUNNING_TASK_INDEX_GETTERS.get(type);
            if (cached != null) return cached;
            if (MISSING_RUNNING_TASK_INDEX_GETTERS.contains(type)) return null;
            try {
                Method getter = type.getMethod("getRunningTaskIndex");
                getter.setAccessible(true);
                RUNNING_TASK_INDEX_GETTERS.put(type, getter);
                return getter;
            } catch (Throwable ignored) {
                MISSING_RUNNING_TASK_INDEX_GETTERS.add(type);
                return null;
            }
        }
    }

    /**
     * Quickstep draws the running task in a separate live Surface that does
     * not inherit TaskView translations. Once the app-originated entry has
     * settled, use Quickstep's own screenshot hand-off so the current task and
     * the normal cards share one visual coordinate system.
     */
    private static void scheduleRunningTaskScreenshot(
            ViewGroup recents, OverviewEntryState state) {
        if (!state.runningTaskEntry
                || state.screenshotSwitchScheduled
                || state.screenshotSwitchRequested
                || state.screenshotSwitchComplete
                || state.screenshotSwitchFailed) return;
        state.screenshotSwitchScheduled = true;
        recents.post(new Runnable() {
            @Override public void run() {
                state.screenshotSwitchScheduled = false;
                if (!recents.isAttachedToWindow()
                        || !state.overviewEnabled
                        || !state.runningTaskEntry) return;
                Method method = switchToScreenshotMethod(recents.getClass());
                if (method == null) {
                    state.screenshotSwitchFailed = true;
                    requestVisualLayout(recents);
                    return;
                }
                state.screenshotSwitchRequested = true;
                try {
                    method.invoke(recents, new Runnable() {
                        @Override public void run() {
                            state.screenshotSwitchComplete = true;
                            requestVisualLayout(recents);
                        }
                    });
                } catch (Throwable error) {
                    state.screenshotSwitchRequested = false;
                    state.screenshotSwitchFailed = true;
                    reportSafeLayoutFailure(recents, error);
                    requestVisualLayout(recents);
                }
            }
        });
    }

    private static Method switchToScreenshotMethod(Class<?> type) {
        synchronized (SWITCH_TO_SCREENSHOT_METHODS) {
            Method cached = SWITCH_TO_SCREENSHOT_METHODS.get(type);
            if (cached != null) return cached;
            if (MISSING_SWITCH_TO_SCREENSHOT_METHODS.contains(type)) return null;
            try {
                Method method = type.getMethod("switchToScreenshot", Runnable.class);
                method.setAccessible(true);
                SWITCH_TO_SCREENSHOT_METHODS.put(type, method);
                return method;
            } catch (Throwable ignored) {
                MISSING_SWITCH_TO_SCREENSHOT_METHODS.add(type);
                return null;
            }
        }
    }

    private static String runningVisualState(OverviewEntryState state) {
        if (!state.runningTaskEntry) return "none";
        if (state.screenshotSwitchFailed) return "failed";
        if (state.screenshotSwitchComplete) return "screenshot";
        if (state.screenshotSwitchRequested) return "switching";
        if (state.screenshotSwitchScheduled) return "scheduled";
        return "live";
    }

    private static Boolean readRecentsVisible(Object launcherState) {
        if (launcherState == null) return null;
        for (Class<?> current = launcherState.getClass();
                current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField("isRecentsViewVisible");
                field.setAccessible(true);
                Object value = field.get(launcherState);
                if (value instanceof Boolean) return (Boolean) value;
            } catch (Throwable ignored) {
                // Continue through OEM/base state classes.
            }
        }
        return null;
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    private static boolean close(float left, float right) {
        return Math.abs(left - right) <= EPSILON;
    }

    private static boolean closeScale(float left, float right) {
        return Math.abs(left - right) <= 0.002f;
    }

    private static boolean closeAlpha(float left, float right) {
        return Math.abs(left - right) <= 0.01f;
    }

    private static Rect copyRect(Rect value) {
        return value == null ? null : new Rect(value);
    }

    private static boolean sameRect(Rect left, Rect right) {
        if (left == right) return true;
        return left != null && left.equals(right);
    }

    private static String safeMessage(Throwable error) {
        String message = error == null ? "" : error.getMessage();
        return message == null ? error.getClass().getName()
                : message.replace('\n', ' ').replace('\r', ' ');
    }

    private static final class Config {
        final boolean enabled;
        final float compression;
        final float frontOverlapRatio;

        Config(boolean enabled, float compression, float frontOverlapRatio) {
            this.enabled = enabled;
            this.compression = compression;
            this.frontOverlapRatio = frontOverlapRatio;
        }
    }

    private static final class CardPosition {
        final View view;
        final float contentCenter;
        final float nativeCenter;

        CardPosition(View view, float contentCenter, float nativeCenter) {
            this.view = view;
            this.contentCenter = contentCenter;
            this.nativeCenter = nativeCenter;
        }
    }

    private static final class AppliedState {
        float baseTranslationX;
        float baseTranslationY;
        float baseTranslationZ;
        float baseScaleX;
        float baseScaleY;
        float deckTranslationX;
        float deckTranslationY;
        float deckScaleX = 1.0f;
        float deckScaleY = 1.0f;
        float lastTranslationX;
        float lastTranslationY;
        float lastTranslationZ;
        float lastScaleX;
        float lastScaleY;
        int exposedHeaderWidth = -1;
        boolean deckActive;

        AppliedState(
                float baseTranslationX, float baseTranslationY,
                float baseTranslationZ, float baseScaleX, float baseScaleY) {
            this.baseTranslationX = baseTranslationX;
            this.baseTranslationY = baseTranslationY;
            this.baseTranslationZ = baseTranslationZ;
            this.baseScaleX = baseScaleX;
            this.baseScaleY = baseScaleY;
            this.lastTranslationX = baseTranslationX;
            this.lastTranslationY = baseTranslationY;
            this.lastTranslationZ = baseTranslationZ;
            this.lastScaleX = baseScaleX;
            this.lastScaleY = baseScaleY;
        }
    }

    private static final class OverviewEntryState {
        boolean lifecycleKnown;
        boolean overviewEnabled;
        boolean entering;
        boolean transitionComplete;
        boolean layoutRequested;
        boolean disabledRestored;
        boolean stackEstablished;
        boolean runningTaskEntryResolved;
        boolean runningTaskEntry;
        boolean screenshotSwitchScheduled;
        boolean screenshotSwitchRequested;
        boolean screenshotSwitchComplete;
        boolean screenshotSwitchFailed;
        ViewTreeObserver preDrawObserver;
        ViewTreeObserver.OnPreDrawListener preDrawListener;
        View.OnAttachStateChangeListener attachListener;
        long entryStartedAt;
        long blendStartedAt;
        float stackBlend;
        float lastPageInterval;
        float lastNativePagePosition;
        float lastVisualPagePosition;
        float lastViewportCenterInContent;
        float lastFirstCardCenter;
        float lastFinalCardCenter;
        float lastFirstTargetCenter;
        float lastFinalTargetCenter;
        int lastRunningSortedIndex = -1;
        float lastRunningNativeCenter = Float.NaN;
        float lastRunningTargetCenter = Float.NaN;
        float lastRunningBaseTranslationX = Float.NaN;
        float lastRunningDeckTranslationX = Float.NaN;
        float lastRunningActualTranslationX = Float.NaN;
        float lastRunningRenderedCenter = Float.NaN;
        int lastRunningWidth;
        int lastViewportWidth;
        int transientHoldFrames;
        int runningTaskIndex = -1;
        float[] cardCenters = new float[0];
        float[] targetCenters = new float[0];
        float[] renderedLefts = new float[0];
        float[] renderedRights = new float[0];
        float[] scratch = new float[0];

        void ensureCardCapacity(int count) {
            if (cardCenters.length >= count) return;
            cardCenters = new float[count];
            targetCenters = new float[count];
            renderedLefts = new float[count];
            renderedRights = new float[count];
            scratch = new float[count];
        }
    }

    private static final class MemoryOverlayState {
        final TextView label;
        ViewGroup host;
        long lastRefresh;
        String measuredText = "";
        int measuredTextSp = -1;
        int measuredMaxWidth = -1;

        MemoryOverlayState(TextView label) {
            this.label = label;
        }
    }

    private static final class ClipState {
        Rect baseClipBounds;
        Rect lastClipBounds;

        ClipState(Rect baseClipBounds) {
            this.baseClipBounds = copyRect(baseClipBounds);
            this.lastClipBounds = copyRect(baseClipBounds);
        }
    }

    private static final class TextAlphaState {
        float baseAlpha;
        float lastAlpha;

        TextAlphaState(float baseAlpha) {
            this.baseAlpha = baseAlpha;
            this.lastAlpha = baseAlpha;
        }
    }

    private static final class IconVisibilityState {
        int baseVisibility;
        int lastVisibility;

        IconVisibilityState(int visibility) {
            baseVisibility = visibility;
            lastVisibility = visibility;
        }
    }
}
