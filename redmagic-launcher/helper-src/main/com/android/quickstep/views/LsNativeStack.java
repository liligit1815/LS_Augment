package com.android.quickstep.views;

import android.app.ActivityManager;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.Layout;
import android.util.Log;
import android.view.MotionEvent;
import android.view.animation.PathInterpolator;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.OverScroller;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import com.android.launcher3.views.BaseDragLayer;
import com.android.quickstep.orientation.RecentsPagedOrientationHandler;

/**
 * Composes a Xiaomi-like deck transform over the OEM RecentsView pager.
 * The pager remains authoritative for horizontal drag/fling/snap and TaskView's
 * native dismiss fields remain authoritative for upward dismissal.
 */
public final class LsNativeStack {
    private static final String TAG = "LsNativeStack";

    /*
     * HyperOS 3 / MiuiHome 6.01 TaskStackViewsAlgorithmStack constants.
     * Keep these together: the exponential offset, scale curve and clipping
     * have to use the same depth or the deck drifts to one side while paging.
     */
    private static final float MIUI_BASE_TASK_SCALE = 0.70f;
    private static final float MIUI_DEPTH_STEP = 0.125f;
    private static final float MIUI_DEPTH_SCALE_GAIN = 0.20f;
    private static final float MIUI_EXP_RATE = 8.0f;
    private static final float MIUI_BASE_OFFSET_FRACTION = -0.087064676f;
    private static final float MIUI_INTERIOR_SCROLL_CORRECTION = 0.15f;
    private static final float MIUI_FOCUS_DEPTH = -0.17992779f;
    private static final float MIUI_ALPHA_START = 0.40f;
    private static final float MIUI_ALPHA_RATE = 4.0f;
    private static final float MIUI_TITLE_START = 0.20f;
    private static final float MIUI_TITLE_RATE = 12.0f;
    /* Entry is identity-bound, not time-bound.  NX809J may rebind/reorder the
     * same TaskViews late in its Overview animation, so a delayed second page
     * commit inevitably produces a visible snap on high-refresh displays. */

    private static final int RES_FOCUS_CENTER = 0x7f0c0109;
    private static final int RES_FIRST_BACK_CENTER = 0x7f0c010a;
    private static final int RES_TAIL_GAP = 0x7f0c010b;
    private static final int RES_TAIL_DECAY = 0x7f0c010c;
    private static final int RES_FOCUS_SCALE = 0x7f0c0104;
    private static final int RES_SCALE_STEP = 0x7f0c0105;
    private static final int RES_MAX_DEPTH = 0x7f0c0106;
    private static final int RES_INCOMING_DISTANCE = 0x7f0c010d;
    private static final int RES_INCOMING_SCALE_GAIN = 0x7f0c010e;
    private static final int RES_MIN_BACK_SCALE = 0x7f0c010f;
    private static final int RES_NATIVE_CENTER_CORRECTION = 0x7f0c0110;

    private static final int RES_MEMORY_CONTAINER = 0x7f0b06c6;
    private static final int RES_MEMORY_AVAILABLE = 0x7f0b06c7;
    private static final int RES_MEMORY_TOTAL = 0x7f0b06c9;
    private static final int RES_EMPTY_MESSAGE = 0x7f0b06ca;
    private static final int RES_CLEAR_ALL_CONTAINER = 0x7f0b04d7;
    private static final int RES_CLEAR_ALL_BUTTON = 0x7f0b04d6;
    private static final int RES_MEMORY_AVAILABLE_FORMAT = 0x7f1404b8;
    private static final int RES_MEMORY_TOTAL_FORMAT = 0x7f1404b9;
    private static final int RES_RECENT_STYLE_KEY = 0x7f1403b7;
    private static final String PREF_SHOW_MEMORY = "ls_recents_stack_show_memory";
    private static final int NATIVE_STACK_STYLE = 3;

    private static int cachedDensityDpi = -1;
    private static final TaskView[] EMPTY_ENTRY_TASK_VIEWS = new TaskView[0];
    private static final int[] EMPTY_ENTRY_TASK_IDS = new int[0];
    private static float focusCenterFraction;
    private static float firstBackCenterFraction;
    private static float tailGapFraction;
    private static float tailDecay;
    private static float focusScale;
    private static float scaleStep;
    private static int maxDepth;
    private static float incomingDistanceFraction;
    private static float incomingScaleGain;
    private static float minBackScale;
    private static float nativeCenterCorrectionFraction;
    private static long lastMemoryUpdateMs;
    private static WeakReference<RecentsView> decorationRecents =
            new WeakReference<>(null);
    private static int lastDecorationTaskCount = Integer.MIN_VALUE;
    private static int lastDecorationWidth = -1;
    private static int lastDecorationHeight = -1;
    private static boolean lastDecorationShowMemory = true;
    private static WeakReference<View> translatedClearAllHost =
            new WeakReference<>(null);
    private static float clearAllHostBaseTranslationY;
    private static long lastErrorLogMs;
    private static WeakReference<RecentsView> entryAnchorRecents =
            new WeakReference<>(null);
    private static int entryAnchorPage = -1;
    private static int entryAnchorTaskId = -1;
    private static WeakReference<TaskView> entryAnchorTask =
            new WeakReference<>(null);
    private static WeakReference<RecentsView> entryOrderRecents =
            new WeakReference<>(null);
    private static TaskView[] entryTaskOrderViews = EMPTY_ENTRY_TASK_VIEWS;
    private static int[] entryTaskOrderIds = EMPTY_ENTRY_TASK_IDS;
    private static int entryTaskOrderSize;
    private static boolean entryFromApp;
    private static WeakReference<RecentsView> overviewPendingRecents =
            new WeakReference<>(null);
    private static boolean overviewEntryPending;
    private static int overviewEntryGeneration;
    private static boolean liveSimulatorOverviewTarget;
    private static float liveEntryPageProgress;
    private static float lastLiveAppliedScale = Float.NaN;
    private static float liveEntryStartScale = Float.NaN;
    private static WeakReference<RecentsView> activeOverviewRecents =
            new WeakReference<>(null);
    private static boolean overviewActive;
    private static int entryStabilizerGeneration;
    private static WeakReference<RecentsView> entryRevealRecents =
            new WeakReference<>(null);
    private static float entryRevealProgress = 1.0f;
    private static ValueAnimator entryRevealAnimator;
    private static WeakReference<TaskView> gestureLayerTask =
            new WeakReference<>(null);
    private static int gestureLayerGeneration;
    private static WeakReference<RecentsView> pagerAuditRecents =
            new WeakReference<>(null);
    private static int lastAuditedPage = Integer.MIN_VALUE;
    private static WeakReference<RecentsView> frameUpdateRecents =
            new WeakReference<>(null);
    private static boolean frameUpdateScheduled;
    /*
     * PagedView changes its physical scroll and several OEM TaskView fields in
     * the same UI turn.  Rebuilding the deck directly from onScrollChanged()
     * samples an intermediate mixture of those values, which can be submitted
     * as a one-frame standard-page/half-card flash.  Coalesce scroll callbacks
     * and consume the final values immediately before RecentsView draws.
     * Keep the WeakReference across frames so the hot scroll path allocates
     * nothing.
     */
    private static WeakReference<RecentsView> drawUpdateRecents =
            new WeakReference<>(null);
    private static boolean drawUpdatePending;
    private static WeakReference<RecentsView> pendingDismissRecents =
            new WeakReference<>(null);
    private static WeakReference<TaskView> pendingDismissTask =
            new WeakReference<>(null);
    private static int pendingDismissOrdinal = -1;
    /*
     * The dismissed card and the viewport focus are not necessarily the same
     * card: Xiaomi lets the user swipe an exposed back/upper layer directly.
     * RedMagic starts moving its logical page before that TaskView has finished
     * leaving, so preserve the pre-gesture viewport ordinal independently from
     * pendingDismissOrdinal.  Mixing these values recenters the whole deck on
     * a non-focused dismissed card and is the remaining random-looking reflow.
     */
    private static float pendingDismissPagePosition = Float.NaN;
    private static WeakReference<RecentsView> memoryRefreshRecents =
            new WeakReference<>(null);
    private static boolean memoryRefreshScheduled;
    private static final Rect TEMP_DESCENDANT_BOUNDS = new Rect();
    private static final Rect TEMP_HIT_BOUNDS = new Rect();
    private static final RectF TEMP_LIVE_SURFACE_BOUNDS = new RectF();
    private static final int[] TEMP_VIEW_LOCATION = new int[2];
    private static final int[] TEMP_ROOT_LOCATION = new int[2];

    private LsNativeStack() {
    }

    /**
     * TaskViewSimulator is created before RecentsView becomes visible, so it
     * cannot ask that view whether the Xiaomi stack is active.  Read the same
     * launcher preference that populates DeviceProfile.taskViewLayoutStyle;
     * once Overview exists, prefer its already-resolved value.
     */
    private static boolean usesNativeStackStyle(Context context) {
        RecentsView active = activeOverviewRecents.get();
        if (active != null) {
            return active.isNativeStackStyle();
        }
        if (context == null) {
            return false;
        }
        try {
            Class<?> launcherPrefs = Class.forName("com.android.launcher3.J3");
            java.lang.reflect.Method getter = launcherPrefs.getDeclaredMethod(
                    "m", Context.class);
            Object value = getter.invoke(null, context);
            if (!(value instanceof SharedPreferences)) {
                return false;
            }
            String key = context.getString(RES_RECENT_STYLE_KEY);
            return ((SharedPreferences) value).getInt(key, 0) == NATIVE_STACK_STYLE;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** User-facing memory visibility is independent from the selected Recents style. */
    private static boolean isMemoryInfoEnabled(Context context) {
        if (context == null) {
            return true;
        }
        try {
            Class<?> launcherPrefs = Class.forName("com.android.launcher3.J3");
            java.lang.reflect.Method getter = launcherPrefs.getDeclaredMethod(
                    "m", Context.class);
            Object value = getter.invoke(null, context);
            if (!(value instanceof SharedPreferences)) {
                return true;
            }
            return ((SharedPreferences) value).getBoolean(PREF_SHOW_MEMORY, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    /**
     * The live app leash and the final TaskView must converge on the same
     * scale.  RedMagic's simulator normally ends at 1.0 while the Xiaomi front
     * card is 1.10, producing the exact 742 -> 824 px shrink/grow jump seen in
     * test7.mp4.  Supplying the deck scale as the animator endpoint makes the
     * whole fullscreen-to-card motion monotonic.  The same endpoint is also
     * used as the start of a card-to-app launch.
     */
    public static float getLiveRecentsScale(Context context, float nativeScale) {
        if (!usesNativeStackStyle(context)) {
            return nativeScale;
        }
        loadConfig(context.getResources());
        return nativeScale * focusScale;
    }

    /**
     * On NX809J the non-carousel feature branch leaves AnimatedFloat
     * carouselScale at its Java default of 0, even though apply() always
     * multiplies the live leash matrix by that value.  The app therefore
     * collapses almost to zero before TaskView replaces it.  Style 3 uses the
     * normal task rectangle and must have an identity carousel multiplier.
     */
    public static float getLiveCarouselScale(Context context, float nativeScale) {
        return usesNativeStackStyle(context) ? 1.0f : nativeScale;
    }

    /**
     * RedMagic marks the phone simulator as a grid task before the live app
     * leash is animated into Overview.  The real TaskView used by style 3 is
     * based on the normal carousel task rectangle, so the live leash first
     * collapses to the much narrower grid rectangle and then jumps to the
     * normal Xiaomi stack rectangle when it is replaced by TaskView.  Keep the
     * simulator on the normal task rectangle for this style; other recents
     * styles retain the OEM grid decision.
     */
    public static boolean normalizeLiveGridTask(Context context,
            boolean nativeGridTask) {
        return usesNativeStackStyle(context) ? false : nativeGridTask;
    }

    /**
     * The target is known before Launcher state and RecentsView's entry token
     * are committed.  Remember that narrow interval so the live leash cannot
     * consume the pager position left by the previous Overview session.
     */
    public static void setLiveOverviewTarget(Context context, boolean targetRecents) {
        liveSimulatorOverviewTarget = targetRecents && usesNativeStackStyle(context);
        liveEntryPageProgress = 0.0f;
        liveEntryStartScale = lastLiveAppliedScale;
    }

    /** Sample the existing gesture animator: no second animator or delayed snap. */
    public static void onLiveOverviewFrame(ValueAnimator animator) {
        if (!liveSimulatorOverviewTarget || animator == null) return;
        liveEntryPageProgress = clamp(animator.getAnimatedFraction());
    }

    public static long normalizeLiveOverviewDuration(RecentsView recents, long duration) {
        // A held gesture can already be at shift=1; OEM then uses a zero-length
        // settle. The newly selected second page still has one page to travel.
        if (!liveSimulatorOverviewTarget || recents == null) return duration;
        entryFromApp = true;
        activeOverviewRecents = new WeakReference<>(recents);
        return recents.getTaskViewCount() > 1 ? Math.max(220L, duration) : duration;
    }

    private static float getEntryPagePosition(RecentsView recents, int taskCount) {
        int target = getInitialTaskOrdinal(recents, taskCount);
        return liveSimulatorOverviewTarget ? target * liveEntryPageProgress : target;
    }

    /**
     * RecentsView resets the remote simulator scale to 1.0 once when targets
     * attach and once again from resetTaskVisuals().  Both writes happen after
     * the main app-to-Overview animator was built, so changing only that
     * animator's endpoint still allows a 1.10 -> 1.00 -> 1.10 size flash.
     * Clamp only the active Overview-entry surface to the Xiaomi front-card
     * floor while preserving every larger fullscreen/intermediate value.
     */
    public static float normalizeLiveAppliedScale(Context context, float nativeScale) {
        RecentsView recents = activeOverviewRecents.get();
        boolean pending = liveSimulatorOverviewTarget
                || (overviewEntryPending && overviewPendingRecents.get() == recents);
        if (!pending || context == null
                || (!liveSimulatorOverviewTarget && !usesNativeStackStyle(context))) {
            lastLiveAppliedScale = nativeScale;
            return nativeScale;
        }
        loadConfig(context.getResources());
        float floor = focusScale;
        if (liveSimulatorOverviewTarget && !Float.isNaN(liveEntryStartScale)) {
            float start = Math.min(focusScale, liveEntryStartScale);
            floor = start + (focusScale - start) * liveEntryPageProgress;
        }
        return Math.max(nativeScale, floor);
    }

    /**
     * During a live app -> Overview commit RedMagic can keep the cached pager's
     * previous horizontal scroll in TaskViewSimulator.  That moves the running
     * app leash to the far right even though its final Xiaomi card is centered.
     * Only neutralize that transient simulator scroll while this entry token is
     * pending; quick-switch, Overview paging and task-launch paths keep their
     * native scroll values.
     */
    public static float normalizeLiveEntryScroll(float nativeScroll) {
        if (liveSimulatorOverviewTarget) {
            return 0.0f;
        }
        RecentsView recents = activeOverviewRecents.get();
        if (!overviewEntryPending || overviewPendingRecents.get() != recents
                || recents == null || !recents.isNativeStackStyle()
                || !recents.isRecentsAnimationRunning()) {
            return nativeScroll;
        }
        return 0.0f;
    }

    /**
     * RedMagic adds a late recentsViewSecondaryTranslation to the live app
     * leash after its target task rectangle has already been centered.  On the
     * NX809J that value is about 12 px and is reset/reapplied near the handoff,
     * producing the down-up-down movement visible in test9.mp4.  Normalize the
     * mapped crop, rather than any one OEM field, so every live-entry frame has
     * the same screen-center endpoint as the final Xiaomi TaskView.  The guard
     * is active only for the app-to-Overview surface lifecycle; task launch,
     * quick switch and the other recent-task styles retain native matrices.
     */
    public static void normalizeLiveEntryMatrix(Context context, Matrix matrix,
            Rect crop) {
        if (context == null || matrix == null || crop == null || crop.isEmpty()) {
            return;
        }
        RecentsView recents = activeOverviewRecents.get();
        boolean pending = liveSimulatorOverviewTarget
                || (overviewEntryPending && overviewPendingRecents.get() == recents
                && recents != null && recents.isNativeStackStyle()
                && recents.isRecentsAnimationRunning());
        if (!pending) {
            return;
        }
        TEMP_LIVE_SURFACE_BOUNDS.set(crop);
        if (!matrix.mapRect(TEMP_LIVE_SURFACE_BOUNDS)
                || TEMP_LIVE_SURFACE_BOUNDS.isEmpty()) {
            return;
        }
        float targetCenterY = context.getResources().getDisplayMetrics().heightPixels * 0.5f;
        float correctionY = targetCenterY - TEMP_LIVE_SURFACE_BOUNDS.centerY();
        if (recents != null && getInitialTaskOrdinal(recents, recents.getTaskViewCount()) == 1) {
            float page = getEntryPagePosition(recents, recents.getTaskViewCount());
            float depth = getMiuiDepth(0.0f, page, recents.getTaskViewCount());
            float scale = getMiuiScaleRatio(depth);
            float centerX = TEMP_LIVE_SURFACE_BOUNDS.centerX();
            float centerY = TEMP_LIVE_SURFACE_BOUNDS.centerY();
            matrix.postScale(scale, scale, centerX, centerY);
            float width = context.getResources().getDisplayMetrics().widthPixels;
            matrix.postTranslate(getMiuiCenter(width, depth) - centerX, correctionY);
            return;
        }
        if (Math.abs(correctionY) > 0.01f) {
            matrix.postTranslate(0.0f, correctionY);
        }
    }

    /**
     * applyLoadPlan may invoke its page callback either immediately or after
     * resetTaskVisuals(), depending on whether page scrolls were initialized.
     * Always compose the deck on the following display frame so both entry and
     * dismiss/reload paths see the final OEM transforms and child geometry.
     */
    private static final class FrameUpdate implements Runnable {
        private final RecentsView recents;

        FrameUpdate(RecentsView recents) {
            this.recents = recents;
        }

        @Override
        public void run() {
            if (frameUpdateRecents.get() == recents) {
                frameUpdateScheduled = false;
                frameUpdateRecents.clear();
            }
            update(recents);
        }
    }

    /** Keeps the ActivityManager binder call off entry and dismiss tail frames. */
    private static final class MemoryRefresh implements Runnable {
        private final RecentsView recents;

        MemoryRefresh(RecentsView recents) {
            this.recents = recents;
        }

        @Override
        public void run() {
            if (memoryRefreshRecents.get() != recents) {
                return;
            }
            memoryRefreshScheduled = false;
            memoryRefreshRecents.clear();
            if (!recents.isNativeStackStyle() || !recents.isShown()) {
                return;
            }
            refreshMemoryLabels(recents);
        }
    }

    /**
     * Waits only for drawable page geometry.  It never schedules a delayed
     * correction and never resolves ordinal zero again: both actions caused the
     * task identity/Z order to change in the middle of the visible transition.
     */
    private static final class InitialFrameCommit implements Runnable {
        private final RecentsView recents;
        private final int generation;
        private int remainingGeometryFrames = 12;

        InitialFrameCommit(RecentsView recents, int generation) {
            this.recents = recents;
            this.generation = generation;
        }

        @Override
        public void run() {
            if (generation != entryStabilizerGeneration
                    || !recents.isNativeStackStyle()) {
                return;
            }
            if (!isEntryTaskOrderActive(recents) && recents.getTaskViewCount() > 0) {
                TaskView preferred = getPreferredEntryTask(recents);
                if (preferred != null && captureEntryTaskOrder(recents, preferred)) {
                    int page = resolveEntryAnchorPage(recents);
                    if (page >= 0) {
                        setEntryPageAligned(recents, page);
                    }
                }
            }
            int liveTargetPage = resolveEntryAnchorPage(recents);
            if (liveTargetPage < 0 || liveTargetPage >= recents.getChildCount()) {
                if (remainingGeometryFrames-- > 0) {
                    recents.postOnAnimation(this);
                }
                return;
            }
            if (!isEntryGeometryReady(recents, liveTargetPage)
                    && remainingGeometryFrames-- > 0) {
                recents.postOnAnimation(this);
                return;
            }
            entryAnchorPage = liveTargetPage;
            update(recents);
        }
    }

    private static final class EntryRevealUpdate
            implements ValueAnimator.AnimatorUpdateListener {
        private final RecentsView recents;

        EntryRevealUpdate(RecentsView recents) {
            this.recents = recents;
        }

        @Override
        public void onAnimationUpdate(ValueAnimator animation) {
            if (entryRevealRecents.get() != recents) {
                return;
            }
            entryRevealProgress = ((Float) animation.getAnimatedValue()).floatValue();
            update(recents);
        }
    }

    private static final class EntryRevealEnd extends AnimatorListenerAdapter {
        private final RecentsView recents;

        EntryRevealEnd(RecentsView recents) {
            this.recents = recents;
        }

        @Override
        public void onAnimationEnd(Animator animation) {
            if (entryRevealRecents.get() == recents) {
                entryRevealProgress = 1.0f;
                entryRevealRecents.clear();
                update(recents);
            }
            if (entryRevealAnimator == animation) {
                entryRevealAnimator = null;
            }
        }
    }

    /** Starts the Home -> Overview reveal only after reusable task geometry is drawable. */
    private static final class EntryRevealStart implements Runnable {
        private final RecentsView recents;
        private int remainingFrames = 12;

        EntryRevealStart(RecentsView recents) {
            this.recents = recents;
        }

        @Override
        public void run() {
            if (entryRevealRecents.get() != recents
                    || !recents.isNativeStackStyle()) {
                return;
            }
            if (!recents.isShown() || recents.getWidth() <= 0
                    || recents.getTaskViewCount() <= 0) {
                if (remainingFrames-- > 0) {
                    recents.postOnAnimation(this);
                } else {
                    /* Never leave an unusually slow/empty load parked at the
                     * off-screen reveal start.  The next task-list update will
                     * render the final deck without replaying stale entry work. */
                    finishEntryReveal(recents);
                }
                return;
            }
            startEntryRevealIfArmed(recents);
        }
    }

    /** Releases the one transient texture used by the actively dragged card. */
    private static final class GestureLayerReset implements Runnable {
        private final WeakReference<TaskView> taskRef;
        private final int generation;

        GestureLayerReset(TaskView task, int generation) {
            taskRef = new WeakReference<>(task);
            this.generation = generation;
        }

        @Override
        public void run() {
            TaskView task = taskRef.get();
            if (task != null && generation == gestureLayerGeneration
                    && gestureLayerTask.get() == task) {
                task.setLayerType(View.LAYER_TYPE_NONE, null);
                gestureLayerTask.clear();
            }
        }
    }

    private static void cacheGestureLayer(TaskView task) {
        /*
         * TaskView already owns a hardware RenderNode.  Forcing a full-card
         * hardware layer here allocates a screen-sized texture at ACTION_DOWN
         * and is the dominant GPU submission spike during upward dismissal.
         */
    }

    private static void scheduleFrameUpdate(RecentsView recents) {
        if (frameUpdateScheduled && frameUpdateRecents.get() == recents) {
            return;
        }
        frameUpdateScheduled = true;
        frameUpdateRecents = new WeakReference<>(recents);
        recents.postOnAnimation(new FrameUpdate(recents));
    }

    private static void markDrawUpdate(RecentsView recents) {
        if (drawUpdateRecents.get() != recents) {
            drawUpdateRecents = new WeakReference<>(recents);
        }
        drawUpdatePending = true;
    }

    /** Runs once per rendered pager frame, after all OEM scroll properties settle. */
    public static void beforeDispatchDraw(RecentsView recents) {
        if (!recents.isNativeStackStyle()) {
            return;
        }
        boolean requested = drawUpdatePending && drawUpdateRecents.get() == recents;
        boolean entryActive = isEntryTransitionActive(recents);
        if (!requested && !entryActive) {
            return;
        }
        if (requested) {
            drawUpdatePending = false;
        }
        update(recents);
    }

    private static void setCurrentPageIfChanged(RecentsView recents, int page) {
        if (page >= 0 && page < recents.getChildCount()
                && recents.getCurrentPage() != page) {
            recents.setCurrentPage(page);
        }
    }

    /**
     * Entry must align both the logical page and its physical scroll.  RedMagic
     * can report the target currentPage while retaining a residual scroll from
     * the Home transition; skipping setCurrentPage() in that state leaves the
     * first card a few pixels off-center and lets the offset vary across entries.
     * This is called only at bounded entry commit/release points, never per draw.
     */
    private static void setEntryPageAligned(RecentsView recents, int page) {
        if (page >= 0 && page < recents.getChildCount()) {
            recents.setNativeStackOverviewPage(page);
        }
    }

    private static int getPrimaryTaskId(TaskView task) {
        if (task == null) {
            return -1;
        }
        try {
            int[] taskIds = task.getTaskIds();
            return taskIds != null && taskIds.length > 0 ? taskIds[0] : -1;
        } catch (Throwable ignored) {
            return -1;
        }
    }

    /**
     * A live app entry must follow the running TaskView, not ordinal zero from
     * the previous cached task list.  RedMagic publishes Overview state before
     * it finishes binding the new running task; falling back during that gap is
     * the short right-edge pile visible in test7.mp4.  A Home entry has no live
     * animation and continues to use the newest task at ordinal zero.
     */
    private static TaskView getPreferredEntryTask(RecentsView recents) {
        if (recents == null) {
            return null;
        }
        if (recents.isRecentsAnimationRunning()) {
            if (activeOverviewRecents.get() == recents) entryFromApp = true;
            int runningPage = recents.getRunningTaskIndex();
            return runningPage >= 0 ? recents.getTaskViewAt(runningPage) : null;
        }
        return getTaskForOrdinal(recents, 0);
    }

    /** Captures one immutable visual order for the whole visible entry. */
    private static boolean captureEntryTaskOrder(RecentsView recents,
            TaskView preferredAnchor) {
        int count = recents.getTaskViewCount();
        if (count <= 0) {
            return false;
        }
        if (preferredAnchor == null || recents.indexOfChild(preferredAnchor) < 0) {
            return false;
        }

        TaskView[] orderedViews = new TaskView[count];
        int[] orderedIds = new int[count];
        int size = 0;
        orderedViews[size] = preferredAnchor;
        orderedIds[size++] = getPrimaryTaskId(preferredAnchor);
        for (int i = 0; i < recents.getChildCount() && size < count; i++) {
            View child = recents.getChildAt(i);
            if (!(child instanceof TaskView) || child == preferredAnchor) {
                continue;
            }
            TaskView task = (TaskView) child;
            orderedViews[size] = task;
            orderedIds[size++] = getPrimaryTaskId(task);
        }
        if (size <= 0) {
            return false;
        }

        entryOrderRecents = new WeakReference<>(recents);
        entryTaskOrderViews = orderedViews;
        entryTaskOrderIds = orderedIds;
        entryTaskOrderSize = size;
        entryAnchorTask = new WeakReference<>(preferredAnchor);
        entryAnchorTaskId = orderedIds[0];
        entryAnchorPage = recents.indexOfChild(orderedViews[getInitialTaskOrdinal(recents, size)]);
        entryAnchorRecents = new WeakReference<>(recents);
        Log.i(TAG, "entry identity taskId=" + entryAnchorTaskId
                + " page=" + entryAnchorPage + " tasks=" + size
                + " fromApp=" + entryFromApp + " focusOrdinal=" + getInitialTaskOrdinal(recents, size));
        return true;
    }

    private static void clearEntryTaskOrder(RecentsView recents) {
        if (entryAnchorRecents.get() != recents && entryOrderRecents.get() != recents) {
            return;
        }
        entryAnchorPage = -1;
        entryAnchorTaskId = -1;
        entryAnchorTask.clear();
        entryAnchorRecents.clear();
        entryOrderRecents.clear();
        entryTaskOrderViews = EMPTY_ENTRY_TASK_VIEWS;
        entryTaskOrderIds = EMPTY_ENTRY_TASK_IDS;
        entryTaskOrderSize = 0;
    }

    private static boolean isEntryTaskOrderActive(RecentsView recents) {
        return entryOrderRecents.get() == recents && entryTaskOrderSize > 0;
    }

    /** Rebinds captured IDs to their current TaskView without changing order. */
    private static boolean refreshEntryTaskBindings(RecentsView recents) {
        if (!isEntryTaskOrderActive(recents)
                || recents.getTaskViewCount() != entryTaskOrderSize) {
            return false;
        }
        for (int i = 0; i < entryTaskOrderSize; i++) {
            TaskView task = entryTaskOrderViews[i];
            int taskId = entryTaskOrderIds[i];
            boolean stillBound = task != null && recents.indexOfChild(task) >= 0
                    && (taskId < 0 || task.containsTaskId(taskId));
            if (!stillBound && taskId >= 0) {
                task = recents.getTaskViewByTaskId(taskId);
            }
            if (task == null || recents.indexOfChild(task) < 0) {
                return false;
            }
            entryTaskOrderViews[i] = task;
        }
        entryAnchorTask = new WeakReference<>(entryTaskOrderViews[0]);
        entryAnchorPage = recents.indexOfChild(entryTaskOrderViews[getInitialTaskOrdinal(recents, entryTaskOrderSize)]);
        return entryAnchorPage >= 0;
    }

    private static boolean ensureEntryTaskOrder(RecentsView recents) {
        if (refreshEntryTaskBindings(recents)) {
            return true;
        }
        TaskView preferred = entryAnchorTaskId >= 0
                ? recents.getTaskViewByTaskId(entryAnchorTaskId) : null;
        if (preferred == null) {
            preferred = getPreferredEntryTask(recents);
        }
        return preferred != null && captureEntryTaskOrder(recents, preferred);
    }

    private static TaskView getEntryTaskForOrdinal(RecentsView recents, int ordinal) {
        if (!isEntryTaskOrderActive(recents)
                || ordinal < 0 || ordinal >= entryTaskOrderSize) {
            return null;
        }
        TaskView task = entryTaskOrderViews[ordinal];
        int taskId = entryTaskOrderIds[ordinal];
        if (task != null && recents.indexOfChild(task) >= 0
                && (taskId < 0 || task.containsTaskId(taskId))) {
            return task;
        }
        task = taskId >= 0 ? recents.getTaskViewByTaskId(taskId) : null;
        if (task != null) {
            entryTaskOrderViews[ordinal] = task;
        }
        return task;
    }

    private static int resolveEntryAnchorPage(RecentsView recents) {
        if (!isEntryTaskOrderActive(recents)) {
            return -1;
        }
        TaskView anchor = getEntryTaskForOrdinal(recents, getInitialTaskOrdinal(recents, entryTaskOrderSize));
        if (anchor == null) {
            anchor = entryAnchorTask.get();
        }
        int page = anchor == null ? -1 : recents.indexOfChild(anchor);
        if (page >= 0) {
            entryAnchorPage = page;
        }
        return page;
    }

    private static void scheduleInitialFrameCommit(RecentsView recents) {
        int generation = ++entryStabilizerGeneration;
        recents.postOnAnimation(new InitialFrameCommit(recents, generation));
    }

    private static boolean isEntryTransitionActive(RecentsView recents) {
        return (liveSimulatorOverviewTarget && activeOverviewRecents.get() == recents)
                || entryAnchorRecents.get() == recents
                || isEntryTaskOrderActive(recents)
                || recents.isNativeStackEntryPending()
                || (overviewEntryPending && overviewPendingRecents.get() == recents);
    }

    /**
     * Atomically hands the bounded entry target back to the native pager.  The
     * page and logical anchor change in one UI turn, then the canonical stack is
     * composed from the final physical scroll.
     */
    private static void finishEntryForInteraction(RecentsView recents) {
        finishEntryForInteraction(recents, true);
    }

    private static void finishEntryForInteraction(
            RecentsView recents, boolean composeImmediately) {
        if (recents == null || !isEntryTransitionActive(recents)) {
            return;
        }
        int targetPage = -1;
        if (isEntryTaskOrderActive(recents)) {
            targetPage = resolveEntryAnchorPage(recents);
        } else if (recents.getTaskViewCount() > 0) {
            targetPage = resolveInitialPage(recents, recents.getCurrentPage());
        }
        if (targetPage >= 0 && targetPage < recents.getChildCount()) {
            setEntryPageAligned(recents, targetPage);
        }
        recents.setNativeStackEntryPending(false);
        liveSimulatorOverviewTarget = false;
        if (overviewPendingRecents.get() == recents) {
            overviewEntryPending = false;
            overviewPendingRecents.clear();
        }
        clearEntryTaskOrder(recents);
        if (composeImmediately) {
            update(recents);
        }
    }

    /**
     * PagedView changes physical scroll and TaskView fields in one UI turn.
     * Coalesce all scroll callbacks, including entry, and consume only the
     * finished state immediately before children draw.
     */
    public static void onScrollChanged(RecentsView recents) {
        if (recents.isNativeStackStyle()) {
            markDrawUpdate(recents);
            return;
        }
        update(recents);
    }

    private static boolean isEntryGeometryReady(RecentsView recents, int targetPage) {
        if (targetPage < 0 || targetPage >= recents.getChildCount()) {
            return false;
        }
        View target = recents.getChildAt(targetPage);
        if (!(target instanceof TaskView)
                || target.getWidth() <= 0 || target.getHeight() <= 0) {
            return false;
        }
        int firstScroll = 0;
        boolean foundFirst = false;
        int taskCount = 0;
        for (int i = 0; i < recents.getChildCount(); i++) {
            if (!(recents.getChildAt(i) instanceof TaskView)) {
                continue;
            }
            taskCount++;
            int pageScroll = recents.getScrollForPage(i);
            if (!foundFirst) {
                firstScroll = pageScroll;
                foundFirst = true;
            } else if (Math.abs(pageScroll - firstScroll) >= 1) {
                return true;
            }
        }
        return taskCount == 1;
    }

    /**
     * RedMagic's cached Home -> Overview path does not run applyLoadPlan or the
     * recents-animation completion callback.  Release its one-card staging only
     * after the focus TaskView's real View translation has reached the Xiaomi
     * center.  This is state-bound rather than time-bound, so a slow transition
     * cannot expose the stale right-edge deck and a fast transition is never
     * held for an arbitrary timeout.  Keep the captured identity/order until
     * first touch so late OEM property writes are repaired before every draw.
     */
    private static void finishCachedEntryStagingIfReady(
            RecentsView recents, int primarySize) {
        if (recents == null || recents.isRecentsAnimationRunning()
                || !overviewActive || activeOverviewRecents.get() != recents
                || !isEntryTaskOrderActive(recents)) {
            return;
        }
        boolean pending = recents.isNativeStackEntryPending()
                || (overviewEntryPending && overviewPendingRecents.get() == recents);
        if (!pending) {
            return;
        }
        int targetPage = resolveEntryAnchorPage(recents);
        if (!isEntryGeometryReady(recents, targetPage)) {
            return;
        }
        TaskView focus = getEntryTaskForOrdinal(recents, getInitialTaskOrdinal(recents, entryTaskOrderSize));
        if (focus == null || recents.indexOfChild(focus) != targetPage
                || focus.getAlpha() <= 0.01f) {
            return;
        }
        RecentsPagedOrientationHandler handler = recents.getPagedOrientationHandler();
        float actualCenter = handler.getChildStart(focus)
                + (handler.getPrimarySize(focus) * 0.5f)
                - handler.getPrimaryScroll(recents)
                + handler.getPrimaryValue(
                        focus.getTranslationX(), focus.getTranslationY());
        float expectedCenter = getMiuiCenter(primarySize, MIUI_FOCUS_DEPTH);
        float tolerance = Math.max(2.0f,
                1.5f * recents.getResources().getDisplayMetrics().density);
        if (Math.abs(actualCenter - expectedCenter) > tolerance) {
            return;
        }

        recents.setNativeStackEntryPending(false);
        if (overviewPendingRecents.get() == recents) {
            overviewEntryPending = false;
            overviewPendingRecents.clear();
        }
        recents.postInvalidateOnAnimation();
        Log.i(TAG, "cached entry staging committed at center=" + actualCenter
                + " page=" + targetPage);
    }

    /**
     * RedMagic can attach a legacy View Animation to a TaskView during both a
     * cached Home entry and a live app entry.  The remote app surface/property
     * animation already owns the real fullscreen-to-Overview motion; composing
     * this additional legacy transform makes the card undershoot in size or
     * park at the right edge before snapping to the deck.  Clear only while the
     * immutable entry identity is active.  First touch releases that identity,
     * so pager, dismiss and launch animations remain native.
     */
    private static void settleEntryPresentation(TaskView task) {
        task.clearAnimation();
    }

    private static boolean isDismissReflowActive(RecentsView recents) {
        for (int i = 0; i < recents.getChildCount(); i++) {
            View child = recents.getChildAt(i);
            if (!(child instanceof TaskView)) {
                continue;
            }
            TaskView task = (TaskView) child;
            if (Math.abs(task.getNativeDismissTranslationX()) > 1.0f
                    || Math.abs(task.getNativeDismissTranslationY()) > 1.0f) {
                return true;
            }
        }
        return false;
    }

    private static boolean isDismissTransitionActive(RecentsView recents) {
        return pendingDismissRecents.get() == recents || isDismissReflowActive(recents);
    }

    /** Drops a dismiss transaction that ended without the OEM end callback. */
    private static void clearPendingDismissState(RecentsView recents) {
        if (recents != null && pendingDismissRecents.get() != recents) {
            return;
        }
        pendingDismissRecents.clear();
        pendingDismissTask.clear();
        pendingDismissOrdinal = -1;
        pendingDismissPagePosition = Float.NaN;
    }

    private static boolean isPendingDismissTask(
            RecentsView recents, TaskView task) {
        return pendingDismissRecents.get() == recents
                && pendingDismissTask.get() == task;
    }

    /** Only cards covered by the deleted card advance one deck depth. */
    private static boolean isPendingDismissReflowTask(
            RecentsView recents, TaskView task) {
        if (pendingDismissRecents.get() != recents
                || pendingDismissOrdinal < 0 || task == null) {
            return false;
        }
        int ordinal = getTaskOrdinalForChildIndex(
                recents, recents.indexOfChild(task));
        return ordinal > pendingDismissOrdinal;
    }

    /**
     * The deck now follows the OEM pager's physical scroll direction.  Older
     * tasks are the positive-relative pages and sit in the left/back stack, so
     * the original event keeps the foreground card under the finger.
     */
    public static MotionEvent obtainPagerEvent(RecentsView recents, MotionEvent source) {
        if (source.getActionMasked() == MotionEvent.ACTION_DOWN) {
            /* A new gesture proves the preceding one is no longer active.  A
             * system-edge takeover can bypass RecentsView$23.onEnd entirely;
             * never let that abandoned transaction freeze later paging. */
            clearPendingDismissState(recents);
            finishEntryReveal(recents);
            finishEntryForInteraction(recents);
            /*
             * OEM Recents may expose a non-task pager child at either edge.
             * Starting a drag from that page makes every TaskView have the same
             * relative sign, which is the observed "all cards on the right"
             * failure.  Xiaomi's scroller contains task pages only, so mirror
             * that invariant before the native RedMagic pager handles input.
             */
            int currentPage = recents.getCurrentPage();
            View currentChild = currentPage >= 0 && currentPage < recents.getChildCount()
                    ? recents.getChildAt(currentPage) : null;
            if (!(currentChild instanceof TaskView)) {
                RecentsPagedOrientationHandler handler = recents.getPagedOrientationHandler();
                int nearestTaskPage = findNearestTaskPage(recents,
                        handler.getPrimaryScroll(recents));
                if (nearestTaskPage >= 0) {
                    setCurrentPageIfChanged(recents, nearestTaskPage);
                    Log.i(TAG, "touch anchor normalized to task page=" + nearestTaskPage);
                    update(recents);
                }
            }
        }
        return source;
    }

    public static void recyclePagerEvent(MotionEvent source, MotionEvent pagerEvent) {
        if (pagerEvent != source) {
            pagerEvent.recycle();
        }
    }

    private static int findNearestTaskPage(RecentsView recents, float scroll) {
        int nearestPage = -1;
        float nearestDistance = Float.POSITIVE_INFINITY;
        for (int i = 0; i < recents.getChildCount(); i++) {
            if (!(recents.getChildAt(i) instanceof TaskView)) {
                continue;
            }
            float distance = Math.abs(recents.getScrollForPage(i) - scroll);
            if (distance < nearestDistance) {
                nearestDistance = distance;
                nearestPage = i;
            }
        }
        return nearestPage;
    }

    /** Arms exactly one latest-running-task commit for each real Overview entry. */
    public static void onOverviewStateChanged(RecentsView recents, boolean enabled) {
        /* State entry/exit is a hard transaction boundary.  This also repairs
         * a vertical swipe intercepted by the system gesture layer before the
         * OEM dismissal listener can report cancellation. */
        clearPendingDismissState(recents);
        if (enabled && recents.isNativeStackStyle()) {
            entryFromApp = liveSimulatorOverviewTarget || recents.isRecentsAnimationRunning();
            activeOverviewRecents = new WeakReference<>(recents);
            overviewActive = true;
            overviewPendingRecents = new WeakReference<>(recents);
            overviewEntryPending = true;
            ++overviewEntryGeneration;
            /* Xiaomi composes the stack on the first visible Overview frame;
             * it does not replay a second whole-deck reveal after the native
             * Home/app transition.  The synthetic off-left reveal used here
             * raced RedMagic's transition writers and exposed one or more
             * standard pager frames before snapping back into the deck. */
            finishEntryReveal(recents);
            TaskView preferred = getPreferredEntryTask(recents);
            if (preferred != null && captureEntryTaskOrder(recents, preferred)) {
                int page = resolveEntryAnchorPage(recents);
                if (page >= 0) {
                    setEntryPageAligned(recents, page);
                }
                update(recents);
            }
            scheduleInitialFrameCommit(recents);
            return;
        }
        if (!enabled) {
            entryFromApp = false;
            liveSimulatorOverviewTarget = false;
            if (drawUpdateRecents.get() == recents) {
                drawUpdatePending = false;
                drawUpdateRecents.clear();
            }
            if (activeOverviewRecents.get() == recents) {
                overviewActive = false;
                activeOverviewRecents.clear();
            }
            ++overviewEntryGeneration;
            finishEntryReveal(recents);
            if (overviewPendingRecents.get() == recents) {
                overviewEntryPending = false;
                overviewPendingRecents.clear();
            }
            ++entryStabilizerGeneration;
            clearEntryTaskOrder(recents);
            updateDecorations(recents, -1);
        }
    }

    /**
     * applyLoadPlan is not called again when RedMagic reuses its already-bound
     * task views.  In that path the native entry marker would otherwise remain
     * armed forever, keeping the one-card staging clip after the transition has
     * finished.  The recents-animation completion is the common lifecycle edge
     * for both a cold load and a cached re-entry, so use it as the non-timed
     * fallback commit.  Keep the identity snapshot until the first real touch;
     * that prevents a late child rebind from changing the visible front task.
     */
    public static void onRecentsAnimationComplete(RecentsView recents) {
        if (recents == null || !recents.isNativeStackStyle()
                || !overviewActive || activeOverviewRecents.get() != recents) {
            return;
        }
        boolean pending = recents.isNativeStackEntryPending()
                || (overviewEntryPending && overviewPendingRecents.get() == recents);
        if (!pending) {
            return;
        }
        if (!isEntryTaskOrderActive(recents) && recents.getTaskViewCount() > 0) {
            TaskView preferred = getPreferredEntryTask(recents);
            if (preferred != null) {
                captureEntryTaskOrder(recents, preferred);
            }
        } else {
            ensureEntryTaskOrder(recents);
        }
        int targetPage = resolveEntryAnchorPage(recents);
        if (targetPage >= 0 && targetPage < recents.getChildCount()) {
            setEntryPageAligned(recents, targetPage);
        }
        recents.setNativeStackEntryPending(false);
        liveSimulatorOverviewTarget = false;
        if (overviewPendingRecents.get() == recents) {
            overviewEntryPending = false;
            overviewPendingRecents.clear();
        }
        update(recents);
        scheduleInitialFrameCommit(recents);
    }

    /**
     * Home centers the newest task; live app entry centers the second task if
     * one exists. Keep the running app first in the immutable task order: only
     * the focus changes, never task order, Z order or pager/dismiss behavior.
     * Convert the logical ordinal back to an OEM child index because the pager
     * may also contain non-task pages.
     */
    public static int resolveInitialPage(RecentsView recents, int requestedPage) {
        if (!recents.isNativeStackStyle()) {
            return requestedPage;
        }
        int anchoredPage = resolveEntryAnchorPage(recents);
        if (anchoredPage >= 0) {
            return anchoredPage;
        }
        int taskCount = recents.getTaskViewCount();
        if (taskCount > 0) {
            int targetOrdinal = getInitialTaskOrdinal(recents, taskCount);
            TaskView initialTask = getTaskForOrdinal(recents, targetOrdinal);
            int childIndex = initialTask == null ? -1 : recents.indexOfChild(initialTask);
            if (childIndex >= 0) {
                return childIndex;
            }
        }
        return requestedPage;
    }

    /**
     * The load-plan callback is shared by entry, task dismissal and task-list
     * updates.  Override its page only for the first callback of a real Overview
     * entry; every later callback keeps the OEM-requested target.
     */
    public static void commitInitialPage(RecentsView recents, int requestedPage) {
        if (!recents.isNativeStackStyle()) {
            setCurrentPageIfChanged(recents, requestedPage);
            return;
        }
        if (!recents.isNativeStackEntryPending()) {
            setCurrentPageIfChanged(recents, requestedPage);
            scheduleFrameUpdate(recents);
            return;
        }
        final boolean liveEntryRunning = recents.isRecentsAnimationRunning();
        if (!liveEntryRunning) {
            if (overviewPendingRecents.get() == recents) {
                overviewEntryPending = false;
                overviewPendingRecents.clear();
            }
            ++overviewEntryGeneration;
            recents.setNativeStackEntryPending(false);
        }
        /* The load-plan callback is the first point where the full task order
         * is valid, but it is not the end of a live app animation.  Keep the
         * entry token armed until onRecentsAnimationComplete() so cached cards
         * cannot appear around the still-moving app leash and form a transient
         * right-side pile.  Home entry has no live animation and commits here. */
        /* Keep the already-visible deck intact.  Clearing every TaskView here
         * used to write native layout -> zero stack -> final stack in one UI
         * turn, rebuilding every thumbnail RenderNode and producing the
         * perceived Home -> Overview hitch.  The transform is absolute and
         * subtracts its previous stack component.  The bounded logical anchor
         * is recomposed against RedMagic's latest physical scroll at draw time. */
        TaskView preferred = getPreferredEntryTask(recents);
        if (preferred != null) {
            captureEntryTaskOrder(recents, preferred);
        }
        int target = resolveEntryAnchorPage(recents);
        if (target >= 0 && target < recents.getChildCount()) {
            setEntryPageAligned(recents, target);
            update(recents);
        } else {
            setCurrentPageIfChanged(recents, requestedPage);
        }
        startEntryRevealIfArmed(recents);
        scheduleInitialFrameCommit(recents);
    }

    private static int getInitialTaskOrdinal(RecentsView recents, int taskCount) {
        if (entryFromApp && activeOverviewRecents.get() == recents && taskCount > 1) {
            return 1;
        }
        return 0;
    }

    private static void armEntryReveal(RecentsView recents) {
        if (entryRevealAnimator != null) {
            entryRevealAnimator.cancel();
            entryRevealAnimator = null;
        }
        entryRevealRecents = new WeakReference<>(recents);
        entryRevealProgress = 0.0f;
        recents.postOnAnimation(new EntryRevealStart(recents));
    }

    private static void startEntryRevealIfArmed(RecentsView recents) {
        if (entryRevealRecents.get() != recents || entryRevealAnimator != null
                || !recents.isShown() || recents.getWidth() <= 0
                || recents.getTaskViewCount() <= 0) {
            return;
        }
        ValueAnimator animator = ValueAnimator.ofFloat(0.0f, 1.0f);
        animator.setDuration(280L);
        animator.setInterpolator(new PathInterpolator(0.2f, 0.0f, 0.2f, 1.0f));
        animator.addUpdateListener(new EntryRevealUpdate(recents));
        animator.addListener(new EntryRevealEnd(recents));
        entryRevealAnimator = animator;
        animator.start();
    }

    private static void finishEntryReveal(RecentsView recents) {
        if (entryRevealRecents.get() != recents) {
            return;
        }
        ValueAnimator animator = entryRevealAnimator;
        entryRevealAnimator = null;
        entryRevealProgress = 1.0f;
        entryRevealRecents.clear();
        if (animator != null) {
            animator.cancel();
        }
    }

    /**
     * The OEM dismiss controller scans overlapping TaskViews in adapter order.
     * In deck mode that order is not the visual Z order, so the wrong task can
     * win the hit test.  Prefer the focused card, then the highest visible layer.
     */
    public static TaskView findTouchedTask(RecentsView recents,
            BaseDragLayer dragLayer, MotionEvent event) {
        if (!recents.isNativeStackStyle() || dragLayer == null) {
            return null;
        }
        try {
            int focusPage = getVisualFocusPage(recents);
            View focusChild = focusPage >= 0 && focusPage < recents.getChildCount()
                    ? recents.getChildAt(focusPage) : null;
            TaskView focus = focusChild instanceof TaskView
                    ? (TaskView) focusChild : null;
            /* Xiaomi gives the logical focus card first refusal throughout its
             * transformed rectangle, including the region overlapped by the
             * exposed newer card.  This keeps a vertical swipe bound to the
             * card the user sees as centered instead of an adapter-order layer. */
            if (isTouchableTask(recents, dragLayer, focus, event, false)) {
                cacheGestureLayer(focus);
                Log.d(TAG, "dismiss hit mapped to visual focus");
                return focus;
            }
            TaskView best = null;
            float bestZ = -Float.MAX_VALUE;
            for (int i = 0; i < recents.getChildCount(); i++) {
                View child = recents.getChildAt(i);
                if (!(child instanceof TaskView)) {
                    continue;
                }
                TaskView task = (TaskView) child;
                if (task == focus
                        || !isTouchableTask(recents, dragLayer, task, event, true)) {
                    continue;
                }
                float z = task.getTranslationZ();
                if (best == null || z > bestZ) {
                    best = task;
                    bestZ = z;
                }
            }
            if (best != null) {
                cacheGestureLayer(best);
                Log.d(TAG, "dismiss hit mapped to visible top layer");
            }
            return best;
        } catch (Throwable error) {
            Log.e(TAG, "deck hit-test failed", error);
            return null;
        }
    }

    private static boolean isTouchableTask(RecentsView recents,
            BaseDragLayer dragLayer, TaskView task, MotionEvent event,
            boolean respectVisibleClip) {
        if (task == null || task.getAlpha() <= 0.01f
                || !recents.isTaskViewVisible(task)) {
            return false;
        }
        float scale = dragLayer.getDescendantRectRelativeToSelf(task, TEMP_HIT_BOUNDS);
        Rect clip = respectVisibleClip ? task.getClipBounds() : null;
        if (clip != null) {
            int transformedLeft = TEMP_HIT_BOUNDS.left + Math.round(clip.left * scale);
            int transformedTop = TEMP_HIT_BOUNDS.top + Math.round(clip.top * scale);
            int transformedRight = TEMP_HIT_BOUNDS.left + Math.round(clip.right * scale);
            int transformedBottom = TEMP_HIT_BOUNDS.top + Math.round(clip.bottom * scale);
            TEMP_HIT_BOUNDS.set(transformedLeft, transformedTop,
                    transformedRight, transformedBottom);
        }
        return TEMP_HIT_BOUNDS.contains(Math.round(event.getX()), Math.round(event.getY()));
    }

    /** Keeps the swiped card complete without changing its deck hierarchy. */
    public static void prepareDismissedTask(RecentsView recents, TaskView task) {
        if (task == null) {
            return;
        }
        if (recents.isNativeStackStyle()) {
            recordDismissedTask(recents, task);
            cacheGestureLayer(task);
            /* A removed card needs its complete RenderNode, otherwise the old
             * settled clip produces the half-card seen in test3.mp4.  It must
             * retain its original Z, though: Xiaomi keeps all newer/upper cards
             * in place while only the covered history layers advance. */
            task.setNativeStackClipRight(-1);
            /* Rebuild once so every card participating in the native dismiss
             * animation receives the correct fixed/reflow role; settled clips
             * return atomically in onDismissAnimationEnd(). */
            update(recents);
        } else {
            task.setTranslationZ(0.1f);
        }
    }

    /** Records the visual focus before OEM dismissal code samples reflow depth. */
    public static void recordDismissedTask(RecentsView recents, TaskView task) {
        if (recents == null || task == null || !recents.isNativeStackStyle()) {
            return;
        }
        /* createTaskDismissAnimation() records once before it builds any OEM
         * reflow properties, then prepareDismissedTask() reaches here again at
         * the end of that method.  The second call must not replace the clean
         * ACTION_UP-era viewport sample with RedMagic's already-mutated page. */
        if (pendingDismissRecents.get() == recents
                && pendingDismissTask.get() == task
                && pendingDismissOrdinal >= 0
                && !Float.isNaN(pendingDismissPagePosition)) {
            return;
        }
        /* Upward dismissal does not pass through the horizontal pager's
         * ACTION_DOWN hook.  Finish the bounded entry target before sampling
         * the visual focus used by the native dismiss animation. */
        finishEntryReveal(recents);
        /* prepareDismissedTask() composes the clipped dismiss deck immediately
         * after this method, so do not traverse every TaskView twice. */
        finishEntryForInteraction(recents, false);
        int dismissedOrdinal = getTaskOrdinalForChildIndex(
                recents, recents.indexOfChild(task));
        RecentsPagedOrientationHandler handler = recents.getPagedOrientationHandler();
        int focusPage = findNearestTaskPage(recents,
                handler.getPrimaryScroll(recents));
        if (focusPage < 0) {
            int nextPage = recents.getNextPage();
            focusPage = nextPage >= 0 && nextPage < recents.getChildCount()
                    && recents.getChildAt(nextPage) instanceof TaskView
                    ? nextPage : recents.getCurrentPage();
        }
        int viewportOrdinal = getTaskOrdinalForChildIndex(recents, focusPage);
        if (viewportOrdinal < 0) {
            viewportOrdinal = dismissedOrdinal;
        }
        pendingDismissRecents = new WeakReference<>(recents);
        pendingDismissTask = new WeakReference<>(task);
        pendingDismissOrdinal = dismissedOrdinal;
        /* Keep the pre-gesture viewport fixed.  pendingDismissOrdinal is used
         * separately to decide which older/covered cards advance one layer. */
        pendingDismissPagePosition = viewportOrdinal >= 0
                ? viewportOrdinal : Float.NaN;
        Log.i(TAG, "dismiss capture cardOrdinal=" + dismissedOrdinal
                + " viewportOrdinal=" + viewportOrdinal
                + " currentPage=" + recents.getCurrentPage());
    }

    /**
     * The stock callback changes currentPage after removing a child, but the
     * TaskViews still carry stack transforms calculated against the old pager
     * scroll.  Commit Xiaomi's replacement card and the native scroll together,
     * then compose the deck in that same frame so no blank/right-only frame is
     * exposed between the leaving card and the promoted history card.
     */
    public static void onDismissAnimationEnd(RecentsView recents, boolean success) {
        long startedAt = android.os.SystemClock.uptimeMillis();
        int dismissedOrdinal = pendingDismissRecents.get() == recents
                ? pendingDismissOrdinal : -1;
        int viewportOrdinal = pendingDismissRecents.get() == recents
                && !Float.isNaN(pendingDismissPagePosition)
                ? Math.round(pendingDismissPagePosition) : -1;
        clearPendingDismissState(recents);
        if (!recents.isNativeStackStyle()) {
            return;
        }
        try {
            finishEntryForInteraction(recents);
            /*
             * RecentsView$23 has already removed the child, rebuilt page
             * scrolls and committed its stock current page before reaching
             * this callback.  Calling updateScrollSynchronously() again here
             * forces another measure/layout pass on the animation tail and
             * was the remaining visible hitch after an upward dismissal.
             */
            int taskCount = recents.getTaskViewCount();
            int targetPage = -1;
            if (taskCount > 0 && viewportOrdinal >= 0) {
                /* Keep the same visible deck slot after removal.  If the last
                 * task was dismissed, clamp to its immediate newer neighbour.
                 * This works for focused and directly-swiped exposed cards. */
                int targetOrdinal = Math.min(viewportOrdinal, taskCount - 1);
                TaskView target = getTaskForOrdinal(recents, targetOrdinal);
                targetPage = target == null ? -1 : recents.indexOfChild(target);
                if (targetPage >= 0) {
                    /* Call even when the numeric page did not change: child
                     * removal changed getScrollForPage(page). */
                    recents.setCurrentPage(targetPage);
                }
            }
            /* The callback is injected after OEM pending-animation cleanup;
             * one canonical composition is sufficient and avoids five full
             * traversals on consecutive 144 Hz frames. */
            update(recents);
            Log.i(TAG, "dismiss commit success=" + success
                    + " oldOrdinal=" + dismissedOrdinal
                    + " viewportOrdinal=" + viewportOrdinal
                    + " tasks=" + taskCount
                    + " targetPage=" + targetPage
                    + " currentPage=" + recents.getCurrentPage()
                    + " costMs=" + (android.os.SystemClock.uptimeMillis() - startedAt));
        } catch (Throwable error) {
            Log.e(TAG, "post-dismiss stack commit failed", error);
        }
    }

    /**
     * resetTaskVisuals() is also called at the start of RecentsView$23.onEnd,
     * before the dismissed child is removed.  Re-composing that obsolete deck
     * wastes a whole traversal and can briefly restore the leaving card.  The
     * post-dismiss callback below owns the one final composition instead.
     */
    public static void onTaskVisualsReset(RecentsView recents) {
        if (pendingDismissRecents.get() == recents) {
            return;
        }
        if (recents.isNativeStackStyle() && isEntryTransitionActive(recents)) {
            markDrawUpdate(recents);
            return;
        }
        update(recents);
    }

    /**
     * Converts the stock pager's full-page post-dismiss displacement into the
     * much shorter displacement between two neighbouring deck depths.  Cards
     * newer than the dismissed page do not move; older cards close only the
     * visible stack gap.  Returning zero also avoids animating fully hidden
     * tail cards.
     */
    public static int adjustDismissOffset(RecentsView recents, View child,
            TaskView dismissedTask, int nativeOffset) {
        if (nativeOffset == 0 || !recents.isNativeStackStyle()
                || !(child instanceof TaskView) || dismissedTask == null) {
            return nativeOffset;
        }
        try {
            int childIndex = recents.indexOfChild(child);
            int dismissedIndex = recents.indexOfChild(dismissedTask);
            int childOrdinal = getTaskOrdinalForChildIndex(recents, childIndex);
            int dismissedOrdinal = getTaskOrdinalForChildIndex(recents, dismissedIndex);
            int focusedOrdinal = getTaskOrdinalForChildIndex(
                    recents, getVisualFocusPage(recents));
            if (focusedOrdinal < 0) {
                int nearestPage = findNearestTaskPage(recents,
                        recents.getPagedOrientationHandler().getPrimaryScroll(recents));
                focusedOrdinal = getTaskOrdinalForChildIndex(recents, nearestPage);
            }
            if (childOrdinal < 0 || dismissedOrdinal < 0
                    || dismissedOrdinal < Math.max(0, focusedOrdinal)
                    || childOrdinal <= dismissedOrdinal) {
                return 0;
            }

            float depth = getRelativeDepth(recents, (TaskView) child);
            if (depth <= 0.0f || depth > maxDepth + 1.0f) {
                return 0;
            }
            float oldCenter = getCenterForDepth(recents, depth);
            float newDepth = Math.max(0.0f, depth - 1.0f);
            float newCenter = getCenterForDepth(recents, newDepth);
            int magnitude = Math.round(Math.abs(newCenter - oldCenter));
            if (magnitude == 0) {
                return 0;
            }
            return nativeOffset < 0 ? -magnitude : magnitude;
        } catch (Throwable error) {
            return nativeOffset;
        }
    }

    /** Target multiplier for TaskView.DISMISS_SCALE during deck reflow. */
    public static float getDismissReflowScale(RecentsView recents, TaskView task) {
        if (!recents.isNativeStackStyle() || task == null) {
            return 1.0f;
        }
        try {
            float depth = getRelativeDepth(recents, task);
            if (depth <= 0.0f) {
                return 1.0f;
            }
            float oldScale = getScaleForDepth(depth);
            float newScale = getScaleForDepth(Math.max(0.0f, depth - 1.0f));
            return oldScale == 0.0f ? 1.0f : newScale / oldScale;
        } catch (Throwable error) {
            return 1.0f;
        }
    }

    /** Target title/action alpha for a card moving one deck depth forward. */
    public static float getDismissReflowTitleAlpha(RecentsView recents,
            TaskView task) {
        if (!recents.isNativeStackStyle() || task == null) {
            return 1.0f;
        }
        try {
            float newDepth = Math.max(0.0f,
                    getRelativeDepth(recents, task) - 1.0f);
            return getMiuiTitleAlpha(MIUI_FOCUS_DEPTH
                    - (MIUI_DEPTH_STEP * newDepth));
        } catch (Throwable error) {
            return 1.0f;
        }
    }

    private static float getRelativeDepth(RecentsView recents, TaskView task) {
        loadConfig(recents.getResources());
        int taskOrdinal = getTaskOrdinalForChildIndex(
                recents, recents.indexOfChild(task));
        if (taskOrdinal < 0) {
            return 0.0f;
        }
        int focusedOrdinal = getTaskOrdinalForChildIndex(
                recents, getVisualFocusPage(recents));
        if (focusedOrdinal < 0) {
            int nearestPage = findNearestTaskPage(recents,
                    recents.getPagedOrientationHandler().getPrimaryScroll(recents));
            focusedOrdinal = getTaskOrdinalForChildIndex(recents, nearestPage);
        }
        return Math.max(0.0f, taskOrdinal - Math.max(0, focusedOrdinal));
    }

    private static int getTaskOrdinalForChildIndex(
            RecentsView recents, int childIndex) {
        int ordinal = 0;
        for (int i = 0; i < recents.getChildCount(); i++) {
            if (!(recents.getChildAt(i) instanceof TaskView)) {
                continue;
            }
            if (i == childIndex) {
                return ordinal;
            }
            ordinal++;
        }
        return -1;
    }

    private static TaskView getTaskForOrdinal(RecentsView recents, int targetOrdinal) {
        if (targetOrdinal < 0) {
            return null;
        }
        int ordinal = 0;
        for (int i = 0; i < recents.getChildCount(); i++) {
            View child = recents.getChildAt(i);
            if (!(child instanceof TaskView)) {
                continue;
            }
            if (ordinal == targetOrdinal) {
                return (TaskView) child;
            }
            ordinal++;
        }
        return null;
    }

    private static int getVisualFocusPage(RecentsView recents) {
        if (pendingDismissRecents.get() == recents && pendingDismissOrdinal >= 0) {
            TaskView dismissedFocus = getTaskForOrdinal(recents, pendingDismissOrdinal);
            int dismissedPage = dismissedFocus == null
                    ? -1 : recents.indexOfChild(dismissedFocus);
            if (dismissedPage >= 0) {
                return dismissedPage;
            }
        }
        if (entryAnchorRecents.get() == recents
                && entryAnchorPage >= 0
                && entryAnchorPage < recents.getChildCount()
                && recents.getChildAt(entryAnchorPage) instanceof TaskView) {
            return entryAnchorPage;
        }
        int nearest = findNearestTaskPage(recents,
                recents.getPagedOrientationHandler().getPrimaryScroll(recents));
        if (nearest >= 0) {
            return nearest;
        }
        int next = recents.getNextPage();
        if (next >= 0 && next < recents.getChildCount()
                && recents.getChildAt(next) instanceof TaskView) {
            return next;
        }
        return recents.getCurrentPage();
    }

    /** Maps the real pager scroll onto TaskView ordinals using actual adjacent
     * page scrolls.  It has no allocations and remains valid with non-task pages
     * or non-uniform page spacing. */
    private static float getTaskPagePositionForScroll(
            RecentsView recents, float scroll, int fallbackPage) {
        int fallbackOrdinal = getTaskOrdinalForChildIndex(recents, fallbackPage);
        int ordinal = 0;
        float previousScroll = 0.0f;
        boolean havePrevious = false;
        boolean haveUsableSegment = false;
        float bestPosition = fallbackOrdinal >= 0 ? fallbackOrdinal : 0.0f;
        float bestDistance = Float.POSITIVE_INFINITY;

        for (int i = 0; i < recents.getChildCount(); i++) {
            if (!(recents.getChildAt(i) instanceof TaskView)) {
                continue;
            }
            float currentScroll = recents.getScrollForPage(i);
            float pointDistance = Math.abs(scroll - currentScroll);
            if (pointDistance < bestDistance) {
                bestDistance = pointDistance;
                bestPosition = ordinal;
            }
            if (havePrevious) {
                float delta = currentScroll - previousScroll;
                if (Math.abs(delta) >= 1.0f) {
                    haveUsableSegment = true;
                    float t = clamp((scroll - previousScroll) / delta);
                    float projected = previousScroll + (delta * t);
                    float distance = Math.abs(scroll - projected);
                    if (distance <= bestDistance) {
                        bestDistance = distance;
                        bestPosition = ordinal - 1.0f + t;
                    }
                }
            }
            previousScroll = currentScroll;
            havePrevious = true;
            ordinal++;
        }
        if (!haveUsableSegment && fallbackOrdinal >= 0) {
            return fallbackOrdinal;
        }
        return Math.max(0.0f, Math.min(ordinal - 1.0f, bestPosition));
    }

    private static float getCenterForDepth(RecentsView recents, float depth) {
        RecentsPagedOrientationHandler handler = recents.getPagedOrientationHandler();
        float primarySize = handler.getPrimarySize(recents);
        return getMiuiCenter(primarySize,
                MIUI_FOCUS_DEPTH - (MIUI_DEPTH_STEP * depth));
    }

    private static float getScaleForDepth(float depth) {
        float miuiDepth = MIUI_FOCUS_DEPTH - (MIUI_DEPTH_STEP * depth);
        return focusScale * getMiuiScaleRatio(miuiDepth);
    }

    private static float getMiuiInteriorCorrection(float pagePosition, int taskCount) {
        if (taskCount <= 1) {
            return 0.0f;
        }
        /* Xiaomi's newest endpoint is centered, while every selected history
         * page uses the same 53.75% focus center, including the oldest page.
         * Attenuating this correction from the total task count made an upper
         * (newer) card move sideways when a dismissal changed N -> N - 1.
         * Base the correction only on continuous pager progress so removing a
         * child cannot alter any card that was above the dismissed one. */
        return MIUI_INTERIOR_SCROLL_CORRECTION * clamp(pagePosition);
    }

    private static float getMiuiDepth(float taskPosition,
            float pagePosition, int taskCount) {
        float correctedPagePosition = pagePosition
                + getMiuiInteriorCorrection(pagePosition, taskCount);
        return MIUI_FOCUS_DEPTH
                - (MIUI_DEPTH_STEP * (taskPosition - correctedPagePosition));
    }

    private static float getMiuiScaleTerm(float depth) {
        return 1.0f + (MIUI_DEPTH_SCALE_GAIN * depth);
    }

    private static float getMiuiScaleRatio(float depth) {
        return getMiuiScaleTerm(depth) / getMiuiScaleTerm(MIUI_FOCUS_DEPTH);
    }

    private static float getMiuiCenter(float primarySize, float depth) {
        float scaleTerm = getMiuiScaleTerm(depth);
        float offset = scaleTerm * primarySize * (
                MIUI_BASE_OFFSET_FRACTION
                        + (float) Math.exp(MIUI_EXP_RATE * depth)
                        - (0.5f * (1.0f - MIUI_BASE_TASK_SCALE)));
        return (primarySize * 0.5f) + offset;
    }

    private static float valueAlongDepth(float depth, float start, float rate) {
        return clamp((-depth - start) * rate);
    }

    private static float getMiuiAlpha(float depth) {
        float alpha = 1.0f - valueAlongDepth(depth,
                MIUI_ALPHA_START, MIUI_ALPHA_RATE);
        return alpha < 0.01f ? 0.0f : alpha;
    }

    private static float getMiuiTitleAlpha(float depth) {
        return 1.0f - valueAlongDepth(depth,
                MIUI_TITLE_START, MIUI_TITLE_RATE);
    }

    public static void update(RecentsView recents) {
        try {
            if (drawUpdateRecents.get() == recents) {
                drawUpdatePending = false;
            }
            if (!recents.isNativeStackStyle()) {
                resetIfNeeded(recents);
                return;
            }

            final RecentsPagedOrientationHandler handler = recents.getPagedOrientationHandler();
            final int primarySize = handler.getPrimarySize(recents);
            if (primarySize <= 0) {
                return;
            }

            loadConfig(recents.getResources());

            int firstTaskIndex = -1;
            int firstTaskScroll = 0;
            float stride = 0.0f;
            int taskCount = 0;
            final int childCount = recents.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View child = recents.getChildAt(i);
                if (!(child instanceof TaskView)) {
                    continue;
                }
                taskCount++;
                if (firstTaskIndex < 0) {
                    firstTaskIndex = i;
                    firstTaskScroll = recents.getScrollForPage(i);
                } else if (Math.abs(stride) < 1.0f) {
                    stride = recents.getScrollForPage(i) - firstTaskScroll;
                }
            }

            if (taskCount == 0) {
                updateDecorations(recents, 0);
                resetIfNeeded(recents);
                return;
            }

            final boolean entryLoading = recents.isNativeStackEntryPending()
                    || (overviewEntryPending && overviewPendingRecents.get() == recents);
            final boolean liveEntryRunning = recents.isRecentsAnimationRunning();
            if (isEntryTransitionActive(recents)) {
                if (!isEntryTaskOrderActive(recents)) {
                    TaskView preferred = getPreferredEntryTask(recents);
                    if (preferred != null) {
                        captureEntryTaskOrder(recents, preferred);
                    }
                } else {
                    ensureEntryTaskOrder(recents);
                }
            }
            final boolean stableEntryOrder = isEntryTaskOrderActive(recents);
            final boolean waitingForLiveEntryAnchor = entryLoading
                    && liveEntryRunning && !stableEntryOrder;
            final int entryReadyPage = stableEntryOrder
                    ? resolveEntryAnchorPage(recents) : -1;
            final boolean entryDeckReady = !entryLoading
                    || (stableEntryOrder && !waitingForLiveEntryAnchor
                    && isEntryGeometryReady(recents, entryReadyPage));
            if (Math.abs(stride) < 1.0f) {
                stride = primarySize * 0.72f;
            }

            final boolean firstApply = !recents.isNativeStackApplied();
            if (firstApply) {
                recents.setNativeStackApplied(true);
                Log.i(TAG, "enabled: horizontal paging + upward dismiss; tasks=" + taskCount);
            }

            updateDecorations(recents, taskCount);

            /*
             * nativeScroll is the real RedMagic ViewGroup scroll used to find
             * each child's current on-screen center.  scroll is only the MiUI
             * logical sample and may be clamped/anchored to a real task page.
             * Conflating the two shifts the whole deck off-screen during the
             * Home -> Overview transition.
             */
            final float nativeScroll = handler.getPrimaryScroll(recents);
            float scroll = nativeScroll;
            OverScroller scroller = recents.getScroller();
            boolean pagerAnimating = scroller != null && !scroller.isFinished();
            if (stableEntryOrder) {
                int liveEntryPage = resolveEntryAnchorPage(recents);
                if (liveEntryPage >= 0 && liveEntryPage < recents.getChildCount()) {
                    scroll = recents.getScrollForPage(liveEntryPage);
                }
            } else if (entryLoading && taskCount >= 1) {
                int initialOrdinal = getInitialTaskOrdinal(recents, taskCount);
                TaskView initialTask = getTaskForOrdinal(recents, initialOrdinal);
                int initialPage = initialTask == null
                        ? -1 : recents.indexOfChild(initialTask);
                if (initialPage >= 0) {
                    scroll = recents.getScrollForPage(initialPage);
                }
            }

            /*
             * The OEM pager can overscroll beyond its first/last TaskView.
             * Xiaomi's stack scroll is strictly [-lastTask, 0], so clamp only
             * the visual sample while leaving the native scroller untouched.
             */
            float pagePosition;
            if (pendingDismissRecents.get() == recents
                    && !Float.isNaN(pendingDismissPagePosition)) {
                pagePosition = Math.max(0.0f, Math.min(taskCount - 1.0f,
                        pendingDismissPagePosition));
            } else {
                pagePosition = stableEntryOrder ? getEntryPagePosition(recents, entryTaskOrderSize)
                        : getTaskPagePositionForScroll(
                                recents, scroll, recents.getCurrentPage());
            }
            int visualTaskCount = stableEntryOrder ? entryTaskOrderSize : taskCount;

            if (firstApply) {
                Log.i(TAG, "geometry nativeScroll=" + nativeScroll
                        + " sampleScroll=" + scroll
                        + " firstTaskScroll=" + firstTaskScroll
                        + " stride=" + stride
                        + " pagePosition=" + pagePosition
                        + " currentPage=" + recents.getCurrentPage());
            }

            if (!recents.isHandlingTouch() && !pagerAnimating) {
                int auditedPage = recents.getCurrentPage();
                if (pagerAuditRecents.get() != recents || lastAuditedPage != auditedPage) {
                    pagerAuditRecents = new WeakReference<>(recents);
                    lastAuditedPage = auditedPage;
                    boolean taskPage = auditedPage >= 0
                            && auditedPage < recents.getChildCount()
                            && recents.getChildAt(auditedPage) instanceof TaskView;
                    Log.i(TAG, "settled pager page=" + auditedPage
                            + " taskPage=" + taskPage
                            + " taskPosition=" + pagePosition
                            + " firstTaskPage=" + firstTaskIndex);
                }
            }

            final boolean horizontalPrimary = Math.abs(
                    handler.getPrimaryValue(1.0f, 0.0f)) > 0.5f;
            final float secondarySize = horizontalPrimary
                    ? recents.getHeight() : recents.getWidth();
            final float revealProgress = entryRevealRecents.get() == recents
                    ? clamp(entryRevealProgress) : 1.0f;
            final float revealScale = 0.94f + (0.06f * revealProgress);
            final float revealPrimary = -0.56f * primarySize
                    * (1.0f - revealProgress);
            final float revealSecondary = 0.02f * secondarySize
                    * (1.0f - revealProgress);
            boolean dismissInProgress = isDismissTransitionActive(recents);
            /* Recompute occlusion from this same frame's centers while paging.
             * Clearing every clip during motion exposes complete overlapping
             * surfaces for one frame whenever Z/order changes, which is the
             * switch flash visible in test6.mp4.  Dismiss remains unclipped so
             * the promoted card can never inherit a settled half-card bound. */
            int childCursor = 0;
            float higherLayerStart = Float.POSITIVE_INFINITY;

            for (int taskOrdinal = 0; taskOrdinal < visualTaskCount; taskOrdinal++) {
                TaskView task = null;
                if (stableEntryOrder) {
                    task = getEntryTaskForOrdinal(recents, taskOrdinal);
                } else {
                    while (childCursor < childCount && task == null) {
                        View child = recents.getChildAt(childCursor++);
                        if (child instanceof TaskView) {
                            task = (TaskView) child;
                        }
                    }
                }
                if (task == null) {
                    continue;
                }
                float taskPosition = taskOrdinal;
                float depth = getMiuiDepth(
                        taskPosition, pagePosition, visualTaskCount);

                /*
                 * This is the MiuiHome 6.01 stack curve.  A zero offset always
                 * centers the focused task.  Older tasks converge exponentially
                 * on the left; newer tasks move to the right with the same
                 * continuous depth while the native RedMagic pager supplies
                 * drag, fling and snap timing.
                */
                float finalCenter = getMiuiCenter(primarySize, depth);
                float desiredCenter = finalCenter + revealPrimary;
                float finalStackScale = focusScale * getMiuiScaleRatio(depth);
                float stackScale = finalStackScale;
                float stackAlpha = getMiuiAlpha(depth);
                float stackZ = 100.0f - taskPosition;

                float projectedStart = desiredCenter
                        - (handler.getPrimarySize(task) * stackScale * 0.5f);
                if (projectedStart > primarySize * 1.08f) {
                    stackAlpha = 0.0f;
                }

                float currentPrimaryTranslation = handler.getPrimaryValue(
                        task.getTranslationX(), task.getTranslationY());
                float oldStackPrimary = handler.getPrimaryValue(
                        task.getNativeStackTranslationX(),
                        task.getNativeStackTranslationY());
                float dismissPrimary = handler.getPrimaryValue(
                        task.getNativeDismissTranslationX(),
                        task.getNativeDismissTranslationY());
                float nativeCenter = handler.getChildStart(task)
                        + (handler.getPrimarySize(task) * 0.5f)
                        - nativeScroll
                        + currentPrimaryTranslation
                        - oldStackPrimary
                        - dismissPrimary;
                float stackPrimary = desiredCenter - nativeCenter;

                /* TaskView's pivot is the snapshot center.  Align that visual
                 * center, not the outer view (which includes the title rail),
                 * to the middle of the screen.  Subtract dismiss translation so
                 * the OEM upward-swipe field remains fully additive. */
                float currentSecondaryTranslation = handler.getSecondaryValue(
                        task.getTranslationX(), task.getTranslationY());
                float oldStackSecondary = handler.getSecondaryValue(
                        task.getNativeStackTranslationX(),
                        task.getNativeStackTranslationY());
                float dismissSecondary = handler.getSecondaryValue(
                        task.getNativeDismissTranslationX(),
                        task.getNativeDismissTranslationY());
                float layoutSecondaryPivot = handler.getSecondaryValue(
                        task.getLeft() + task.getPivotX(),
                        task.getTop() + task.getPivotY());
                float nativeSecondaryPivot = layoutSecondaryPivot
                        + currentSecondaryTranslation
                        - oldStackSecondary
                        - dismissSecondary;
                float stackSecondary = (secondarySize * 0.5f)
                        - nativeSecondaryPivot + revealSecondary;

                stackScale *= revealScale;
                stackAlpha *= revealProgress;
                if (waitingForLiveEntryAnchor
                        || (entryLoading && !entryDeckReady && taskOrdinal > 0)) {
                    /* Hide stale cached children only until a coherent task
                     * identity order and drawable page geometry exist.  Once
                     * ready, the back deck must join the still-running live
                     * app animation instead of appearing after it has settled. */
                    stackAlpha = 0.0f;
                }
                /* Clip/chrome geometry is constant throughout the common entry
                 * translation.  Keeping it at the final deck geometry avoids a
                 * clip-bounds and TextView-alpha write for every card/frame. */
                float displayedStart = finalCenter
                        - (handler.getPrimarySize(task) * finalStackScale * 0.5f);
                float displayedEnd = finalCenter
                        + (handler.getPrimarySize(task) * finalStackScale * 0.5f);
                float stackX = handler.getPrimaryValue(stackPrimary, stackSecondary);
                float stackY = handler.getSecondaryValue(stackPrimary, stackSecondary);
                boolean dismissLayer = isPendingDismissTask(recents, task)
                        || (gestureLayerTask.get() == task
                        && (Math.abs(task.getNativeDismissTranslationX()) > 1.0f
                        || Math.abs(task.getNativeDismissTranslationY()) > 1.0f));
                boolean dismissReflowLayer = isPendingDismissReflowTask(recents, task);
                task.setNativeStackTransform(
                        stackX, stackY, stackScale, stackAlpha,
                        stackZ);
                if (stableEntryOrder) {
                    settleEntryPresentation(task);
                }

                /*
                 * Every back TaskView used to submit its complete, screen-sized
                 * thumbnail even though only a narrow left edge was visible.
                 * Clip it at the first higher-Z card, leaving a tiny overlap for
                 * antialiasing/shadow continuity.  This removes the dominant GPU
                 * overdraw on entry and during post-dismiss reflow.
                 */
                if (entryLoading && !entryDeckReady) {
                    task.setNativeStackClipRight(taskOrdinal == 0 ? -1 : 0);
                } else if (!horizontalPrimary || dismissLayer || dismissReflowLayer) {
                    task.setNativeStackClipRight(-1);
                } else if (stackAlpha <= 0.01f) {
                    task.setNativeStackClipRight(0);
                } else if (higherLayerStart != Float.POSITIVE_INFINITY) {
                    float shadowAllowance = 3.0f
                            * recents.getResources().getDisplayMetrics().density;
                    int clipRight = Math.round((higherLayerStart - displayedStart
                            + shadowAllowance) / Math.max(0.01f, stackScale));
                    clipRight = Math.max(0, Math.min(task.getWidth(), clipRight));
                    task.setNativeStackClipRight(
                            clipRight >= task.getWidth() ? -1 : clipRight);
                } else {
                    task.setNativeStackClipRight(-1);
                }

                float baseChromeAlpha = getMiuiTitleAlpha(depth);
                float titleSpaceAlpha = 1.0f;
                float actionSpaceAlpha = 1.0f;
                if (horizontalPrimary && baseChromeAlpha > 0.001f) {
                    TextView title = task.getNativeStackTitleView();
                    titleSpaceAlpha = getFullyVisibleFactor(recents, task, title,
                            displayedStart, displayedEnd, stackScale,
                            higherLayerStart, primarySize);

                    actionSpaceAlpha = getActionsVisibleFactor(recents, task,
                            displayedStart, displayedEnd, stackScale,
                            higherLayerStart, primarySize);
                }
                if (entryLoading && !entryDeckReady) {
                    task.setNativeStackChromeAlpha(0.0f, 0.0f);
                } else if (!dismissInProgress) {
                    task.setNativeStackChromeAlpha(
                            baseChromeAlpha * titleSpaceAlpha,
                            baseChromeAlpha * actionSpaceAlpha);
                }

                if (stackAlpha > 0.01f && !dismissLayer) {
                    higherLayerStart = Math.min(higherLayerStart, displayedStart);
                }
            }
            if (entryLoading) {
                finishCachedEntryStagingIfReady(recents, primarySize);
            }
        } catch (Throwable error) {
            long now = android.os.SystemClock.uptimeMillis();
            if (now - lastErrorLogMs > 3000L) {
                lastErrorLogMs = now;
                Log.e(TAG, "stack transform failed; preserving native Recents", error);
            }
        }
    }

    private static void resetIfNeeded(RecentsView recents) {
        if (!recents.isNativeStackApplied()) {
            return;
        }
        for (int i = 0; i < recents.getChildCount(); i++) {
            View child = recents.getChildAt(i);
            if (child instanceof TaskView) {
                TaskView task = (TaskView) child;
                task.setNativeStackTransform(
                        0.0f, 0.0f, 1.0f, 1.0f, 0.0f);
                task.setNativeStackClipRight(-1);
                task.setNativeStackChromeAlpha(1.0f, 1.0f);
            }
        }
        updateDecorations(recents, -1);
        clearEntryTaskOrder(recents);
        recents.setNativeStackApplied(false);
        Log.i(TAG, "disabled: native standard/grid transforms restored");
    }

    private static void loadConfig(Resources resources) {
        int densityDpi = resources.getDisplayMetrics().densityDpi;
        if (cachedDensityDpi == densityDpi) {
            return;
        }
        focusCenterFraction = resources.getInteger(RES_FOCUS_CENTER) / 1000.0f;
        firstBackCenterFraction = resources.getInteger(RES_FIRST_BACK_CENTER) / 1000.0f;
        tailGapFraction = resources.getInteger(RES_TAIL_GAP) / 1000.0f;
        tailDecay = resources.getInteger(RES_TAIL_DECAY) / 1000.0f;
        focusScale = resources.getInteger(RES_FOCUS_SCALE) / 1000.0f;
        scaleStep = resources.getInteger(RES_SCALE_STEP) / 1000.0f;
        maxDepth = Math.max(1, resources.getInteger(RES_MAX_DEPTH));
        incomingDistanceFraction = resources.getInteger(RES_INCOMING_DISTANCE) / 1000.0f;
        incomingScaleGain = resources.getInteger(RES_INCOMING_SCALE_GAIN) / 1000.0f;
        minBackScale = resources.getInteger(RES_MIN_BACK_SCALE) / 1000.0f;
        nativeCenterCorrectionFraction = resources.getInteger(
                RES_NATIVE_CENTER_CORRECTION) / 1000.0f;
        cachedDensityDpi = densityDpi;
    }

    private static float clamp(float value) {
        return Math.max(0.0f, Math.min(1.0f, value));
    }

    private static float getActionsVisibleFactor(RecentsView recents,
            TaskView task, float displayedStart, float displayedEnd,
            float scale, float higherLayerStart, int primarySize) {
        float factor = 1.0f;
        boolean hasVisibleAction = false;
        View action = task.getMMiniWindowButton();
        if (action != null && action.getVisibility() == View.VISIBLE) {
            hasVisibleAction = true;
            factor = Math.min(factor, getFullyVisibleFactor(recents, task,
                    action, displayedStart, displayedEnd, scale,
                    higherLayerStart, primarySize));
        }
        action = task.getMSplitScreenButton();
        if (action != null && action.getVisibility() == View.VISIBLE) {
            hasVisibleAction = true;
            factor = Math.min(factor, getFullyVisibleFactor(recents, task,
                    action, displayedStart, displayedEnd, scale,
                    higherLayerStart, primarySize));
        }
        action = task.getMMenuButton();
        if (action != null && action.getVisibility() == View.VISIBLE) {
            hasVisibleAction = true;
            factor = Math.min(factor, getFullyVisibleFactor(recents, task,
                    action, displayedStart, displayedEnd, scale,
                    higherLayerStart, primarySize));
        }
        return hasVisibleAction ? factor : 0.0f;
    }

    /**
     * Maps a title/action descendant into the displayed deck coordinate and
     * returns non-zero only after the whole control fits inside both the screen
     * and the unoccluded slice left by every higher-Z card.
     */
    private static float getFullyVisibleFactor(RecentsView recents,
            TaskView task, View descendant, float displayedStart,
            float displayedEnd, float scale, float higherLayerStart,
            int primarySize) {
        if (descendant == null || descendant.getVisibility() != View.VISIBLE
                || descendant.getWidth() <= 0 || descendant.getHeight() <= 0) {
            return 0.0f;
        }
        if (descendant instanceof TextView) {
            Layout textLayout = ((TextView) descendant).getLayout();
            if (textLayout == null || textLayout.getLineCount() == 0) {
                return 0.0f;
            }
            for (int line = 0; line < textLayout.getLineCount(); line++) {
                if (textLayout.getEllipsisCount(line) > 0) {
                    return 0.0f;
                }
            }
        }
        Rect bounds = TEMP_DESCENDANT_BOUNDS;
        descendant.getDrawingRect(bounds);
        task.offsetDescendantRectToMyCoords(descendant, bounds);

        float left = displayedStart + (bounds.left * scale);
        float right = displayedStart + (bounds.right * scale);
        float density = recents.getResources().getDisplayMetrics().density;
        float margin = 4.0f * density;
        float availableLeft = margin;
        float availableRight = Math.min(primarySize - margin,
                higherLayerStart - margin);
        if (left < availableLeft || right > availableRight) {
            return 0.0f;
        }

        /* Fade in only after it already fits; partially clipped controls stay hidden. */
        float spare = Math.min(left - availableLeft, availableRight - right);
        float fadeDistance = 6.0f * density;
        return clamp((spare + 1.0f) / fadeDistance);
    }

    /** Keeps Xiaomi's memory line and empty state out of the OEM pager itself. */
    private static void updateDecorations(RecentsView recents, int taskCount) {
        /* Task-list callbacks can arrive after the last-card dismissal has
         * already returned Launcher to HOME.  Decorations are siblings of the
         * pager, so a late zero-task callback must not make them visible over
         * the workspace. */
        if (taskCount >= 0
                && (!overviewActive || activeOverviewRecents.get() != recents)) {
            taskCount = -1;
        }
        long now = android.os.SystemClock.uptimeMillis();
        View root = recents.getRootView();
        int rootWidth = root.getWidth();
        int rootHeight = root.getHeight();
        boolean showMemory = isMemoryInfoEnabled(recents.getContext());
        boolean sameState = decorationRecents.get() == recents
                && lastDecorationTaskCount == taskCount
                && lastDecorationWidth == rootWidth
                && lastDecorationHeight == rootHeight
                && lastDecorationShowMemory == showMemory;
        if (sameState && (taskCount < 0 || now - lastMemoryUpdateMs < 2000L)) {
            return;
        }
        decorationRecents = new WeakReference<>(recents);
        lastDecorationTaskCount = taskCount;
        lastDecorationWidth = rootWidth;
        lastDecorationHeight = rootHeight;
        lastDecorationShowMemory = showMemory;

        View memoryContainer = root.findViewById(RES_MEMORY_CONTAINER);
        View emptyMessage = root.findViewById(RES_EMPTY_MESSAGE);
        View clearAll = root.findViewById(RES_CLEAR_ALL_CONTAINER);
        View clearButton = root.findViewById(RES_CLEAR_ALL_BUTTON);

        if (taskCount < 0) {
            resetClearAllGeometry(clearAll, clearButton);
            setVisibilityIfChanged(memoryContainer, View.GONE);
            setVisibilityIfChanged(emptyMessage, View.GONE);
            setVisibilityIfChanged(clearAll, View.VISIBLE);
            return;
        }

        setVisibilityIfChanged(memoryContainer,
                showMemory ? View.VISIBLE : View.GONE);
        setVisibilityIfChanged(emptyMessage,
                taskCount == 0 ? View.VISIBLE : View.GONE);
        setVisibilityIfChanged(clearAll,
                taskCount == 0 ? View.GONE : View.VISIBLE);
        applyStackClearAllGeometry(root, clearAll, clearButton);

        if (!showMemory || now - lastMemoryUpdateMs < 2000L) return;
        scheduleMemoryRefresh(recents);
    }

    private static void scheduleMemoryRefresh(RecentsView recents) {
        if (memoryRefreshScheduled && memoryRefreshRecents.get() == recents) {
            return;
        }
        memoryRefreshScheduled = true;
        memoryRefreshRecents = new WeakReference<>(recents);
        recents.postDelayed(new MemoryRefresh(recents), 360L);
    }

    private static void refreshMemoryLabels(RecentsView recents) {
        View root = recents.getRootView();
        View memoryContainer = root.findViewById(RES_MEMORY_CONTAINER);
        if (!isMemoryInfoEnabled(recents.getContext())) {
            setVisibilityIfChanged(memoryContainer, View.GONE);
            return;
        }

        TextView availableView = (TextView) root.findViewById(RES_MEMORY_AVAILABLE);
        TextView totalView = (TextView) root.findViewById(RES_MEMORY_TOTAL);
        if (availableView == null || totalView == null) return;

        ActivityManager manager = (ActivityManager) recents.getContext()
                .getSystemService(android.content.Context.ACTIVITY_SERVICE);
        if (manager == null) return;
        ActivityManager.MemoryInfo info = new ActivityManager.MemoryInfo();
        manager.getMemoryInfo(info);
        lastMemoryUpdateMs = android.os.SystemClock.uptimeMillis();
        double gib = 1024.0d * 1024.0d * 1024.0d;
        Resources resources = recents.getResources();
        availableView.setText(resources.getString(
                RES_MEMORY_AVAILABLE_FORMAT, Double.valueOf(info.availMem / gib)));
        totalView.setText(resources.getString(
                RES_MEMORY_TOTAL_FORMAT, Double.valueOf(info.totalMem / gib)));
    }

    private static void applyStackClearAllGeometry(
            View root, View clearAll, View clearButton) {
        if (!(root instanceof ViewGroup) || clearAll == null || clearButton == null
                || root.getWidth() <= 0 || root.getHeight() <= 0
                || clearAll.getWidth() <= 0 || clearAll.getHeight() <= 0
                || clearButton.getWidth() <= 0) {
            return;
        }
        /* The Xiaomi portrait decoration lives much lower than RedMagic's
         * shared actions container.  Keep this transform local to style 3. */
        if (root.getHeight() <= root.getWidth()) {
            resetClearAllGeometry(clearAll, clearButton);
            return;
        }
        /* Move the whole native actions host instead of only translating its
         * child.  This keeps RedMagic's original click-container size while
         * aligning that unchanged hit target with the visible clear button. */
        View actionHost = getClearAllActionHost(clearAll);
        if (actionHost != null) {
            View previousHost = translatedClearAllHost.get();
            if (previousHost != actionHost) {
                if (previousHost != null) {
                    previousHost.setTranslationY(clearAllHostBaseTranslationY);
                }
                translatedClearAllHost = new WeakReference<>(actionHost);
                clearAllHostBaseTranslationY = actionHost.getTranslationY();
            }
            clearAll.setTranslationY(0.0f);
            setClearAllParentClipping(clearAll, true);
        } else {
            setClearAllParentClipping(clearAll, false);
        }
        clearAll.getLocationOnScreen(TEMP_VIEW_LOCATION);
        root.getLocationOnScreen(TEMP_ROOT_LOCATION);
        /* getLocationOnScreen includes the existing translation.  Remove it
         * before calculating the target so repeated updateDecorations() calls
         * are idempotent during a dismiss/reload. */
        float baseCenterY = TEMP_VIEW_LOCATION[1] - TEMP_ROOT_LOCATION[1]
                - clearAll.getTranslationY() + (clearAll.getHeight() * 0.5f);
        if (actionHost != null) {
            baseCenterY -= actionHost.getTranslationY();
        }
        float desiredCenterY = root.getHeight() * 0.92484375f;
        if (actionHost != null) {
            actionHost.setTranslationY(desiredCenterY - baseCenterY);
        } else {
            clearAll.setTranslationY(desiredCenterY - baseCenterY);
        }

        /* Keep the OEM drawable/layout size.  The stack decoration may move
         * the native host, but must not enlarge either the circle or its hit
         * region. */
        clearButton.setScaleX(1.0f);
        clearButton.setScaleY(1.0f);
    }

    private static void resetClearAllGeometry(View clearAll, View clearButton) {
        View translatedHost = translatedClearAllHost.get();
        if (translatedHost != null) {
            translatedHost.setTranslationY(clearAllHostBaseTranslationY);
        }
        translatedClearAllHost.clear();
        clearAllHostBaseTranslationY = 0.0f;
        if (clearAll != null) {
            clearAll.setTranslationY(0.0f);
            setClearAllParentClipping(clearAll, true);
        }
        if (clearButton != null) {
            clearButton.setScaleX(1.0f);
            clearButton.setScaleY(1.0f);
        }
    }

    private static View getClearAllActionHost(View clearAll) {
        ViewParent parent = clearAll.getParent();
        if (!(parent instanceof View)) return null;
        ViewParent grandParent = parent.getParent();
        return grandParent instanceof View ? (View) grandParent : null;
    }

    private static void setClearAllParentClipping(View clearAll, boolean clip) {
        ViewParent parent = clearAll.getParent();
        for (int depth = 0; depth < 2 && parent instanceof ViewGroup; depth++) {
            ViewGroup group = (ViewGroup) parent;
            group.setClipChildren(clip);
            group.setClipToPadding(clip);
            parent = group.getParent();
        }
    }

    private static void setVisibilityIfChanged(View view, int visibility) {
        if (view != null && view.getVisibility() != visibility) {
            view.setVisibility(visibility);
        }
    }
}
