#!/usr/bin/env python3
"""Static guardrails for the Xiaomi-aligned RedMagic Recents stack."""

from pathlib import Path
import re
import struct
import sys


ROOT = Path(__file__).resolve().parents[1]
STACK = ROOT / "redmagic-launcher"
SRC = STACK / "src"


def require(source: str, needle: str, message: str) -> None:
    if needle not in source:
        raise AssertionError(message)


def method(source: str, header: str) -> str:
    start = source.find(header)
    if start < 0:
        raise AssertionError(f"missing method: {header}")
    end = source.find(".end method", start)
    if end < 0:
        raise AssertionError(f"unterminated method: {header}")
    return source[start:end]


def resource_value(source: str, name: str) -> int:
    match = re.search(
        rf'<integer\s+name="{re.escape(name)}">(\d+)</integer>', source
    )
    if not match:
        raise AssertionError(f"missing integer resource: {name}")
    return int(match.group(1))


def main() -> int:
    helper = (SRC / "smali_classes2/com/android/quickstep/views/LsNativeStack.smali").read_text(
        encoding="utf-8"
    )
    helper_java = (
        STACK
        / "helper-src/main/com/android/quickstep/views/LsNativeStack.java"
    ).read_text(encoding="utf-8")
    initial_commit = (
        SRC / "smali_classes2/com/android/quickstep/views/LsNativeStack$InitialFrameCommit.smali"
    ).read_text(encoding="utf-8")
    recents = (SRC / "smali_classes2/com/android/quickstep/views/RecentsView.smali").read_text(
        encoding="utf-8"
    )
    task = (SRC / "smali_classes2/com/android/quickstep/views/TaskView.smali").read_text(
        encoding="utf-8"
    )
    simulator = (
        SRC / "smali_classes2/com/android/quickstep/util/TaskViewSimulator.smali"
    ).read_text(encoding="utf-8")
    swipe_handler = (
        SRC / "smali/com/android/quickstep/AbsSwipeUpHandler.smali"
    ).read_text(encoding="utf-8")
    config = (SRC / "res/values/recents_stack_config.xml").read_text(encoding="utf-8")
    dimens = (SRC / "res/values/dimens.xml").read_text(encoding="utf-8")
    overview = (SRC / "res/layout/overview_panel.xml").read_text(encoding="utf-8")
    style_activity = (
        SRC / "smali/com/android/launcher3/settings/RecentAppStyleActivity.smali"
    ).read_text(encoding="utf-8")
    style_layout = (
        SRC / "res/layout/setting_recent_app_style_layout.xml"
    ).read_text(encoding="utf-8")
    stack_card = (
        SRC / "res/layout/recent_style_stack_card.xml"
    ).read_text(encoding="utf-8")
    strings_zh = (
        SRC / "res/values-zh-rCN/strings.xml"
    ).read_text(encoding="utf-8")

    expected = {
        "recents_stack_focus_center_permille": 538,
        "recents_stack_first_back_center_permille": 372,
        "recents_stack_tail_gap_permille": 56,
        "recents_stack_tail_decay_permille": 310,
        "recents_stack_focus_scale_permille": 1100,
        "recents_stack_scale_step_permille": 26,
        "recents_stack_incoming_distance_permille": 472,
        "recents_stack_incoming_scale_gain_permille": 25,
        "recents_stack_min_back_scale_permille": 895,
        "recents_stack_native_center_correction_permille": 0,
        "recents_stack_max_depth": 4,
    }
    for name, value in expected.items():
        actual = resource_value(config, name)
        if actual != value:
            raise AssertionError(f"{name}: expected {value}, got {actual}")

    require(
        stack_card,
        "@drawable/pic_recentapp_stack_lispace_iceblue",
        "stack-style selector does not use the LiSpace ice-blue preview",
    )
    require(
        style_layout,
        'android:id="@id/recents_stack_memory_switch_card"',
        "memory-information switch row is missing from the style page",
    )
    if style_layout.index("recents_stack_memory_switch_card") < style_layout.index(
        'layout="@layout/recent_style_stack_card"'
    ):
        raise AssertionError("memory-information switch is not below the stack card")
    memory_row = style_layout[style_layout.index("recents_stack_memory_switch_card") :]
    require(
        memory_row,
        'android:layout_marginStart="@dimen/padding05"',
        "memory switch label is not aligned with the stack-style label",
    )
    require(
        memory_row,
        'android:layout_marginEnd="@dimen/padding05"',
        "memory switch right edge is not aligned with the stack-style selector",
    )
    require(strings_zh, ">显示内存信息</string>", "memory switch Chinese label is missing")
    require(
        style_activity,
        'const-string v1, "ls_recents_stack_show_memory"',
        "memory switch state is not restored",
    )
    require(
        style_activity,
        'const-string v2, "ls_recents_stack_show_memory"',
        "memory switch state is not persisted",
    )
    require(
        helper_java,
        "getBoolean(PREF_SHOW_MEMORY, true)",
        "memory overlay is not guarded by its independent preference",
    )
    require(
        helper_java,
        "showMemory ? View.VISIBLE : View.GONE",
        "memory overlay visibility does not follow the switch",
    )
    preview = SRC / "res/drawable-xxxhdpi/pic_recentapp_stack_lispace_iceblue.png"
    png_header = preview.read_bytes()[:24]
    if len(png_header) != 24 or png_header[:8] != b"\x89PNG\r\n\x1a\n":
        raise AssertionError("LiSpace stack preview is not a valid PNG")
    width, height = struct.unpack(">II", png_header[16:24])
    if (width, height) != (1280, 840):
        raise AssertionError(
            f"LiSpace stack preview: expected 1280x840, got {width}x{height}"
        )

    for resource_id in (
        "0x7f0c0109",
        "0x7f0c010a",
        "0x7f0c010b",
        "0x7f0c010c",
        "0x7f0c010d",
        "0x7f0c010e",
        "0x7f0c010f",
        "0x7f0c0110",
        "0x7f0b06c6",
    ):
        require(helper, resource_id, f"helper missing configured resource {resource_id}")

    require(helper, "Ljava/lang/Math;->exp(D)D", "MIUI depth spacing is not exponential")
    require(
        helper_java,
        "return MIUI_INTERIOR_SCROLL_CORRECTION * clamp(pagePosition);",
        "history-page focus still changes when the task count changes",
    )
    if "taskCount + 1.0f - pagePosition" in helper_java:
        raise AssertionError(
            "dismiss completion still shifts upper cards through task-count attenuation"
        )
    require(
        helper,
        "TaskView;->setNativeStackChromeAlpha(FF)V",
        "title/action depth fade missing",
    )
    require(helper, "ActivityManager;->getMemoryInfo", "memory display logic missing")
    require(helper, "isHandlingTouch()Z", "settled-page guard does not preserve dragging")
    require(helper, "OverScroller;->isFinished()Z", "settled-page guard does not preserve fling/snap")
    require(helper, "WeakReference", "entry anchor is not lifecycle-safe")
    require(helper, "MotionEvent;->getActionMasked()I", "entry anchor is not released on touch")
    require(helper, "const-wide/16", "memory refresh interval constant missing")
    require(helper, "0x7d0", "memory refresh is not rate-limited to 2 seconds")
    require(helper, "setEntryPageAligned", "strict entry page/scroll alignment missing")
    if "ENTRY_STABILIZATION_MS" in helper_java:
        raise AssertionError("entry still performs the visible 640 ms delayed correction")
    require(helper, "scheduleInitialFrameCommit", "strict entry lacks a geometry-ready fallback")
    require(
        helper_java,
        "entryAnchorTaskId",
        "entry anchor still follows a mutable child ordinal instead of task identity",
    )
    require(
        helper_java,
        "public static void onRecentsAnimationComplete(RecentsView recents)",
        "cached Overview re-entry has no animation-complete fallback commit",
    )
    require(
        recents,
        "LsNativeStack;->onRecentsAnimationComplete(Lcom/android/quickstep/views/RecentsView;)V",
        "Recents animation completion is not wired to the cached-entry fallback",
    )
    require(
        helper_java,
        "entryTaskOrderIds",
        "entry does not preserve one coherent task/Z order",
    )
    require(
        helper_java,
        "recents.getTaskViewByTaskId(entryAnchorTaskId)",
        "entry task identity is not rebound to the live TaskView",
    )
    initial_java_start = helper_java.find("private static int getInitialTaskOrdinal(")
    initial_java_end = helper_java.find(
        "private static void armEntryReveal(", initial_java_start
    )
    if initial_java_start < 0 or initial_java_end < 0:
        raise AssertionError("strict Xiaomi initial ordinal method missing")
    initial_java = helper_java[initial_java_start:initial_java_end]
    require(initial_java, "return 0;", "Home/single-task entry does not preserve first task")
    require(initial_java, "entryFromApp && activeOverviewRecents.get() == recents && taskCount > 1",
            "second-task focus is not restricted to this live app entry with multiple tasks")
    require(initial_java, "return 1;", "live app entry does not center the second task")
    require(helper_java, "pagePosition = stableEntryOrder ? getEntryPagePosition(recents, entryTaskOrderSize)",
            "visual entry does not share the live animator progress")
    require(swipe_handler, "LsNativeStack;->onLiveOverviewFrame(Landroid/animation/ValueAnimator;)V",
            "entry progress is not sampled from the native gesture animator")
    require(helper_java, "orderedViews[size] = preferredAnchor;",
            "entry focus change reordered the latest running task")
    if "getRunningTaskIndex" in initial_java:
        raise AssertionError("entry still overrides Xiaomi first-task anchor with the running task")
    entry_align_start = helper_java.find("private static void setEntryPageAligned(")
    entry_align_end = helper_java.find(
        "private static boolean isEntryTransitionActive(", entry_align_start
    )
    if entry_align_start < 0 or entry_align_end < 0:
        raise AssertionError("bounded entry page/scroll alignment method missing")
    entry_align = helper_java[entry_align_start:entry_align_end]
    require(
        entry_align,
        "recents.setNativeStackOverviewPage(page);",
        "entry does not clear the stale page-scroll delta while aligning",
    )
    if "recents.getCurrentPage() != page" in entry_align:
        raise AssertionError("entry still skips physical alignment when logical page already matches")
    require(
        helper_java,
        "entryLoading && taskCount >= 1",
        "single-task entry does not anchor its only task page",
    )
    if "startEntryTranslationLock(recents)" in helper_java:
        raise AssertionError("entry still freezes TaskView translations against partial layout")
    require(
        helper_java,
        "(entryLoading && !entryDeckReady && taskOrdinal > 0)",
        "partial load-plan entry does not gate stale back TaskViews on coherent geometry",
    )
    require(
        helper_java,
        "task.setNativeStackClipRight(taskOrdinal == 0 ? -1 : 0);",
        "entry staging does not keep one complete focus card",
    )
    require(
        helper_java,
        "task.setNativeStackChromeAlpha(0.0f, 0.0f);",
        "entry staging still exposes mismatched title/action chrome",
    )
    require(
        helper_java,
        "finishCachedEntryStagingIfReady(recents, primarySize);",
        "cached Home entry has no state-based staging release",
    )
    require(
        helper_java,
        "if (stableEntryOrder) {\n                    settleEntryPresentation(task);",
        "entry presentation repair does not cover the first live-entry frame",
    )
    require(
        helper_java,
        "private static TaskView getPreferredEntryTask(RecentsView recents)",
        "live entry has no running-task identity resolver",
    )
    live_anchor_start = helper_java.find(
        "private static TaskView getPreferredEntryTask(RecentsView recents)"
    )
    live_anchor_end = helper_java.find(
        "/** Captures one immutable visual order", live_anchor_start
    )
    if live_anchor_start < 0 or live_anchor_end < 0:
        raise AssertionError("live-entry anchor method missing")
    live_anchor = helper_java[live_anchor_start:live_anchor_end]
    require(
        live_anchor,
        "recents.isRecentsAnimationRunning()",
        "running task is not isolated to live app entry",
    )
    require(
        live_anchor,
        "recents.getRunningTaskIndex()",
        "live app entry does not use the running TaskView page",
    )
    if helper_java.count("getRunningTaskIndex()") != 1:
        raise AssertionError(
            "running-task identity escaped the isolated live-entry resolver"
        )
    require(
        helper_java,
        "waitingForLiveEntryAnchor",
        "old cached cards can render before the live running task is bound",
    )
    require(
        helper_java,
        "waitingForLiveEntryAnchor\n                        || (entryLoading && !entryDeckReady && taskOrdinal > 0)",
        "live-entry staging does not release the back deck after coherent geometry",
    )
    require(
        helper_java,
        "public static float getLiveRecentsScale(Context context, float nativeScale)",
        "live app surface does not share the Xiaomi front-card scale",
    )
    require(
        simulator,
        "LsNativeStack;->getLiveRecentsScale(Landroid/content/Context;F)F",
        "TaskViewSimulator still converges on RedMagic's smaller card scale",
    )
    if simulator.count(
        "LsNativeStack;->getLiveRecentsScale(Landroid/content/Context;F)F"
    ) != 2:
        raise AssertionError(
            "live scale must be symmetric for app entry and task launch"
        )
    require(
        helper_java,
        "public static float getLiveCarouselScale(Context context, float nativeScale)",
        "live app surface does not repair RedMagic's zero carousel scale",
    )
    if simulator.count(
        "LsNativeStack;->getLiveCarouselScale(Landroid/content/Context;F)F"
    ) != 2:
        raise AssertionError(
            "carousel scale repair must be symmetric for app entry and task launch"
        )
    require(
        helper_java,
        "public static boolean normalizeLiveGridTask(Context context,",
        "live app surface does not normalize RedMagic's grid task geometry",
    )
    require(
        simulator,
        "LsNativeStack;->normalizeLiveGridTask(Landroid/content/Context;Z)Z",
        "TaskViewSimulator can still shrink the live app to a grid card",
    )
    require(
        simulator,
        "LsNativeStack;->normalizeLiveEntryScroll(F)F",
        "live app surface can still inherit the cached pager's right offset",
    )
    if simulator.count("LsNativeStack;->normalizeLiveEntryScroll(F)F") != 2:
        raise AssertionError(
            "live scroll must be normalized both when written and when applied"
        )
    require(
        helper_java,
        "public static void normalizeLiveEntryMatrix(Context context, Matrix matrix,",
        "live app surface does not share the final TaskView vertical center",
    )
    require(
        simulator,
        "LsNativeStack;->normalizeLiveEntryMatrix(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;)V",
        "TaskViewSimulator can still apply RedMagic's late vertical entry offset",
    )
    require(
        helper_java,
        "targetCenterY - TEMP_LIVE_SURFACE_BOUNDS.centerY()",
        "live-entry matrix is not centered from its actual mapped crop",
    )
    require(
        helper_java,
        "public static void setLiveOverviewTarget(Context context, boolean targetRecents)",
        "live Overview target is not armed before Launcher state changes",
    )
    require(
        swipe_handler,
        "LsNativeStack;->setLiveOverviewTarget(Landroid/content/Context;Z)V",
        "gesture end target cannot neutralize stale pager scroll before the first frame",
    )
    require(
        helper_java,
        "public static float normalizeLiveAppliedScale(Context context, float nativeScale)",
        "late RecentsView scale writers can still undershoot the Xiaomi front card",
    )
    if simulator.count(
        "LsNativeStack;->normalizeLiveAppliedScale(Landroid/content/Context;F)F"
    ) != 2:
        raise AssertionError(
            "live scale floor must cover draw parameters and the surface matrix"
        )
    commit_start = helper_java.find(
        "public static void commitInitialPage(RecentsView recents, int requestedPage)"
    )
    commit_end = helper_java.find(
        "private static int getInitialTaskOrdinal(", commit_start
    )
    if commit_start < 0 or commit_end < 0:
        raise AssertionError("initial page commit method missing")
    commit = helper_java[commit_start:commit_end]
    require(
        commit,
        "if (!liveEntryRunning)",
        "load-plan callback releases live-entry staging before animation completion",
    )
    require(
        commit,
        "recents.setNativeStackEntryPending(false);",
        "non-live Home entry no longer commits its pending token",
    )
    presentation_start = helper_java.find(
        "private static void settleEntryPresentation("
    )
    presentation_end = helper_java.find(
        "private static boolean isDismissReflowActive(", presentation_start
    )
    if presentation_start < 0 or presentation_end < 0:
        raise AssertionError("entry presentation settlement method missing")
    presentation = helper_java[presentation_start:presentation_end]
    require(
        presentation,
        "task.clearAnimation();",
        "entry leaves the legacy View animation transform running",
    )
    cached_release_start = helper_java.find(
        "private static void finishCachedEntryStagingIfReady("
    )
    cached_release_end = helper_java.find(
        "private static boolean isDismissReflowActive(", cached_release_start
    )
    if cached_release_start < 0 or cached_release_end < 0:
        raise AssertionError("cached Home entry convergence method missing")
    cached_release = helper_java[cached_release_start:cached_release_end]
    require(
        cached_release,
        "recents.isRecentsAnimationRunning()",
        "cached entry release can expose app-entry tasks before animation completion",
    )
    require(
        cached_release,
        "Math.abs(actualCenter - expectedCenter) > tolerance",
        "cached entry release is not gated by the actual centered View position",
    )
    require(
        cached_release,
        "recents.postInvalidateOnAnimation();",
        "cached entry release does not schedule the coherent full-deck frame",
    )
    if "postDelayed" in cached_release or "SystemClock" in cached_release:
        raise AssertionError("cached entry release is still time-based")
    if 'setContentDescription("LS' in helper_java:
        raise AssertionError("temporary coordinate diagnostics remain in release helper")

    # The clear button must keep RedMagic's native 40 dp artwork and native
    # 60 dp click container.  Only the complete actions host may move; scaling
    # the child recreates a visible/touchable-bounds mismatch below its parent.
    require(
        dimens,
        '<dimen name="mfv_recent_clear_button_width_height">40.0dp</dimen>',
        "clear circle no longer uses the OEM size",
    )
    require(
        dimens,
        '<dimen name="mfv_recent_clear_button_layout_width_height">60.0dp</dimen>',
        "clear click container no longer uses the OEM size",
    )
    require(
        helper_java,
        "View actionHost = getClearAllActionHost(clearAll);",
        "clear geometry does not move the complete native actions host",
    )
    require(
        helper_java,
        "clearButton.setScaleX(1.0f);",
        "clear circle is not restored to native horizontal scale",
    )
    require(
        helper_java,
        "clearButton.setScaleY(1.0f);",
        "clear circle is not restored to native vertical scale",
    )
    if "desiredDiameter" in helper_java or "TouchDelegate" in helper_java:
        raise AssertionError("clear button or click target is expanded beyond OEM size")
    clear_geometry = method(
        helper,
        ".method private static applyStackClearAllGeometry(Landroid/view/View;Landroid/view/View;Landroid/view/View;)V",
    )
    require(
        clear_geometry,
        "getClearAllActionHost(Landroid/view/View;)Landroid/view/View;",
        "compiled clear geometry does not translate the actions host",
    )
    if "div-float" in clear_geometry or "0x42693333" in clear_geometry:
        raise AssertionError("compiled clear geometry still scales the clear circle")
    require(helper, "InitialFrameCommit", "one-shot physical-scroll verification missing")
    require(
        initial_commit,
        "remainingGeometryFrames:I",
        "initial frame is not bounded while waiting for task geometry",
    )
    require(
        initial_commit,
        "postOnAnimation(Ljava/lang/Runnable;)V",
        "initial frame does not wait for drawable task geometry",
    )
    require(
        initial_commit,
        "LsNativeStack;->update(Lcom/android/quickstep/views/RecentsView;)V",
        "initial frame does not compose the final deck",
    )
    initial_frame_java_start = helper_java.find(
        "private static final class InitialFrameCommit"
    )
    initial_frame_java_end = helper_java.find(
        "private static final class EntryRevealUpdate", initial_frame_java_start
    )
    if initial_frame_java_start < 0 or initial_frame_java_end < 0:
        raise AssertionError("identity-bound initial-frame commit class missing")
    initial_frame_java = helper_java[
        initial_frame_java_start:initial_frame_java_end
    ]
    require(
        initial_frame_java,
        "resolveEntryAnchorPage(recents)",
        "initial frame still reselects ordinal zero instead of the captured task",
    )
    if "postDelayed(Ljava/lang/Runnable;J)Z" in initial_commit:
        raise AssertionError("initial frame still schedules a delayed visible correction")
    if "postAlignmentFramePending:Z" in initial_commit:
        raise AssertionError("entry still performs a delayed second page alignment")
    if "setCurrentPage(I)V" in initial_commit:
        raise AssertionError("initial-frame stabilizer fights the OEM page every frame")

    scroll = method(recents, ".method protected onScrollChanged(IIII)V")
    require(
        scroll,
        "LsNativeStack;->onScrollChanged",
        "scroll does not update the lightweight transform",
    )
    if "updatePageOffsets()V" in scroll:
        raise AssertionError("onScrollChanged performs a full OEM offset pass")
    helper_scroll = method(
        helper,
        ".method public static onScrollChanged(Lcom/android/quickstep/views/RecentsView;)V",
    )
    require(
        helper_scroll,
        "markDrawUpdate(Lcom/android/quickstep/views/RecentsView;)V",
        "scroll transform is not coalesced until the final OEM frame state",
    )
    if "isEntryTransitionActive" in helper_scroll:
        raise AssertionError("entry scroll callbacks are still discarded")
    require(
        helper_java,
        "boolean entryActive = isEntryTransitionActive(recents);",
        "entry is not recomposed from the final state before each draw",
    )
    dispatch_draw = method(recents, ".method protected dispatchDraw(Landroid/graphics/Canvas;)V")
    require(
        dispatch_draw,
        "LsNativeStack;->beforeDispatchDraw",
        "coalesced stack transform is not consumed before child drawing",
    )
    rebound_guard = (
        "RecentsView;->isNativeStackStyle()Z"
    )
    require(
        dispatch_draw,
        rebound_guard,
        "stack draw still inherits RedMagic's stale whole-canvas edge rebound",
    )
    if dispatch_draw.find(rebound_guard) > dispatch_draw.find("mAllowOverScroll:Z"):
        raise AssertionError("stack edge-rebound guard runs after the canvas shift")
    require(
        dispatch_draw,
        "if-nez v0, :cond_3",
        "stack edge-rebound guard does not use the native zero-shift draw path",
    )
    page_scrolls = method(
        recents,
        ".method protected getPageScrolls([IZLcom/android/launcher3/V4$c;)Z",
    )
    if "LsNativeStack" in page_scrolls:
        raise AssertionError("OEM page scroll array is modified by stack code")
    overview_state = method(recents, ".method public setOverviewStateEnabled(Z)V")
    require(
        overview_state,
        "LsNativeStack;->onOverviewStateChanged(Lcom/android/quickstep/views/RecentsView;Z)V",
        "Overview lifecycle does not arm the strict entry page",
    )
    helper_overview = method(
        helper,
        ".method public static onOverviewStateChanged(Lcom/android/quickstep/views/RecentsView;Z)V",
    )
    if "armEntryReveal" in helper_overview:
        raise AssertionError("Overview starts a second reveal animation over the OEM transition")
    require(
        recents,
        "LsNativeStack;->prepareDismissedTask",
        "dismissed task is not promoted above the deck",
    )
    require(
        recents,
        "LsNativeStack;->adjustDismissOffset",
        "post-dismiss cards still use full-page reflow offsets",
    )

    dismiss_end = (
        SRC / "smali_classes2/com/android/quickstep/views/RecentsView$23.smali"
    ).read_text(encoding="utf-8")
    require(
        dismiss_end,
        "LsNativeStack;->onDismissAnimationEnd",
        "dismiss completion does not atomically commit the replacement deck",
    )

    prepare_dismiss = method(
        helper,
        ".method public static prepareDismissedTask(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskView;)V",
    )
    require(
        prepare_dismiss,
        "setNativeStackClipRight(I)V",
        "dismissed focus card keeps a stale half-card clip",
    )
    require(
        helper_java,
        "dismiss hit mapped to visual focus",
        "overlapping dismiss hit-test does not prefer the visual focus card",
    )
    require(
        helper_java,
        "if (!horizontalPrimary || dismissLayer || dismissReflowLayer)",
        "dismiss does not preserve fixed upper-card clipping while lower cards reflow",
    )
    require(
        helper_java,
        "private static float pendingDismissPagePosition = Float.NaN;",
        "deep dismiss does not retain its original logical focus",
    )
    require(
        helper_java,
        "pendingDismissPagePosition = viewportOrdinal >= 0",
        "dismiss viewport is still derived from the removed card ordinal",
    )
    require(
        helper_java,
        "pendingDismissTask.get() == task\n                && pendingDismissOrdinal >= 0",
        "late prepareDismissedTask call can overwrite the original viewport sample",
    )
    require(
        helper_java,
        "int targetOrdinal = Math.min(viewportOrdinal, taskCount - 1);",
        "post-dismiss commit jumps to the removed card instead of preserving the viewport",
    )
    require(
        helper_java,
        "private static void clearPendingDismissState(RecentsView recents)",
        "aborted dismiss transactions have no common cleanup path",
    )
    require(
        helper,
        "clearPendingDismissState(Lcom/android/quickstep/views/RecentsView;)V",
        "built helper smali is missing abandoned-dismiss cleanup",
    )
    require(
        helper,
        'const-string v2, "dismiss capture cardOrdinal="',
        "built helper smali does not contain independent dismiss/viewport capture",
    )
    pager_event_java = helper_java[
        helper_java.find("public static MotionEvent obtainPagerEvent"):
        helper_java.find("public static void recyclePagerEvent")
    ]
    require(
        pager_event_java,
        "clearPendingDismissState(recents);",
        "a new gesture can inherit an abandoned dismiss viewport",
    )
    overview_state_java = helper_java[
        helper_java.find("public static void onOverviewStateChanged"):
        helper_java.find("public static void onRecentsAnimationComplete")
    ]
    require(
        overview_state_java,
        "clearPendingDismissState(recents);",
        "Overview lifecycle can retain an abandoned dismiss transaction",
    )
    if "pendingDismissPagePosition = pendingDismissOrdinal >= 0" in helper_java:
        raise AssertionError("dismissed card ordinal is still reused as viewport focus")
    require(
        helper_java,
        "pendingDismissRecents.get() == recents\n                    && !Float.isNaN(pendingDismissPagePosition)",
        "deck geometry still follows the OEM pager during deep dismissal",
    )
    require(
        helper_java,
        "pendingDismissPagePosition = Float.NaN;",
        "deep dismiss focus is not released at animation completion",
    )
    if "task.setTranslationZ(200.0f)" in helper_java:
        raise AssertionError("dismissed task still jumps above unchanged upper deck cards")
    if "visualMotion || dismissLayer" in helper_java:
        raise AssertionError("horizontal paging still clears all occlusion clips")

    native_transform = method(task, ".method public final setNativeStackTransform(FFFFF)V")
    for call in (
        "applyTranslationX()V",
        "applyTranslationY()V",
        "applyScale()V",
        "applyNativeStackAlpha()V",
    ):
        require(native_transform, call, f"native composition missing {call}")

    clip = method(task, ".method public final setNativeStackClipRight(I)V")
    require(clip, "setClipBounds", "visible deck slices are not clipped in TaskView")
    if "TaskView;->lockNativeStackEntryTranslation()V" in helper:
        raise AssertionError(
            "helper reactivates the retired TaskView entry translation lock"
        )
    if "TaskView;->unlockNativeStackEntryTranslation()V" in helper:
        raise AssertionError(
            "helper retains legacy entry translation lock lifecycle state"
        )

    for view_id in (
        "@id/recents_stack_memory_container",
        "@id/recents_stack_memory_available",
        "@id/recents_stack_memory_total",
        "@id/recents_stack_empty_message",
    ):
        require(overview, view_id, f"overview overlay missing {view_id}")

    print("PASS Xiaomi Recents stack static guardrails")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (AssertionError, OSError, UnicodeError) as error:
        print(f"FAIL {error}", file=sys.stderr)
        raise SystemExit(1)
