.class public abstract Lcom/android/quickstep/AbsSwipeUpHandler;
.super Lcom/android/quickstep/SwipeUpAnimationLogic;
.source "AbsSwipeUpHandler.java"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/AbsSwipeUpHandler$DepthAnimatorListenerAdapter;,
        Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;,
        Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;,
        Lcom/android/quickstep/AbsSwipeUpHandler$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RECENTS_CONTAINER:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "TSTATE;>;RECENTS_VIEW:",
        "Lcom/android/quickstep/views/RecentsView<",
        "TRECENTS_CONTAINER;TSTATE;>;STATE::",
        "Lcom/android/launcher3/statemanager/a<",
        "TSTATE;>;>",
        "Lcom/android/quickstep/SwipeUpAnimationLogic;",
        "Landroid/view/View$OnApplyWindowInsetsListener;",
        "Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;"
    }
.end annotation


# static fields
.field private static final DEFAULT_SCALE_FINAL_POSITION:F = 0.25f

.field private static FLAG_COUNT:I = 0x0

.field private static final KQS_TASK_FADE_ANIMATION_FRACTION:F = 0.4f

.field private static final LAUNCHER_UI_STATES:I

.field private static final LOG_NO_OP_PAGE_INDEX:I = -0x1

.field private static final MAX_QUICK_SWITCH_RECENTS_SCALE_PROGRESS:F = 0.07f

.field public static final MAX_SWIPE_DURATION:J = 0x15eL

.field public static final MAX_SWIPE_DURATION_PAD:J = 0x1c2L

.field public static final MIN_PROGRESS_FOR_FULLSCREENTOWINDOW:F = 0.2f

.field public static final MIN_PROGRESS_FOR_HOME_GESTURE:F = 0.08f

.field public static final MIN_PROGRESS_FOR_OVERVIEW:F = 0.7f

.field public static final RECENTS_ATTACH_DURATION:J = 0x12cL

.field private static final RECENTS_SNAP_DURATION:I = 0x1f4

.field private static final RECENTS_VIEW_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/dynamicanimation/animation/g<",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;>;"
        }
    .end annotation
.end field

.field private static final SCREENSHOT_CAPTURED_EVT:Ljava/lang/String; = "ScreenshotCaptured"

.field private static final SPLASH_ANIMATION_DURATION:I = 0x15d

.field private static final SPLASH_APP_REVEAL_DELAY:I = 0x53

.field private static final SPLASH_APP_REVEAL_DURATION:I = 0x10a

.field private static final SPLASH_FADE_OUT_DURATION:I = 0x85

.field private static final STATE_APP_CONTROLLER_RECEIVED:I

.field private static final STATE_CAPTURE_SCREENSHOT:I

.field private static final STATE_CURRENT_TASK_FINISHED:I

.field private static final STATE_FINISH_WITH_NO_END:I

.field private static final STATE_GESTURE_CANCELLED:I

.field private static final STATE_GESTURE_COMPLETED:I

.field private static final STATE_GESTURE_STARTED:I

.field protected static final STATE_HANDLER_INVALIDATED:I

.field protected static final STATE_LAUNCHER_BIND_TO_SERVICE:I

.field protected static final STATE_LAUNCHER_DRAWN:I

.field protected static final STATE_LAUNCHER_PRESENT:I

.field protected static final STATE_LAUNCHER_STARTED:I

.field private static final STATE_NAMES:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final STATE_PARALLEL_ANIM_FINISHED:I

.field private static final STATE_RESUME_LAST_TASK:I

.field private static final STATE_SCALED_CONTROLLER_HOME:I

.field private static final STATE_SCALED_CONTROLLER_RECENTS:I

.field protected static final STATE_SCREENSHOT_CAPTURED:I

.field private static final STATE_SCREENSHOT_VIEW_SHOWN:I

.field private static final STATE_START_NEW_TASK:I

.field public static final SWIPEUP_RECORD_BEFORE_RECENTS_THRESHOLD:F = 0.01f

.field public static final SWIPEUP_RECORD_DECREASE_DURATION:J = 0x28L

.field private static final SWIPE_DURATION_MULTIPLIER:F

.field private static final TAG:Ljava/lang/String; = "AbsSwipeUpHandler"


# instance fields
.field private currentScrollOffset:F

.field private defferExecuteAnimation:Z

.field private dragLengthFactorMaxPullback:F

.field private dragLengthFactorStartPullback:F

.field public forceToHome:Z

.field private isDragging:Z

.field private isLandscape:Z

.field private final mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

.field private mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

.field protected mAnimationRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

.field public mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

.field private mAppToHomeWindowMapping:Landroid/graphics/Matrix;

.field public mAppTransitionManager:Lcom/android/launcher3/q5;

.field public mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

.field private mCanSlowSwipeGoHome:Z

.field protected mCanceled:Z

.field private mClosingTarget:Lu2/s;

.field public mContainer:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TRECENTS_CONTAINER;"
        }
    .end annotation
.end field

.field protected final mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/BaseContainerInterface<",
            "TSTATE;TRECENTS_CONTAINER;>;"
        }
    .end annotation
.end field

.field protected final mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

.field protected mContinuingLastGesture:Z

.field protected final mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private mDragleryHideReseted:Z

.field protected mFullScreenToWindowSmallOrMini:Z

.field protected mGestureEndCallback:Ljava/lang/Runnable;

.field private mGestureStarted:Z

.field protected mHandOffAnimationToHome:Z

.field private mHasEndedLauncherTransition:Z

.field private mHasMotionEverBeenPaused:Z

.field public mIfRunningTaskSupportCasting:Z

.field public mIfRunningTaskSupportMiniWindow:Z

.field public mIfSupportCasting:Z

.field public mIfUpDisplacementLonger:Z

.field protected final mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

.field protected mInterruptAdjustProgress:Lcom/android/launcher3/anim/d;

.field private mIsDividerShown:Z

.field private mIsLikelyToStartNewTask:Z

.field protected mIsMiniWindowLeft:Z

.field protected mIsMiniWindowToHome:Z

.field private mIsMotionPaused:Z

.field protected mIsSwipingPipToHome:Z

.field private final mIsTaskbarAllAppsOpen:Z

.field private final mIsTransientTaskbar:Z

.field private mLauncherFrameDrawnTime:J

.field private final mLauncherOnDestroyCallback:Ljava/lang/Runnable;

.field private final mLauncherOnStartCallback:Ljava/lang/Runnable;

.field private mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

.field private mLogDirectionUpOrLeft:Z

.field private final mMSDLPlayerWrapper:Lcom/android/launcher3/util/s1;

.field protected mMiniWindowTipsView:Lcom/android/quickstep/views/MiniWindowTipsView;

.field protected mNeedShowPeekStatus:Z

.field private final mOnDeferredActivityLaunch:Ljava/lang/Runnable;

.field private mOnDrawListener:Landroid/view/ViewTreeObserver$OnDrawListener;

.field private final mOnRecentsScrollListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

.field private mParallelRunningAnim:Landroid/animation/Animator;

.field protected mPassedTriggerMiniWindowSlop:Z

.field private mPreviousTaskViewType:Lcom/android/quickstep/views/TaskViewType;

.field private final mQuickSwitchScaleScrollThreshold:F

.field protected mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

.field private final mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field protected mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

.field protected mRecentsView:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TRECENTS_VIEW;"
        }
    .end annotation
.end field

.field private mRecentsViewScrollLinked:Z

.field protected mReverseDisable:Z

.field protected mRunningTaskFullscreenBounds:Landroid/graphics/Rect;

.field private mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

.field private mScreenRect:Landroid/graphics/Rect;

.field private mShouldPauseAdvance:Z

.field private final mSplashMainWindowShiftLength:I

.field private mStartMovingTasks:Z

.field protected mStateCallback:Lcom/android/quickstep/MultiStateCallback;

.field private mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

.field private final mSwipePipToHomeAnimators:[Lcom/android/quickstep/util/SwipePipToHomeAnimator;

.field private mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

.field private final mSwipeUpVelocityParam:Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

.field private mTargetScaleRect:Landroid/graphics/Rect;

.field protected mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

.field private mTaskSnapshotCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation
.end field

.field protected mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field private final mTaskbarAlreadyOpen:Z

.field private final mTaskbarAppWindowThreshold:I

.field private final mTaskbarCatchUpThreshold:I

.field private final mTaskbarHomeOverviewThreshold:I

.field private final mTouchTimeMs:J

.field public mUsingNewAnim:Z

.field private mWasLauncherAlreadyVisible:Z

.field private mWrapperVelocity:Landroid/graphics/PointF;

.field private final recentViewScaleSpring:Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation<",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;>;"
        }
    .end annotation
.end field

.field private shouldUseCurrentScrollOffset:Z

.field private toHomeAnim:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_NAMES:Ljava/util/ArrayList;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Lcom/android/quickstep/AbsSwipeUpHandler;->FLAG_COUNT:I

    .line 10
    .line 11
    const-string v0, "STATE_LAUNCHER_PRESENT"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sput v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_PRESENT:I

    .line 18
    .line 19
    const-string v1, "STATE_LAUNCHER_STARTED"

    .line 20
    .line 21
    invoke-static {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sput v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_STARTED:I

    .line 26
    .line 27
    const-string v2, "STATE_LAUNCHER_DRAWN"

    .line 28
    .line 29
    invoke-static {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sput v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 34
    .line 35
    const-string v3, "STATE_LAUNCHER_BIND_TO_SERVICE"

    .line 36
    .line 37
    invoke-static {v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    sput v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_BIND_TO_SERVICE:I

    .line 42
    .line 43
    const-string v4, "STATE_APP_CONTROLLER_RECEIVED"

    .line 44
    .line 45
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_APP_CONTROLLER_RECEIVED:I

    .line 50
    .line 51
    const-string v4, "STATE_SCALED_CONTROLLER_HOME"

    .line 52
    .line 53
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_HOME:I

    .line 58
    .line 59
    const-string v4, "STATE_SCALED_CONTROLLER_RECENTS"

    .line 60
    .line 61
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_RECENTS:I

    .line 66
    .line 67
    const-string v4, "STATE_PARALLEL_ANIM_FINISHED"

    .line 68
    .line 69
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_PARALLEL_ANIM_FINISHED:I

    .line 74
    .line 75
    const-string v4, "STATE_HANDLER_INVALIDATED"

    .line 76
    .line 77
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 82
    .line 83
    const-string v4, "STATE_GESTURE_STARTED"

    .line 84
    .line 85
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 90
    .line 91
    const-string v4, "STATE_GESTURE_CANCELLED"

    .line 92
    .line 93
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_CANCELLED:I

    .line 98
    .line 99
    const-string v4, "STATE_GESTURE_COMPLETED"

    .line 100
    .line 101
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 106
    .line 107
    const-string v4, "STATE_CAPTURE_SCREENSHOT"

    .line 108
    .line 109
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 114
    .line 115
    const-string v4, "STATE_SCREENSHOT_CAPTURED"

    .line 116
    .line 117
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 122
    .line 123
    const-string v4, "STATE_SCREENSHOT_VIEW_SHOWN"

    .line 124
    .line 125
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_VIEW_SHOWN:I

    .line 130
    .line 131
    const-string v4, "STATE_RESUME_LAST_TASK"

    .line 132
    .line 133
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_RESUME_LAST_TASK:I

    .line 138
    .line 139
    const-string v4, "STATE_START_NEW_TASK"

    .line 140
    .line 141
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_START_NEW_TASK:I

    .line 146
    .line 147
    const-string v4, "STATE_CURRENT_TASK_FINISHED"

    .line 148
    .line 149
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 154
    .line 155
    const-string v4, "STATE_FINISH_WITH_NO_END"

    .line 156
    .line 157
    invoke-static {v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->getNextStateFlag(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    sput v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 162
    .line 163
    or-int/2addr v0, v2

    .line 164
    or-int/2addr v0, v1

    .line 165
    or-int/2addr v0, v3

    .line 166
    sput v0, Lcom/android/quickstep/AbsSwipeUpHandler;->LAUNCHER_UI_STATES:I

    .line 167
    .line 168
    const v0, 0x3fb6db6e

    .line 169
    .line 170
    .line 171
    const v1, 0x40555555

    .line 172
    .line 173
    .line 174
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    sput v0, Lcom/android/quickstep/AbsSwipeUpHandler;->SWIPE_DURATION_MULTIPLIER:F

    .line 179
    .line 180
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$14;

    .line 181
    .line 182
    const-string v1, "RecentsViewScall"

    .line 183
    .line 184
    invoke-direct {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler$14;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sput-object v0, Lcom/android/quickstep/AbsSwipeUpHandler;->RECENTS_VIEW_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;

    .line 188
    .line 189
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;JZLcom/android/systemui/shared/system/InputConsumerController;Lcom/android/launcher3/util/s1;)V
    .locals 9

    .line 1
    invoke-direct {p0, p1, p3}, Lcom/android/quickstep/SwipeUpAnimationLogic;-><init>(Landroid/content/Context;Lcom/android/quickstep/GestureState;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/Q;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/quickstep/Q;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnRecentsScrollListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 20
    .line 21
    new-instance v0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 27
    .line 28
    new-instance v0, Lcom/android/quickstep/S;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/android/quickstep/S;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 34
    .line 35
    const/4 v7, 0x1

    .line 36
    iput-boolean v7, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLogDirectionUpOrLeft:Z

    .line 37
    .line 38
    new-instance v0, Lcom/android/quickstep/U;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/android/quickstep/U;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDeferredActivityLaunch:Ljava/lang/Runnable;

    .line 44
    .line 45
    new-instance v0, Lcom/android/quickstep/V;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Lcom/android/quickstep/V;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnStartCallback:Ljava/lang/Runnable;

    .line 51
    .line 52
    const/4 v0, 0x2

    .line 53
    new-array v0, v0, [Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimators:[Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 56
    .line 57
    new-instance v0, Lcom/android/quickstep/W;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Lcom/android/quickstep/W;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnDestroyCallback:Ljava/lang/Runnable;

    .line 63
    .line 64
    iput-boolean v7, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanSlowSwipeGoHome:Z

    .line 65
    .line 66
    iput-boolean v7, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsDividerShown:Z

    .line 67
    .line 68
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHandOffAnimationToHome:Z

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 72
    .line 73
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$4;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Lcom/android/quickstep/AbsSwipeUpHandler$4;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 79
    .line 80
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mNeedShowPeekStatus:Z

    .line 81
    .line 82
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 83
    .line 84
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 85
    .line 86
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mPassedTriggerMiniWindowSlop:Z

    .line 87
    .line 88
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfUpDisplacementLonger:Z

    .line 89
    .line 90
    new-instance v0, Landroid/graphics/PointF;

    .line 91
    .line 92
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWrapperVelocity:Landroid/graphics/PointF;

    .line 96
    .line 97
    sget-object v0, Lcom/android/quickstep/util/animation/AnimParamProvider;->INSTANCE:Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimParamProvider$Companion;->getSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipeUpVelocityParam:Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 104
    .line 105
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->isLandscape:Z

    .line 106
    .line 107
    iput-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mUsingNewAnim:Z

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p1, v0, v6}, Lx1/O;->D(Landroid/content/Context;Landroid/content/res/Resources;Z)V

    .line 114
    .line 115
    .line 116
    sget-object v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 117
    .line 118
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 127
    .line 128
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    iput-object v8, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 133
    .line 134
    new-instance v0, Lcom/android/quickstep/X;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Lcom/android/quickstep/X;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v8, v0}, Lcom/android/quickstep/BaseContainerInterface;->createActivityInitListener(Ljava/util/function/Predicate;)Lcom/android/quickstep/util/ContextInitListener;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

    .line 144
    .line 145
    new-instance v0, Lcom/android/quickstep/util/InputConsumerProxy;

    .line 146
    .line 147
    new-instance v2, Lcom/android/quickstep/Y;

    .line 148
    .line 149
    invoke-direct {v2, p0}, Lcom/android/quickstep/Y;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 150
    .line 151
    .line 152
    new-instance v4, Lcom/android/quickstep/Z;

    .line 153
    .line 154
    invoke-direct {v4, p0}, Lcom/android/quickstep/Z;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 155
    .line 156
    .line 157
    new-instance v5, Lcom/android/quickstep/util/InputProxyHandlerFactory;

    .line 158
    .line 159
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 160
    .line 161
    invoke-direct {v5, v8, v3}, Lcom/android/quickstep/util/InputProxyHandlerFactory;-><init>(Lcom/android/quickstep/BaseContainerInterface;Lcom/android/quickstep/GestureState;)V

    .line 162
    .line 163
    .line 164
    move-object v1, p1

    .line 165
    move-object/from16 v3, p7

    .line 166
    .line 167
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/InputConsumerProxy;-><init>(Landroid/content/Context;Ljava/util/function/Supplier;Lcom/android/systemui/shared/system/InputConsumerController;Ljava/lang/Runnable;Ljava/util/function/Supplier;)V

    .line 168
    .line 169
    .line 170
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 171
    .line 172
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 173
    .line 174
    move-wide v0, p4

    .line 175
    iput-wide v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTouchTimeMs:J

    .line 176
    .line 177
    move v0, p6

    .line 178
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContinuingLastGesture:Z

    .line 179
    .line 180
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const v1, 0x7f070a1e

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    iput v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mQuickSwitchScaleScrollThreshold:F

    .line 192
    .line 193
    const v1, 0x7f070a9b

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    neg-int v1, v1

    .line 201
    iput v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSplashMainWindowShiftLength:I

    .line 202
    .line 203
    move-object/from16 v1, p8

    .line 204
    .line 205
    iput-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mMSDLPlayerWrapper:Lcom/android/launcher3/util/s1;

    .line 206
    .line 207
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 208
    .line 209
    aget-object v1, v1, v6

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-virtual {p3}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getLauncherDeviceProfile(I)Lcom/android/launcher3/h0;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {p0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 228
    .line 229
    .line 230
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initStateCallbacks()V

    .line 231
    .line 232
    .line 233
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 234
    .line 235
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->p3:Z

    .line 236
    .line 237
    if-eqz v1, :cond_0

    .line 238
    .line 239
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_0

    .line 244
    .line 245
    move v1, v7

    .line 246
    goto :goto_0

    .line 247
    :cond_0
    move v1, v6

    .line 248
    :goto_0
    iput-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 249
    .line 250
    invoke-virtual {v8}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    if-eqz v1, :cond_1

    .line 255
    .line 256
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/o4;->x()Z

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    if-nez v2, :cond_1

    .line 261
    .line 262
    move v2, v7

    .line 263
    goto :goto_1

    .line 264
    :cond_1
    move v2, v6

    .line 265
    :goto_1
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarAlreadyOpen:Z

    .line 266
    .line 267
    if-eqz v1, :cond_2

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/o4;->w()Z

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    if-eqz v1, :cond_2

    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_2
    move v7, v6

    .line 277
    :goto_2
    iput-boolean v7, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTaskbarAllAppsOpen:Z

    .line 278
    .line 279
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 280
    .line 281
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/c4;->a(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    iput v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarAppWindowThreshold:I

    .line 286
    .line 287
    if-nez v2, :cond_4

    .line 288
    .line 289
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 290
    .line 291
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-eqz v1, :cond_3

    .line 296
    .line 297
    goto :goto_3

    .line 298
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 299
    .line 300
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/c4;->d(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 301
    .line 302
    .line 303
    move-result v6

    .line 304
    :cond_4
    :goto_3
    iput v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarHomeOverviewThreshold:I

    .line 305
    .line 306
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 307
    .line 308
    invoke-static {v0, v1}, Lcom/android/launcher3/taskbar/c4;->b(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    iput v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarCatchUpThreshold:I

    .line 313
    .line 314
    new-instance v0, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;

    .line 315
    .line 316
    sget-object v1, Lcom/android/quickstep/AbsSwipeUpHandler;->RECENTS_VIEW_SCALE_PROGRESS:Landroidx/dynamicanimation/animation/g;

    .line 317
    .line 318
    const/high16 v2, 0x3e800000    # 0.25f

    .line 319
    .line 320
    invoke-direct {v0, p0, v1, v2}, Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V

    .line 321
    .line 322
    .line 323
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->recentViewScaleSpring:Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;

    .line 324
    .line 325
    const/high16 v0, 0x3f800000    # 1.0f

    .line 326
    .line 327
    iput v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorMaxPullback:F

    .line 328
    .line 329
    iput v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorStartPullback:F

    .line 330
    .line 331
    return-void
.end method

.method public static synthetic A(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onLauncherBindToService()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->invalidateHandlerWithLauncher()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$updateThumbnailMFV$39()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onLauncherStart$8()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->continueComputingRecentsScrollIfNecessary()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initializeLauncherAnimationController()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/util/function/Consumer;ZLjava/lang/Boolean;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$startNewTask$33(Ljava/util/function/Consumer;ZLjava/lang/Boolean;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic H(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onRecentsViewScroll()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I(I)[Landroid/view/RemoteAnimationTarget;
    .locals 0

    .line 1
    new-array p0, p0, [Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J(I)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getTrackedEventForState(I)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic K(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$animateToProgressInternal$19()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$maybeUpdateRecentsAttachedState$11(Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Lcom/android/quickstep/AbsSwipeUpHandler;FZLandroid/graphics/PointF;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onGestureEnded$15(FZLandroid/graphics/PointF;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic N(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onAnimatorPlaybackControllerCreated(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$handleNormalGestureEnd$17()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Lcom/android/quickstep/AbsSwipeUpHandler;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$new$2()Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic R(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onRecentsAnimationStart$13(Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->startInterceptingTouchesForGesture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$linkRecentsViewScroll$30(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onDeferredActivityLaunch()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onLauncherStart$7(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->launcherFrameDrawn()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishCurrentTransitionToHome()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private animateSplashScreenExit(Landroid/content/Context;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TRECENTS_CONTAINER;[",
            "Landroid/view/RemoteAnimationTarget;",
            "[",
            "Landroid/view/RemoteAnimationTarget;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v3, p3

    .line 8
    .line 9
    move-object v4, v1

    .line 10
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    instance-of v4, v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v1, 0x0

    .line 24
    :goto_0
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const/4 v6, 0x1

    .line 31
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/BaseDepthController;->pauseBlursOnWindows(Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    new-instance v4, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 35
    .line 36
    invoke-direct {v4, v5}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    new-instance v6, Lcom/android/quickstep/util/SurfaceTransaction;

    .line 40
    .line 41
    invoke-direct {v6}, Lcom/android/quickstep/util/SurfaceTransaction;-><init>()V

    .line 42
    .line 43
    .line 44
    array-length v7, v2

    .line 45
    const/4 v8, 0x0

    .line 46
    move v9, v8

    .line 47
    :goto_1
    if-ge v9, v7, :cond_2

    .line 48
    .line 49
    aget-object v10, v2, v9

    .line 50
    .line 51
    iget-object v10, v10, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 52
    .line 53
    invoke-virtual {v6, v10}, Lcom/android/quickstep/util/SurfaceTransaction;->forSurface(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    const/high16 v11, 0x3f800000    # 1.0f

    .line 58
    .line 59
    invoke-virtual {v10, v11}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setAlpha(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    const/4 v11, -0x1

    .line 64
    invoke-virtual {v10, v11}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setLayer(I)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 65
    .line 66
    .line 67
    move-result-object v10

    .line 68
    invoke-virtual {v10}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setShow()Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 69
    .line 70
    .line 71
    add-int/lit8 v9, v9, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->scheduleApply(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 75
    .line 76
    .line 77
    array-length v2, v3

    .line 78
    move v4, v8

    .line 79
    :goto_2
    if-ge v4, v2, :cond_3

    .line 80
    .line 81
    aget-object v6, v3, v4

    .line 82
    .line 83
    iget-object v7, v6, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 84
    .line 85
    move-object v8, v7

    .line 86
    iget v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSplashMainWindowShiftLength:I

    .line 87
    .line 88
    move-object v9, v8

    .line 89
    new-instance v8, Lcom/android/wm/shell/shared/m;

    .line 90
    .line 91
    invoke-direct {v8}, Lcom/android/wm/shell/shared/m;-><init>()V

    .line 92
    .line 93
    .line 94
    iget-object v6, v6, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 95
    .line 96
    new-instance v10, Lcom/android/quickstep/AbsSwipeUpHandler$13;

    .line 97
    .line 98
    invoke-direct {v10, v0, v5, v1}, Lcom/android/quickstep/AbsSwipeUpHandler$13;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/ViewGroup;Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 99
    .line 100
    .line 101
    move-object/from16 v16, v10

    .line 102
    .line 103
    const/16 v10, 0x15d

    .line 104
    .line 105
    const/16 v11, 0x85

    .line 106
    .line 107
    const/4 v12, 0x0

    .line 108
    const/4 v13, 0x0

    .line 109
    const/16 v14, 0x53

    .line 110
    .line 111
    const/16 v15, 0x10a

    .line 112
    .line 113
    move-object/from16 v17, v9

    .line 114
    .line 115
    move-object v9, v6

    .line 116
    move-object/from16 v6, v17

    .line 117
    .line 118
    invoke-static/range {v5 .. v16}, LT2/c;->j(Landroid/view/ViewGroup;Landroid/view/SurfaceControl;ILcom/android/wm/shell/shared/m;Landroid/graphics/Rect;IIFFIILandroid/animation/Animator$AnimatorListener;)V

    .line 119
    .line 120
    .line 121
    add-int/lit8 v4, v4, 0x1

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    return-void
.end method

.method private animateToProgressInternal(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
    .locals 24

    move-object/from16 v0, p0

    move/from16 v8, p1

    move/from16 v1, p2

    move-wide/from16 v2, p3

    move-object/from16 v9, p7

    move-object/from16 v5, p6

    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    if-ne v5, v4, :ls_native_stack_not_recents_target

    const/4 v4, 0x1

    goto :ls_native_stack_target_ready

    :ls_native_stack_not_recents_target
    const/4 v4, 0x0

    :ls_native_stack_target_ready
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    invoke-static {v5, v4}, Lcom/android/quickstep/views/LsNativeStack;->setLiveOverviewTarget(Landroid/content/Context;Z)V

    iget-object v5, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-static {v5, v2, v3}, Lcom/android/quickstep/views/LsNativeStack;->normalizeLiveOverviewDuration(Lcom/android/quickstep/views/RecentsView;J)J

    move-result-wide v2

    .line 1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "animateToProgressInternal target = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v5}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v10, "AbsSwipeUpHandler"

    invoke-static {v10, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    sget-object v5, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eq v4, v5, :cond_0

    move v4, v11

    goto :goto_0

    :cond_0
    move v4, v12

    :goto_0
    invoke-virtual {v0, v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 3
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    iget-boolean v4, v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    if-eqz v4, :cond_4

    .line 4
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    if-eqz v4, :cond_1

    .line 5
    check-cast v4, Lcom/android/launcher3/views/k;

    invoke-static {v4}, Lcom/android/launcher3/dragndrop/v;->E(Lcom/android/launcher3/views/k;)V

    .line 6
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    move-result-object v4

    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    invoke-virtual {v4, v6}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 7
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    sget-object v6, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    if-eq v4, v6, :cond_4

    .line 8
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    if-eqz v4, :cond_2

    .line 9
    invoke-virtual {v4}, Landroid/animation/Animator;->end()V

    .line 10
    :cond_2
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 11
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v6

    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 12
    invoke-virtual {v7}, Lcom/android/quickstep/TaskAnimationManager;->getCurrentCallbacks()Lcom/android/quickstep/RecentsAnimationCallbacks;

    move-result-object v7

    .line 13
    invoke-virtual {v4, v6, v2, v3, v7}, Lcom/android/quickstep/BaseContainerInterface;->getParallelAnimationToGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;

    move-result-object v4

    iput-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    if-eqz v4, :cond_3

    .line 14
    new-instance v6, Lcom/android/quickstep/AbsSwipeUpHandler$5;

    invoke-direct {v6, v0}, Lcom/android/quickstep/AbsSwipeUpHandler$5;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {v4, v6}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 15
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    invoke-virtual {v4}, Landroid/animation/Animator;->start()V

    goto :goto_1

    .line 16
    :cond_3
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    sget v6, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_PARALLEL_ANIM_FINISHED:I

    invoke-virtual {v4, v6}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 17
    :cond_4
    :goto_1
    sget-object v4, Lx1/r;->H:Lcom/android/launcher3/util/I;

    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lx1/r;

    .line 18
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    sget-object v6, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    const/4 v14, 0x0

    if-eq v4, v6, :cond_5

    if-eqz v13, :cond_5

    .line 19
    invoke-virtual {v13, v14, v12}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 20
    :cond_5
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    if-eq v4, v5, :cond_6

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    if-eqz v4, :cond_6

    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    move-result-object v4

    if-eqz v4, :cond_6

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 21
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    move-result-object v4

    const/4 v6, 0x7

    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 22
    :cond_6
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v4}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v4

    if-nez v4, :cond_7

    .line 23
    invoke-direct {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetDragLayer()V

    .line 24
    :cond_7
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    iget-boolean v4, v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    if-eqz v4, :cond_8

    iget-boolean v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    if-nez v4, :cond_8

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iget-boolean v4, v4, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    if-nez v4, :cond_8

    .line 25
    sget-object v4, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/launcher3/anim/C;

    iput-boolean v11, v4, Lcom/android/launcher3/anim/C;->L:Z

    :cond_8
    const-wide/16 v6, 0x3e8

    .line 26
    invoke-static {v6, v7}, Lx1/O;->p4(J)Z

    .line 27
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v4

    if-ne v4, v5, :cond_26

    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    move-result-object v1

    invoke-interface {v1, v9}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V

    .line 29
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    if-eqz v1, :cond_9

    .line 30
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4, v12}, Lcom/android/quickstep/GestureState;->getRunningTaskIds(Z)[I

    move-result-object v4

    aget v4, v4, v12

    invoke-virtual {v1, v4}, Lcom/android/quickstep/RemoteAnimationTargets;->findTask(I)Landroid/view/RemoteAnimationTarget;

    move-result-object v1

    goto :goto_2

    :cond_9
    move-object v1, v14

    .line 31
    :goto_2
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInterruptAdjustProgress:Lcom/android/launcher3/anim/d;

    if-eqz v4, :cond_a

    .line 32
    invoke-virtual {v4}, Lcom/android/launcher3/anim/d;->h()V

    :cond_a
    if-nez v1, :cond_b

    if-eqz v13, :cond_b

    .line 33
    iget-boolean v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    if-eqz v4, :cond_b

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    if-eqz v4, :cond_b

    iget-object v5, v4, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    array-length v5, v5

    if-ne v5, v11, :cond_b

    .line 34
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTarget()Landroid/view/RemoteAnimationTarget;

    move-result-object v1

    :cond_b
    move-object v6, v1

    .line 35
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    if-eqz v1, :cond_c

    .line 36
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v4, v12}, Lcom/android/quickstep/GestureState;->getRunningTaskIds(Z)[I

    move-result-object v4

    aget v4, v4, v12

    invoke-virtual {v1, v4}, Lcom/android/quickstep/RemoteAnimationTargets;->findTaskCompat(I)Lu2/s;

    move-result-object v1

    goto :goto_3

    :cond_c
    move-object v1, v14

    :goto_3
    if-nez v1, :cond_d

    .line 37
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    if-eqz v4, :cond_d

    .line 38
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteAnimationTargets;->getFirstAppTargetCompat()Lu2/s;

    move-result-object v1

    :cond_d
    move-object v15, v1

    if-eqz v6, :cond_e

    .line 39
    iget-object v1, v6, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v1, v1, Landroid/app/ActivityManager$RunningTaskInfo;->launchCookies:Ljava/util/ArrayList;

    goto :goto_4

    .line 40
    :cond_e
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_4
    if-eqz v6, :cond_f

    .line 41
    iget-boolean v4, v6, Landroid/view/RemoteAnimationTarget;->isTranslucent:Z

    if-eqz v4, :cond_f

    move v4, v11

    goto :goto_5

    :cond_f
    move v4, v12

    :goto_5
    if-eqz v6, :cond_10

    .line 42
    iget-object v5, v6, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    if-eqz v5, :cond_10

    .line 43
    invoke-virtual {v5}, Landroid/view/SurfaceControl;->isValid()Z

    move-result v5

    if-eqz v5, :cond_10

    move v5, v11

    goto :goto_6

    :cond_10
    move v5, v12

    .line 44
    :goto_6
    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isPipActive()Z

    move-result v7

    if-nez v7, :cond_11

    if-eqz v5, :cond_11

    iget-boolean v5, v6, Landroid/view/RemoteAnimationTarget;->allowEnterPip:Z

    if-eqz v5, :cond_11

    iget-object v5, v6, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v5, v5, Landroid/app/ActivityManager$RunningTaskInfo;->pictureInPictureParams:Landroid/app/PictureInPictureParams;

    if-eqz v5, :cond_11

    .line 45
    invoke-virtual {v5}, Landroid/app/PictureInPictureParams;->isAutoEnterEnabled()Z

    move-result v5

    if-eqz v5, :cond_11

    move v5, v11

    goto :goto_7

    :cond_11
    move v5, v12

    .line 46
    :goto_7
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    move-result v7

    if-eqz v7, :cond_13

    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-eqz v7, :cond_13

    .line 47
    invoke-virtual {v7}, Lcom/android/launcher3/V4;->getCurrentPage()I

    move-result v7

    iget-object v11, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    move-result v11

    if-ne v7, v11, :cond_12

    goto :goto_8

    .line 48
    :cond_12
    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v7}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v7

    goto :goto_9

    :cond_13
    :goto_8
    move-object v7, v14

    .line 49
    :goto_9
    invoke-virtual/range {v0 .. v7}, Lcom/android/quickstep/AbsSwipeUpHandler;->createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    move-result-object v3

    .line 50
    iget-boolean v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    if-nez v1, :cond_14

    if-eqz v5, :cond_14

    .line 51
    invoke-direct {v0, v3, v6, v8}, Lcom/android/quickstep/AbsSwipeUpHandler;->createWindowAnimationToPip(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/view/RemoteAnimationTarget;F)Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    move-result-object v1

    goto :goto_a

    :cond_14
    move-object v1, v14

    :goto_a
    if-eqz v1, :cond_15

    const/4 v2, 0x1

    goto :goto_b

    :cond_15
    move v2, v12

    .line 52
    :goto_b
    iput-boolean v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsSwipingPipToHome:Z

    .line 53
    iget-boolean v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    if-nez v4, :cond_16

    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iget-boolean v4, v4, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    if-eqz v4, :cond_18

    :cond_16
    if-eqz v6, :cond_18

    .line 54
    const-string v1, "Trigger the mini window"

    invoke-static {v10, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    if-nez v1, :cond_17

    iget-boolean v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    if-eqz v1, :cond_17

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    if-eqz v1, :cond_17

    if-eqz v13, :cond_17

    .line 56
    check-cast v1, Lcom/android/launcher3/views/k;

    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 57
    :cond_17
    invoke-virtual {v0, v8, v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->createWindowAnimationToHome(FLcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)[Lcom/android/quickstep/util/RectFSpringAnim;

    move-result-object v1

    .line 58
    aget-object v2, v1, v12

    new-instance v4, Lcom/android/quickstep/AbsSwipeUpHandler$6;

    invoke-direct {v4, v0, v6}, Lcom/android/quickstep/AbsSwipeUpHandler$6;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/RemoteAnimationTarget;)V

    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 59
    aget-object v2, v1, v12

    new-instance v4, Lcom/android/quickstep/AbsSwipeUpHandler$7;

    invoke-direct {v4, v0, v6, v13}, Lcom/android/quickstep/AbsSwipeUpHandler$7;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/RemoteAnimationTarget;Lx1/r;)V

    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    :goto_c
    const/4 v2, 0x1

    goto/16 :goto_10

    :cond_18
    if-eqz v2, :cond_1b

    .line 60
    iput-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 61
    iget-object v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimators:[Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    aput-object v1, v2, v12

    .line 62
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    if-eqz v1, :cond_19

    .line 63
    invoke-virtual {v1, v12}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 64
    :cond_19
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    new-instance v2, Lcom/android/quickstep/r;

    invoke-direct {v2, v0}, Lcom/android/quickstep/r;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 65
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    iget-object v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Lcom/android/quickstep/SystemUiProxy;

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 66
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getTaskId()I

    move-result v18

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 67
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getComponentName()Landroid/content/ComponentName;

    move-result-object v19

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 68
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getDestinationBounds()Landroid/graphics/Rect;

    move-result-object v20

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 69
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getContentOverlay()Landroid/view/SurfaceControl;

    move-result-object v21

    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 70
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getAppBounds()Landroid/graphics/Rect;

    move-result-object v22

    .line 71
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getContentOverlay()Landroid/view/SurfaceControl;

    move-result-object v1

    if-eqz v1, :cond_1a

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    :goto_d
    move-object/from16 v23, v1

    goto :goto_e

    .line 72
    :cond_1a
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getSourceRectHint()Landroid/graphics/Rect;

    move-result-object v1

    goto :goto_d

    .line 73
    :goto_e
    invoke-virtual/range {v17 .. v23}, Lcom/android/quickstep/SystemUiProxy;->stopSwipePipToHome(ILandroid/content/ComponentName;Landroid/graphics/Rect;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 74
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimators:[Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    goto :goto_c

    .line 75
    :cond_1b
    iput-object v14, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 76
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    if-eqz v1, :cond_1c

    const/4 v2, 0x1

    .line 77
    invoke-virtual {v1, v2}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 78
    iput-object v14, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 79
    :cond_1c
    iget-boolean v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mUsingNewAnim:Z

    if-nez v1, :cond_1e

    .line 80
    invoke-virtual {v0, v8, v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->createWindowAnimationToHome(FLcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)[Lcom/android/quickstep/util/RectFSpringAnim;

    move-result-object v1

    .line 81
    iget-boolean v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHandOffAnimationToHome:Z

    if-eqz v2, :cond_1d

    .line 82
    invoke-direct {v0, v9}, Lcom/android/quickstep/AbsSwipeUpHandler;->handOffAnimation(Landroid/graphics/PointF;)V

    .line 83
    :cond_1d
    aget-object v2, v1, v12

    new-instance v4, Lcom/android/quickstep/AbsSwipeUpHandler$8;

    invoke-direct {v4, v0}, Lcom/android/quickstep/AbsSwipeUpHandler$8;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_f

    :cond_1e
    move-object v1, v14

    .line 84
    :goto_f
    iget-boolean v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    if-eqz v2, :cond_1f

    .line 85
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    :cond_1f
    const/4 v2, 0x1

    .line 86
    iput-boolean v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mShouldPauseAdvance:Z

    .line 87
    sget-object v4, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->INSTANCE:Lcom/android/launcher3/util/I;

    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    iget-object v5, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 88
    invoke-virtual {v4, v5, v6}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->setPauseAdvance(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/view/RemoteAnimationTarget;)V

    :goto_10
    if-eqz v1, :cond_24

    .line 89
    array-length v4, v1

    add-int/2addr v4, v2

    new-array v2, v4, [Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    iput-object v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 90
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 91
    iget v4, v9, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v4, v2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->playAtomicAnimation(FLandroid/animation/AnimatorSet;)V

    .line 92
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    array-length v5, v1

    invoke-static {v2}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Landroid/animation/Animator;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    move-result-object v6

    aput-object v6, v4, v5

    .line 93
    sget-boolean v4, Lf1/a;->H:Z

    if-eqz v4, :cond_20

    .line 94
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 95
    :cond_20
    array-length v4, v1

    move v5, v12

    :goto_11
    if-ge v5, v4, :cond_23

    .line 96
    aget-object v6, v1, v5

    if-nez v6, :cond_21

    :goto_12
    const/16 v16, 0x1

    goto :goto_14

    .line 97
    :cond_21
    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    if-nez v7, :cond_22

    move-object v7, v14

    goto :goto_13

    :cond_22
    check-cast v7, Lcom/android/launcher3/views/k;

    invoke-interface {v7}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v7

    .line 98
    :goto_13
    iget-object v8, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    const/4 v10, 0x0

    move-object/from16 p5, v2

    move-object/from16 p1, v6

    move-object/from16 p3, v7

    move-object/from16 p2, v8

    move-object/from16 p4, v9

    move/from16 p6, v10

    invoke-virtual/range {p1 .. p6}, Lcom/android/quickstep/util/RectFSpringAnim;->start(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/PointF;Landroid/animation/AnimatorSet;Z)V

    .line 99
    iget-object v7, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    invoke-static {v6}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Lcom/android/quickstep/util/RectFSpringAnim;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    move-result-object v6

    aput-object v6, v7, v5

    goto :goto_12

    :goto_14
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v9, p7

    goto :goto_11

    :cond_23
    move-object/from16 v9, p7

    goto :goto_15

    :cond_24
    const/4 v5, 0x1

    move-object/from16 v2, p7

    move v1, v8

    move-object v4, v15

    .line 100
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/AbsSwipeUpHandler;->createAnimateToHome(FLandroid/graphics/PointF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lu2/s;Z)V

    move-object v9, v2

    .line 101
    :goto_15
    iget v1, v9, Landroid/graphics/PointF;->y:F

    invoke-virtual {v3, v1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setSwipeVelocity(F)V

    .line 102
    iput-object v14, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 103
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-eqz v1, :cond_25

    .line 104
    iget-object v2, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v2

    iget-object v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    invoke-virtual {v1, v14, v2, v3}, Lcom/android/quickstep/views/RecentsView;->onPrepareGestureEndAnimation(Landroid/animation/AnimatorSet;Lcom/android/quickstep/GestureState$GestureEndTarget;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 105
    :cond_25
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v12, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    const/4 v1, 0x0

    .line 106
    iput v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 107
    iput v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetSecondary:F

    .line 108
    iput v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimPrimary:F

    .line 109
    iput v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimSecondary:F

    .line 110
    iput-boolean v12, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedChangeTaskTranslation:Z

    return-void

    .line 111
    :cond_26
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 112
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    invoke-virtual {v5, v8, v1}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 113
    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v6

    sget-object v7, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    if-ne v6, v7, :cond_27

    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-eqz v6, :cond_27

    .line 114
    invoke-virtual {v6, v12}, Lcom/android/quickstep/views/RecentsView;->setRunningTaskHiddenKeepThumbnailInvisible(Z)V

    .line 115
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6, v12}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 116
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->animateActionsViewIn()V

    .line 117
    :cond_27
    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v6

    sget-object v9, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    if-eq v6, v9, :cond_28

    .line 118
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v12, v6, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 119
    :cond_28
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iget-object v9, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v9}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v9

    if-ne v9, v7, :cond_29

    const/4 v7, 0x1

    goto :goto_16

    :cond_29
    move v7, v12

    :goto_16
    iput-boolean v7, v6, Lcom/android/quickstep/BaseContainerInterface;->mNeedChangeTaskTranslation:Z

    .line 120
    new-instance v6, Lcom/android/quickstep/s;

    invoke-direct {v6, v0, v8, v1}, Lcom/android/quickstep/s;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;FF)V

    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 121
    new-instance v1, Lcom/android/quickstep/AbsSwipeUpHandler$9;

    move-object/from16 v6, p6

    invoke-direct {v1, v0, v6}, Lcom/android/quickstep/AbsSwipeUpHandler$9;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    invoke-virtual {v5, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 122
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 123
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-eqz v1, :cond_2b

    .line 124
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v5}, Lcom/android/quickstep/GestureState;->isHandlingAtomicEvent()Z

    move-result v5

    if-eqz v5, :cond_2a

    goto :goto_17

    :cond_2a
    move-object v14, v4

    :goto_17
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 125
    invoke-virtual {v5}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v5

    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 126
    invoke-virtual {v1, v14, v5, v6}, Lcom/android/quickstep/views/RecentsView;->onPrepareGestureEndAnimation(Landroid/animation/AnimatorSet;Lcom/android/quickstep/GestureState$GestureEndTarget;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 127
    :cond_2b
    invoke-virtual {v4, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    move-result-object v1

    move-object/from16 v2, p5

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 128
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 129
    invoke-static {v4}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->wrap(Landroid/animation/Animator;)Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    aput-object v1, v2, v12

    iput-object v2, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    return-void
.end method

.method private attachTaskWindowSpringScrollerController()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->getTaskWindowSpringScrollerController()Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->attach(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v0, "AbsSwipeUpHandler"

    .line 18
    .line 19
    const-string v1, "onGestureStarted, taskWindowSpringScrollerController is null"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    :goto_0
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLastRunningAnimRecord(Z)Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lx1/O;->T2()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x7

    .line 42
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static synthetic b0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->invalidateHandler()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private buildAnimationController()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->canCreateNewOrUpdateExistingLauncherTransitionController()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 22
    .line 23
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 24
    .line 25
    int-to-long v1, p0

    .line 26
    invoke-interface {v0, v1, v2}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->createContainerInterface(J)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic c0(Lcom/android/quickstep/AbsSwipeUpHandler;FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$handleNormalGestureEnd$18(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private calculateEndTarget(Landroid/graphics/PointF;FZZZ)Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 6

    .line 1
    iget v0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->dpiFromPx(F)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p1, Landroid/graphics/PointF;->y:F

    .line 8
    .line 9
    invoke-direct {p0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->dpiFromPx(F)F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget v2, p1, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float v2, v2

    .line 16
    float-to-double v2, v2

    .line 17
    iget v4, p1, Landroid/graphics/PointF;->x:F

    .line 18
    .line 19
    float-to-double v4, v4

    .line 20
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    invoke-static {v2, v3}, Ljava/lang/Math;->toDegrees(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    invoke-static {v0, v1, v2, v3}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnCalculateEndTarget(FFD)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isHandlingAtomicEvent()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v1, "calculateEndTarget / currentShift: "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 53
    .line 54
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v1, "/"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShiftValue()F

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, " ,isScrollingToNewTask: "

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isScrollingToNewTask()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, " ,isFlingY: "

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, " ,isCancel: "

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, " ,mIsMotionPaused: "

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMotionPaused:Z

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v1, " ,velocityPxPerMs: "

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v1, " mIfUpDisplacementLonger: "

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfUpDisplacementLonger:Z

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, " mIsMiniWindowToHome: "

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, " mGestureStarted: "

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureStarted:Z

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v1, " gesture mode: "

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    const-string v1, "TaplEvents"

    .line 166
    .line 167
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    if-eqz p4, :cond_1

    .line 171
    .line 172
    sget-object p1, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_1
    if-eqz p3, :cond_2

    .line 176
    .line 177
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->calculateEndTargetForFlingY(Landroid/graphics/PointF;F)Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    goto :goto_0

    .line 182
    :cond_2
    invoke-direct {p0, p1, p5}, Lcom/android/quickstep/AbsSwipeUpHandler;->calculateEndTargetForNonFling(Landroid/graphics/PointF;Z)Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    :goto_0
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 187
    .line 188
    iget-boolean p3, p2, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 189
    .line 190
    if-eqz p3, :cond_4

    .line 191
    .line 192
    iget-boolean p0, p2, Lcom/android/quickstep/BaseContainerInterface;->mIfRunningTaskSupportMiniWindow:Z

    .line 193
    .line 194
    if-eqz p0, :cond_3

    .line 195
    .line 196
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 197
    .line 198
    return-object p0

    .line 199
    :cond_3
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 200
    .line 201
    return-object p0

    .line 202
    :cond_4
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 203
    .line 204
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isOverviewDisabled()Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-eqz p2, :cond_5

    .line 209
    .line 210
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 211
    .line 212
    if-ne p1, p2, :cond_5

    .line 213
    .line 214
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 215
    .line 216
    return-object p0

    .line 217
    :cond_5
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 218
    .line 219
    const/4 p3, 0x0

    .line 220
    if-eqz p2, :cond_6

    .line 221
    .line 222
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getNextPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    goto :goto_1

    .line 227
    :cond_6
    move-object p2, p3

    .line 228
    :goto_1
    iget-object p4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 229
    .line 230
    if-eqz p4, :cond_7

    .line 231
    .line 232
    invoke-virtual {p4}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 233
    .line 234
    .line 235
    move-result-object p3

    .line 236
    :cond_7
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 237
    .line 238
    invoke-static {p0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 239
    .line 240
    .line 241
    move-result p0

    .line 242
    if-eqz p0, :cond_a

    .line 243
    .line 244
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 245
    .line 246
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 247
    .line 248
    .line 249
    move-result p0

    .line 250
    if-eqz p0, :cond_8

    .line 251
    .line 252
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_QUICK_SWITCH:Landroid/window/DesktopModeFlags;

    .line 253
    .line 254
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    if-nez p0, :cond_a

    .line 259
    .line 260
    :cond_8
    instance-of p0, p2, Lcom/android/quickstep/views/DesktopTaskView;

    .line 261
    .line 262
    if-nez p0, :cond_9

    .line 263
    .line 264
    instance-of p0, p3, Lcom/android/quickstep/views/DesktopTaskView;

    .line 265
    .line 266
    if-eqz p0, :cond_a

    .line 267
    .line 268
    :cond_9
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 269
    .line 270
    if-ne p1, p0, :cond_a

    .line 271
    .line 272
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 273
    .line 274
    return-object p0

    .line 275
    :cond_a
    return-object p1
.end method

.method private calculateEndTargetForFlingY(Landroid/graphics/PointF;F)Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isScrollingToNewTask()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget p1, p1, Landroid/graphics/PointF;->x:F

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    cmpl-float p1, p1, v0

    .line 20
    .line 21
    if-lez p1, :cond_0

    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfUpDisplacementLonger:Z

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    move p1, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move p1, v2

    .line 30
    :goto_0
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfUpDisplacementLonger:Z

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const v3, 0x7f07082e

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    cmpl-float v0, v3, v0

    .line 50
    .line 51
    if-lez v0, :cond_1

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 54
    .line 55
    :cond_1
    const/4 v0, 0x0

    .line 56
    cmpg-float p2, p2, v0

    .line 57
    .line 58
    if-gez p2, :cond_4

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShiftValue()F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    const p1, 0x3da3d70a    # 0.08f

    .line 70
    .line 71
    .line 72
    cmpg-float p0, p0, p1

    .line 73
    .line 74
    if-gez p0, :cond_3

    .line 75
    .line 76
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_3
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_4
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 83
    .line 84
    if-eqz p2, :cond_5

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eq p2, p0, :cond_5

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_5
    move v1, v2

    .line 100
    :goto_1
    if-nez p1, :cond_7

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_6
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_7
    :goto_2
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 109
    .line 110
    return-object p0
.end method

.method private calculateEndTargetForNonFling(Landroid/graphics/PointF;Z)Lcom/android/quickstep/GestureState$GestureEndTarget;
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isScrollingToNewTask()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p1, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const v3, 0x7f070a1f

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    cmpl-float v1, v1, v2

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    invoke-static {}, Lcom/android/launcher3/y0;->v()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    :cond_0
    const/4 p2, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p2, 0x0

    .line 39
    :goto_0
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    if-eqz v0, :cond_3

    .line 47
    .line 48
    if-eqz p2, :cond_3

    .line 49
    .line 50
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    iget-boolean p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMotionPaused:Z

    .line 54
    .line 55
    if-eqz p2, :cond_4

    .line 56
    .line 57
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_4
    if-eqz v0, :cond_5

    .line 61
    .line 62
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_5
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 66
    .line 67
    const/4 p2, 0x0

    .line 68
    cmpg-float p1, p1, p2

    .line 69
    .line 70
    if-ltz p1, :cond_6

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->ifReachedMaxPausedProgress()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_7

    .line 77
    .line 78
    :cond_6
    iget-boolean p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanSlowSwipeGoHome:Z

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_7
    sget-object p0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 86
    .line 87
    return-object p0
.end method

.method private calculateWindowRotation(Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/RecentsOrientedState;)I
    .locals 0

    .line 1
    iget p0, p1, Landroid/view/RemoteAnimationTarget;->rotationChange:I

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p1, 0x1

    .line 10
    if-ne p0, p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x3

    .line 13
    return p0

    .line 14
    :cond_0
    return p1

    .line 15
    :cond_1
    invoke-virtual {p2}, Lcom/android/quickstep/util/RecentsOrientedState;->getDisplayRotation()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private canCreateNewOrUpdateExistingLauncherTransitionController()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHasEndedLauncherTransition:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private cancelCurrentAnimation()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logAbsSwipeUpHandlerCancelCurrentAnimation()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->h()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputConsumerProxy;->unregisterOnTouchDownCallback()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

    .line 18
    .line 19
    const-string v1, "AbsSwipeUpHandler.cancelCurrentAnimation"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ContextInitListener;->unregister(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private continueComputingRecentsScrollIfNecessary()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->hasState(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 12
    .line 13
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->computeRecentsScrollIfInvisible()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 33
    .line 34
    new-instance v1, Lcom/android/quickstep/r0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/android/quickstep/r0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private final createAppToHomeAnimation(FLandroid/graphics/PointF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 38

    .line 1
    move-object/from16 v2, p0

    .line 2
    .line 3
    move/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    const-string v4, "BaseSwipeUpHandler#createAppToHomeAnimation"

    .line 8
    .line 9
    const-wide/16 v12, 0x8

    .line 10
    .line 11
    invoke-static {v12, v13, v4}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v14, Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-direct {v14}, Landroid/graphics/RectF;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v4, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 20
    .line 21
    const/4 v15, 0x0

    .line 22
    aget-object v4, v4, v15

    .line 23
    .line 24
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    iget-object v5, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 29
    .line 30
    aget-object v5, v5, v15

    .line 31
    .line 32
    invoke-virtual {v5}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v6, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 37
    .line 38
    if-eqz v6, :cond_0

    .line 39
    .line 40
    check-cast v6, Lcom/android/launcher3/views/k;

    .line 41
    .line 42
    invoke-interface {v6}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const/4 v6, 0x0

    .line 48
    :goto_0
    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/TaskViewSimulator;->checkAndUpdateDeviceProfile(Lcom/android/launcher3/h0;)V

    .line 49
    .line 50
    .line 51
    iget-object v6, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 52
    .line 53
    aget-object v6, v6, v15

    .line 54
    .line 55
    invoke-virtual {v6}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v6}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    iget-object v6, v6, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 64
    .line 65
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWorkspaceView()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    const/4 v8, 0x1

    .line 71
    invoke-virtual {v2, v8}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLastRunningAnimRecord(Z)Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-virtual {v4}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    iget-object v10, v10, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 80
    .line 81
    invoke-virtual {v3, v10, v9}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->createToHomeAnimRecord([Lu2/s;Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    iput-object v10, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    const-string v11, "homeAnimationFactory.windowTargetRect"

    .line 92
    .line 93
    invoke-static {v10, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v11, Landroid/graphics/Matrix;

    .line 97
    .line 98
    invoke-direct {v11}, Landroid/graphics/Matrix;-><init>()V

    .line 99
    .line 100
    .line 101
    new-instance v7, Landroid/graphics/Matrix;

    .line 102
    .line 103
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 104
    .line 105
    .line 106
    new-instance v17, Landroid/graphics/RectF;

    .line 107
    .line 108
    invoke-direct/range {v17 .. v17}, Landroid/graphics/RectF;-><init>()V

    .line 109
    .line 110
    .line 111
    const-string v12, "targets"

    .line 112
    .line 113
    invoke-static {v6, v12}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-direct {v2, v6}, Lcom/android/quickstep/AbsSwipeUpHandler;->getClosingSourceWinBounds([Lu2/s;)Landroid/graphics/RectF;

    .line 117
    .line 118
    .line 119
    move-result-object v12

    .line 120
    new-instance v13, Lkotlin/jvm/internal/z;

    .line 121
    .line 122
    invoke-direct {v13}, Lkotlin/jvm/internal/z;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {}, LM3/a;->e()Z

    .line 126
    .line 127
    .line 128
    move-result v20

    .line 129
    const-string v15, "QuickStep"

    .line 130
    .line 131
    const-string v8, "AbsSwipeUpHandler"

    .line 132
    .line 133
    if-eqz v20, :cond_1

    .line 134
    .line 135
    move-object/from16 v20, v6

    .line 136
    .line 137
    new-instance v6, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    move-object/from16 v23, v12

    .line 143
    .line 144
    const-string v12, "createAppToHomeAnimation, startProgress = "

    .line 145
    .line 146
    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    invoke-static {v15, v8, v6}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_1
    move-object/from16 v20, v6

    .line 161
    .line 162
    move-object/from16 v23, v12

    .line 163
    .line 164
    :goto_1
    iget-object v6, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 165
    .line 166
    invoke-static {v6}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 167
    .line 168
    .line 169
    move-result v12

    .line 170
    new-instance v6, Lkotlin/jvm/internal/C;

    .line 171
    .line 172
    invoke-direct {v6}, Lkotlin/jvm/internal/C;-><init>()V

    .line 173
    .line 174
    .line 175
    if-eqz v9, :cond_3

    .line 176
    .line 177
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v11, v7}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3, v7}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->applyTaskFullRect(Landroid/graphics/Matrix;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 187
    .line 188
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    move/from16 v24, v12

    .line 192
    .line 193
    iget-object v12, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 194
    .line 195
    instance-of v3, v12, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 196
    .line 197
    if-eqz v3, :cond_2

    .line 198
    .line 199
    check-cast v12, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 200
    .line 201
    :goto_2
    const/4 v3, 0x0

    .line 202
    goto :goto_3

    .line 203
    :cond_2
    const/4 v12, 0x0

    .line 204
    goto :goto_2

    .line 205
    :goto_3
    invoke-virtual {v1, v9, v10, v3, v12}, Lcom/android/quickstep/util/animation/AnimationRecord;->tryConnectExistingAnim(Lcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/RectF;FLcom/android/launcher3/C2;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    new-instance v3, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    const-string v9, "tryConnectExistingAnim "

    .line 215
    .line 216
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-static {v8, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    iput-object v1, v6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 230
    .line 231
    if-eqz v1, :cond_4

    .line 232
    .line 233
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 234
    .line 235
    .line 236
    move-result v3

    .line 237
    invoke-virtual {v1, v3}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setAsyncStart(Z)V

    .line 238
    .line 239
    .line 240
    sget-object v1, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 241
    .line 242
    goto :goto_4

    .line 243
    :cond_3
    move/from16 v24, v12

    .line 244
    .line 245
    :cond_4
    :goto_4
    iget-object v1, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 246
    .line 247
    if-eqz v1, :cond_5

    .line 248
    .line 249
    iget-object v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 250
    .line 251
    invoke-virtual {v1, v3}, Lcom/android/launcher3/q5;->W0(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 252
    .line 253
    .line 254
    :cond_5
    iget-object v1, v6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 255
    .line 256
    if-nez v1, :cond_f

    .line 257
    .line 258
    const-string v1, "tryConnectExistingAnim  null need new anim"

    .line 259
    .line 260
    invoke-static {v8, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    invoke-virtual {v11}, Landroid/graphics/Matrix;->reset()V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 267
    .line 268
    .line 269
    iget-object v1, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 270
    .line 271
    array-length v1, v1

    .line 272
    new-array v1, v1, [Landroid/graphics/Matrix;

    .line 273
    .line 274
    invoke-virtual {v2, v1, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateProgressForStartRect([Landroid/graphics/Matrix;F)[Landroid/graphics/RectF;

    .line 275
    .line 276
    .line 277
    iget-object v1, v5, Lcom/android/quickstep/util/TaskViewSimulator;->recentsViewScroll:Lcom/android/launcher3/anim/d;

    .line 278
    .line 279
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 280
    .line 281
    invoke-static {}, LM3/a;->e()Z

    .line 282
    .line 283
    .line 284
    move-result v9

    .line 285
    if-eqz v9, :cond_6

    .line 286
    .line 287
    iget-boolean v9, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 288
    .line 289
    iget-boolean v12, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->defferExecuteAnimation:Z

    .line 290
    .line 291
    iget-boolean v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->shouldUseCurrentScrollOffset:Z

    .line 292
    .line 293
    move-object/from16 v27, v6

    .line 294
    .line 295
    iget v6, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->currentScrollOffset:F

    .line 296
    .line 297
    move-object/from16 v28, v10

    .line 298
    .line 299
    const-string v10, ", defferExecuteAnimation = "

    .line 300
    .line 301
    move-object/from16 v29, v7

    .line 302
    .line 303
    const-string v7, ", currentScroll = "

    .line 304
    .line 305
    move-object/from16 v30, v14

    .line 306
    .line 307
    const-string v14, "createAppToHomeAnimation: mRecentsViewScrollLinked = "

    .line 308
    .line 309
    invoke-static {v14, v9, v10, v12, v7}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    move-result-object v7

    .line 313
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string v9, ", shouldUseCurrentScrollOffset = "

    .line 317
    .line 318
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    const-string v3, ", currentScrollOffset = "

    .line 325
    .line 326
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    invoke-static {v15, v8, v3}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    goto :goto_5

    .line 340
    :cond_6
    move-object/from16 v27, v6

    .line 341
    .line 342
    move-object/from16 v29, v7

    .line 343
    .line 344
    move-object/from16 v28, v10

    .line 345
    .line 346
    move-object/from16 v30, v14

    .line 347
    .line 348
    :goto_5
    iget-boolean v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 349
    .line 350
    if-eqz v3, :cond_7

    .line 351
    .line 352
    iget-boolean v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->shouldUseCurrentScrollOffset:Z

    .line 353
    .line 354
    if-eqz v3, :cond_7

    .line 355
    .line 356
    iget v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->currentScrollOffset:F

    .line 357
    .line 358
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 359
    .line 360
    .line 361
    :cond_7
    iget-boolean v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 362
    .line 363
    if-eqz v3, :cond_8

    .line 364
    .line 365
    iget-boolean v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->defferExecuteAnimation:Z

    .line 366
    .line 367
    if-eqz v3, :cond_8

    .line 368
    .line 369
    iget-object v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 370
    .line 371
    if-eqz v3, :cond_8

    .line 372
    .line 373
    const/4 v3, 0x0

    .line 374
    invoke-virtual {v5, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 375
    .line 376
    .line 377
    :cond_8
    iget-object v3, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 378
    .line 379
    if-eqz v3, :cond_a

    .line 380
    .line 381
    iget-object v6, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 382
    .line 383
    invoke-virtual {v6}, Lcom/android/quickstep/GestureState;->getRunningTaskId()I

    .line 384
    .line 385
    .line 386
    move-result v6

    .line 387
    invoke-virtual {v3, v6}, Lcom/android/quickstep/views/RecentsView;->getTaskIndexForId(I)I

    .line 388
    .line 389
    .line 390
    move-result v3

    .line 391
    invoke-static {}, LM3/a;->e()Z

    .line 392
    .line 393
    .line 394
    move-result v6

    .line 395
    if-eqz v6, :cond_9

    .line 396
    .line 397
    new-instance v6, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 400
    .line 401
    .line 402
    const-string v7, "createAppToHomeAnimation: current running index is "

    .line 403
    .line 404
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v6

    .line 414
    invoke-static {v15, v8, v6}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    :cond_9
    const/4 v6, -0x1

    .line 418
    if-eq v3, v6, :cond_a

    .line 419
    .line 420
    iget-object v7, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 421
    .line 422
    invoke-virtual {v7}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 423
    .line 424
    .line 425
    move-result v7

    .line 426
    sub-int v9, v7, v3

    .line 427
    .line 428
    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    .line 429
    .line 430
    .line 431
    move-result v9

    .line 432
    if-lez v9, :cond_a

    .line 433
    .line 434
    iget-object v9, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 435
    .line 436
    invoke-virtual {v9, v7}, Lcom/android/quickstep/views/RecentsView;->getScrollOffset(I)I

    .line 437
    .line 438
    .line 439
    move-result v9

    .line 440
    int-to-float v10, v9

    .line 441
    invoke-virtual {v5, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 442
    .line 443
    .line 444
    const/4 v10, 0x1

    .line 445
    iput-boolean v10, v13, Lkotlin/jvm/internal/z;->g:Z

    .line 446
    .line 447
    invoke-static {}, LM3/a;->e()Z

    .line 448
    .line 449
    .line 450
    move-result v12

    .line 451
    if-eqz v12, :cond_b

    .line 452
    .line 453
    const-string v12, ", current page is "

    .line 454
    .line 455
    const-string v14, ". so we should set scroll offset to "

    .line 456
    .line 457
    const-string v6, "createAppToHomeAnimation: running index is "

    .line 458
    .line 459
    invoke-static {v6, v3, v12, v7, v14}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    move-result-object v3

    .line 463
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    const-string v6, ", and force invisible recents view"

    .line 467
    .line 468
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v3

    .line 475
    invoke-static {v15, v8, v3}, LM3/a;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    goto :goto_6

    .line 479
    :cond_a
    const/4 v10, 0x1

    .line 480
    :cond_b
    :goto_6
    invoke-virtual {v4, v0}, Lcom/android/quickstep/util/TransformParams;->setProgress(F)Lcom/android/quickstep/util/TransformParams;

    .line 481
    .line 482
    .line 483
    move-result-object v0

    .line 484
    invoke-virtual {v5, v0}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 485
    .line 486
    .line 487
    new-instance v0, Landroid/graphics/RectF;

    .line 488
    .line 489
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 490
    .line 491
    .line 492
    move-result-object v3

    .line 493
    invoke-direct {v0, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 494
    .line 495
    .line 496
    invoke-virtual {v5, v11}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 497
    .line 498
    .line 499
    move-object/from16 v12, v30

    .line 500
    .line 501
    invoke-virtual {v12, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    invoke-virtual {v0, v12}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 509
    .line 510
    .line 511
    move-object/from16 v0, v29

    .line 512
    .line 513
    invoke-virtual {v11, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 514
    .line 515
    .line 516
    invoke-virtual {v0, v12}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 517
    .line 518
    .line 519
    move-object/from16 v3, p3

    .line 520
    .line 521
    invoke-virtual {v3, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->applyTaskFullRect(Landroid/graphics/Matrix;)V

    .line 522
    .line 523
    .line 524
    iget-boolean v0, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 525
    .line 526
    if-eqz v0, :cond_c

    .line 527
    .line 528
    iget-boolean v0, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->defferExecuteAnimation:Z

    .line 529
    .line 530
    if-eqz v0, :cond_c

    .line 531
    .line 532
    invoke-virtual {v5, v1}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 533
    .line 534
    .line 535
    :cond_c
    invoke-virtual {v5}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentRect()Landroid/graphics/RectF;

    .line 536
    .line 537
    .line 538
    move-result-object v6

    .line 539
    new-instance v0, Ljava/lang/StringBuilder;

    .line 540
    .line 541
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 542
    .line 543
    .line 544
    const-string v1, "customRectFSpringAnim startRects "

    .line 545
    .line 546
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v0

    .line 556
    invoke-static {v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 557
    .line 558
    .line 559
    move/from16 v22, v10

    .line 560
    .line 561
    const/4 v10, 0x0

    .line 562
    move-object v7, v11

    .line 563
    const/4 v11, 0x1

    .line 564
    move-object v0, v4

    .line 565
    const/4 v4, 0x0

    .line 566
    move-object v1, v5

    .line 567
    const/4 v5, 0x0

    .line 568
    move-object v9, v7

    .line 569
    const/high16 v7, 0x3f800000    # 1.0f

    .line 570
    .line 571
    move-object v14, v8

    .line 572
    const/4 v8, 0x0

    .line 573
    move-object/from16 v29, v9

    .line 574
    .line 575
    const/4 v9, 0x0

    .line 576
    move-object/from16 p1, v1

    .line 577
    .line 578
    move-object/from16 v30, v12

    .line 579
    .line 580
    move-object/from16 v19, v20

    .line 581
    .line 582
    move-object/from16 v1, v27

    .line 583
    .line 584
    const/4 v12, -0x1

    .line 585
    const-wide/16 v26, 0x8

    .line 586
    .line 587
    move-object/from16 v20, v0

    .line 588
    .line 589
    move-object v0, v14

    .line 590
    move-object/from16 v14, v28

    .line 591
    .line 592
    invoke-virtual/range {v3 .. v11}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->update(FFLandroid/graphics/RectF;FFLjava/util/function/Supplier;Ljava/util/function/Supplier;Z)V

    .line 593
    .line 594
    .line 595
    new-instance v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 596
    .line 597
    new-instance v5, Landroid/graphics/PointF;

    .line 598
    .line 599
    const/4 v8, 0x0

    .line 600
    invoke-direct {v5, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    .line 601
    .line 602
    .line 603
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 604
    .line 605
    .line 606
    move-result v7

    .line 607
    invoke-direct {v4, v6, v14, v5, v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;Z)V

    .line 608
    .line 609
    .line 610
    iput-object v4, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 611
    .line 612
    move/from16 v5, v24

    .line 613
    .line 614
    invoke-virtual {v4, v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartRadius(F)V

    .line 615
    .line 616
    .line 617
    iget-object v4, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 618
    .line 619
    check-cast v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 620
    .line 621
    sget-boolean v6, Lx1/O;->T:Z

    .line 622
    .line 623
    if-eqz v6, :cond_e

    .line 624
    .line 625
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isHotSeatIcon()Z

    .line 626
    .line 627
    .line 628
    move-result v6

    .line 629
    if-nez v6, :cond_d

    .line 630
    .line 631
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWorkspaceView()Landroid/view/View;

    .line 632
    .line 633
    .line 634
    move-result-object v6

    .line 635
    invoke-static {v6}, Lp1/f;->y(Landroid/view/View;)Z

    .line 636
    .line 637
    .line 638
    move-result v6

    .line 639
    if-eqz v6, :cond_e

    .line 640
    .line 641
    :cond_d
    const/4 v6, 0x2

    .line 642
    goto :goto_7

    .line 643
    :cond_e
    sget-object v6, Lcom/android/quickstep/util/animation/RectTransformHelper;->INSTANCE:Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;

    .line 644
    .line 645
    iget-object v7, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 646
    .line 647
    iget v7, v7, Lcom/android/launcher3/h0;->U0:I

    .line 648
    .line 649
    invoke-virtual {v6, v7, v14}, Lcom/android/quickstep/util/animation/RectTransformHelper$Companion;->getTracking(ILandroid/graphics/RectF;)I

    .line 650
    .line 651
    .line 652
    move-result v6

    .line 653
    :goto_7
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setTracking(I)V

    .line 654
    .line 655
    .line 656
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 657
    .line 658
    .line 659
    goto :goto_8

    .line 660
    :cond_f
    move-object/from16 v3, p3

    .line 661
    .line 662
    move-object/from16 p1, v5

    .line 663
    .line 664
    move-object v1, v6

    .line 665
    move-object v0, v8

    .line 666
    move-object/from16 v29, v11

    .line 667
    .line 668
    move-object/from16 v30, v14

    .line 669
    .line 670
    move-object/from16 v19, v20

    .line 671
    .line 672
    move/from16 v5, v24

    .line 673
    .line 674
    const/4 v12, -0x1

    .line 675
    const/16 v22, 0x1

    .line 676
    .line 677
    const-wide/16 v26, 0x8

    .line 678
    .line 679
    move-object/from16 v20, v4

    .line 680
    .line 681
    move-object v14, v10

    .line 682
    :goto_8
    iget-object v4, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 683
    .line 684
    check-cast v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 685
    .line 686
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 687
    .line 688
    .line 689
    move-result v6

    .line 690
    const v7, 0x3e99999a    # 0.3f

    .line 691
    .line 692
    .line 693
    mul-float/2addr v6, v7

    .line 694
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setMinWidth(F)V

    .line 695
    .line 696
    .line 697
    move-object/from16 v4, p2

    .line 698
    .line 699
    iget v6, v4, Landroid/graphics/PointF;->y:F

    .line 700
    .line 701
    invoke-direct {v2, v6}, Lcom/android/quickstep/AbsSwipeUpHandler;->useWrapperVelocity(F)Z

    .line 702
    .line 703
    .line 704
    move-result v6

    .line 705
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 706
    .line 707
    .line 708
    move-result-object v8

    .line 709
    invoke-virtual {v8}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getXVelocityScale()F

    .line 710
    .line 711
    .line 712
    move-result v8

    .line 713
    if-eqz v6, :cond_10

    .line 714
    .line 715
    iget-object v9, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mWrapperVelocity:Landroid/graphics/PointF;

    .line 716
    .line 717
    iget v9, v9, Landroid/graphics/PointF;->x:F

    .line 718
    .line 719
    goto :goto_9

    .line 720
    :cond_10
    iget v9, v4, Landroid/graphics/PointF;->x:F

    .line 721
    .line 722
    :goto_9
    mul-float/2addr v8, v9

    .line 723
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 724
    .line 725
    .line 726
    move-result-object v9

    .line 727
    invoke-virtual {v9}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getMaxXVelocity()F

    .line 728
    .line 729
    .line 730
    move-result v9

    .line 731
    invoke-static {v8, v9}, Lcom/android/quickstep/util/VelocityUtils;->limitVelocity(FF)F

    .line 732
    .line 733
    .line 734
    move-result v32

    .line 735
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 736
    .line 737
    .line 738
    move-result-object v8

    .line 739
    invoke-virtual {v8}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getYVelocityScale()F

    .line 740
    .line 741
    .line 742
    move-result v8

    .line 743
    if-eqz v6, :cond_11

    .line 744
    .line 745
    iget-object v4, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mWrapperVelocity:Landroid/graphics/PointF;

    .line 746
    .line 747
    :cond_11
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 748
    .line 749
    mul-float/2addr v8, v4

    .line 750
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 751
    .line 752
    .line 753
    move-result-object v4

    .line 754
    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getMaxYVelocity()F

    .line 755
    .line 756
    .line 757
    move-result v4

    .line 758
    invoke-static {v8, v4}, Lcom/android/quickstep/util/VelocityUtils;->limitVelocity(FF)F

    .line 759
    .line 760
    .line 761
    move-result v33

    .line 762
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 763
    .line 764
    .line 765
    move-result-object v4

    .line 766
    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getWidthVelocityStrategy()F

    .line 767
    .line 768
    .line 769
    move-result v4

    .line 770
    mul-float v4, v4, v33

    .line 771
    .line 772
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 773
    .line 774
    .line 775
    move-result-object v6

    .line 776
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getMaxWidthVelocity()F

    .line 777
    .line 778
    .line 779
    move-result v6

    .line 780
    invoke-static {v4, v6}, Lcom/android/quickstep/util/VelocityUtils;->limitVelocity(FF)F

    .line 781
    .line 782
    .line 783
    move-result v4

    .line 784
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->canUseWorkspaceItemView()Z

    .line 785
    .line 786
    .line 787
    move-result v6

    .line 788
    if-eqz v6, :cond_12

    .line 789
    .line 790
    iget-object v6, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 791
    .line 792
    move-object/from16 v31, v6

    .line 793
    .line 794
    check-cast v31, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 795
    .line 796
    check-cast v6, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 797
    .line 798
    invoke-direct {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 799
    .line 800
    .line 801
    move-result-object v8

    .line 802
    invoke-virtual {v8}, Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;->getMaxRadioVelocity()F

    .line 803
    .line 804
    .line 805
    move-result v8

    .line 806
    invoke-virtual {v6, v4, v8}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->mapRatioVelocity(FF)F

    .line 807
    .line 808
    .line 809
    move-result v36

    .line 810
    const/16 v35, 0x0

    .line 811
    .line 812
    move/from16 v34, v4

    .line 813
    .line 814
    invoke-virtual/range {v31 .. v36}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setVelocity(FFFFF)V

    .line 815
    .line 816
    .line 817
    goto :goto_a

    .line 818
    :cond_12
    iget-object v4, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 819
    .line 820
    move-object/from16 v31, v4

    .line 821
    .line 822
    check-cast v31, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 823
    .line 824
    const/16 v35, 0x0

    .line 825
    .line 826
    const/16 v36, 0x0

    .line 827
    .line 828
    const/16 v32, 0x0

    .line 829
    .line 830
    const/16 v33, 0x0

    .line 831
    .line 832
    const/16 v34, 0x0

    .line 833
    .line 834
    invoke-virtual/range {v31 .. v36}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setVelocity(FFFFF)V

    .line 835
    .line 836
    .line 837
    :goto_a
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 838
    .line 839
    .line 840
    move-result-object v4

    .line 841
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 842
    .line 843
    .line 844
    move-result-object v4

    .line 845
    sget-object v6, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 846
    .line 847
    invoke-virtual {v6}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 848
    .line 849
    .line 850
    move-result v6

    .line 851
    if-eqz v6, :cond_13

    .line 852
    .line 853
    const/4 v6, 0x0

    .line 854
    invoke-virtual {v3, v6}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setReverseDisable(Z)V

    .line 855
    .line 856
    .line 857
    goto :goto_d

    .line 858
    :cond_13
    sget-object v6, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->SEASCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 859
    .line 860
    invoke-static {v4, v6}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 861
    .line 862
    .line 863
    move-result v6

    .line 864
    if-nez v6, :cond_15

    .line 865
    .line 866
    sget-object v6, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 867
    .line 868
    invoke-static {v4, v6}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 869
    .line 870
    .line 871
    move-result v4

    .line 872
    if-eqz v4, :cond_14

    .line 873
    .line 874
    goto :goto_b

    .line 875
    :cond_14
    const/4 v8, 0x0

    .line 876
    goto :goto_c

    .line 877
    :cond_15
    :goto_b
    move/from16 v8, v22

    .line 878
    .line 879
    :goto_c
    invoke-virtual {v3, v8}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setReverseDisable(Z)V

    .line 880
    .line 881
    .line 882
    :goto_d
    iget-object v4, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 883
    .line 884
    check-cast v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 885
    .line 886
    invoke-virtual {v3, v4}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 887
    .line 888
    .line 889
    move-object/from16 v4, v17

    .line 890
    .line 891
    new-instance v17, Landroid/graphics/RectF;

    .line 892
    .line 893
    invoke-direct/range {v17 .. v17}, Landroid/graphics/RectF;-><init>()V

    .line 894
    .line 895
    .line 896
    new-instance v6, Landroid/graphics/PointF;

    .line 897
    .line 898
    invoke-direct {v6}, Landroid/graphics/PointF;-><init>()V

    .line 899
    .line 900
    .line 901
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->createActivityAnimationToHome()Lcom/android/launcher3/anim/q;

    .line 902
    .line 903
    .line 904
    move-result-object v8

    .line 905
    const-string v9, "homeAnimationFactory.cre\u2026ActivityAnimationToHome()"

    .line 906
    .line 907
    invoke-static {v8, v9}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 908
    .line 909
    .line 910
    iget-object v9, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 911
    .line 912
    const-string v10, "null cannot be cast to non-null type com.android.launcher3.DeviceProfile"

    .line 913
    .line 914
    invoke-static {v9, v10}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 915
    .line 916
    .line 917
    iget v9, v9, Lcom/android/launcher3/h0;->B1:I

    .line 918
    .line 919
    int-to-float v9, v9

    .line 920
    const/4 v10, 0x2

    .line 921
    new-array v10, v10, [Ljava/lang/Float;

    .line 922
    .line 923
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 924
    .line 925
    .line 926
    move-result-object v9

    .line 927
    const/16 v21, 0x0

    .line 928
    .line 929
    aput-object v9, v10, v21

    .line 930
    .line 931
    const/high16 v9, 0x41800000    # 16.0f

    .line 932
    .line 933
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 934
    .line 935
    .line 936
    move-result-object v9

    .line 937
    aput-object v9, v10, v22

    .line 938
    .line 939
    new-instance v9, Ljava/lang/StringBuilder;

    .line 940
    .line 941
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 942
    .line 943
    .line 944
    const-string v11, "getIconVisualSize : "

    .line 945
    .line 946
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 947
    .line 948
    .line 949
    aget-object v11, v10, v21

    .line 950
    .line 951
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 952
    .line 953
    .line 954
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 955
    .line 956
    .line 957
    move-result-object v9

    .line 958
    invoke-static {v15, v0, v9}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 959
    .line 960
    .line 961
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 962
    .line 963
    .line 964
    move-result v9

    .line 965
    if-nez v9, :cond_16

    .line 966
    .line 967
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 968
    .line 969
    .line 970
    move-result v9

    .line 971
    aget-object v11, v10, v21

    .line 972
    .line 973
    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    .line 974
    .line 975
    .line 976
    move-result v11

    .line 977
    invoke-static {v9, v11}, Ljava/lang/Float;->compare(FF)I

    .line 978
    .line 979
    .line 980
    move-result v9

    .line 981
    if-gez v9, :cond_16

    .line 982
    .line 983
    const-string v9, "createAppToHomeAnimation: icon width greater than the float icon width"

    .line 984
    .line 985
    invoke-static {v15, v0, v9}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    .line 987
    .line 988
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 989
    .line 990
    .line 991
    move-result v9

    .line 992
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 993
    .line 994
    .line 995
    move-result-object v9

    .line 996
    aput-object v9, v10, v21

    .line 997
    .line 998
    :cond_16
    sget-object v9, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 999
    .line 1000
    iget-object v11, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 1001
    .line 1002
    invoke-virtual {v9, v11}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v9

    .line 1006
    check-cast v9, Lcom/android/quickstep/RotationTouchHelper;

    .line 1007
    .line 1008
    invoke-virtual {v9}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    .line 1009
    .line 1010
    .line 1011
    move-result v9

    .line 1012
    iget-object v11, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 1013
    .line 1014
    move/from16 p1, v7

    .line 1015
    .line 1016
    instance-of v7, v11, Lcom/android/launcher3/C2;

    .line 1017
    .line 1018
    if-eqz v7, :cond_17

    .line 1019
    .line 1020
    check-cast v11, Lcom/android/launcher3/C2;

    .line 1021
    .line 1022
    :cond_17
    new-instance v7, Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 1023
    .line 1024
    sget-object v11, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 1025
    .line 1026
    move-object/from16 v12, v23

    .line 1027
    .line 1028
    invoke-direct {v7, v12, v11}, Lcom/android/quickstep/util/animation/RectTransformHelper;-><init>(Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 1029
    .line 1030
    .line 1031
    new-instance v11, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 1032
    .line 1033
    invoke-direct {v11}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;-><init>()V

    .line 1034
    .line 1035
    .line 1036
    move-object/from16 p2, v4

    .line 1037
    .line 1038
    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    .line 1039
    .line 1040
    .line 1041
    move-result v4

    .line 1042
    invoke-virtual {v11, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginHeight(F)V

    .line 1043
    .line 1044
    .line 1045
    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    .line 1046
    .line 1047
    .line 1048
    move-result v4

    .line 1049
    invoke-virtual {v11, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setOriginWidth(F)V

    .line 1050
    .line 1051
    .line 1052
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isWidget()Z

    .line 1053
    .line 1054
    .line 1055
    move-result v4

    .line 1056
    invoke-virtual {v7, v11, v14, v9, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper;->getWindowCropStrategy(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;IZ)V

    .line 1057
    .line 1058
    .line 1059
    iget-object v4, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 1060
    .line 1061
    move-object/from16 v23, v6

    .line 1062
    .line 1063
    if-eqz v4, :cond_18

    .line 1064
    .line 1065
    invoke-virtual {v11}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsVerticalClip()Z

    .line 1066
    .line 1067
    .line 1068
    move-result v6

    .line 1069
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsVerticalClip(Z)V

    .line 1070
    .line 1071
    .line 1072
    invoke-virtual {v11}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getIsClipFromLeftOrTop()Z

    .line 1073
    .line 1074
    .line 1075
    move-result v6

    .line 1076
    invoke-virtual {v4, v6}, Lcom/android/quickstep/util/animation/AnimationRecord;->setMIsClipFromLeftOrTop(Z)V

    .line 1077
    .line 1078
    .line 1079
    :cond_18
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 1080
    .line 1081
    .line 1082
    move-result v4

    .line 1083
    if-nez v4, :cond_19

    .line 1084
    .line 1085
    invoke-virtual/range {v20 .. v20}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 1086
    .line 1087
    .line 1088
    move-result-object v4

    .line 1089
    invoke-virtual {v11, v4}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 1090
    .line 1091
    .line 1092
    :cond_19
    new-instance v4, Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 1093
    .line 1094
    invoke-direct {v4}, Lcom/android/quickstep/utils/CreateTransactionHelper;-><init>()V

    .line 1095
    .line 1096
    .line 1097
    move/from16 v6, v22

    .line 1098
    .line 1099
    if-eq v9, v6, :cond_1b

    .line 1100
    .line 1101
    const/4 v6, 0x3

    .line 1102
    if-ne v9, v6, :cond_1a

    .line 1103
    .line 1104
    goto :goto_f

    .line 1105
    :cond_1a
    sget-object v6, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->PORTRAIT:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 1106
    .line 1107
    :goto_e
    move-object/from16 v24, v4

    .line 1108
    .line 1109
    goto :goto_10

    .line 1110
    :cond_1b
    :goto_f
    sget-object v6, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->LANDSCAPE:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 1111
    .line 1112
    goto :goto_e

    .line 1113
    :goto_10
    iget-boolean v4, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->isLandscape:Z

    .line 1114
    .line 1115
    if-nez v4, :cond_1c

    .line 1116
    .line 1117
    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    .line 1118
    .line 1119
    .line 1120
    move-result v4

    .line 1121
    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    .line 1122
    .line 1123
    .line 1124
    move-result v25

    .line 1125
    cmpg-float v4, v4, v25

    .line 1126
    .line 1127
    if-gtz v4, :cond_1d

    .line 1128
    .line 1129
    :cond_1c
    move-object/from16 v32, v7

    .line 1130
    .line 1131
    move-object/from16 v25, v8

    .line 1132
    .line 1133
    move-object/from16 v28, v10

    .line 1134
    .line 1135
    move-object/from16 v31, v13

    .line 1136
    .line 1137
    const/16 v21, 0x0

    .line 1138
    .line 1139
    const/16 v22, 0x1

    .line 1140
    .line 1141
    goto :goto_11

    .line 1142
    :cond_1d
    new-instance v4, Landroid/graphics/RectF;

    .line 1143
    .line 1144
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 1145
    .line 1146
    .line 1147
    move-object/from16 v25, v8

    .line 1148
    .line 1149
    iget v8, v12, Landroid/graphics/RectF;->left:F

    .line 1150
    .line 1151
    move-object/from16 v28, v10

    .line 1152
    .line 1153
    iget v10, v12, Landroid/graphics/RectF;->top:F

    .line 1154
    .line 1155
    move-object/from16 v31, v13

    .line 1156
    .line 1157
    iget v13, v12, Landroid/graphics/RectF;->bottom:F

    .line 1158
    .line 1159
    move-object/from16 v32, v7

    .line 1160
    .line 1161
    iget v7, v12, Landroid/graphics/RectF;->right:F

    .line 1162
    .line 1163
    invoke-virtual {v4, v8, v10, v13, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1164
    .line 1165
    .line 1166
    const/16 v21, 0x0

    .line 1167
    .line 1168
    aget-object v7, v28, v21

    .line 1169
    .line 1170
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 1171
    .line 1172
    .line 1173
    move-result v7

    .line 1174
    const/16 v22, 0x1

    .line 1175
    .line 1176
    aget-object v8, v28, v22

    .line 1177
    .line 1178
    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    .line 1179
    .line 1180
    .line 1181
    move-result v8

    .line 1182
    invoke-interface {v6, v4, v7, v8}, Lcom/android/launcher3/touch/G;->calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F

    .line 1183
    .line 1184
    .line 1185
    goto :goto_12

    .line 1186
    :goto_11
    aget-object v4, v28, v21

    .line 1187
    .line 1188
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    .line 1189
    .line 1190
    .line 1191
    move-result v4

    .line 1192
    aget-object v7, v28, v22

    .line 1193
    .line 1194
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 1195
    .line 1196
    .line 1197
    move-result v7

    .line 1198
    invoke-interface {v6, v12, v4, v7}, Lcom/android/launcher3/touch/G;->calculateWindowRadiusToHome(Landroid/graphics/RectF;FF)F

    .line 1199
    .line 1200
    .line 1201
    :goto_12
    sget-object v4, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 1202
    .line 1203
    iget-object v6, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 1204
    .line 1205
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v6

    .line 1209
    invoke-virtual {v4, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v4

    .line 1213
    check-cast v4, Lcom/android/launcher3/anim/C;

    .line 1214
    .line 1215
    invoke-virtual {v4}, Lcom/android/launcher3/anim/C;->T()I

    .line 1216
    .line 1217
    .line 1218
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWorkspaceView()Landroid/view/View;

    .line 1219
    .line 1220
    .line 1221
    move-result-object v4

    .line 1222
    instance-of v4, v4, Lcom/android/launcher3/BubbleTextView;

    .line 1223
    .line 1224
    if-eqz v4, :cond_1e

    .line 1225
    .line 1226
    invoke-virtual {v3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 1227
    .line 1228
    .line 1229
    move-result-object v4

    .line 1230
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 1231
    .line 1232
    .line 1233
    iget-object v4, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 1234
    .line 1235
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 1236
    .line 1237
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v4

    .line 1241
    iget v4, v4, Lcom/android/launcher3/h0;->B1:I

    .line 1242
    .line 1243
    :cond_1e
    const/4 v4, 0x0

    .line 1244
    invoke-virtual {v3, v4}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getEndRadius(Landroid/graphics/RectF;)F

    .line 1245
    .line 1246
    .line 1247
    move-result v4

    .line 1248
    iget-object v6, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1249
    .line 1250
    check-cast v6, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1251
    .line 1252
    invoke-virtual {v6, v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 1253
    .line 1254
    .line 1255
    iget-object v6, v1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1256
    .line 1257
    check-cast v6, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1258
    .line 1259
    invoke-virtual {v12}, Landroid/graphics/RectF;->height()F

    .line 1260
    .line 1261
    .line 1262
    move-result v7

    .line 1263
    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    .line 1264
    .line 1265
    .line 1266
    move-result v8

    .line 1267
    div-float/2addr v7, v8

    .line 1268
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->isSameAsStartRectAspectRatio(F)Z

    .line 1269
    .line 1270
    .line 1271
    move-result v6

    .line 1272
    invoke-static {}, LM3/a;->e()Z

    .line 1273
    .line 1274
    .line 1275
    move-result v7

    .line 1276
    if-eqz v7, :cond_1f

    .line 1277
    .line 1278
    move-object/from16 v34, v1

    .line 1279
    .line 1280
    move-object/from16 v16, v11

    .line 1281
    .line 1282
    move-object/from16 v33, v14

    .line 1283
    .line 1284
    :goto_13
    move-object v5, v12

    .line 1285
    goto/16 :goto_14

    .line 1286
    .line 1287
    :cond_1f
    iget-boolean v7, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->defferExecuteAnimation:Z

    .line 1288
    .line 1289
    invoke-virtual {v14}, Landroid/graphics/RectF;->toShortString()Ljava/lang/String;

    .line 1290
    .line 1291
    .line 1292
    move-result-object v8

    .line 1293
    const/16 v22, 0x1

    .line 1294
    .line 1295
    aget-object v10, v28, v22

    .line 1296
    .line 1297
    const/16 v21, 0x0

    .line 1298
    .line 1299
    aget-object v13, v28, v21

    .line 1300
    .line 1301
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isReverseEnable()Z

    .line 1302
    .line 1303
    .line 1304
    move-result v3

    .line 1305
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 1306
    .line 1307
    .line 1308
    move-result v2

    .line 1309
    move-object/from16 v16, v11

    .line 1310
    .line 1311
    invoke-virtual/range {p0 .. p0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 1312
    .line 1313
    .line 1314
    move-result-object v11

    .line 1315
    move-object/from16 v33, v14

    .line 1316
    .line 1317
    new-instance v14, Ljava/lang/StringBuilder;

    .line 1318
    .line 1319
    move-object/from16 v34, v1

    .line 1320
    .line 1321
    const-string v1, " createAppToHomeAnimation: prepare, defferExecuteAnimation: "

    .line 1322
    .line 1323
    invoke-direct {v14, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1324
    .line 1325
    .line 1326
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 1327
    .line 1328
    .line 1329
    const-string v1, ", targetRect: "

    .line 1330
    .line 1331
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1332
    .line 1333
    .line 1334
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1335
    .line 1336
    .line 1337
    const-string v1, ", iconRadius: "

    .line 1338
    .line 1339
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    .line 1341
    .line 1342
    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1343
    .line 1344
    .line 1345
    const-string v1, ", winRadius: "

    .line 1346
    .line 1347
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1348
    .line 1349
    .line 1350
    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1351
    .line 1352
    .line 1353
    const-string v1, ", iconSize: "

    .line 1354
    .line 1355
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1356
    .line 1357
    .line 1358
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1359
    .line 1360
    .line 1361
    const-string v1, ", endRadius: "

    .line 1362
    .line 1363
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1364
    .line 1365
    .line 1366
    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1367
    .line 1368
    .line 1369
    const-string v1, ", closeWindowRect: "

    .line 1370
    .line 1371
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1372
    .line 1373
    .line 1374
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1375
    .line 1376
    .line 1377
    const-string v1, ", rotation: "

    .line 1378
    .line 1379
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1380
    .line 1381
    .line 1382
    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1383
    .line 1384
    .line 1385
    const-string v1, ", reverseEnable = "

    .line 1386
    .line 1387
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1388
    .line 1389
    .line 1390
    const-string v1, ", homeAnimationFactory.isViewSupportAsync: "

    .line 1391
    .line 1392
    const-string v4, ", handler: "

    .line 1393
    .line 1394
    invoke-static {v14, v3, v1, v2, v4}, Lcom/android/quickstep/util/MFVStringUtils;->appendToStringBuilder(Ljava/lang/StringBuilder;ZLjava/lang/String;ZLjava/lang/String;)V

    .line 1395
    .line 1396
    .line 1397
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1398
    .line 1399
    .line 1400
    const-string v1, ", isSameAsStartRectAspectRatio: "

    .line 1401
    .line 1402
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1403
    .line 1404
    .line 1405
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 1406
    .line 1407
    .line 1408
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1409
    .line 1410
    .line 1411
    move-result-object v1

    .line 1412
    invoke-static {v15, v0, v1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1413
    .line 1414
    .line 1415
    goto/16 :goto_13

    .line 1416
    .line 1417
    :goto_14
    new-instance v12, Lcom/android/launcher3/anim/S;

    .line 1418
    .line 1419
    invoke-direct {v12}, Lcom/android/launcher3/anim/S;-><init>()V

    .line 1420
    .line 1421
    .line 1422
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1423
    .line 1424
    const/4 v2, 0x0

    .line 1425
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 1426
    .line 1427
    .line 1428
    if-eqz v6, :cond_20

    .line 1429
    .line 1430
    const/4 v6, 0x1

    .line 1431
    invoke-virtual {v1, v2, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 1432
    .line 1433
    .line 1434
    move-object/from16 v9, v16

    .line 1435
    .line 1436
    move-object/from16 v8, v32

    .line 1437
    .line 1438
    move-object/from16 v14, v33

    .line 1439
    .line 1440
    move-object/from16 v3, v34

    .line 1441
    .line 1442
    goto :goto_15

    .line 1443
    :cond_20
    move-object/from16 v3, v34

    .line 1444
    .line 1445
    const/4 v6, 0x1

    .line 1446
    iget-object v4, v3, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1447
    .line 1448
    check-cast v4, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1449
    .line 1450
    invoke-virtual {v4}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getStartRect()Landroid/graphics/RectF;

    .line 1451
    .line 1452
    .line 1453
    move-result-object v4

    .line 1454
    iget-object v7, v3, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1455
    .line 1456
    check-cast v7, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1457
    .line 1458
    invoke-virtual {v7}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMReverseToOpen()Z

    .line 1459
    .line 1460
    .line 1461
    move-result v7

    .line 1462
    move-object/from16 v9, v16

    .line 1463
    .line 1464
    move-object/from16 v8, v32

    .line 1465
    .line 1466
    move-object/from16 v14, v33

    .line 1467
    .line 1468
    invoke-virtual {v8, v9, v4, v14, v7}, Lcom/android/quickstep/util/animation/RectTransformHelper;->calculateWindowAlpha(Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;Landroid/graphics/RectF;Z)F

    .line 1469
    .line 1470
    .line 1471
    move-result v4

    .line 1472
    cmpl-float v7, v4, p1

    .line 1473
    .line 1474
    if-lez v7, :cond_21

    .line 1475
    .line 1476
    invoke-virtual {v1, v2, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 1477
    .line 1478
    .line 1479
    goto :goto_15

    .line 1480
    :cond_21
    const/4 v7, -0x1

    .line 1481
    invoke-virtual {v1, v2, v7}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 1482
    .line 1483
    .line 1484
    invoke-static {}, LM3/a;->g()Z

    .line 1485
    .line 1486
    .line 1487
    move-result v1

    .line 1488
    if-eqz v1, :cond_22

    .line 1489
    .line 1490
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1491
    .line 1492
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1493
    .line 1494
    .line 1495
    const-string v2, "possibleInitAlpha = "

    .line 1496
    .line 1497
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1498
    .line 1499
    .line 1500
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1501
    .line 1502
    .line 1503
    const-string v2, ", use default alpha"

    .line 1504
    .line 1505
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1506
    .line 1507
    .line 1508
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1509
    .line 1510
    .line 1511
    move-result-object v1

    .line 1512
    invoke-static {v15, v0, v1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1513
    .line 1514
    .line 1515
    :cond_22
    :goto_15
    iget-object v0, v3, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1516
    .line 1517
    check-cast v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1518
    .line 1519
    move-object v1, v0

    .line 1520
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;

    .line 1521
    .line 1522
    new-instance v13, Landroid/graphics/RectF;

    .line 1523
    .line 1524
    move-object/from16 v2, p0

    .line 1525
    .line 1526
    iget-object v4, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 1527
    .line 1528
    iget v7, v4, Lcom/android/launcher3/h0;->T0:I

    .line 1529
    .line 1530
    int-to-float v7, v7

    .line 1531
    iget v4, v4, Lcom/android/launcher3/h0;->U0:I

    .line 1532
    .line 1533
    int-to-float v4, v4

    .line 1534
    const/4 v10, 0x0

    .line 1535
    invoke-direct {v13, v10, v10, v7, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1536
    .line 1537
    .line 1538
    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 1539
    .line 1540
    const/4 v7, -0x1

    .line 1541
    invoke-direct {v4, v7}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 1542
    .line 1543
    .line 1544
    move-object/from16 v11, p3

    .line 1545
    .line 1546
    move-object/from16 v37, v1

    .line 1547
    .line 1548
    move-object/from16 v16, v4

    .line 1549
    .line 1550
    move-object v6, v14

    .line 1551
    move-object/from16 v15, v23

    .line 1552
    .line 1553
    move-object/from16 v1, v24

    .line 1554
    .line 1555
    move-object/from16 v18, v28

    .line 1556
    .line 1557
    move-object/from16 v7, v29

    .line 1558
    .line 1559
    move-object/from16 v10, v30

    .line 1560
    .line 1561
    move-object/from16 v4, p2

    .line 1562
    .line 1563
    move-object v14, v8

    .line 1564
    move-object/from16 v8, v25

    .line 1565
    .line 1566
    invoke-direct/range {v0 .. v19}, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationUpdateListener;-><init>(Lcom/android/quickstep/utils/CreateTransactionHelper;Lcom/android/quickstep/AbsSwipeUpHandler;Lkotlin/jvm/internal/C;Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix;Lcom/android/launcher3/anim/q;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Landroid/graphics/RectF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lcom/android/launcher3/anim/S;Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/RectTransformHelper;Landroid/graphics/PointF;Ljava/util/concurrent/atomic/AtomicInteger;Landroid/graphics/RectF;[Ljava/lang/Float;[Lu2/s;)V

    .line 1567
    .line 1568
    .line 1569
    move-object v6, v3

    .line 1570
    move-object v4, v8

    .line 1571
    move-object/from16 v1, v37

    .line 1572
    .line 1573
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V

    .line 1574
    .line 1575
    .line 1576
    iget-object v0, v6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1577
    .line 1578
    move-object v7, v0

    .line 1579
    check-cast v7, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1580
    .line 1581
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;

    .line 1582
    .line 1583
    move-object/from16 v3, p0

    .line 1584
    .line 1585
    move-object/from16 v1, p3

    .line 1586
    .line 1587
    move-object/from16 v5, v20

    .line 1588
    .line 1589
    move-object/from16 v2, v31

    .line 1590
    .line 1591
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lkotlin/jvm/internal/z;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/anim/q;Lcom/android/quickstep/util/TransformParams;)V

    .line 1592
    .line 1593
    .line 1594
    move-object v1, v0

    .line 1595
    move-object v2, v3

    .line 1596
    move-object v0, v5

    .line 1597
    invoke-virtual {v7, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 1598
    .line 1599
    .line 1600
    iget-object v1, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 1601
    .line 1602
    if-eqz v1, :cond_23

    .line 1603
    .line 1604
    sget-object v1, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 1605
    .line 1606
    :cond_23
    invoke-static/range {v26 .. v27}, Landroid/os/Trace;->traceEnd(J)V

    .line 1607
    .line 1608
    .line 1609
    iget-object v1, v2, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 1610
    .line 1611
    if-eqz v1, :cond_24

    .line 1612
    .line 1613
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 1614
    .line 1615
    .line 1616
    move-result-object v1

    .line 1617
    if-eqz v1, :cond_24

    .line 1618
    .line 1619
    iget-object v2, v6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1620
    .line 1621
    check-cast v2, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1622
    .line 1623
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 1624
    .line 1625
    .line 1626
    sget-object v1, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 1627
    .line 1628
    :cond_24
    invoke-virtual/range {p3 .. p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isViewSupportAsync()Z

    .line 1629
    .line 1630
    .line 1631
    move-result v1

    .line 1632
    if-eqz v1, :cond_25

    .line 1633
    .line 1634
    invoke-virtual {v0}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 1635
    .line 1636
    .line 1637
    move-result-object v0

    .line 1638
    if-eqz v0, :cond_25

    .line 1639
    .line 1640
    const/4 v10, 0x1

    .line 1641
    invoke-virtual {v0, v10}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->setAsyncAnimStarted(Z)V

    .line 1642
    .line 1643
    .line 1644
    sget-object v0, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 1645
    .line 1646
    :cond_25
    iget-object v0, v6, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 1647
    .line 1648
    check-cast v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 1649
    .line 1650
    return-object v0
.end method

.method private createWindowAnimationToPip(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/view/RemoteAnimationTarget;F)Lcom/android/quickstep/util/SwipePipToHomeAnimator;
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    return-object v3

    .line 9
    :cond_0
    iget-object v2, p2, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 10
    .line 11
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 12
    .line 13
    aget-object v4, v4, v1

    .line 14
    .line 15
    invoke-virtual {v4}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-direct {p0, p2, v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->calculateWindowRotation(Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/RecentsOrientedState;)I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-virtual {v4}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    iget-object v6, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 32
    .line 33
    array-length v6, v6

    .line 34
    new-array v6, v6, [Landroid/graphics/Matrix;

    .line 35
    .line 36
    invoke-virtual {p0, v6, p3}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateProgressForStartRect([Landroid/graphics/Matrix;F)[Landroid/graphics/RectF;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    aget-object p3, p3, v1

    .line 41
    .line 42
    aget-object v6, v6, v1

    .line 43
    .line 44
    new-instance v7, Landroid/graphics/Matrix;

    .line 45
    .line 46
    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v6, v7}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 50
    .line 51
    .line 52
    invoke-virtual {v7, p3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 53
    .line 54
    .line 55
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getKeepClearAreaForHotseat()Landroid/graphics/Rect;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    sget-object v8, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 60
    .line 61
    iget-object v9, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 62
    .line 63
    invoke-virtual {v8, v9}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    check-cast v8, Lcom/android/quickstep/SystemUiProxy;

    .line 68
    .line 69
    invoke-virtual {v8, v2, v4, v7}, Lcom/android/quickstep/SystemUiProxy;->startSwipePipToHome(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    if-nez v7, :cond_1

    .line 74
    .line 75
    return-object v3

    .line 76
    :cond_1
    new-instance v3, Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 79
    .line 80
    .line 81
    iget-object v8, v2, Landroid/app/ActivityManager$RunningTaskInfo;->configuration:Landroid/content/res/Configuration;

    .line 82
    .line 83
    iget-object v8, v8, Landroid/content/res/Configuration;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 84
    .line 85
    invoke-virtual {v8}, Landroid/app/WindowConfiguration;->getWindowingMode()I

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    if-ne v9, v0, :cond_2

    .line 90
    .line 91
    iget-object v8, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 92
    .line 93
    aget-object v8, v8, v1

    .line 94
    .line 95
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 96
    .line 97
    .line 98
    move-result-object v8

    .line 99
    invoke-virtual {v8}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCropRect()Landroid/graphics/RectF;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    invoke-virtual {v8, v3}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_2
    invoke-virtual {v8}, Landroid/app/WindowConfiguration;->getBounds()Landroid/graphics/Rect;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-virtual {v3, v8}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 112
    .line 113
    .line 114
    :goto_0
    new-instance v8, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 115
    .line 116
    invoke-direct {v8}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v9, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 120
    .line 121
    invoke-virtual {v8, v9}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setContext(Landroid/content/Context;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    iget v9, p2, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 126
    .line 127
    invoke-virtual {v8, v9}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setTaskId(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    iget-object v9, v2, Landroid/app/ActivityManager$RunningTaskInfo;->topActivityInfo:Landroid/content/pm/ActivityInfo;

    .line 132
    .line 133
    invoke-virtual {v8, v9}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setActivityInfo(Landroid/content/pm/ActivityInfo;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object v8

    .line 137
    iget-object v9, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 138
    .line 139
    iget v9, v9, Lcom/android/launcher3/h0;->B1:I

    .line 140
    .line 141
    invoke-virtual {v8, v9}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setAppIconSizePx(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    iget-object v9, p2, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 146
    .line 147
    invoke-virtual {v8, v9}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setLeash(Landroid/view/SurfaceControl;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 148
    .line 149
    .line 150
    move-result-object v8

    .line 151
    iget-object p2, p2, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 152
    .line 153
    iget-object p2, p2, Landroid/app/ActivityManager$RunningTaskInfo;->pictureInPictureParams:Landroid/app/PictureInPictureParams;

    .line 154
    .line 155
    invoke-virtual {p2}, Landroid/app/PictureInPictureParams;->getSourceRectHint()Landroid/graphics/Rect;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {v8, p2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setSourceRectHint(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 160
    .line 161
    .line 162
    move-result-object p2

    .line 163
    invoke-virtual {p2, v3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setAppBounds(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p2, v6}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setHomeToWindowPositionMap(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setStartBounds(Landroid/graphics/RectF;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-virtual {p2, v7}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setDestinationBounds(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    iget-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 180
    .line 181
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getPipCornerRadius()I

    .line 182
    .line 183
    .line 184
    move-result p3

    .line 185
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setCornerRadius(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    iget-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 190
    .line 191
    invoke-virtual {p3}, Lcom/android/quickstep/views/RecentsView;->getPipShadowRadius()I

    .line 192
    .line 193
    .line 194
    move-result p3

    .line 195
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setShadowRadius(I)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    iget-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 200
    .line 201
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setAttachedView(Landroid/view/View;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    if-nez v4, :cond_4

    .line 206
    .line 207
    if-eq v5, v0, :cond_3

    .line 208
    .line 209
    const/4 p3, 0x3

    .line 210
    if-ne v5, p3, :cond_4

    .line 211
    .line 212
    :cond_3
    iget-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 213
    .line 214
    aget-object p3, p3, v1

    .line 215
    .line 216
    invoke-virtual {p3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 217
    .line 218
    .line 219
    move-result-object p3

    .line 220
    iget-object v2, v2, Landroid/app/ActivityManager$RunningTaskInfo;->displayCutoutInsets:Landroid/graphics/Rect;

    .line 221
    .line 222
    invoke-virtual {p2, p3, v5, v2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setFromRotation(Lcom/android/quickstep/util/TaskViewSimulator;ILandroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_4
    iget-object p3, v2, Landroid/app/ActivityManager$RunningTaskInfo;->displayCutoutInsets:Landroid/graphics/Rect;

    .line 227
    .line 228
    if-eqz p3, :cond_5

    .line 229
    .line 230
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->setDisplayCutoutInsets(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;

    .line 231
    .line 232
    .line 233
    :cond_5
    :goto_1
    invoke-virtual {p2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator$Builder;->build()Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->createActivityAnimationToHome()Lcom/android/launcher3/anim/q;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    new-instance p3, Lcom/android/quickstep/AbsSwipeUpHandler$10;

    .line 242
    .line 243
    invoke-direct {p3, p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler$10;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/anim/q;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p2, p3}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 247
    .line 248
    .line 249
    new-array p1, v0, [Lcom/android/quickstep/util/RectFSpringAnim;

    .line 250
    .line 251
    aput-object p2, p1, v1

    .line 252
    .line 253
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupWindowAnimation([Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 254
    .line 255
    .line 256
    return-object p2
.end method

.method public static synthetic d(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onTasksAppeared$36(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetStateForAnimationCancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private doLogGesture(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/views/TaskView;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->P0:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/android/quickstep/AbsSwipeUpHandler$17;->$SwitchMap$com$android$quickstep$GestureState$GestureEndTarget:[I

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    aget v1, v1, v2

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    const/4 v3, 0x1

    .line 26
    if-eq v1, v3, :cond_5

    .line 27
    .line 28
    if-eq v1, v2, :cond_4

    .line 29
    .line 30
    const/4 v4, 0x3

    .line 31
    if-eq v1, v4, :cond_1

    .line 32
    .line 33
    const/4 v4, 0x4

    .line 34
    if-eq v1, v4, :cond_1

    .line 35
    .line 36
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->h:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLogDirectionUpOrLeft:Z

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->n0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->o0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 50
    .line 51
    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    if-eqz p2, :cond_6

    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {v1}, LO2/d;->c(Landroid/content/Context;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_6

    .line 63
    .line 64
    sget-object v1, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_QUICK_SWITCH:Landroid/window/DesktopModeFlags;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_6

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getType()Lcom/android/quickstep/views/TaskViewType;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    sget-object v4, Lcom/android/quickstep/views/TaskViewType;->DESKTOP:Lcom/android/quickstep/views/TaskViewType;

    .line 77
    .line 78
    if-ne v1, v4, :cond_3

    .line 79
    .line 80
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->p0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mPreviousTaskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 87
    .line 88
    if-ne v1, v4, :cond_6

    .line 89
    .line 90
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->q0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_4
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->m0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_5
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->w0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_6
    :goto_1
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 108
    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 112
    .line 113
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    goto :goto_2

    .line 118
    :cond_7
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 119
    .line 120
    :goto_2
    invoke-static {v1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iget v4, p1, Lcom/android/quickstep/GestureState$GestureEndTarget;->containerType:I

    .line 133
    .line 134
    invoke-interface {v1, v4}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 139
    .line 140
    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    if-eqz v4, :cond_8

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_8
    move v2, v3

    .line 148
    :goto_3
    invoke-interface {v1, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInputType(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    if-eqz p2, :cond_9

    .line 153
    .line 154
    invoke-virtual {p2}, Lcom/android/quickstep/views/TaskView;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    invoke-interface {v1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 159
    .line 160
    .line 161
    :cond_9
    sget-object p2, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 162
    .line 163
    if-eq p1, p2, :cond_b

    .line 164
    .line 165
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 166
    .line 167
    if-nez p0, :cond_a

    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_a
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    goto :goto_5

    .line 175
    :cond_b
    :goto_4
    const/4 p0, -0x1

    .line 176
    :goto_5
    invoke-interface {v1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withRank(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 177
    .line 178
    .line 179
    new-instance p0, Lcom/android/launcher3/p2;

    .line 180
    .line 181
    invoke-direct {p0, v1}, Lcom/android/launcher3/p2;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 185
    .line 186
    .line 187
    :cond_c
    :goto_6
    return-void
.end method

.method private dpiFromPx(F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic e(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setScreenshotCapturedState()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$startNewTask$22(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private endLauncherTransitionController()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHasEndedLauncherTransition:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->getNormalController()Lcom/android/launcher3/anim/q;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/android/quickstep/f0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/android/quickstep/f0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/q;->l(Landroid/animation/TimeInterpolator;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->getNormalController()Lcom/android/launcher3/anim/q;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->abortScrollerAnimation(Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method private endRunningWindowAnim(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    array-length p1, v0

    .line 9
    :goto_0
    if-ge v1, p1, :cond_3

    .line 10
    .line 11
    aget-object v2, v0, v1

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v2}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    array-length p1, v0

    .line 22
    :goto_1
    if-ge v1, p1, :cond_3

    .line 23
    .line 24
    aget-object v2, v0, v1

    .line 25
    .line 26
    if-eqz v2, :cond_2

    .line 27
    .line 28
    invoke-interface {v2}, Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;->end()V

    .line 29
    .line 30
    .line 31
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    .line 35
    .line 36
    if-eqz p0, :cond_4

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 39
    .line 40
    .line 41
    :cond_4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$initStateCallbacks$4(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishCurrentTransitionToRecents()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private finishCurrentTransitionToHome()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasTargets()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeFinishSwipePipToHome()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeFinishSwipeMiniWindowToHome()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/android/quickstep/O;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/android/quickstep/O;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsControllerToHome(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 28
    .line 29
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeAbortSwipePipToHome()V

    .line 35
    .line 36
    .line 37
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 47
    .line 48
    :cond_2
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    if-nez v2, :cond_3

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_3
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :goto_2
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->doLogGesture(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/views/TaskView;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private finishCurrentTransitionToRecents()V
    .locals 3

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 11
    .line 12
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Lcom/android/quickstep/RecentsAnimationController;->detachNavigationBarFromApp(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    new-instance v2, Lcom/android/quickstep/M;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Lcom/android/quickstep/M;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 39
    .line 40
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logFinishRecentsAnimationOnTasksAppeared()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private flushOnRecentsAnimationAndLauncherBound()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 6
    .line 7
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_BIND_TO_SERVICE:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/lang/Runnable;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onDeferredActivityLaunch$10()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$finishCurrentTransitionToHome$27()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getClosingAppTarget([Lu2/s;)Lu2/s;
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_1

    .line 4
    .line 5
    aget-object v1, p1, v0

    .line 6
    .line 7
    iget v2, v1, Lu2/s;->m:I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v2, v3, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method private final getClosingSourceWinBounds([Lu2/s;)Landroid/graphics/RectF;
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 9
    .line 10
    int-to-float p0, p0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v2, v2, v1, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 13
    .line 14
    .line 15
    array-length p0, p1

    .line 16
    const/4 v1, 0x0

    .line 17
    :goto_0
    if-ge v1, p0, :cond_1

    .line 18
    .line 19
    aget-object v2, p1, v1

    .line 20
    .line 21
    iget v3, v2, Lu2/s;->m:I

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-ne v3, v4, :cond_0

    .line 25
    .line 26
    iget-object p0, v2, Lu2/s;->s:Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, v2, Lu2/s;->n:Landroid/graphics/Point;

    .line 32
    .line 33
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    const-string v1, ", bounds = "

    .line 38
    .line 39
    const-string v3, "getClosingSourceWinBounds: x = "

    .line 40
    .line 41
    const-string v4, ", y = "

    .line 42
    .line 43
    invoke-static {v3, p1, v4, p0, v1}, Lcom/android/quickstep/util/MFVStringUtils;->appendToNewStringBuilder(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p1, "AbsSwipeUpHandler"

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const-string v1, "QuickStep"

    .line 57
    .line 58
    invoke-static {v1, p1, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, v2, Lu2/s;->n:Landroid/graphics/Point;

    .line 62
    .line 63
    iget p1, p0, Landroid/graphics/Point;->x:I

    .line 64
    .line 65
    int-to-float p1, p1

    .line 66
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 67
    .line 68
    int-to-float p0, p0

    .line 69
    invoke-virtual {v0, p1, p0}, Landroid/graphics/RectF;->offsetTo(FF)V

    .line 70
    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    return-object v0
.end method

.method private final getCurrentShiftValue()F
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->INSTANCE:Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController$Companion;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isAttached()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->getFinalPositionOfScrollYSpring()F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    :goto_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0

    .line 41
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 42
    .line 43
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 44
    .line 45
    return p0
.end method

.method private getKeepClearAreaForHotseat()Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->H0:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->S0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Landroid/graphics/Rect;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 17
    .line 18
    iget v1, p0, Lcom/android/launcher3/h0;->f2:I

    .line 19
    .line 20
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 21
    .line 22
    invoke-direct {v0, v2, v2, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 27
    .line 28
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/Rect;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 35
    .line 36
    iget v1, p0, Lcom/android/launcher3/h0;->T0:I

    .line 37
    .line 38
    iget v3, p0, Lcom/android/launcher3/h0;->f2:I

    .line 39
    .line 40
    sub-int v3, v1, v3

    .line 41
    .line 42
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 43
    .line 44
    invoke-direct {v0, v3, v2, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 51
    .line 52
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 53
    .line 54
    iget v3, p0, Lcom/android/launcher3/h0;->f2:I

    .line 55
    .line 56
    sub-int v3, v1, v3

    .line 57
    .line 58
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 59
    .line 60
    invoke-direct {v0, v2, v3, p0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 61
    .line 62
    .line 63
    return-object v0

    .line 64
    :cond_2
    new-instance v0, Landroid/graphics/Rect;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 67
    .line 68
    iget v1, p0, Lcom/android/launcher3/h0;->U0:I

    .line 69
    .line 70
    iget v3, p0, Lcom/android/launcher3/h0;->f2:I

    .line 71
    .line 72
    sub-int v3, v1, v3

    .line 73
    .line 74
    iget p0, p0, Lcom/android/launcher3/h0;->T0:I

    .line 75
    .line 76
    invoke-direct {v0, v2, v3, p0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 77
    .line 78
    .line 79
    return-object v0
.end method

.method private final getMSwipeUpVelocityParam()Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipeUpVelocityParam:Lcom/android/quickstep/util/animation/AnimParamProvider$SwipeUpVelocityParam;

    .line 2
    .line 3
    return-object p0
.end method

.method private static getNextStateFlag(Ljava/lang/String;)I
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_NAMES:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/android/quickstep/AbsSwipeUpHandler;->FLAG_COUNT:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    shl-int v1, v0, p0

    .line 10
    .line 11
    add-int/2addr p0, v0

    .line 12
    sput p0, Lcom/android/quickstep/AbsSwipeUpHandler;->FLAG_COUNT:I

    .line 13
    .line 14
    return v1
.end method

.method private getScaleProgressDueToScroll()F
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->shouldLinkRecentsViewScroll()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/RecentsView;->getScrollOffset(I)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v2, v0

    .line 42
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-interface {v3, v4, v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(II)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 67
    .line 68
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getPageSpacing()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    add-int/2addr v0, v3

    .line 73
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 74
    .line 75
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getMaxScaleForFullScreen()F

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    const v4, 0x3d8f5c29    # 0.07f

    .line 80
    .line 81
    .line 82
    mul-float v5, v3, v4

    .line 83
    .line 84
    iget v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mQuickSwitchScaleScrollThreshold:F

    .line 85
    .line 86
    cmpg-float p0, v2, v4

    .line 87
    .line 88
    if-gez p0, :cond_1

    .line 89
    .line 90
    move v6, v5

    .line 91
    const/4 v5, 0x0

    .line 92
    sget-object v7, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    move v6, v5

    .line 100
    int-to-float p0, v0

    .line 101
    sub-float v0, p0, v4

    .line 102
    .line 103
    cmpl-float v0, v2, v0

    .line 104
    .line 105
    if-lez v0, :cond_2

    .line 106
    .line 107
    sub-float v3, p0, v4

    .line 108
    .line 109
    move v5, v6

    .line 110
    const/4 v6, 0x0

    .line 111
    sget-object v7, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 112
    .line 113
    move v4, p0

    .line 114
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 115
    .line 116
    .line 117
    :cond_2
    :goto_0
    return v1
.end method

.method private static getTrackedEventForState(I)Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_STARTED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 9
    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_COMPLETED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_CANCELLED:I

    .line 16
    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_GESTURE_CANCELLED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 23
    .line 24
    if-ne p0, v0, :cond_3

    .line 25
    .line 26
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_SCREENSHOT_CAPTURED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 30
    .line 31
    if-ne p0, v0, :cond_4

    .line 32
    .line 33
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_CAPTURE_SCREENSHOT:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 37
    .line 38
    if-ne p0, v0, :cond_5

    .line 39
    .line 40
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_HANDLER_INVALIDATED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_5
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 44
    .line 45
    if-ne p0, v0, :cond_6

    .line 46
    .line 47
    sget-object p0, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->STATE_LAUNCHER_DRAWN:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method

.method public static synthetic h(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onActivityInit$6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$switchToScreenshot$24()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private handOffAnimation(Landroid/graphics/PointF;)V
    .locals 2

    .line 1
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lu2/F$b;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/Choreographer;->getFrameTime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-direct {p0, v0, v1, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->handOffAnimationInternal(JLandroid/graphics/PointF;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/android/quickstep/B;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/B;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/PointF;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    return-void
.end method

.method private handOffAnimationInternal(JLandroid/graphics/PointF;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 7
    .line 8
    invoke-static {v0, p1, p2, p3}, Lcom/android/quickstep/TaskViewUtils;->extractTargetsAndStates([Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;JLandroid/graphics/PointF;)Landroid/util/Pair;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 13
    .line 14
    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p2, [Landroid/view/RemoteAnimationTarget;

    .line 17
    .line 18
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, [Landroid/window/WindowAnimationState;

    .line 21
    .line 22
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/RecentsAnimationController;->handOffAnimation([Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logHandOffAnimation()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private handleNormalGestureEnd(FZLandroid/graphics/PointF;ZZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-wide/16 v1, 0x1c2

    .line 10
    .line 11
    :goto_0
    move-wide v6, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-wide/16 v1, 0x15e

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :goto_1
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 17
    .line 18
    iget v8, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 19
    .line 20
    move/from16 v2, p1

    .line 21
    .line 22
    move/from16 v3, p2

    .line 23
    .line 24
    move-object/from16 v1, p3

    .line 25
    .line 26
    move/from16 v4, p4

    .line 27
    .line 28
    move/from16 v5, p5

    .line 29
    .line 30
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/AbsSwipeUpHandler;->calculateEndTarget(Landroid/graphics/PointF;FZZZ)Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    invoke-virtual {v4, v2, v5}, Lcom/android/quickstep/GestureState;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-interface {v4, v2}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 48
    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    move/from16 v9, p4

    .line 52
    .line 53
    invoke-virtual {v4, v9, v2, v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->handleNormalGestureEnd(ZLcom/android/quickstep/GestureState$GestureEndTarget;Z)V

    .line 54
    .line 55
    .line 56
    :cond_2
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 57
    .line 58
    if-eq v2, v4, :cond_3

    .line 59
    .line 60
    sget-object v9, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 61
    .line 62
    if-ne v2, v9, :cond_4

    .line 63
    .line 64
    :cond_3
    invoke-static {}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer;->getGestureState()Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    iget-object v10, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 69
    .line 70
    const/4 v11, 0x5

    .line 71
    invoke-virtual {v9, v10, v11}, Lcom/android/quickstep/inputconsumers/GestureCourseInputConsumer$GestureCourseState;->syncGestureState(Landroid/content/Context;I)V

    .line 72
    .line 73
    .line 74
    :cond_4
    invoke-virtual {v0, v5}, Lcom/android/quickstep/AbsSwipeUpHandler;->setMiniWindowWeaken(Z)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 78
    .line 79
    .line 80
    move-result v9

    .line 81
    const/4 v10, 0x1

    .line 82
    if-eqz v9, :cond_6

    .line 83
    .line 84
    iget-boolean v9, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 85
    .line 86
    if-eqz v9, :cond_6

    .line 87
    .line 88
    iget-object v9, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 89
    .line 90
    invoke-virtual {v9}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    if-eqz v9, :cond_6

    .line 95
    .line 96
    iget-object v9, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 97
    .line 98
    invoke-virtual {v9}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    if-eq v2, v4, :cond_5

    .line 103
    .line 104
    move v11, v10

    .line 105
    goto :goto_2

    .line 106
    :cond_5
    move v11, v5

    .line 107
    :goto_2
    invoke-virtual {v9, v11}, Lcom/android/launcher3/taskbar/o4;->O(Z)V

    .line 108
    .line 109
    .line 110
    :cond_6
    iget-boolean v9, v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    .line 111
    .line 112
    const/4 v11, 0x0

    .line 113
    if-eqz v9, :cond_7

    .line 114
    .line 115
    const/high16 v9, 0x3f800000    # 1.0f

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_7
    move v9, v11

    .line 119
    :goto_3
    if-nez v3, :cond_8

    .line 120
    .line 121
    sub-float v3, v9, v8

    .line 122
    .line 123
    long-to-float v11, v6

    .line 124
    mul-float/2addr v3, v11

    .line 125
    sget v11, Lcom/android/quickstep/AbsSwipeUpHandler;->SWIPE_DURATION_MULTIPLIER:F

    .line 126
    .line 127
    mul-float/2addr v3, v11

    .line 128
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    int-to-long v11, v3

    .line 137
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    .line 138
    .line 139
    .line 140
    move-result-wide v11

    .line 141
    goto :goto_5

    .line 142
    :cond_8
    invoke-static {}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->isEnabled()Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_a

    .line 147
    .line 148
    cmpg-float v3, v8, v11

    .line 149
    .line 150
    if-gtz v3, :cond_9

    .line 151
    .line 152
    const v3, 0x3a83126f    # 0.001f

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_9
    move v3, v8

    .line 157
    goto :goto_4

    .line 158
    :cond_a
    iget v3, v1, Landroid/graphics/PointF;->y:F

    .line 159
    .line 160
    iget-object v12, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 161
    .line 162
    invoke-static {v12}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 163
    .line 164
    .line 165
    move-result v12

    .line 166
    int-to-float v12, v12

    .line 167
    mul-float/2addr v3, v12

    .line 168
    iget v12, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 169
    .line 170
    int-to-float v12, v12

    .line 171
    div-float/2addr v3, v12

    .line 172
    sub-float v3, v8, v3

    .line 173
    .line 174
    iget v12, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 175
    .line 176
    invoke-static {v3, v11, v12}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    :goto_4
    iget v11, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    .line 181
    .line 182
    if-lez v11, :cond_b

    .line 183
    .line 184
    sub-float v8, v9, v8

    .line 185
    .line 186
    int-to-float v11, v11

    .line 187
    mul-float/2addr v8, v11

    .line 188
    iget v11, v1, Landroid/graphics/PointF;->y:F

    .line 189
    .line 190
    div-float/2addr v8, v11

    .line 191
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    .line 192
    .line 193
    .line 194
    move-result v8

    .line 195
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    .line 196
    .line 197
    .line 198
    move-result v8

    .line 199
    int-to-long v11, v8

    .line 200
    const-wide/16 v13, 0x2

    .line 201
    .line 202
    mul-long/2addr v11, v13

    .line 203
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    .line 204
    .line 205
    .line 206
    move-result-wide v11

    .line 207
    move v8, v3

    .line 208
    goto :goto_5

    .line 209
    :cond_b
    move v8, v3

    .line 210
    move-wide v11, v6

    .line 211
    :goto_5
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 212
    .line 213
    invoke-virtual {v3, v2}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-direct {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isKeyboardTaskFocusPending()Z

    .line 218
    .line 219
    .line 220
    move-result v13

    .line 221
    if-eqz v13, :cond_c

    .line 222
    .line 223
    sget-object v13, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_c
    iget-object v13, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 227
    .line 228
    invoke-interface {v3, v13}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    .line 229
    .line 230
    .line 231
    move-result v13

    .line 232
    if-eqz v13, :cond_d

    .line 233
    .line 234
    sget-object v13, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_d
    sget-object v13, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 238
    .line 239
    if-ne v2, v13, :cond_f

    .line 240
    .line 241
    invoke-static {}, Lx1/O;->N1()Z

    .line 242
    .line 243
    .line 244
    move-result v13

    .line 245
    if-eqz v13, :cond_e

    .line 246
    .line 247
    sget-object v13, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 248
    .line 249
    goto :goto_6

    .line 250
    :cond_e
    sget-object v13, Lcom/android/launcher3/anim/L;->X:Landroid/view/animation/Interpolator;

    .line 251
    .line 252
    goto :goto_6

    .line 253
    :cond_f
    sget-object v13, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 254
    .line 255
    :goto_6
    iget-boolean v14, v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    .line 256
    .line 257
    if-eqz v14, :cond_10

    .line 258
    .line 259
    iget-object v14, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 260
    .line 261
    invoke-virtual {v14}, Lcom/android/quickstep/util/InputConsumerProxy;->enable()V

    .line 262
    .line 263
    .line 264
    :cond_10
    new-instance v14, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    const-string v15, "handleNormalGestureEnd / endTarget: "

    .line 270
    .line 271
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v14

    .line 281
    const-string v15, "TaplEvents"

    .line 282
    .line 283
    invoke-static {v15, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    if-ne v2, v4, :cond_14

    .line 287
    .line 288
    iget-object v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 289
    .line 290
    invoke-static {v3}, Lcom/android/launcher3/util/Z;->C(Landroid/content/Context;)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 295
    .line 296
    invoke-static {v4}, Lcom/android/launcher3/util/Z;->B(Landroid/content/Context;)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 301
    .line 302
    if-eqz v6, :cond_12

    .line 303
    .line 304
    check-cast v6, Lcom/android/launcher3/views/k;

    .line 305
    .line 306
    invoke-interface {v6}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 307
    .line 308
    .line 309
    move-result-object v6

    .line 310
    iget-boolean v6, v6, Lcom/android/launcher3/h0;->p3:Z

    .line 311
    .line 312
    if-eqz v6, :cond_12

    .line 313
    .line 314
    if-eqz v3, :cond_11

    .line 315
    .line 316
    if-nez v4, :cond_11

    .line 317
    .line 318
    move v5, v10

    .line 319
    :cond_11
    invoke-static {v5}, Lcom/android/launcher3/q5;->y0(Z)I

    .line 320
    .line 321
    .line 322
    move-result v3

    .line 323
    int-to-long v3, v3

    .line 324
    :goto_7
    move-wide v11, v3

    .line 325
    goto :goto_8

    .line 326
    :cond_12
    const-wide/16 v3, 0xfa

    .line 327
    .line 328
    goto :goto_7

    .line 329
    :goto_8
    sget-object v3, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 330
    .line 331
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 332
    .line 333
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    check-cast v3, Lcom/android/quickstep/SystemUiProxy;

    .line 338
    .line 339
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 340
    .line 341
    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 342
    .line 343
    .line 344
    move-result v4

    .line 345
    sget-object v5, Lw2/a;->h:Lw2/a;

    .line 346
    .line 347
    invoke-virtual {v3, v4, v5}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 348
    .line 349
    .line 350
    :cond_13
    :goto_9
    move-wide v4, v11

    .line 351
    goto/16 :goto_e

    .line 352
    .line 353
    :cond_14
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 354
    .line 355
    if-ne v2, v4, :cond_1d

    .line 356
    .line 357
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 358
    .line 359
    if-eqz v4, :cond_13

    .line 360
    .line 361
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    const/4 v14, -0x2

    .line 366
    if-ne v4, v14, :cond_15

    .line 367
    .line 368
    new-instance v14, Ljava/lang/IllegalStateException;

    .line 369
    .line 370
    invoke-direct {v14}, Ljava/lang/IllegalStateException;-><init>()V

    .line 371
    .line 372
    .line 373
    const-string v15, "AbsSwipeUpHandler"

    .line 374
    .line 375
    const-string v5, "RecentsView destination page is invalid"

    .line 376
    .line 377
    invoke-static {v15, v5, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 378
    .line 379
    .line 380
    :cond_15
    invoke-static {}, Lx1/O;->C2()Z

    .line 381
    .line 382
    .line 383
    move-result v5

    .line 384
    if-nez v5, :cond_18

    .line 385
    .line 386
    invoke-static {}, Lx1/O;->l2()Z

    .line 387
    .line 388
    .line 389
    move-result v5

    .line 390
    if-nez v5, :cond_18

    .line 391
    .line 392
    invoke-static {}, Lx1/O;->D2()Ljava/lang/Boolean;

    .line 393
    .line 394
    .line 395
    move-result-object v5

    .line 396
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 397
    .line 398
    .line 399
    move-result v5

    .line 400
    if-nez v5, :cond_18

    .line 401
    .line 402
    invoke-static {}, Lx1/O;->i4()Z

    .line 403
    .line 404
    .line 405
    move-result v5

    .line 406
    if-nez v5, :cond_16

    .line 407
    .line 408
    goto :goto_b

    .line 409
    :cond_16
    iget-object v5, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 410
    .line 411
    invoke-interface {v3, v5}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    .line 412
    .line 413
    .line 414
    move-result v3

    .line 415
    if-nez v3, :cond_18

    .line 416
    .line 417
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 418
    .line 419
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    if-le v3, v10, :cond_18

    .line 424
    .line 425
    if-nez v4, :cond_18

    .line 426
    .line 427
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 428
    .line 429
    invoke-static {}, Lx1/O;->N1()Z

    .line 430
    .line 431
    .line 432
    move-result v4

    .line 433
    if-eqz v4, :cond_17

    .line 434
    .line 435
    long-to-int v4, v6

    .line 436
    goto :goto_a

    .line 437
    :cond_17
    const/16 v4, 0x1f4

    .line 438
    .line 439
    :goto_a
    invoke-virtual {v3, v10, v4}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 440
    .line 441
    .line 442
    goto :goto_d

    .line 443
    :cond_18
    :goto_b
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 444
    .line 445
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 446
    .line 447
    .line 448
    move-result v3

    .line 449
    if-eq v3, v4, :cond_19

    .line 450
    .line 451
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 452
    .line 453
    invoke-static {v11, v12}, Ljava/lang/Math;->toIntExact(J)I

    .line 454
    .line 455
    .line 456
    move-result v5

    .line 457
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 458
    .line 459
    .line 460
    move v5, v10

    .line 461
    goto :goto_c

    .line 462
    :cond_19
    const/4 v5, 0x0

    .line 463
    :goto_c
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 464
    .line 465
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getScroller()Landroid/widget/OverScroller;

    .line 466
    .line 467
    .line 468
    move-result-object v3

    .line 469
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getDuration()I

    .line 470
    .line 471
    .line 472
    move-result v3

    .line 473
    int-to-long v3, v3

    .line 474
    cmp-long v3, v3, v6

    .line 475
    .line 476
    if-lez v3, :cond_1a

    .line 477
    .line 478
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 479
    .line 480
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 481
    .line 482
    .line 483
    move-result v4

    .line 484
    long-to-int v5, v6

    .line 485
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 486
    .line 487
    .line 488
    goto :goto_d

    .line 489
    :cond_1a
    move v10, v5

    .line 490
    :goto_d
    iget-object v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 491
    .line 492
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->isHandlingAtomicEvent()Z

    .line 493
    .line 494
    .line 495
    move-result v3

    .line 496
    if-eqz v3, :cond_1b

    .line 497
    .line 498
    if-eqz v10, :cond_1c

    .line 499
    .line 500
    :cond_1b
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 501
    .line 502
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getScroller()Landroid/widget/OverScroller;

    .line 503
    .line 504
    .line 505
    move-result-object v3

    .line 506
    invoke-virtual {v3}, Landroid/widget/OverScroller;->getDuration()I

    .line 507
    .line 508
    .line 509
    move-result v3

    .line 510
    int-to-long v3, v3

    .line 511
    invoke-static {v11, v12, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 512
    .line 513
    .line 514
    move-result-wide v11

    .line 515
    :cond_1c
    sget-object v3, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 516
    .line 517
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 518
    .line 519
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v3

    .line 523
    check-cast v3, Lcom/android/quickstep/SystemUiProxy;

    .line 524
    .line 525
    iget-object v4, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 526
    .line 527
    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 528
    .line 529
    .line 530
    move-result v4

    .line 531
    sget-object v5, Lw2/a;->i:Lw2/a;

    .line 532
    .line 533
    invoke-virtual {v3, v4, v5}, Lcom/android/quickstep/SystemUiProxy;->updateContextualEduStats(ZLw2/a;)V

    .line 534
    .line 535
    .line 536
    goto/16 :goto_9

    .line 537
    .line 538
    :cond_1d
    sget-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 539
    .line 540
    if-ne v2, v3, :cond_13

    .line 541
    .line 542
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 543
    .line 544
    if-eqz v3, :cond_13

    .line 545
    .line 546
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 547
    .line 548
    .line 549
    move-result v3

    .line 550
    iget-object v4, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 551
    .line 552
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 553
    .line 554
    .line 555
    move-result v4

    .line 556
    if-eq v3, v4, :cond_13

    .line 557
    .line 558
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 559
    .line 560
    invoke-virtual {v3}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 561
    .line 562
    .line 563
    move-result v4

    .line 564
    invoke-static {v11, v12}, Ljava/lang/Math;->toIntExact(J)I

    .line 565
    .line 566
    .line 567
    move-result v5

    .line 568
    invoke-virtual {v3, v4, v5}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 569
    .line 570
    .line 571
    goto/16 :goto_9

    .line 572
    .line 573
    :goto_e
    new-instance v3, Lcom/android/quickstep/i0;

    .line 574
    .line 575
    invoke-direct {v3, v0}, Lcom/android/quickstep/i0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 576
    .line 577
    .line 578
    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 579
    .line 580
    invoke-static {v6}, LO2/d;->c(Landroid/content/Context;)Z

    .line 581
    .line 582
    .line 583
    move-result v6

    .line 584
    if-eqz v6, :cond_20

    .line 585
    .line 586
    sget-object v6, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 587
    .line 588
    invoke-virtual {v6}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 589
    .line 590
    .line 591
    move-result v6

    .line 592
    if-eqz v6, :cond_1e

    .line 593
    .line 594
    sget-object v6, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_QUICK_SWITCH:Landroid/window/DesktopModeFlags;

    .line 595
    .line 596
    invoke-virtual {v6}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 597
    .line 598
    .line 599
    move-result v6

    .line 600
    if-nez v6, :cond_20

    .line 601
    .line 602
    :cond_1e
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 603
    .line 604
    if-eqz v6, :cond_1f

    .line 605
    .line 606
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 607
    .line 608
    .line 609
    move-result-object v6

    .line 610
    if-eqz v6, :cond_1f

    .line 611
    .line 612
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 613
    .line 614
    invoke-virtual {v6}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 615
    .line 616
    .line 617
    move-result-object v6

    .line 618
    instance-of v6, v6, Lcom/android/quickstep/views/DesktopTaskView;

    .line 619
    .line 620
    if-nez v6, :cond_1f

    .line 621
    .line 622
    sget-object v6, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 623
    .line 624
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 625
    .line 626
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/ActiveGestureLog;->trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 627
    .line 628
    .line 629
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 630
    .line 631
    invoke-virtual {v6, v3}, Lcom/android/launcher3/V4;->setOnPageTransitionEndCallback(Ljava/lang/Runnable;)V

    .line 632
    .line 633
    .line 634
    goto :goto_f

    .line 635
    :cond_1f
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 636
    .line 637
    .line 638
    goto :goto_f

    .line 639
    :cond_20
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 640
    .line 641
    if-eqz v6, :cond_21

    .line 642
    .line 643
    sget-object v6, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    .line 644
    .line 645
    sget-object v7, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->SET_ON_PAGE_TRANSITION_END_CALLBACK:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    .line 646
    .line 647
    invoke-virtual {v6, v7}, Lcom/android/quickstep/util/ActiveGestureLog;->trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 648
    .line 649
    .line 650
    iget-object v6, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 651
    .line 652
    invoke-virtual {v6, v3}, Lcom/android/launcher3/V4;->setOnPageTransitionEndCallback(Ljava/lang/Runnable;)V

    .line 653
    .line 654
    .line 655
    goto :goto_f

    .line 656
    :cond_21
    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 657
    .line 658
    .line 659
    :goto_f
    iget-object v3, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 660
    .line 661
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 662
    .line 663
    if-nez v3, :cond_22

    .line 664
    .line 665
    sget-object v3, Lx1/r;->H:Lcom/android/launcher3/util/I;

    .line 666
    .line 667
    iget-object v6, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 668
    .line 669
    invoke-virtual {v3, v6}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 670
    .line 671
    .line 672
    move-result-object v3

    .line 673
    if-eqz v3, :cond_22

    .line 674
    .line 675
    iget-object v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 676
    .line 677
    invoke-virtual {v3}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 678
    .line 679
    .line 680
    move-result v3

    .line 681
    if-eqz v3, :cond_23

    .line 682
    .line 683
    iget-boolean v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 684
    .line 685
    if-eqz v3, :cond_22

    .line 686
    .line 687
    iget-boolean v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 688
    .line 689
    if-eqz v3, :cond_22

    .line 690
    .line 691
    iget-boolean v3, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportCasting:Z

    .line 692
    .line 693
    if-nez v3, :cond_23

    .line 694
    .line 695
    :cond_22
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 696
    .line 697
    .line 698
    :cond_23
    sget v3, Lcom/android/launcher3/anim/C;->T:I

    .line 699
    .line 700
    invoke-static {v3}, Lx1/O;->q(I)V

    .line 701
    .line 702
    .line 703
    new-instance v0, Lcom/android/quickstep/j0;

    .line 704
    .line 705
    move-object v7, v2

    .line 706
    move v2, v8

    .line 707
    move v3, v9

    .line 708
    move-object v6, v13

    .line 709
    move-object v8, v1

    .line 710
    move-object/from16 v1, p0

    .line 711
    .line 712
    invoke-direct/range {v0 .. v8}, Lcom/android/quickstep/j0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V

    .line 713
    .line 714
    .line 715
    move-object/from16 v16, v1

    .line 716
    .line 717
    move-object v1, v0

    .line 718
    move-object/from16 v0, v16

    .line 719
    .line 720
    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->runOnRecentsAnimationAndLauncherBound(Ljava/lang/Runnable;)V

    .line 721
    .line 722
    .line 723
    iget-object v1, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 724
    .line 725
    if-nez v1, :cond_24

    .line 726
    .line 727
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 728
    .line 729
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->isRecentsAnimationEnded()Z

    .line 730
    .line 731
    .line 732
    move-result v1

    .line 733
    if-eqz v1, :cond_24

    .line 734
    .line 735
    iget-object v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 736
    .line 737
    sget v2, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 738
    .line 739
    invoke-virtual {v1, v2}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 740
    .line 741
    .line 742
    invoke-direct {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 743
    .line 744
    .line 745
    :cond_24
    return-void
.end method

.method private hasStartedTaskBefore([Landroid/view/RemoteAnimationTarget;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/GestureState;->mLastStartedTaskIdPredicate:Ljava/util/function/Predicate;

    .line 8
    .line 9
    invoke-interface {p1, p0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private hideDragLayer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDragleryHideReseted:Z

    .line 12
    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startHideDragLayerOnGestureStart()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    :goto_1
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDragleryHideReseted:Z

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic i(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->startNewTask()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/android/quickstep/AbsSwipeUpHandler;F)F
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$endLauncherTransitionController$23(F)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private initStateCallbacks()V
    .locals 12

    .line 1
    new-instance v0, Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_NAMES:Ljava/util/ArrayList;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    new-array v2, v2, [Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, [Ljava/lang/String;

    .line 13
    .line 14
    new-instance v2, Lcom/android/quickstep/o0;

    .line 15
    .line 16
    invoke-direct {v2}, Lcom/android/quickstep/o0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Lcom/android/quickstep/MultiStateCallback;-><init>([Ljava/lang/String;Lcom/android/quickstep/MultiStateCallback$TrackedEventsMapper;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 23
    .line 24
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_PRESENT:I

    .line 25
    .line 26
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 27
    .line 28
    or-int v3, v1, v2

    .line 29
    .line 30
    new-instance v4, Lcom/android/quickstep/h;

    .line 31
    .line 32
    invoke-direct {v4, p0}, Lcom/android/quickstep/h;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v3, v4}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 39
    .line 40
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 41
    .line 42
    or-int v4, v3, v2

    .line 43
    .line 44
    new-instance v5, Lcom/android/quickstep/i;

    .line 45
    .line 46
    invoke-direct {v5, p0}, Lcom/android/quickstep/i;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v4, v5}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 53
    .line 54
    or-int v4, v1, v3

    .line 55
    .line 56
    new-instance v5, Lcom/android/quickstep/j;

    .line 57
    .line 58
    invoke-direct {v5, p0}, Lcom/android/quickstep/j;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v4, v5}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 65
    .line 66
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_STARTED:I

    .line 67
    .line 68
    or-int/2addr v4, v1

    .line 69
    sget v5, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_CANCELLED:I

    .line 70
    .line 71
    or-int/2addr v4, v5

    .line 72
    new-instance v5, Lcom/android/quickstep/f;

    .line 73
    .line 74
    invoke-direct {v5, p0}, Lcom/android/quickstep/f;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v4, v5}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 81
    .line 82
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_RESUME_LAST_TASK:I

    .line 83
    .line 84
    sget v5, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_APP_CONTROLLER_RECEIVED:I

    .line 85
    .line 86
    or-int v6, v4, v5

    .line 87
    .line 88
    new-instance v7, Lcom/android/quickstep/k;

    .line 89
    .line 90
    invoke-direct {v7, p0}, Lcom/android/quickstep/k;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v6, v7}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 97
    .line 98
    sget v6, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_START_NEW_TASK:I

    .line 99
    .line 100
    sget v7, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 101
    .line 102
    or-int/2addr v6, v7

    .line 103
    new-instance v8, Lcom/android/quickstep/m;

    .line 104
    .line 105
    invoke-direct {v8, p0}, Lcom/android/quickstep/m;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v6, v8}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 112
    .line 113
    or-int v6, v1, v5

    .line 114
    .line 115
    or-int/2addr v6, v3

    .line 116
    sget v8, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 117
    .line 118
    or-int/2addr v6, v8

    .line 119
    new-instance v9, Lcom/android/quickstep/n;

    .line 120
    .line 121
    invoke-direct {v9, p0}, Lcom/android/quickstep/n;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v6, v9}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 128
    .line 129
    sget v6, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 130
    .line 131
    or-int v9, v7, v6

    .line 132
    .line 133
    sget v10, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_RECENTS:I

    .line 134
    .line 135
    or-int/2addr v9, v10

    .line 136
    new-instance v11, Lcom/android/quickstep/o;

    .line 137
    .line 138
    invoke-direct {v11, p0}, Lcom/android/quickstep/o;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v9, v11}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 145
    .line 146
    or-int/2addr v7, v6

    .line 147
    sget v9, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_HOME:I

    .line 148
    .line 149
    or-int/2addr v7, v9

    .line 150
    new-instance v11, Lcom/android/quickstep/p;

    .line 151
    .line 152
    invoke-direct {v11, p0}, Lcom/android/quickstep/p;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v7, v11}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 159
    .line 160
    sget v7, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 161
    .line 162
    or-int/2addr v9, v7

    .line 163
    sget v11, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_PARALLEL_ANIM_FINISHED:I

    .line 164
    .line 165
    or-int/2addr v9, v11

    .line 166
    new-instance v11, Lcom/android/quickstep/p0;

    .line 167
    .line 168
    invoke-direct {v11, p0}, Lcom/android/quickstep/p0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v9, v11}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 175
    .line 176
    or-int v9, v1, v5

    .line 177
    .line 178
    or-int/2addr v3, v9

    .line 179
    or-int/2addr v3, v10

    .line 180
    or-int/2addr v3, v7

    .line 181
    or-int/2addr v3, v6

    .line 182
    or-int/2addr v2, v3

    .line 183
    new-instance v3, Lcom/android/quickstep/q0;

    .line 184
    .line 185
    invoke-direct {v3, p0}, Lcom/android/quickstep/q0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 192
    .line 193
    sget v2, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 194
    .line 195
    new-instance v3, Lcom/android/quickstep/r0;

    .line 196
    .line 197
    invoke-direct {v3, p0}, Lcom/android/quickstep/r0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 204
    .line 205
    sget v3, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 206
    .line 207
    or-int/2addr v2, v3

    .line 208
    new-instance v3, Lcom/android/quickstep/b;

    .line 209
    .line 210
    invoke-direct {v3, p0}, Lcom/android/quickstep/b;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 217
    .line 218
    sget v2, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_SET:I

    .line 219
    .line 220
    sget v3, Lcom/android/quickstep/GestureState;->STATE_RECENTS_ANIMATION_STARTED:I

    .line 221
    .line 222
    or-int/2addr v2, v3

    .line 223
    new-instance v3, Lcom/android/quickstep/c;

    .line 224
    .line 225
    invoke-direct {v3, p0}, Lcom/android/quickstep/c;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 232
    .line 233
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 234
    .line 235
    new-instance v3, Lcom/android/quickstep/d;

    .line 236
    .line 237
    invoke-direct {v3, p0}, Lcom/android/quickstep/d;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 241
    .line 242
    .line 243
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 244
    .line 245
    or-int v3, v1, v2

    .line 246
    .line 247
    new-instance v6, Lcom/android/quickstep/e;

    .line 248
    .line 249
    invoke-direct {v6, p0}, Lcom/android/quickstep/e;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, v3, v6}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 256
    .line 257
    or-int v3, v2, v4

    .line 258
    .line 259
    new-instance v4, Lcom/android/quickstep/f;

    .line 260
    .line 261
    invoke-direct {v4, p0}, Lcom/android/quickstep/f;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v0, v3, v4}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 268
    .line 269
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 270
    .line 271
    or-int/2addr v2, v3

    .line 272
    new-instance v3, Lcom/android/quickstep/f;

    .line 273
    .line 274
    invoke-direct {v3, p0}, Lcom/android/quickstep/f;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0, v2, v3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 278
    .line 279
    .line 280
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 281
    .line 282
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_0

    .line 287
    .line 288
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 289
    .line 290
    or-int/2addr v1, v5

    .line 291
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_VIEW_SHOWN:I

    .line 292
    .line 293
    or-int/2addr v1, v2

    .line 294
    or-int/2addr v1, v8

    .line 295
    new-instance v2, Lcom/android/quickstep/g;

    .line 296
    .line 297
    invoke-direct {v2, p0}, Lcom/android/quickstep/g;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/MultiStateCallback;->addChangeListener(ILjava/util/function/Consumer;)V

    .line 301
    .line 302
    .line 303
    :cond_0
    return-void
.end method

.method private initializeLauncherAnimationController()V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->buildAnimationController()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 5
    .line 6
    const-string v1, "logToggleRecents"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->allowIpcs(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/android/internal/util/LatencyTracker;->getInstance(Landroid/content/Context;)Lcom/android/internal/util/LatencyTracker;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-wide v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherFrameDrawnTime:J

    .line 19
    .line 20
    iget-wide v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTouchTimeMs:J

    .line 21
    .line 22
    sub-long/2addr v2, v4

    .line 23
    long-to-int v2, v2

    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v1, v3, v2}, Lcom/android/internal/util/LatencyTracker;->logAction(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {v0}, Lcom/android/launcher3/util/a2;->close()V

    .line 31
    .line 32
    .line 33
    :cond_0
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v3}, Lcom/android/quickstep/HighResLoadingState;->setVisible(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    :try_start_1
    invoke-interface {v0}, Lcom/android/launcher3/util/a2;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :catchall_1
    move-exception v0

    .line 63
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    throw p0
.end method

.method private invalidateHandler()V
    .locals 3

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 24
    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputConsumerProxy;->destroy()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->setLiveTileCleanUpHandler(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputConsumerProxy;->unregisterOnTouchDownCallback()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endRunningWindowAnim(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureEndCallback:Ljava/lang/Runnable;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

    .line 55
    .line 56
    const-string v2, "AbsSwipeUpHandler.invalidateHandler"

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/ContextInitListener;->unregister(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 82
    .line 83
    if-eq v1, v2, :cond_3

    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 86
    .line 87
    iput-boolean v0, v1, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 88
    .line 89
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    iput v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 93
    .line 94
    iput v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetSecondary:F

    .line 95
    .line 96
    iput v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimPrimary:F

    .line 97
    .line 98
    iput v1, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimSecondary:F

    .line 99
    .line 100
    iput-boolean v0, p0, Lcom/android/quickstep/BaseContainerInterface;->mNeedChangeTaskTranslation:Z

    .line 101
    .line 102
    return-void
.end method

.method private invalidateHandlerWithLauncher()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endLauncherTransitionController()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationEnd()V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private isCurrentZVoice(Lcom/android/quickstep/views/TaskView;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ljava/util/List;->getFirst()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/android/quickstep/views/TaskContainer;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    :goto_0
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "com.zte.halo.app"

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string p1, "com.zte.aiassistant"

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    :cond_1
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_2
    const/4 p0, 0x0

    .line 78
    return p0
.end method

.method private isKeyboardTaskFocusPending()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->isKeyboardTaskFocusPending()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private static isNotInRecents(Landroid/view/RemoteAnimationTarget;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Landroid/view/RemoteAnimationTarget;->isNotInRecents:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getActivityType()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x2

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method private isScrollingToNewTask()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasTargets()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    return v2

    .line 15
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ltz v0, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eq p0, v0, :cond_2

    .line 30
    .line 31
    return v2

    .line 32
    :cond_2
    return v1
.end method

.method public static synthetic j(Lcom/android/quickstep/AbsSwipeUpHandler;FFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$animateToProgressInternal$20(FFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Lcom/android/quickstep/util/SurfaceTransactionApplier;Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/TransformParams;->setSyncTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)Lcom/android/quickstep/util/TransformParams;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/PointF;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$handOffAnimation$21(Landroid/graphics/PointF;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$finishCurrentTransitionToRecents$26()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$setClampScrollOffset$14(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$startNewTask$34()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$animateToProgressInternal$19()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getTopRunningTaskId()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/android/quickstep/RecentsAnimationController;->screenshotTask(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$animateToProgressInternal$20(FFLandroid/animation/ValueAnimator;)V
    .locals 9

    invoke-static {p3}, Lcom/android/quickstep/views/LsNativeStack;->onLiveOverviewFrame(Landroid/animation/ValueAnimator;)V

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->computeRecentsScrollIfInvisible()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 5
    .line 6
    iget-boolean v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedChangeTaskTranslation:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 22
    .line 23
    iget v7, v1, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetPrimary:F

    .line 24
    .line 25
    sget-object v8, Lcom/android/launcher3/anim/L;->f:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    const/4 v6, 0x0

    .line 28
    move v4, p1

    .line 29
    move v5, p2

    .line 30
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v4, p1

    .line 36
    move v5, p2

    .line 37
    move p1, v2

    .line 38
    :goto_0
    iput p1, v0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimPrimary:F

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 41
    .line 42
    iget-boolean p2, p1, Lcom/android/quickstep/BaseContainerInterface;->mNeedChangeTaskTranslation:Z

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Ljava/lang/Float;

    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 57
    .line 58
    iget v7, p0, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetSecondary:F

    .line 59
    .line 60
    sget-object v8, Lcom/android/launcher3/anim/L;->f:Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    const/4 v6, 0x0

    .line 63
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    :cond_1
    iput v2, p1, Lcom/android/quickstep/BaseContainerInterface;->mTaskRectOffsetAnimSecondary:F

    .line 68
    .line 69
    return-void
.end method

.method private synthetic lambda$endLauncherTransitionController$23(F)F
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method private synthetic lambda$finishCurrentTransitionToHome$27()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$finishCurrentTransitionToRecents$26()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CURRENT_TASK_FINISHED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$handOffAnimation$21(Landroid/graphics/PointF;J)V
    .locals 2

    .line 1
    const-wide/32 v0, 0xf4240

    .line 2
    .line 3
    .line 4
    div-long/2addr p2, v0

    .line 5
    invoke-direct {p0, p2, p3, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->handOffAnimationInternal(JLandroid/graphics/PointF;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$handleNormalGestureEnd$17()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setClampScrollOffset(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic lambda$handleNormalGestureEnd$18(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/android/quickstep/AbsSwipeUpHandler;->animateGestureEnd(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$initStateCallbacks$4(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setRunningTaskHidden(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "initStateCallbacks setRunningTaskHidden b:"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "AbsSwipeUpHandler"

    .line 33
    .line 34
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private synthetic lambda$linkRecentsViewScroll$30(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic lambda$linkRecentsViewScroll$31()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargets(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic lambda$maybeUpdateRecentsAttachedState$11(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRunningWindowAnim:[Lcom/android/quickstep/SwipeUpAnimationLogic$RunningWindowAnim;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    array-length p1, p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    return-void

    .line 10
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->applyScrollAndTransform()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onConsumerAboutToBeSwitched()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "mLifecycleCallbacks onActivityDestroyed, mActivity = null mContainer:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AbsSwipeUpHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->unregisterActivityRestartListener()V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 46
    .line 47
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logLauncherDestroyed()V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnRecentsScrollListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/android/quickstep/views/RecentsView;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 62
    .line 63
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_PRESENT:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->clearState(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->onLauncherDestroyed()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private synthetic lambda$new$2()Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/RecentsOrientedState;->getRecentsActivityRotation()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private synthetic lambda$new$3()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endRunningWindowAnim(Z)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endLauncherTransitionController()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private synthetic lambda$onActivityInit$6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->consumeRecentsAnimationCanceledSnapshot()Ljava/util/HashMap;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 15
    .line 16
    new-instance v2, Lcom/android/quickstep/w;

    .line 17
    .line 18
    invoke-direct {v2}, Lcom/android/quickstep/w;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0, v2}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->onRecentsAnimationComplete()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const-string v0, "AbsSwipeUpHandler"

    .line 31
    .line 32
    const-string v1, "onActivityInit, snapshots is null or mRecentsView is null"

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic lambda$onAnimatorPlaybackControllerCreated$12()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->getNormalController()Lcom/android/launcher3/anim/q;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateLauncherTransitionProgress()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic lambda$onDeferredActivityLaunch$10()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$onGestureEnded$15(FZLandroid/graphics/PointF;Z)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/AbsSwipeUpHandler;->handleNormalGestureEnd(FZLandroid/graphics/PointF;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic lambda$onLauncherPresentAndGestureStarted$9()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/RotationTouchHelper;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/RotationTouchHelper;->onEndTargetCalculated(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/BaseContainerInterface;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic lambda$onLauncherStart$7(Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/TaskViewSimulator;->setOrientationState(Lcom/android/quickstep/util/RecentsOrientedState;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic lambda$onLauncherStart$8()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 4
    .line 5
    new-instance v2, Lcom/android/quickstep/n0;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Lcom/android/quickstep/n0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/BaseContainerInterface;->prepareRecentsUI(ZLjava/util/function/Consumer;)Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setBackgroundStateUI()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {v0, p0}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private synthetic lambda$onRecentsAnimationStart$13(Lcom/android/quickstep/RecentsAnimationTargets;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onRecentsAnimationStartGestureStartedCallback(Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onSettledOnEndTarget$16()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_RESUME_LAST_TASK:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$onTasksAppeared$35()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logAbsSwipeUpHandlerOnTasksAppeared()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 5
    .line 6
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_CANCELLED:I

    .line 7
    .line 8
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 9
    .line 10
    or-int/2addr v0, v1

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic lambda$onTasksAppeared$36(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 5
    .line 6
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic lambda$setClampScrollOffset$14(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setClampScrollOffset(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$setupLauncherUiAfterSwipeUpToRecentsAnimation$28()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->cleanupRemoteTargets()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInputConsumerProxy:Lcom/android/quickstep/util/InputConsumerProxy;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/util/InputConsumerProxy;->destroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic lambda$startNewTask$22(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endLauncherTransitionController()V

    .line 11
    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 26
    .line 27
    return-void
.end method

.method private synthetic lambda$startNewTask$32(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getPreviouslyAppearedTaskIds()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private synthetic lambda$startNewTask$33(Ljava/util/function/Consumer;ZLjava/lang/Boolean;)Lh4/t;
    .locals 0

    .line 1
    invoke-interface {p1, p3}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onRestartPreviouslyAppearedTask()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->onLaunchTaskFailed()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 31
    .line 32
    return-object p0
.end method

.method private synthetic lambda$startNewTask$34()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$switchToScreenshot$24()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateThumbnailMFV()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setScreenshotCapturedState()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private synthetic lambda$switchToScreenshot$25([I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    new-instance v0, Lcom/android/quickstep/C;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/quickstep/C;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    array-length v1, p1

    .line 17
    const/4 v2, 0x0

    .line 18
    :goto_0
    if-ge v2, v1, :cond_1

    .line 19
    .line 20
    aget v3, p1, v2

    .line 21
    .line 22
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {v0, v3}, Lcom/android/quickstep/RecentsAnimationController;->screenshotTask(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 39
    .line 40
    new-instance v0, Lcom/android/quickstep/D;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/android/quickstep/D;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private synthetic lambda$updateThumbnailMFV$39()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private launcherFrameDrawn()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherFrameDrawnTime:J

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic m(Lcom/android/quickstep/AbsSwipeUpHandler;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$switchToScreenshot$25([I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m0(Lcom/android/quickstep/AbsSwipeUpHandler;)Lcom/android/systemui/shared/system/TaskStackChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private maybeAbortSwipePipToHome()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsSwipingPipToHome:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getTaskId()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 26
    .line 27
    invoke-virtual {v2}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getComponentName()Landroid/content/ComponentName;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/SystemUiProxy;->abortSwipePipToHome(ILandroid/content/ComponentName;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsSwipingPipToHome:Z

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private maybeFinishSwipeMiniWindowToHome()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private maybeFinishSwipePipToHome()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsSwipingPipToHome:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getTaskId()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getFinishTransaction()Landroid/window/PictureInPictureSurfaceTransaction;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 26
    .line 27
    invoke-virtual {v4}, Lcom/android/quickstep/util/SwipePipToHomeAnimator;->getContentOverlay()Landroid/view/SurfaceControl;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual {v0, v1, v3, v4}, Lcom/android/quickstep/RecentsAnimationController;->setFinishTaskTransaction(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 32
    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsSwipingPipToHome:Z

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-static {}, LH2/c;->l()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 48
    .line 49
    invoke-direct {v0}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;-><init>()V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->setAlpha(F)Landroid/window/PictureInPictureSurfaceTransaction$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Landroid/window/PictureInPictureSurfaceTransaction$Builder;->build()Landroid/window/PictureInPictureSurfaceTransaction;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0, v2}, Landroid/window/PictureInPictureSurfaceTransaction;->setShouldDisableCanAffectSystemUiFlags(Z)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/android/quickstep/TopTaskTracker;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    array-length v3, v1

    .line 79
    :goto_0
    if-ge v2, v3, :cond_2

    .line 80
    .line 81
    aget v4, v1, v2

    .line 82
    .line 83
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    invoke-virtual {v5, v4, v0, v6}, Lcom/android/quickstep/RecentsAnimationController;->setFinishTaskTransaction(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 87
    .line 88
    .line 89
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    :goto_1
    return-void
.end method

.method private maybeUpdateRecentsAttachedState(ZZZ)V
    .locals 4

    .line 6
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-nez v0, :cond_1

    goto/16 :goto_3

    .line 7
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    if-eqz v0, :cond_2

    .line 8
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getTopRunningTaskId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/quickstep/RemoteAnimationTargets;->findTask(I)Landroid/view/RemoteAnimationTarget;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 9
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 10
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    move-result-object v0

    iget-boolean v0, v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->recentsAttachedToAppWindow:Z

    goto :goto_2

    .line 11
    :cond_3
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContinuingLastGesture:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    move-result v1

    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getNextPage()I

    move-result v3

    if-eq v1, v3, :cond_4

    :goto_1
    move v0, v2

    goto :goto_2

    :cond_4
    if-eqz v0, :cond_5

    .line 13
    invoke-static {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isNotInRecents(Landroid/view/RemoteAnimationTarget;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_1

    .line 14
    :cond_5
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mNeedShowPeekStatus:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsLikelyToStartNewTask:Z

    if-eqz v0, :cond_7

    :cond_6
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mPassedTriggerMiniWindowSlop:Z

    if-nez v0, :cond_7

    goto :goto_1

    :cond_7
    const/4 v0, 0x0

    :goto_2
    if-eqz p2, :cond_8

    .line 15
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    invoke-interface {p2}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->hasRecentsEverAttachedToAppWindow()Z

    move-result p2

    if-nez p2, :cond_8

    if-eqz v0, :cond_8

    .line 16
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->moveRunningTaskToExpectedPosition()V

    .line 17
    :cond_8
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    invoke-interface {p2, v0, p1, p3}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    if-eqz p1, :cond_9

    const/4 p1, 0x2

    .line 18
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 19
    new-instance p2, Lcom/android/quickstep/l0;

    invoke-direct {p2, p0}, Lcom/android/quickstep/l0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-wide/16 p2, 0x12c

    .line 20
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object p2

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->start()V

    .line 21
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    sget p2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 22
    new-instance p3, Lcom/android/quickstep/m0;

    invoke-direct {p3, p1}, Lcom/android/quickstep/m0;-><init>(Landroid/animation/ValueAnimator;)V

    .line 23
    invoke-virtual {p0, p2, p3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    :cond_9
    :goto_3
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic n(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$setupLauncherUiAfterSwipeUpToRecentsAnimation$28()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHasMotionEverBeenPaused:Z

    .line 2
    .line 3
    return-void
.end method

.method private notifyGestureStarted()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 6
    .line 7
    const/16 v0, 0x9

    .line 8
    .line 9
    invoke-interface {p0, v0}, Lcom/android/quickstep/views/RecentsViewContainer;->clearForceInvisibleFlag(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic o(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onLauncherPresentAndGestureStarted$9()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic o0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsLikelyToStartNewTask:Z

    .line 2
    .line 3
    return-void
.end method

.method private onAnimatorPlaybackControllerCreated(Lcom/android/quickstep/util/AnimatorControllerWithResistance;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 13
    .line 14
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/L;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/quickstep/L;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method private onDeferredActivityLaunch()V
    .locals 2

    .line 1
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/k0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/quickstep/k0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/BaseContainerInterface;->switchRunningTaskViewToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private onLauncherBindToService()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_BIND_TO_SERVICE:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->flushOnRecentsAnimationAndLauncherBound()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private onLauncherPresentAndGestureStarted()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupRecentsViewUi()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDeferredActivityLaunch:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/BaseContainerInterface;->setOnDeferredActivityLaunchCallback(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 16
    .line 17
    sget v1, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_SET:I

    .line 18
    .line 19
    new-instance v2, Lcom/android/quickstep/g0;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Lcom/android/quickstep/g0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->notifyGestureStarted()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private onLauncherStart()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    if-eqz v0, :cond_9

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 12
    .line 13
    if-eq v1, v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 18
    .line 19
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    goto/16 :goto_3

    .line 28
    .line 29
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->updateRecentsRotation()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/android/quickstep/H;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/android/quickstep/H;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 43
    .line 44
    instance-of v2, v1, Lcom/android/launcher3/C2;

    .line 45
    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    move-object v2, v1

    .line 49
    check-cast v2, Lcom/android/launcher3/C2;

    .line 50
    .line 51
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 52
    .line 53
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Lx1/O;->M3(Landroid/content/Context;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const/4 v3, 0x0

    .line 82
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/W3;->g(Lcom/android/launcher3/C2;Z)V

    .line 83
    .line 84
    .line 85
    invoke-static {v2}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 90
    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 94
    .line 95
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 96
    .line 97
    invoke-static {v1}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    if-nez v1, :cond_3

    .line 102
    .line 103
    :cond_2
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 104
    .line 105
    invoke-interface {v2, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 112
    .line 113
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 114
    .line 115
    invoke-virtual {v1, v4}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_3

    .line 120
    .line 121
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v1, v3}, Lcom/android/launcher3/Workspace;->P2(Z)V

    .line 126
    .line 127
    .line 128
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 135
    .line 136
    if-ne v1, v2, :cond_4

    .line 137
    .line 138
    invoke-static {}, Lx1/O;->Y2()Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_6

    .line 143
    .line 144
    :cond_4
    new-instance v1, Lcom/android/quickstep/T;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Lcom/android/quickstep/T;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 147
    .line 148
    .line 149
    iget-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 150
    .line 151
    if-eqz v2, :cond_5

    .line 152
    .line 153
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 154
    .line 155
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 156
    .line 157
    invoke-virtual {v2, v3, v1}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_5
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 162
    .line 163
    .line 164
    :cond_6
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 165
    .line 166
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 167
    .line 168
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    iget-boolean v1, v1, Lcom/android/launcher3/r4;->g0:Z

    .line 177
    .line 178
    if-eqz v1, :cond_7

    .line 179
    .line 180
    move-object v1, v0

    .line 181
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 182
    .line 183
    iget-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 184
    .line 185
    const/16 v3, 0x101

    .line 186
    .line 187
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_7
    move-object v1, v0

    .line 192
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 193
    .line 194
    iget-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 195
    .line 196
    const/16 v3, 0x100

    .line 197
    .line 198
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/a;->closeAllOpenViewsExcept(Lcom/android/launcher3/views/k;ZI)V

    .line 199
    .line 200
    .line 201
    :goto_1
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 202
    .line 203
    if-eqz v1, :cond_8

    .line 204
    .line 205
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 206
    .line 207
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 208
    .line 209
    invoke-virtual {v1, v2}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_8
    sget-object v1, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 214
    .line 215
    const-string v2, "WTS-init"

    .line 216
    .line 217
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/K2;->beginAsyncSection(Ljava/lang/String;)Lcom/android/launcher3/util/a2;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    move-object v2, v0

    .line 222
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 223
    .line 224
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    new-instance v3, Lcom/android/quickstep/AbsSwipeUpHandler$1;

    .line 229
    .line 230
    invoke-direct {v3, p0, v1, v2, v0}, Lcom/android/quickstep/AbsSwipeUpHandler$1;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/util/a2;Landroid/view/View;Landroid/content/Context;)V

    .line 231
    .line 232
    .line 233
    iput-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDrawListener:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 234
    .line 235
    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDrawListener:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 240
    .line 241
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 242
    .line 243
    .line 244
    :goto_2
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 245
    .line 246
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 251
    .line 252
    .line 253
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 254
    .line 255
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_STARTED:I

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 258
    .line 259
    .line 260
    :cond_9
    :goto_3
    return-void
.end method

.method public static final onRecentsAnimationStartGestureStartedCallback(Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/gesture/BreakAppOpenAnimRunnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private onRecentsViewScroll()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->moveWindowWithRecentsScroll()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onCurrentShiftUpdated()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic p(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onSettledOnEndTarget$16()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic p0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMotionPaused:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic q(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$linkRecentsViewScroll$31()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic q0(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic r(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onAnimatorPlaybackControllerCreated$12()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r0(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->endRunningWindowAnim(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private reset()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 13
    .line 14
    const/4 v1, 0x3

    .line 15
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnDestroyCallback:Ljava/lang/Runnable;

    .line 16
    .line 17
    invoke-interface {v0, v1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private resetDragLayer()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDragleryHideReseted:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 5
    .line 6
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p0, Lcom/android/launcher3/C2;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    if-nez p0, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    sget-object v2, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 28
    .line 29
    new-instance v3, LQ1/f;

    .line 30
    .line 31
    invoke-direct {v3}, LQ1/f;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    :goto_1
    return-void

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->resetHideDragLayer()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private resetStateForAnimationCancel()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureStarted:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    move v0, v1

    .line 15
    :goto_1
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 18
    .line 19
    sget v5, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 20
    .line 21
    invoke-virtual {v4, v5}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_2

    .line 26
    .line 27
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_2
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 31
    .line 32
    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    :goto_2
    invoke-virtual {v3, v0, v4}, Lcom/android/quickstep/BaseContainerInterface;->onTransitionCancelled(ZLcom/android/quickstep/GestureState$GestureEndTarget;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 44
    .line 45
    invoke-interface {v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->clearForceInvisibleFlag(I)V

    .line 46
    .line 47
    .line 48
    :cond_3
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 52
    .line 53
    if-eqz v0, :cond_5

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_5

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 64
    .line 65
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 66
    .line 67
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 72
    .line 73
    if-ne v3, v4, :cond_4

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 76
    .line 77
    invoke-virtual {v3, v5}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-nez v3, :cond_4

    .line 82
    .line 83
    move v3, v1

    .line 84
    goto :goto_3

    .line 85
    :cond_4
    move v3, v2

    .line 86
    :goto_3
    invoke-interface {v0, v3, v2, v1}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    .line 87
    .line 88
    .line 89
    :cond_5
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 90
    .line 91
    iput-boolean v2, p0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 92
    .line 93
    return-void
.end method

.method private resumeLastTask()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v0, "AbsSwipeUpHandler"

    .line 7
    .line 8
    const-string v2, "resumeLastTask finishController"

    .line 9
    .line 10
    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v2, v1}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 20
    .line 21
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->doLogGesture(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/views/TaskView;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic s(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$onTasksAppeared$35()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic s0(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setBackgroundStateUI()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLastRunningAnimRecord(Z)Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lx1/O;->T2()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/content/Context;

    .line 27
    .line 28
    :goto_0
    const/4 v3, 0x0

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    move-object p0, v2

    .line 42
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v0, v3

    .line 52
    :goto_1
    if-nez v1, :cond_4

    .line 53
    .line 54
    instance-of p0, v2, Lcom/android/launcher3/C2;

    .line 55
    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    sget-object p0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 65
    .line 66
    iget-boolean p0, p0, Lcom/android/launcher3/anim/C;->E:Z

    .line 67
    .line 68
    if-nez p0, :cond_4

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-static {}, Lx1/O;->q2()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_4

    .line 77
    .line 78
    :cond_3
    move-object p0, v2

    .line 79
    check-cast p0, Lcom/android/launcher3/C2;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object v0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 90
    .line 91
    sget-object v1, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 92
    .line 93
    new-instance v4, LQ1/f;

    .line 94
    .line 95
    invoke-direct {v4}, LQ1/f;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0, v1, v4}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    if-eqz v2, :cond_5

    .line 102
    .line 103
    sget-object p0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 104
    .line 105
    invoke-virtual {p0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 110
    .line 111
    iget-boolean v0, v0, Lcom/android/launcher3/anim/C;->E:Z

    .line 112
    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    invoke-virtual {p0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 120
    .line 121
    iput-boolean v3, p0, Lcom/android/launcher3/anim/C;->E:Z

    .line 122
    .line 123
    return-void

    .line 124
    :cond_5
    if-nez v2, :cond_6

    .line 125
    .line 126
    const-string p0, "AbsSwipeUpHandler"

    .line 127
    .line 128
    const-string v0, "onGestureStarted, activity is null  "

    .line 129
    .line 130
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    :cond_6
    return-void
.end method

.method private setClampScrollOffset(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 11
    .line 12
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_PRESENT:I

    .line 13
    .line 14
    new-instance v2, Lcom/android/quickstep/N;

    .line 15
    .line 16
    invoke-direct {v2, p0, p1}, Lcom/android/quickstep/N;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->setClampScrollOffset(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private setDividerShown(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsDividerShown:Z

    .line 6
    .line 7
    if-ne v1, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsDividerShown:Z

    .line 11
    .line 12
    iget-object p0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->nonApps:[Landroid/view/RemoteAnimationTarget;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, p1, v0}, Lcom/android/quickstep/TaskViewUtils;->createSplitAuxiliarySurfacesAnimator([Landroid/view/RemoteAnimationTarget;ZLjava/util/function/Consumer;)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method private setIsLikelyToStartNewTask(ZZ)V
    .locals 1

    .line 2
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsLikelyToStartNewTask:Z

    if-eq v0, p1, :cond_0

    .line 3
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsLikelyToStartNewTask:Z

    .line 4
    invoke-virtual {p0, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    :cond_0
    return-void
.end method

.method private setScreenshotCapturedState()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "ScreenshotCaptured"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 9
    .line 10
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private setupLauncherUiAfterSwipeUpToRecentsAnimation()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v2, "AbsSwipeUpHandler"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->endLauncherTransitionController()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->onSwipeUpAnimationSuccess()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 28
    .line 29
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 36
    .line 37
    new-instance v1, Lcom/android/quickstep/q;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/android/quickstep/q;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->setLiveTileCleanUpHandler(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->enableLiveTileRestartListener()V

    .line 48
    .line 49
    .line 50
    :cond_1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 59
    .line 60
    invoke-virtual {v0, v3, v2}, Lcom/android/quickstep/SystemUiProxy;->onOverviewShown(ZLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->doLogGesture(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/views/TaskView;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 79
    .line 80
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 81
    .line 82
    invoke-virtual {v0, v4}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 89
    .line 90
    if-eqz v0, :cond_5

    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 93
    .line 94
    instance-of v4, v0, Lcom/android/launcher3/C2;

    .line 95
    .line 96
    if-eqz v4, :cond_3

    .line 97
    .line 98
    check-cast v0, Lcom/android/launcher3/C2;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/android/launcher3/V3;

    .line 109
    .line 110
    new-instance v4, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const-string v5, "setupLauncherUiAfterSwipeUpToRecentsAnimation : curState = "

    .line 116
    .line 117
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_3
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 132
    .line 133
    :goto_1
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 134
    .line 135
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 136
    .line 137
    invoke-virtual {v4}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    sget-object v5, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 142
    .line 143
    const/4 v6, 0x1

    .line 144
    if-ne v4, v5, :cond_4

    .line 145
    .line 146
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 147
    .line 148
    if-eq v0, v4, :cond_4

    .line 149
    .line 150
    move v0, v6

    .line 151
    goto :goto_2

    .line 152
    :cond_4
    move v0, v3

    .line 153
    :goto_2
    invoke-interface {v2, v0, v3, v6}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    .line 154
    .line 155
    .line 156
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_6

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 165
    .line 166
    .line 167
    :cond_6
    return-void
.end method

.method private setupRecentsViewUi()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContinuingLastGesture:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 6
    .line 7
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 14
    .line 15
    const-string v1, "Launcher.setupRecentsViewUi"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x5dc

    .line 21
    .line 22
    invoke-static {v0, v1}, Lx1/O;->p4(J)Z

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->notifyGestureAnimationStartToRecents()V

    .line 26
    .line 27
    .line 28
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private setupWindowAnimation([Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    new-instance v2, Lcom/android/quickstep/AbsSwipeUpHandler$11;

    .line 5
    .line 6
    invoke-direct {v2, p0}, Lcom/android/quickstep/AbsSwipeUpHandler$11;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/RectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;)V

    .line 10
    .line 11
    .line 12
    aget-object v1, p1, v0

    .line 13
    .line 14
    new-instance v2, Lcom/android/quickstep/AbsSwipeUpHandler$12;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Lcom/android/quickstep/AbsSwipeUpHandler$12;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    aget-object p1, p1, v0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method private shouldFadeOutTargetsForKeyboardQuickSwitch(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;F)Z
    .locals 12

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isKeyboardTaskFocusPending()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    array-length v1, v1

    .line 20
    if-lez v1, :cond_0

    .line 21
    .line 22
    move v1, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v1, v2

    .line 25
    :goto_0
    const/high16 v8, 0x3f800000    # 1.0f

    .line 26
    .line 27
    sget-object v9, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    const v6, 0x3ecccccd    # 0.4f

    .line 31
    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    move v4, p3

    .line 35
    invoke-static/range {v4 .. v9}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-eqz v1, :cond_5

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-static {p3, v1}, Ljava/lang/Float;->compare(FF)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_1

    .line 48
    .line 49
    goto :goto_4

    .line 50
    :cond_1
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/TransformParams;->createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Lcom/android/quickstep/util/SurfaceTransaction;->getTransaction()Landroid/view/SurfaceControl$Transaction;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    iget-object v0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 59
    .line 60
    array-length v6, v0

    .line 61
    :goto_1
    if-ge v2, v6, :cond_4

    .line 62
    .line 63
    aget-object v7, v0, v2

    .line 64
    .line 65
    iget-object v8, v7, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 66
    .line 67
    invoke-virtual {v8}, Landroid/view/SurfaceControl;->isValid()Z

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    if-nez v8, :cond_2

    .line 72
    .line 73
    const-string v7, "AbsSwipeUpHandler"

    .line 74
    .line 75
    const-string v8, "shouldFadeOutTargetsForKeyboardQuickSwitch, app.leash is inValid"

    .line 76
    .line 77
    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_2
    iget-object v8, v7, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 82
    .line 83
    sub-float v9, v1, p3

    .line 84
    .line 85
    invoke-virtual {v5, v8, v9}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 86
    .line 87
    .line 88
    iget-object v8, v7, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 89
    .line 90
    iget-object v9, v7, Landroid/view/RemoteAnimationTarget;->startBounds:Landroid/graphics/Rect;

    .line 91
    .line 92
    iget v9, v9, Landroid/graphics/Rect;->left:I

    .line 93
    .line 94
    int-to-float v9, v9

    .line 95
    iget-object v10, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 96
    .line 97
    check-cast v10, Lcom/android/launcher3/views/k;

    .line 98
    .line 99
    invoke-interface {v10}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    iget v10, v10, Lcom/android/launcher3/h0;->W2:I

    .line 104
    .line 105
    int-to-float v10, v10

    .line 106
    iget-object v11, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 107
    .line 108
    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->isRtl()Z

    .line 109
    .line 110
    .line 111
    move-result v11

    .line 112
    if-eqz v11, :cond_3

    .line 113
    .line 114
    move v11, p3

    .line 115
    goto :goto_2

    .line 116
    :cond_3
    neg-float v11, p3

    .line 117
    :goto_2
    mul-float/2addr v10, v11

    .line 118
    add-float/2addr v9, v10

    .line 119
    const/4 v10, 0x0

    .line 120
    invoke-virtual {v5, v8, v9, v10}, Landroid/view/SurfaceControl$Transaction;->setPosition(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 121
    .line 122
    .line 123
    iget-object v7, v7, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 124
    .line 125
    invoke-virtual {v5, v7, v1, v1}, Landroid/view/SurfaceControl$Transaction;->setScale(Landroid/view/SurfaceControl;FF)Landroid/view/SurfaceControl$Transaction;

    .line 126
    .line 127
    .line 128
    iget-object v7, p2, Lcom/android/quickstep/util/TaskViewSimulator;->taskPrimaryTranslation:Lcom/android/launcher3/anim/d;

    .line 129
    .line 130
    iget-object v8, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 131
    .line 132
    invoke-virtual {v8}, Lcom/android/quickstep/views/RecentsView;->getScrollOffsetForKeyboardTaskFocus()I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    int-to-float v8, v8

    .line 137
    iput v8, v7, Lcom/android/launcher3/anim/d;->d:F

    .line 138
    .line 139
    invoke-virtual {p2, p1, v4, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/SurfaceTransaction;Z)V

    .line 140
    .line 141
    .line 142
    :goto_3
    add-int/lit8 v2, v2, 0x1

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_4
    return v3

    .line 146
    :cond_5
    :goto_4
    return v2
.end method

.method private shouldLinkRecentsViewScroll()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isKeyboardTaskFocusPending()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private startInterceptingTouchesForGesture()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStartMovingTasks:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationController;->enableInputConsumer()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setDividerShown(Z)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method private startNewTask()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getNextPageTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    .line 2
    :goto_0
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    invoke-direct {p0, v1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->doLogGesture(Lcom/android/quickstep/GestureState$GestureEndTarget;Lcom/android/quickstep/views/TaskView;)V

    .line 3
    new-instance v0, Lcom/android/quickstep/e0;

    invoke-direct {v0, p0}, Lcom/android/quickstep/e0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->startNewTask(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public static synthetic t(Lcom/android/quickstep/AbsSwipeUpHandler;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$startNewTask$32(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic t0(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetDragLayer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onLauncherStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic u0()I
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_PARALLEL_ANIM_FINISHED:I

    .line 2
    .line 3
    return v0
.end method

.method private unregisterActivityRestartListener()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mActivityRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "unregisterActivityRestartListener e:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "AbsSwipeUpHandler"

    .line 30
    .line 31
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private updateLauncherTransitionProgress()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->canCreateNewOrUpdateExistingLauncherTransitionController()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isKeyboardTaskFocusPending()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 24
    .line 25
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getScaleProgressDueToScroll()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    :goto_0
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->setProgress(FF)V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_1
    return-void
.end method

.method private updateThumbnail()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    if-eq v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/android/quickstep/views/RecentsView;->updateThumbnail(Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method private updateThumbnailMFV()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 19
    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->ALL_APPS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 29
    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->updateThumbnail(Ljava/util/Map;)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 43
    .line 44
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    .line 51
    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 55
    .line 56
    new-instance v1, Lcom/android/quickstep/z;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lcom/android/quickstep/z;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Lcom/android/quickstep/A;

    .line 62
    .line 63
    invoke-direct {v2, p0}, Lcom/android/quickstep/A;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1, v2}, Lcom/android/quickstep/ViewUtils;->postFrameDrawn(Landroid/view/View;Ljava/lang/Runnable;Ljava/util/function/BooleanSupplier;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_1
    :goto_0
    return v2
.end method

.method private final useWrapperVelocity(F)Z
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x40c00000    # 6.0f

    .line 6
    .line 7
    cmpg-float p1, p1, v0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-gez p1, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWrapperVelocity:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget p1, p0, Landroid/graphics/PointF;->y:F

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    cmpl-float p1, p1, v1

    .line 19
    .line 20
    if-ltz p1, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v0, "use wrapper velocity: "

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "QuickStep"

    .line 41
    .line 42
    const-string v0, "AbsSwipeUpHandler"

    .line 43
    .line 44
    invoke-static {p1, v0, p0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public static synthetic v(I)Z
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p0, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static synthetic w(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resumeLastTask()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onLauncherPresentAndGestureStarted()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupLauncherUiAfterSwipeUpToRecentsAnimation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->lambda$new$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected animateGestureEnd(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Lcom/android/quickstep/AbsSwipeUpHandler;->animateToProgressInternal(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected applyScrollAndTransform()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget-object v3, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 14
    .line 15
    if-eq v0, v3, :cond_0

    .line 16
    .line 17
    move v0, v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v2

    .line 20
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->shouldLinkRecentsViewScroll()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    move v3, v1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v3, v2

    .line 33
    :goto_1
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 34
    .line 35
    iget v4, v4, Lcom/android/launcher3/anim/d;->d:F

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getScaleProgressDueToScroll()F

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    invoke-virtual {v5}, Lcom/android/quickstep/views/RecentsView;->getScrollOffset()I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v5, v2

    .line 55
    :goto_2
    iget-boolean v6, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStartMovingTasks:Z

    .line 56
    .line 57
    if-nez v6, :cond_4

    .line 58
    .line 59
    const/4 v6, 0x0

    .line 60
    cmpl-float v6, v4, v6

    .line 61
    .line 62
    if-gtz v6, :cond_3

    .line 63
    .line 64
    if-eqz v5, :cond_4

    .line 65
    .line 66
    :cond_3
    iput-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStartMovingTasks:Z

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->startInterceptingTouchesForGesture()V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 72
    .line 73
    array-length v6, v1

    .line 74
    move v7, v2

    .line 75
    :goto_3
    if-ge v7, v6, :cond_c

    .line 76
    .line 77
    aget-object v8, v1, v7

    .line 78
    .line 79
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getPlaybackController()Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 80
    .line 81
    .line 82
    move-result-object v9

    .line 83
    if-eqz v9, :cond_5

    .line 84
    .line 85
    iget v10, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    .line 86
    .line 87
    invoke-virtual {v9, v4, v10}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->setProgress(FF)V

    .line 88
    .line 89
    .line 90
    :cond_5
    if-eqz v0, :cond_b

    .line 91
    .line 92
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    if-eqz v3, :cond_6

    .line 97
    .line 98
    int-to-float v10, v5

    .line 99
    invoke-virtual {v9, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setScroll(F)V

    .line 100
    .line 101
    .line 102
    :cond_6
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 103
    .line 104
    .line 105
    move-result-object v10

    .line 106
    invoke-direct {p0, v10, v9, v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->shouldFadeOutTargetsForKeyboardQuickSwitch(Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;F)Z

    .line 107
    .line 108
    .line 109
    move-result v10

    .line 110
    if-eqz v10, :cond_7

    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_7
    iget-object v10, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 114
    .line 115
    if-eqz v10, :cond_a

    .line 116
    .line 117
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 118
    .line 119
    .line 120
    move-result v10

    .line 121
    if-eqz v10, :cond_a

    .line 122
    .line 123
    invoke-virtual {v9}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentApplyRect()Landroid/graphics/RectF;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    iget-object v10, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 128
    .line 129
    if-eqz v10, :cond_8

    .line 130
    .line 131
    aget-object v10, v10, v2

    .line 132
    .line 133
    if-eqz v10, :cond_8

    .line 134
    .line 135
    invoke-virtual {v10}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 136
    .line 137
    .line 138
    move-result-object v10

    .line 139
    if-eqz v10, :cond_8

    .line 140
    .line 141
    invoke-virtual {v10}, Lcom/android/quickstep/util/TaskViewSimulator;->getNonDirectApplyMatrixBeforeGestureEnd()Landroid/graphics/Matrix;

    .line 142
    .line 143
    .line 144
    move-result-object v10

    .line 145
    if-eqz v10, :cond_8

    .line 146
    .line 147
    invoke-virtual {v9}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentMatrix()Landroid/graphics/Matrix;

    .line 148
    .line 149
    .line 150
    move-result-object v11

    .line 151
    invoke-virtual {v10, v11}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 152
    .line 153
    .line 154
    :cond_8
    iget-object v10, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 155
    .line 156
    iget v10, v10, Lcom/android/launcher3/anim/d;->d:F

    .line 157
    .line 158
    invoke-virtual {v9, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setCurrentProgressWhenNonApply(F)V

    .line 159
    .line 160
    .line 161
    iget-object v10, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeWindowMapping:Landroid/graphics/Matrix;

    .line 162
    .line 163
    if-eqz v10, :cond_9

    .line 164
    .line 165
    invoke-virtual {v10, v8}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 166
    .line 167
    .line 168
    :cond_9
    iget-object v10, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 169
    .line 170
    if-eqz v10, :cond_b

    .line 171
    .line 172
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 173
    .line 174
    .line 175
    move-result-object v10

    .line 176
    if-eqz v10, :cond_b

    .line 177
    .line 178
    invoke-virtual {v10}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 179
    .line 180
    .line 181
    move-result-object v10

    .line 182
    if-eqz v10, :cond_b

    .line 183
    .line 184
    invoke-virtual {v9}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    .line 185
    .line 186
    .line 187
    move-result v9

    .line 188
    invoke-virtual {v10, v8, v9}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->updateEndTargetRectF(Landroid/graphics/RectF;F)V

    .line 189
    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_a
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 193
    .line 194
    .line 195
    move-result-object v10

    .line 196
    iget-object v11, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 197
    .line 198
    iget v11, v11, Lcom/android/launcher3/anim/d;->d:F

    .line 199
    .line 200
    invoke-virtual {v10, v11}, Lcom/android/quickstep/util/TransformParams;->setCurrentProgress(F)V

    .line 201
    .line 202
    .line 203
    iget-object v10, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 204
    .line 205
    iget v10, v10, Lcom/android/launcher3/anim/d;->d:F

    .line 206
    .line 207
    invoke-virtual {v9, v10}, Lcom/android/quickstep/util/TaskViewSimulator;->setCurrentProgressWhenApply(F)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v8}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 211
    .line 212
    .line 213
    move-result-object v8

    .line 214
    invoke-virtual {v9, v8}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 215
    .line 216
    .line 217
    :cond_b
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :cond_c
    return-void
.end method

.method public computeRecentsScrollIfInvisible()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->computeScroll()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final createAnimateToHome(FLandroid/graphics/PointF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lu2/s;Z)V
    .locals 3

    .line 1
    const-string p4, "velocityPxPerMs"

    .line 2
    .line 3
    invoke-static {p2, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p4, "homeAnimationFactory"

    .line 7
    .line 8
    invoke-static {p3, p4}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    invoke-interface {p4, p2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->adjustFloatingIconStartVelocity(Landroid/graphics/PointF;)V

    .line 16
    .line 17
    .line 18
    const/4 p4, 0x0

    .line 19
    iput-boolean p4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->toHomeAnim:Z

    .line 20
    .line 21
    const/4 p5, 0x0

    .line 22
    iput-object p5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeAnimator:Lcom/android/quickstep/util/SwipePipToHomeAnimator;

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 30
    .line 31
    array-length v1, v0

    .line 32
    aget-object v0, v0, p4

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 43
    .line 44
    const-string v1, "targets"

    .line 45
    .line 46
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v1, "mRemoteTargetHandles[0].\u2026.targetSet.unfilteredApps"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->toHomeAnim:Z

    .line 56
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/AbsSwipeUpHandler;->createAppToHomeAnimation(FLandroid/graphics/PointF;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->toHomeAnim:Z

    .line 62
    .line 63
    if-eqz v0, :cond_5

    .line 64
    .line 65
    invoke-virtual {p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getAnimRecord()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Lcom/android/quickstep/AbsSwipeUpHandler$15;

    .line 70
    .line 71
    invoke-direct {v1, p0, p3}, Lcom/android/quickstep/AbsSwipeUpHandler$15;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)V

    .line 72
    .line 73
    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    move-object v0, p5

    .line 82
    :goto_0
    if-eqz v0, :cond_1

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    move-object v2, p5

    .line 90
    :goto_1
    if-eqz v2, :cond_2

    .line 91
    .line 92
    invoke-virtual {v2, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 96
    .line 97
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p3, p2, v2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->playAtomicAnimation(FLandroid/animation/AnimatorSet;)V

    .line 103
    .line 104
    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 108
    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_3
    const-string p2, "AbsSwipeUpHandler"

    .line 112
    .line 113
    const-string p3, "MultiAnimatorSet had not created."

    .line 114
    .line 115
    const-string v0, "QuickStep"

    .line 116
    .line 117
    invoke-static {v0, p2, p3}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    if-eqz p1, :cond_4

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    move-object p1, p5

    .line 124
    :goto_2
    if-eqz p1, :cond_5

    .line 125
    .line 126
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addAnimatorListener(Lcom/android/launcher3/anim/T;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->start()V

    .line 130
    .line 131
    .line 132
    :cond_5
    :goto_3
    iput-object p5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 133
    .line 134
    sget p1, Lcom/android/launcher3/anim/x;->f:F

    .line 135
    .line 136
    const/4 p2, 0x0

    .line 137
    cmpl-float p1, p1, p2

    .line 138
    .line 139
    if-nez p1, :cond_6

    .line 140
    .line 141
    invoke-direct {p0, p4}, Lcom/android/quickstep/AbsSwipeUpHandler;->endRunningWindowAnim(Z)V

    .line 142
    .line 143
    .line 144
    :cond_6
    return-void
.end method

.method public final createBreakAppOpenAnim(Lcom/android/quickstep/util/animation/AnimationRecord;)Lcom/android/quickstep/util/animation/MultiAnimatorSet;
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v0, v0, v2

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 9
    .line 10
    .line 11
    move-result-object v8

    .line 12
    iget-object v0, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 13
    .line 14
    aget-object v0, v0, v2

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 17
    .line 18
    .line 19
    move-result-object v10

    .line 20
    new-instance v0, Landroid/graphics/RectF;

    .line 21
    .line 22
    iget-object v3, v8, Lcom/android/quickstep/util/TaskViewSimulator;->mThumbnailPosition:Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {v0, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 25
    .line 26
    .line 27
    new-instance v3, Landroid/graphics/RectF;

    .line 28
    .line 29
    invoke-direct {v3, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 30
    .line 31
    .line 32
    new-instance v4, Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v5, Landroid/graphics/Matrix;

    .line 38
    .line 39
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v5, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeWindowMapping:Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-virtual {v8, v4}, Lcom/android/quickstep/util/TaskViewSimulator;->applyWindowToHomeRotation(Landroid/graphics/Matrix;)V

    .line 45
    .line 46
    .line 47
    iget-object v5, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeWindowMapping:Landroid/graphics/Matrix;

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 50
    .line 51
    .line 52
    iget-object v5, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeWindowMapping:Landroid/graphics/Matrix;

    .line 53
    .line 54
    if-eqz v5, :cond_0

    .line 55
    .line 56
    invoke-virtual {v5, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    new-instance v9, Lkotlin/jvm/internal/A;

    .line 60
    .line 61
    invoke-direct {v9}, Lkotlin/jvm/internal/A;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getCurrentRadius()F

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMStartRadius()F

    .line 79
    .line 80
    .line 81
    move-result v11

    .line 82
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMEndRadius()F

    .line 83
    .line 84
    .line 85
    move-result v12

    .line 86
    invoke-static {v7, v11, v12}, Lcom/android/launcher3/N5;->e(FFF)F

    .line 87
    .line 88
    .line 89
    move-result v13

    .line 90
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMStartRadius()F

    .line 91
    .line 92
    .line 93
    move-result v14

    .line 94
    invoke-virtual {v5}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMEndRadius()F

    .line 95
    .line 96
    .line 97
    move-result v15

    .line 98
    const/high16 v17, 0x40000000    # 2.0f

    .line 99
    .line 100
    sget-object v18, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 101
    .line 102
    const v16, 0x3f7d70a4    # 0.99f

    .line 103
    .line 104
    .line 105
    invoke-static/range {v13 .. v18}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    iput v5, v9, Lkotlin/jvm/internal/A;->g:F

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    const/4 v7, 0x0

    .line 113
    :goto_0
    sget-object v5, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->GESTURE_TO_DRAG:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 114
    .line 115
    new-instance v11, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 116
    .line 117
    invoke-direct {v11, v5}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v10}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 121
    .line 122
    .line 123
    move-result-object v12

    .line 124
    iget-object v12, v12, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 125
    .line 126
    const-string v13, "transformParams.targetSet.unfilteredApps"

    .line 127
    .line 128
    invoke-static {v12, v13}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    new-instance v13, Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 132
    .line 133
    const/4 v14, 0x0

    .line 134
    invoke-direct {v13, v11, v12, v14}, Lcom/android/quickstep/util/animation/AnimationRecord;-><init>(Lcom/android/quickstep/util/animation/MultiAnimatorSet;[Lu2/s;Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iput-object v13, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 138
    .line 139
    iget-object v12, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 140
    .line 141
    if-eqz v12, :cond_2

    .line 142
    .line 143
    invoke-virtual {v12, v11}, Lcom/android/launcher3/q5;->Q0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 144
    .line 145
    .line 146
    :cond_2
    iget-object v12, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 147
    .line 148
    invoke-static {v12}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    iget-object v13, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 152
    .line 153
    instance-of v15, v13, Lcom/android/launcher3/C2;

    .line 154
    .line 155
    if-eqz v15, :cond_3

    .line 156
    .line 157
    check-cast v13, Lcom/android/launcher3/C2;

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_3
    move-object v13, v14

    .line 161
    :goto_1
    const/high16 v15, 0x3f800000    # 1.0f

    .line 162
    .line 163
    move-object/from16 v6, p1

    .line 164
    .line 165
    const/16 v16, 0x0

    .line 166
    .line 167
    invoke-virtual {v12, v6, v3, v15, v13}, Lcom/android/quickstep/util/animation/AnimationRecord;->tryConnectExistingAnim(Lcom/android/quickstep/util/animation/AnimationRecord;Landroid/graphics/RectF;FLcom/android/launcher3/C2;)Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 168
    .line 169
    .line 170
    move-result-object v12

    .line 171
    if-nez v12, :cond_4

    .line 172
    .line 173
    iput-object v14, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 174
    .line 175
    return-object v14

    .line 176
    :cond_4
    invoke-direct {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideDragLayer()V

    .line 177
    .line 178
    .line 179
    new-instance v13, Landroid/graphics/RectF;

    .line 180
    .line 181
    invoke-direct {v13}, Landroid/graphics/RectF;-><init>()V

    .line 182
    .line 183
    .line 184
    iget-object v14, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 185
    .line 186
    if-eqz v14, :cond_5

    .line 187
    .line 188
    check-cast v14, Lcom/android/launcher3/views/k;

    .line 189
    .line 190
    invoke-interface {v14}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 191
    .line 192
    .line 193
    move-result-object v14

    .line 194
    goto :goto_2

    .line 195
    :cond_5
    const/4 v14, 0x0

    .line 196
    :goto_2
    invoke-virtual {v8, v14}, Lcom/android/quickstep/util/TaskViewSimulator;->checkAndUpdateDeviceProfile(Lcom/android/launcher3/h0;)V

    .line 197
    .line 198
    .line 199
    iget-object v14, v1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 200
    .line 201
    instance-of v2, v14, Lcom/android/launcher3/C2;

    .line 202
    .line 203
    if-eqz v2, :cond_6

    .line 204
    .line 205
    invoke-static {v14}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    goto :goto_3

    .line 210
    :cond_6
    move/from16 v2, v16

    .line 211
    .line 212
    :goto_3
    invoke-virtual {v12, v15}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setStartAlpha(F)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v12, v2}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setEndRadius(F)V

    .line 216
    .line 217
    .line 218
    move-object v14, v4

    .line 219
    new-instance v4, Lcom/android/quickstep/utils/CreateTransactionHelper;

    .line 220
    .line 221
    invoke-direct {v4}, Lcom/android/quickstep/utils/CreateTransactionHelper;-><init>()V

    .line 222
    .line 223
    .line 224
    new-instance v15, Lcom/android/quickstep/util/animation/RectTransformHelper;

    .line 225
    .line 226
    invoke-direct {v15, v0, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper;-><init>(Landroid/graphics/RectF;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 227
    .line 228
    .line 229
    new-instance v6, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;

    .line 230
    .line 231
    invoke-direct {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;-><init>()V

    .line 232
    .line 233
    .line 234
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIsVerticalClip()Z

    .line 235
    .line 236
    .line 237
    move-result v5

    .line 238
    invoke-virtual {v6, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setVerticalClip(Z)V

    .line 239
    .line 240
    .line 241
    invoke-virtual/range {p1 .. p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMIsClipFromLeftOrTop()Z

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    invoke-virtual {v6, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setClipFromLeftOrTop(Z)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v10}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    invoke-virtual {v6, v5}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->setSurfaceTransactionApplier(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 253
    .line 254
    .line 255
    invoke-static {}, LM3/a;->e()Z

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    if-eqz v5, :cond_7

    .line 260
    .line 261
    new-instance v5, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    move-object/from16 v18, v4

    .line 267
    .line 268
    const-string v4, "createBreakAppOpenAnim, windowFullScreenBounds: "

    .line 269
    .line 270
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    const-string v0, ", rotationFixedWindowRectF: "

    .line 277
    .line 278
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    const-string v0, " endRadius: "

    .line 285
    .line 286
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string v0, ", csv: "

    .line 293
    .line 294
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    iget-object v0, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 298
    .line 299
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 300
    .line 301
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    const-string v2, "QuickStep"

    .line 309
    .line 310
    const-string v3, "AbsSwipeUpHandler"

    .line 311
    .line 312
    invoke-static {v2, v3, v0}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_7
    move-object/from16 v18, v4

    .line 317
    .line 318
    :goto_4
    cmpl-float v0, v7, v16

    .line 319
    .line 320
    if-nez v0, :cond_8

    .line 321
    .line 322
    invoke-virtual {v6}, Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;->getRadiusWeight()F

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    iput v0, v9, Lkotlin/jvm/internal/A;->g:F

    .line 327
    .line 328
    :cond_8
    iget-object v0, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 329
    .line 330
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 331
    .line 332
    invoke-virtual {v1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 333
    .line 334
    .line 335
    const/4 v0, 0x0

    .line 336
    invoke-virtual {v12, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->setAsyncStart(Z)V

    .line 337
    .line 338
    .line 339
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$16;

    .line 340
    .line 341
    move-object v7, v12

    .line 342
    move-object v3, v13

    .line 343
    move-object v2, v14

    .line 344
    move-object v5, v15

    .line 345
    move-object/from16 v4, v18

    .line 346
    .line 347
    invoke-direct/range {v0 .. v10}, Lcom/android/quickstep/AbsSwipeUpHandler$16;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/graphics/Matrix;Landroid/graphics/RectF;Lcom/android/quickstep/utils/CreateTransactionHelper;Lcom/android/quickstep/util/animation/RectTransformHelper;Lcom/android/quickstep/util/animation/RectTransformHelper$TransformParams;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Lcom/android/quickstep/util/TaskViewSimulator;Lkotlin/jvm/internal/A;Lcom/android/quickstep/util/TransformParams;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v7, v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->addOnUpdateListener(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$OnAnimUpdateListener;)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v11, v7}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 354
    .line 355
    .line 356
    return-object v11
.end method

.method protected abstract createHomeAnimationFactory(Ljava/util/List;JZZLandroid/view/RemoteAnimationTarget;Lcom/android/quickstep/views/TaskView;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/IBinder;",
            ">;JZZ",
            "Landroid/view/RemoteAnimationTarget;",
            "Lcom/android/quickstep/views/TaskView;",
            ")",
            "Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;"
        }
    .end annotation
.end method

.method protected createWindowAnimationToHome(FLcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)[Lcom/android/quickstep/util/RectFSpringAnim;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic;->createWindowAnimationToHome(FLcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;)[Lcom/android/quickstep/util/RectFSpringAnim;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupWindowAnimation([Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method protected abstract finishRecentsControllerToHome(Ljava/lang/Runnable;)V
.end method

.method public final getCurrentShift()Lcom/android/launcher3/anim/d;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    const-string v0, "mCurrentShift"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public final getGestureState()Lcom/android/quickstep/GestureState;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    const-string v0, "mGestureState"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public getHomeIntent()Landroid/content/Intent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method protected getLastAppearedTaskIndex()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getLastAppearedTaskIds()[I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/android/quickstep/h0;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/android/quickstep/h0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/stream/IntStream;->findFirst()Ljava/util/OptionalInt;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/util/OptionalInt;->isPresent()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/OptionalInt;->getAsInt()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskIndexForId(I)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskIndex()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method public final getLastRunningAnimRecord(Z)Lcom/android/quickstep/util/animation/AnimationRecord;
    .locals 4

    .line 1
    const-string v0, "AbsSwipeUpHandler"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string p1, "getLastRunningAnimRecord: Found running break open animation."

    .line 16
    .line 17
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mBreakOpenAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    move-object v1, v2

    .line 47
    :goto_1
    if-eqz v1, :cond_3

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMReverseToOpen()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMAnimStarted()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    const-string p1, "getLastRunningAnimRecord: Found running recent reverse open animation."

    .line 62
    .line 63
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 74
    .line 75
    if-eqz v1, :cond_6

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-eqz v1, :cond_6

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_4

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    const-string p1, "getLastRunningAnimRecord: Found running app open animation."

    .line 91
    .line 92
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 96
    .line 97
    if-eqz p0, :cond_5

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0

    .line 104
    :cond_5
    return-object v2

    .line 105
    :cond_6
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    const-string v1, "getLastRunningAnimRecord: Failed to find the running desired animation record, toHome:"

    .line 111
    .line 112
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    return-object v2
.end method

.method public getLaunchIntent()Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->getEnableOverviewInWindow()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getHomeIntent()Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getOverviewIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getMotionPauseListener()Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/AbsSwipeUpHandler$2;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final getRecentViewScaleSpring()Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation<",
            "Lcom/android/quickstep/AbsSwipeUpHandler<",
            "***>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->recentViewScaleSpring:Lcom/android/quickstep/util/AnimatedFactorsSpringAnimation;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecentsView()Lcom/android/quickstep/views/RecentsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecentsViewDispatcher(F)Ljava/util/function/Consumer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Ljava/util/function/Consumer<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->getEventDispatcher(F)Ljava/util/function/Consumer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final getRecentsViewScaleProgress()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->getNormalController()Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->q()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final getRemoteTargetHandles()[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThresholdToAllowMotionPause()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarHomeOverviewThreshold:I

    .line 6
    .line 7
    int-to-float p0, p0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final getToHomeAnim()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->toHomeAnim:Z

    .line 2
    .line 3
    return p0
.end method

.method protected handleTaskAppeared([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 13
    .line 14
    .line 15
    const-string p0, "State handler was invalidated"

    .line 16
    .line 17
    new-array p1, v1, [Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p2, p0, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 24
    .line 25
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_START_NEW_TASK:I

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasStartedTaskBefore([Landroid/view/RemoteAnimationTarget;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 46
    .line 47
    const-string p0, "STATE_START_NEW_TASK was never set"

    .line 48
    .line 49
    new-array p1, v1, [Ljava/lang/Object;

    .line 50
    .line 51
    invoke-virtual {p2, p0, p1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    aget-object p0, p1, v1

    .line 56
    .line 57
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 58
    .line 59
    iget p1, p0, Landroid/app/TaskInfo;->taskId:I

    .line 60
    .line 61
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p0, p0, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "Unexpected task appeared id=%d, pkg=%s"

    .line 80
    .line 81
    invoke-virtual {p2, p1, p0}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 82
    .line 83
    .line 84
    :goto_1
    return v1
.end method

.method protected hasStartedNewTask()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getLastStartedTaskIds()[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    aget p0, p0, v0

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    if-eq p0, v1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    return v0
.end method

.method protected hasTargets()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationTargets;->hasTargets()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public hideMiniWindowTipsView()V
    .locals 0

    .line 1
    return-void
.end method

.method public ifReachedMaxPausedProgress()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->getCurrentShiftValue()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthMaxRecentsFactor:F

    .line 6
    .line 7
    cmpl-float p0, v0, p0

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected initTransitionEndpoints(Lcom/android/launcher3/h0;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    aget-object p1, p1, v1

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getFullScreenScale()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-float/2addr v0, p1

    .line 28
    const/high16 v1, 0x3f400000    # 0.75f

    .line 29
    .line 30
    sub-float/2addr v1, p1

    .line 31
    div-float/2addr v1, v0

    .line 32
    iput v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorStartPullback:F

    .line 33
    .line 34
    const/high16 v1, 0x3f000000    # 0.5f

    .line 35
    .line 36
    sub-float/2addr v1, p1

    .line 37
    div-float/2addr v1, v0

    .line 38
    iput v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorMaxPullback:F

    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iput v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorMaxPullback:F

    .line 42
    .line 43
    iput v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->dragLengthFactorStartPullback:F

    .line 44
    .line 45
    return-void
.end method

.method public initWhenReady(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/RecentsModel;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;)I

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/ContextInitListener;->register(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public isCanceled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isInvalidRectF(Landroid/graphics/RectF;)Z
    .locals 0

    .line 1
    iget p0, p1, Landroid/graphics/RectF;->left:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    iget p0, p1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    iget p0, p1, Landroid/graphics/RectF;->right:F

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public isLauncherStart()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_STARTED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isNonPendingApplyData()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected linkRecentsViewScroll()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v1, Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;-><init>(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/v;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/android/quickstep/v;-><init>(Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic;->runActionOnRemoteHandles(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/x;

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Lcom/android/quickstep/x;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/util/SurfaceTransactionApplier;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->runOnRecentsAnimationAndLauncherBound(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 28
    .line 29
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnRecentsScrollListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    new-instance v0, Lcom/android/quickstep/y;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/quickstep/y;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->runOnRecentsAnimationAndLauncherBound(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 53
    .line 54
    invoke-static {v0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_QUICK_SWITCH:Landroid/window/DesktopModeFlags;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getNextPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    instance-of v0, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 83
    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    instance-of v0, v0, Lcom/android/quickstep/views/DesktopTaskView;

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    :cond_3
    const/4 v0, 0x0

    .line 97
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isThreeFingerTrackpadGesture()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsViewScrollLinked:Z

    .line 110
    .line 111
    :cond_5
    :goto_0
    return-void
.end method

.method protected maybeUpdateRecentsAttachedState()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    return-void
.end method

.method protected maybeUpdateRecentsAttachedState(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(ZZ)V

    return-void
.end method

.method protected maybeUpdateRecentsAttachedState(ZZ)V
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-eqz v0, :cond_0

    .line 4
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->shouldUpdateRunningTaskAlpha()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 5
    :goto_0
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(ZZZ)V

    return-void
.end method

.method protected moveWindowWithRecentsScroll()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method protected notifyGestureAnimationStartToRecents()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getRunningTask()Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPlaceholderGroupedTaskInfo([I)Lcom/android/wm/shell/shared/i;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-virtual {v1, v0}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationStart(Lcom/android/wm/shell/shared/i;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getType()Lcom/android/quickstep/views/TaskViewType;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mPreviousTaskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 55
    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method protected onActivityInit(Ljava/lang/Boolean;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 13
    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/content/Context;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/content/Context;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 44
    .line 45
    const-string v4, "AbsSwipeUpHandler"

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    if-ne v3, v0, :cond_3

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    const-string p0, "onActivityInit container is null!"

    .line 53
    .line 54
    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_2
    return v5

    .line 58
    :cond_3
    if-eqz v3, :cond_5

    .line 59
    .line 60
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 61
    .line 62
    sget v6, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 63
    .line 64
    invoke-virtual {v3, v6}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_4

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 71
    .line 72
    sget p1, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 75
    .line 76
    .line 77
    const-string p0, "onActivityInit STATE_GESTURE_COMPLETED & STATE_RECENTS_SCROLLING_FINISHED"

    .line 78
    .line 79
    invoke-static {v4, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    return v5

    .line 83
    :cond_4
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 84
    .line 85
    .line 86
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 87
    .line 88
    invoke-virtual {v3}, Lcom/android/quickstep/MultiStateCallback;->getState()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->LAUNCHER_UI_STATES:I

    .line 93
    .line 94
    not-int v4, v4

    .line 95
    and-int/2addr v3, v4

    .line 96
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->initStateCallbacks()V

    .line 97
    .line 98
    .line 99
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 100
    .line 101
    invoke-virtual {v4, v3}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 102
    .line 103
    .line 104
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    iput-boolean v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWasLauncherAlreadyVisible:Z

    .line 109
    .line 110
    iput-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    const/16 v4, 0x9

    .line 117
    .line 118
    if-eqz v3, :cond_6

    .line 119
    .line 120
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 121
    .line 122
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 123
    .line 124
    invoke-interface {v3, v4}, Lcom/android/quickstep/views/RecentsViewContainer;->clearForceInvisibleFlag(I)V

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_6
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 129
    .line 130
    check-cast v3, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 131
    .line 132
    invoke-interface {v3, v4}, Lcom/android/quickstep/views/RecentsViewContainer;->addForceInvisibleFlag(I)V

    .line 133
    .line 134
    .line 135
    :goto_0
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 136
    .line 137
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lcom/android/quickstep/views/RecentsView;

    .line 142
    .line 143
    iput-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 144
    .line 145
    const/4 v4, 0x0

    .line 146
    invoke-virtual {v3, v4}, Lcom/android/launcher3/V4;->setOnPageTransitionEndCallback(Ljava/lang/Runnable;)V

    .line 147
    .line 148
    .line 149
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 150
    .line 151
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_PRESENT:I

    .line 152
    .line 153
    invoke-virtual {v3, v4}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-eqz p1, :cond_7

    .line 161
    .line 162
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onLauncherStart()V

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnStartCallback:Ljava/lang/Runnable;

    .line 167
    .line 168
    invoke-interface {v0, v2, p1}, Lcom/android/quickstep/views/RecentsViewContainer;->addEventCallback(ILjava/lang/Runnable;)V

    .line 169
    .line 170
    .line 171
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 172
    .line 173
    sget v0, Lcom/android/quickstep/GestureState;->STATE_RECENTS_ANIMATION_CANCELED:I

    .line 174
    .line 175
    new-instance v2, Lcom/android/quickstep/E;

    .line 176
    .line 177
    invoke-direct {v2, p0}, Lcom/android/quickstep/E;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p1, v0, v2}, Lcom/android/quickstep/GestureState;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 181
    .line 182
    .line 183
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupRecentsViewUi()V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 187
    .line 188
    new-instance v0, Lcom/android/quickstep/F;

    .line 189
    .line 190
    invoke-direct {v0, p0}, Lcom/android/quickstep/F;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 197
    .line 198
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 199
    .line 200
    new-instance v0, Lcom/android/quickstep/G;

    .line 201
    .line 202
    invoke-direct {v0, p0}, Lcom/android/quickstep/G;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 203
    .line 204
    .line 205
    invoke-interface {p1, v0}, Lcom/android/quickstep/views/RecentsViewContainer;->runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 209
    .line 210
    invoke-virtual {p1, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-nez p1, :cond_8

    .line 215
    .line 216
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 217
    .line 218
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 219
    .line 220
    const/4 v0, 0x3

    .line 221
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnDestroyCallback:Ljava/lang/Runnable;

    .line 222
    .line 223
    invoke-interface {p1, v0, v1}, Lcom/android/quickstep/views/RecentsViewContainer;->addEventCallback(ILjava/lang/Runnable;)V

    .line 224
    .line 225
    .line 226
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 227
    .line 228
    instance-of v0, p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 229
    .line 230
    if-eqz v0, :cond_9

    .line 231
    .line 232
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 233
    .line 234
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 239
    .line 240
    :cond_9
    return v5
.end method

.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Landroid/view/WindowInsets$Type;->ime()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p2, v0}, Landroid/view/WindowInsets;->isVisible(I)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->buildAnimationController()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-object p1
.end method

.method protected onCalculateEndTarget()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/quickstep/AbsSwipeUpHandler$17;->$SwitchMap$com$android$quickstep$GestureState$GestureEndTarget:[I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    aget v0, v1, v0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Lcom/android/quickstep/RecentsAnimationController;->detachNavigationBarFromApp(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method

.method public onConsumerAboutToBeSwitched()V
    .locals 4

    .line 1
    const-string v0, "MultiStateCallback onConsumerAboutToBeSwitched"

    .line 2
    .line 3
    const-string v1, "AbsSwipeUpHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->resetLauncherListeners()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isRecentsAnimationRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-boolean v0, v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->isLauncher:Z

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->cancelCurrentAnimation()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 41
    .line 42
    sget v1, Lcom/android/quickstep/GestureState;->STATE_RECENTS_SCROLLING_FINISHED:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->hasState(I)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-static {}, Lx1/O;->T2()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->clearState(I)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->hasState(I)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 70
    .line 71
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    invoke-static {}, Lx1/O;->T2()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_1

    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void

    .line 91
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    new-instance v2, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    const-string v3, "onConsumerAboutToBeSwitched isRecentsAnimationRunning:"

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    if-eqz v0, :cond_3

    .line 118
    .line 119
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 120
    .line 121
    const/4 v1, 0x0

    .line 122
    invoke-virtual {v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->getCurrentCallbacks()Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_4

    .line 133
    .line 134
    new-instance v1, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

    .line 135
    .line 136
    invoke-direct {v1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 140
    .line 141
    .line 142
    :cond_4
    :goto_0
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 143
    .line 144
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v0}, Lu2/e;->h()V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 160
    .line 161
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 164
    .line 165
    .line 166
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public onCurrentShiftUpdated()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateSysUiFlags(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->applyScrollAndTransform()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateLauncherTransitionProgress()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onGestureCancelled()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateDisplacement(F)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 6
    .line 7
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 10
    .line 11
    .line 12
    new-instance v5, Landroid/graphics/PointF;

    .line 13
    .line 14
    invoke-direct {v5}, Landroid/graphics/PointF;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v6, 0x1

    .line 18
    const/4 v7, 0x0

    .line 19
    const/4 v3, 0x0

    .line 20
    const/4 v4, 0x0

    .line 21
    move-object v2, p0

    .line 22
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/AbsSwipeUpHandler;->handleNormalGestureEnd(FZLandroid/graphics/PointF;ZZ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onGestureEnded(FLandroid/graphics/PointF;Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const v1, 0x7f070a1f

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureStarted:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMotionPaused:Z

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    cmpl-float v0, v1, v0

    .line 29
    .line 30
    if-lez v0, :cond_0

    .line 31
    .line 32
    move v7, v2

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move v7, v3

    .line 35
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 36
    .line 37
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 40
    .line 41
    .line 42
    iget v0, p2, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget v1, p2, Landroid/graphics/PointF;->x:F

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    cmpl-float v0, v0, v1

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    if-lez v0, :cond_2

    .line 58
    .line 59
    iget v0, p2, Landroid/graphics/PointF;->y:F

    .line 60
    .line 61
    cmpg-float v0, v0, v1

    .line 62
    .line 63
    if-gez v0, :cond_1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move v2, v3

    .line 67
    :goto_1
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLogDirectionUpOrLeft:Z

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_2
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 71
    .line 72
    cmpg-float v0, v0, v1

    .line 73
    .line 74
    if-gez v0, :cond_3

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    move v2, v3

    .line 78
    :goto_2
    iput-boolean v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLogDirectionUpOrLeft:Z

    .line 79
    .line 80
    :goto_3
    new-instance v4, Lcom/android/quickstep/u;

    .line 81
    .line 82
    move-object v5, p0

    .line 83
    move v6, p1

    .line 84
    move-object v8, p2

    .line 85
    move v9, p3

    .line 86
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/u;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;FZLandroid/graphics/PointF;Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, v5, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 90
    .line 91
    if-eqz p0, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/RecentsView;->setDrawingTaskRect(Z)V

    .line 94
    .line 95
    .line 96
    iget-object p0, v5, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 97
    .line 98
    invoke-virtual {p0, v4}, Lcom/android/launcher3/V4;->runOnPageScrollsInitialized(Ljava/lang/Runnable;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_4
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onGestureStarted(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/BaseContainerInterface;->closeOverlay()V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentapps"

    .line 7
    .line 8
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Lcom/android/quickstep/AbsSwipeUpHandler$3;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler$3;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->notifyGestureStarted()V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setIsLikelyToStartNewTask(ZZ)V

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarAlreadyOpen:Z

    .line 40
    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    invoke-direct {p0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->setClampScrollOffset(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 49
    .line 50
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 53
    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureStarted:Z

    .line 56
    .line 57
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->attachTaskWindowSpringScrollerController()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onInterruptAdjustProgressUpdated()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_0

    .line 6
    .line 7
    aget-object v3, v0, v2

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mInterruptAdjustProgress:Lcom/android/launcher3/anim/d;

    .line 14
    .line 15
    iget v5, v5, Lcom/android/launcher3/anim/d;->d:F

    .line 16
    .line 17
    iput v5, v4, Lcom/android/quickstep/util/TaskViewSimulator;->interruptAdjustProgress:F

    .line 18
    .line 19
    invoke-virtual {v3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTransformParams()Lcom/android/quickstep/util/TransformParams;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v4, v3}, Lcom/android/quickstep/util/TaskViewSimulator;->apply(Lcom/android/quickstep/util/TransformParams;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p1, "cancelRecentsAnimation"

    .line 2
    .line 3
    const-string v0, "AbsSwipeUpHandler"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logAbsSwipeUpHandlerOnRecentsAnimationCanceled()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContextInitListener:Lcom/android/quickstep/util/ContextInitListener;

    .line 12
    .line 13
    const-string v1, "AbsSwipeUpHandler.onRecentsAnimationCanceled"

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/ContextInitListener;->unregister(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 19
    .line 20
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_CANCELLED:I

    .line 21
    .line 22
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 23
    .line 24
    or-int/2addr v1, v2

    .line 25
    invoke-virtual {p1, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 36
    .line 37
    .line 38
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargetsMFV(Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 48
    .line 49
    invoke-virtual {v1, p1, p1}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargets(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 58
    .line 59
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_LAUNCHER_DRAWN:I

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDrawListener:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 68
    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    const-string p1, "onRecentsAnimationCanceled removeOnDrawListener"

    .line 76
    .line 77
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 81
    .line 82
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 83
    .line 84
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnDrawListener:Landroid/view/ViewTreeObserver$OnDrawListener;

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 101
    .line 102
    if-eqz p0, :cond_3

    .line 103
    .line 104
    const/4 p1, 0x0

    .line 105
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationIsRunning(Z)V

    .line 106
    .line 107
    .line 108
    :cond_3
    return-void
.end method

.method public onRecentsAnimationFinished(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 2

    .line 1
    const-string p1, "onRecentsAnimationFinished: "

    .line 2
    .line 3
    const-string v0, "AbsSwipeUpHandler"

    .line 4
    .line 5
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargetsMFV(Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 28
    .line 29
    invoke-virtual {v1, p1, p1}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargets(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    const-string p1, "mRecentsAnimationStartCallbacks is not empty"

    .line 41
    .line 42
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationIsRunning(Z)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mShouldPauseAdvance:Z

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    sget-object p1, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/android/quickstep/utils/EarlyPauseAppUtils;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/quickstep/utils/EarlyPauseAppUtils;->unSetPauseAdvance()V

    .line 76
    .line 77
    .line 78
    iput-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mShouldPauseAdvance:Z

    .line 79
    .line 80
    :cond_4
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 6

    .line 1
    const-string v0, "onRecentsAnimationStart: "

    .line 2
    .line 3
    const-string v1, "AbsSwipeUpHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;->onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v2, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->asContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-boolean v0, v0, Lu2/e;->m:Z

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->cancel()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 51
    .line 52
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 53
    .line 54
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->resetDraglayer()V

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-static {}, Lx1/O;->Y2()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 64
    .line 65
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 66
    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    check-cast v0, Lcom/android/launcher3/C2;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->A1()V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Lcom/android/quickstep/RecentsAnimationTargets;->hasDesktopTasks(Landroid/content/Context;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTargetGluer:Lcom/android/quickstep/RemoteTargetGluer;

    .line 83
    .line 84
    invoke-virtual {v0, p2, p3}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargetsForDesktop(Lcom/android/quickstep/RemoteAnimationTargets;Landroid/window/TransitionInfo;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    iput-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    iget-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 92
    .line 93
    array-length p3, p3

    .line 94
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTargetGluer:Lcom/android/quickstep/RemoteTargetGluer;

    .line 95
    .line 96
    invoke-virtual {v0, p2}, Lcom/android/quickstep/RemoteTargetGluer;->assignTargetsForSplitScreen(Lcom/android/quickstep/RemoteAnimationTargets;)[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 101
    .line 102
    array-length v2, v0

    .line 103
    if-ge v2, p3, :cond_3

    .line 104
    .line 105
    iget-boolean p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    .line 106
    .line 107
    if-eqz p3, :cond_3

    .line 108
    .line 109
    array-length p3, v0

    .line 110
    invoke-virtual {p0, p3}, Lcom/android/quickstep/SwipeUpAnimationLogic;->updateIsGestureForSplit(I)V

    .line 111
    .line 112
    .line 113
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setupRecentsViewUi()V

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 117
    .line 118
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 119
    .line 120
    const/4 p3, 0x1

    .line 121
    if-eqz p1, :cond_4

    .line 122
    .line 123
    array-length p1, p1

    .line 124
    if-lt p1, p3, :cond_4

    .line 125
    .line 126
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 127
    .line 128
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_FINISH_WITH_NO_END:I

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-eqz p1, :cond_5

    .line 135
    .line 136
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 137
    .line 138
    if-eqz p1, :cond_5

    .line 139
    .line 140
    const-string p1, "Need cancel recents animation"

    .line 141
    .line 142
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 146
    .line 147
    iput-boolean p3, p1, Lcom/android/quickstep/RecentsAnimationController;->mNeedCancleRecents:Z

    .line 148
    .line 149
    const/4 p1, 0x0

    .line 150
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 151
    .line 152
    return-void

    .line 153
    :cond_5
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 154
    .line 155
    if-eqz p1, :cond_6

    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 158
    .line 159
    .line 160
    :cond_6
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 161
    .line 162
    if-eqz p1, :cond_7

    .line 163
    .line 164
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationTargetsMFV(Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 165
    .line 166
    .line 167
    :cond_7
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 168
    .line 169
    new-instance p1, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 170
    .line 171
    invoke-direct {p1}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;-><init>()V

    .line 172
    .line 173
    .line 174
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 175
    .line 176
    invoke-virtual {p1, p3}, Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;->setCanRelease(Z)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 180
    .line 181
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mSwipePipToHomeReleaseCheck:Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 184
    .line 185
    .line 186
    sget-object p1, Lu2/F;->i:Lu2/F$b;

    .line 187
    .line 188
    invoke-virtual {p1}, Lu2/F$b;->h()Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    const/4 v0, 0x0

    .line 193
    if-eqz p1, :cond_8

    .line 194
    .line 195
    iget-object p1, p2, Lcom/android/quickstep/RemoteAnimationTargets;->extras:Landroid/os/Bundle;

    .line 196
    .line 197
    const-string v1, "extra_shell_can_hand_off_animation"

    .line 198
    .line 199
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mHandOffAnimationToHome:Z

    .line 204
    .line 205
    :cond_8
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 206
    .line 207
    if-nez p1, :cond_a

    .line 208
    .line 209
    iget-object p1, p2, Lcom/android/quickstep/RemoteAnimationTargets;->apps:[Landroid/view/RemoteAnimationTarget;

    .line 210
    .line 211
    aget-object p1, p1, v0

    .line 212
    .line 213
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 214
    .line 215
    aget-object v1, v1, v0

    .line 216
    .line 217
    invoke-virtual {v1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v1}, Lcom/android/quickstep/util/TaskViewSimulator;->getOrientationState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    invoke-virtual {v1, v2}, Lcom/android/quickstep/util/RecentsOrientedState;->getLauncherDeviceProfile(I)Lcom/android/launcher3/h0;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    iget-object v3, p2, Lcom/android/quickstep/RecentsAnimationTargets;->minimizedHomeBounds:Landroid/graphics/Rect;

    .line 236
    .line 237
    if-eqz v3, :cond_9

    .line 238
    .line 239
    if-eqz p1, :cond_9

    .line 240
    .line 241
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 242
    .line 243
    invoke-virtual {v4, v3, p1}, Lcom/android/quickstep/BaseContainerInterface;->getOverviewWindowBounds(Landroid/graphics/Rect;Landroid/view/RemoteAnimationTarget;)Landroid/graphics/Rect;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 248
    .line 249
    new-instance v4, Lcom/android/launcher3/util/p3;

    .line 250
    .line 251
    iget-object v5, p2, Lcom/android/quickstep/RecentsAnimationTargets;->homeContentInsets:Landroid/graphics/Rect;

    .line 252
    .line 253
    invoke-direct {v4, p1, v5}, Lcom/android/launcher3/util/p3;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2, v3, v4}, Lcom/android/launcher3/h0;->A0(Landroid/content/Context;Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    goto :goto_1

    .line 261
    :cond_9
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 262
    .line 263
    invoke-virtual {v2, p1}, Lcom/android/launcher3/h0;->S(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    :goto_1
    iget-object v2, p2, Lcom/android/quickstep/RecentsAnimationTargets;->homeContentInsets:Landroid/graphics/Rect;

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Lcom/android/launcher3/h0;->q1(Landroid/graphics/Rect;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->initTransitionEndpoints(Lcom/android/launcher3/h0;)V

    .line 273
    .line 274
    .line 275
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->O0:Z

    .line 276
    .line 277
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/RecentsOrientedState;->setMultiWindowMode(Z)V

    .line 278
    .line 279
    .line 280
    :cond_a
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->flushOnRecentsAnimationAndLauncherBound()V

    .line 281
    .line 282
    .line 283
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 284
    .line 285
    sget v1, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_APP_CONTROLLER_RECEIVED:I

    .line 286
    .line 287
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_STARTED:I

    .line 288
    .line 289
    or-int v3, v1, v2

    .line 290
    .line 291
    new-instance v4, Lcom/android/quickstep/a;

    .line 292
    .line 293
    invoke-direct {v4, p0}, Lcom/android/quickstep/a;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p1, v3, v4}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 297
    .line 298
    .line 299
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 300
    .line 301
    invoke-virtual {p1, v1}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 305
    .line 306
    if-eqz p1, :cond_b

    .line 307
    .line 308
    invoke-virtual {p1, p3}, Lcom/android/quickstep/views/RecentsView;->setRecentsAnimationIsRunning(Z)V

    .line 309
    .line 310
    .line 311
    :cond_b
    iget-object p1, p2, Lcom/android/quickstep/RemoteAnimationTargets;->unfilteredAppsCompat:[Lu2/s;

    .line 312
    .line 313
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->getClosingAppTarget([Lu2/s;)Lu2/s;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mClosingTarget:Lu2/s;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 320
    .line 321
    if-eqz p1, :cond_c

    .line 322
    .line 323
    aget-object p3, p1, v0

    .line 324
    .line 325
    if-eqz p3, :cond_c

    .line 326
    .line 327
    invoke-virtual {p3}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 328
    .line 329
    .line 330
    move-result-object p3

    .line 331
    if-eqz p3, :cond_c

    .line 332
    .line 333
    invoke-virtual {p3}, Lcom/android/quickstep/util/TaskViewSimulator;->getNonDirectApplyMatrixBeforeGestureEnd()Landroid/graphics/Matrix;

    .line 334
    .line 335
    .line 336
    move-result-object p3

    .line 337
    if-eqz p3, :cond_c

    .line 338
    .line 339
    invoke-virtual {p3}, Landroid/graphics/Matrix;->reset()V

    .line 340
    .line 341
    .line 342
    :cond_c
    if-eqz p1, :cond_d

    .line 343
    .line 344
    aget-object p1, p1, v0

    .line 345
    .line 346
    if-eqz p1, :cond_d

    .line 347
    .line 348
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;->getTaskViewSimulator()Lcom/android/quickstep/util/TaskViewSimulator;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    if-eqz p1, :cond_d

    .line 353
    .line 354
    invoke-virtual {p1}, Lcom/android/quickstep/util/TaskViewSimulator;->getActualMatrixBeforeGestureEnd()Landroid/graphics/Matrix;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    if-eqz p1, :cond_d

    .line 359
    .line 360
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 361
    .line 362
    .line 363
    :cond_d
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 364
    .line 365
    new-instance p3, Lcom/android/quickstep/l;

    .line 366
    .line 367
    invoke-direct {p3, p0, p2}, Lcom/android/quickstep/l;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/quickstep/RecentsAnimationTargets;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {p1, v2, p3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 371
    .line 372
    .line 373
    return-void
.end method

.method protected onRestartPreviouslyAppearedTask()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->reset()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected onSettledOnEndTarget()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 12
    .line 13
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_HANDLER_INVALIDATED:I

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "AbsSwipeUpHandler"

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 25
    .line 26
    if-ne v1, v2, :cond_1

    .line 27
    .line 28
    :cond_0
    sget-object v2, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 29
    .line 30
    if-ne v1, v2, :cond_2

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 33
    .line 34
    instance-of v5, v2, Lcom/android/launcher3/C2;

    .line 35
    .line 36
    if-eqz v5, :cond_2

    .line 37
    .line 38
    check-cast v2, Lcom/android/launcher3/C2;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sget-object v5, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 49
    .line 50
    if-ne v2, v5, :cond_2

    .line 51
    .line 52
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    const-string v2, "state already ended"

    .line 57
    .line 58
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAnimationFactory:Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;

    .line 62
    .line 63
    invoke-interface {v2, v0, v0, v4}, Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;->setRecentsAttachedToAppWindow(ZZZ)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Lcom/android/quickstep/BaseContainerInterface;->onSettledOnEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    sget-object v5, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 73
    .line 74
    const/16 v6, 0xb

    .line 75
    .line 76
    if-eq v1, v5, :cond_3

    .line 77
    .line 78
    invoke-static {v6}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-static {v6}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 83
    .line 84
    .line 85
    :goto_0
    sget-object v5, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 86
    .line 87
    const/16 v6, 0x9

    .line 88
    .line 89
    if-eq v1, v5, :cond_4

    .line 90
    .line 91
    invoke-static {v6}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 96
    .line 97
    invoke-static {v5, v0}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    .line 98
    .line 99
    .line 100
    invoke-static {v6}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 101
    .line 102
    .line 103
    :goto_1
    sget-object v5, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 104
    .line 105
    const/4 v6, 0x2

    .line 106
    const/16 v7, 0x42

    .line 107
    .line 108
    if-eq v1, v5, :cond_5

    .line 109
    .line 110
    invoke-static {v7}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->cancel(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 115
    .line 116
    invoke-static {v5, v6}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendStateEventToTest(Landroid/content/Context;I)V

    .line 117
    .line 118
    .line 119
    invoke-static {v7}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 120
    .line 121
    .line 122
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v7, "endTarget "

    .line 128
    .line 129
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    sget-object v3, Lcom/android/quickstep/AbsSwipeUpHandler$17;->$SwitchMap$com$android$quickstep$GestureState$GestureEndTarget:[I

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    aget v3, v3, v5

    .line 149
    .line 150
    if-eq v3, v4, :cond_a

    .line 151
    .line 152
    if-eq v3, v6, :cond_9

    .line 153
    .line 154
    const/4 v5, 0x3

    .line 155
    if-eq v3, v5, :cond_8

    .line 156
    .line 157
    const/4 v5, 0x4

    .line 158
    if-eq v3, v5, :cond_6

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_6
    if-eqz v2, :cond_7

    .line 162
    .line 163
    new-instance v3, Lcom/android/quickstep/P;

    .line 164
    .line 165
    invoke-direct {v3, p0}, Lcom/android/quickstep/P;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 166
    .line 167
    .line 168
    invoke-static {v2, v3}, Lcom/android/quickstep/ViewUtils;->postFrameDrawn(Landroid/view/View;Ljava/lang/Runnable;)Z

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_7
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 173
    .line 174
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_RESUME_LAST_TASK:I

    .line 175
    .line 176
    invoke-virtual {v2, v3}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 177
    .line 178
    .line 179
    :goto_3
    invoke-direct {p0, v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->setDividerShown(Z)V

    .line 180
    .line 181
    .line 182
    goto :goto_4

    .line 183
    :cond_8
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 184
    .line 185
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_START_NEW_TASK:I

    .line 186
    .line 187
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 188
    .line 189
    or-int/2addr v3, v4

    .line 190
    invoke-virtual {v2, v3}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 191
    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_9
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 195
    .line 196
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_RECENTS:I

    .line 197
    .line 198
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 199
    .line 200
    or-int/2addr v3, v4

    .line 201
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_VIEW_SHOWN:I

    .line 202
    .line 203
    or-int/2addr v3, v4

    .line 204
    invoke-virtual {v2, v3}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 205
    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_a
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 209
    .line 210
    sget v3, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCALED_CONTROLLER_HOME:I

    .line 211
    .line 212
    sget v4, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_CAPTURE_SCREENSHOT:I

    .line 213
    .line 214
    or-int/2addr v3, v4

    .line 215
    invoke-virtual {v2, v3}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 216
    .line 217
    .line 218
    sget-object v2, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 219
    .line 220
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 221
    .line 222
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    .line 227
    .line 228
    invoke-virtual {v2}, Lcom/android/quickstep/SystemUiProxy;->setPipAnimationTypeToAlpha()V

    .line 229
    .line 230
    .line 231
    :goto_4
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 232
    .line 233
    invoke-virtual {v2}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    if-eqz v2, :cond_b

    .line 238
    .line 239
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 240
    .line 241
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/o4;->O(Z)V

    .line 246
    .line 247
    .line 248
    :cond_b
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-static {p0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logOnSettledOnEndTarget(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public onTasksAppeared([Landroid/view/RemoteAnimationTarget;Landroid/window/TransitionInfo;)V
    .locals 5

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "mRecentsAnimationController: "

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, " mStateCallback: "

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/quickstep/MultiStateCallback;->getState()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, " lastStartedTaskId: "

    .line 36
    .line 37
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getLastStartedTaskIds()[I

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v0, "AbsSwipeUpHandler"

    .line 54
    .line 55
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/android/quickstep/TaskAnimationManager;->cancelDelayedFinishRunningRecentsAnim()V

    .line 61
    .line 62
    .line 63
    new-instance p2, Lcom/android/quickstep/a0;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Lcom/android/quickstep/a0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->newEmptyString()Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 73
    .line 74
    sget v2, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_GESTURE_COMPLETED:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/android/quickstep/MultiStateCallback;->hasStates(I)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    const/4 v2, 0x0

    .line 81
    if-nez v1, :cond_1

    .line 82
    .line 83
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasStartedTaskBefore([Landroid/view/RemoteAnimationTarget;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_1

    .line 88
    .line 89
    aget-object p1, p1, v2

    .line 90
    .line 91
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 92
    .line 93
    iget v0, p1, Landroid/app/TaskInfo;->taskId:I

    .line 94
    .line 95
    iget-object p1, p1, Landroid/app/TaskInfo;->baseIntent:Landroid/content/Intent;

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {v0, p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logUnexpectedTaskAppeared(ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-direct {p0, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->newEmptyString()Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p0, p1, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->handleTaskAppeared([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-nez v3, :cond_2

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 123
    .line 124
    .line 125
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logHandleTaskAppearedFailed(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 126
    .line 127
    .line 128
    new-instance p1, Lcom/android/quickstep/b0;

    .line 129
    .line 130
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/b0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/lang/Runnable;)V

    .line 131
    .line 132
    .line 133
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_2
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 142
    .line 143
    iget-object v3, v3, Lcom/android/quickstep/GestureState;->mLastStartedTaskIdPredicate:Ljava/util/function/Predicate;

    .line 144
    .line 145
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    new-instance v3, Lcom/android/quickstep/c0;

    .line 150
    .line 151
    invoke-direct {v3}, Lcom/android/quickstep/c0;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    check-cast v1, [Landroid/view/RemoteAnimationTarget;

    .line 159
    .line 160
    array-length v3, v1

    .line 161
    if-nez v3, :cond_3

    .line 162
    .line 163
    const-string p1, "No appeared task matching started task id"

    .line 164
    .line 165
    new-array v1, v2, [Ljava/lang/Object;

    .line 166
    .line 167
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 168
    .line 169
    .line 170
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logHandleTaskAppearedFailed(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 171
    .line 172
    .line 173
    invoke-direct {p0, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_3
    aget-object v3, v1, v2

    .line 178
    .line 179
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 180
    .line 181
    if-nez v4, :cond_4

    .line 182
    .line 183
    const/4 v3, 0x0

    .line 184
    goto :goto_0

    .line 185
    :cond_4
    iget v3, v3, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 186
    .line 187
    invoke-virtual {v4, v3}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    :goto_0
    if-eqz v3, :cond_7

    .line 192
    .line 193
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    invoke-interface {v3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    new-instance v4, Lcom/android/quickstep/d0;

    .line 202
    .line 203
    invoke-direct {v4}, Lcom/android/quickstep/d0;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->noneMatch(Ljava/util/function/Predicate;)Z

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    if-eqz v3, :cond_5

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_5
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 214
    .line 215
    if-nez v3, :cond_6

    .line 216
    .line 217
    const-string p1, "Activity destroyed"

    .line 218
    .line 219
    new-array v1, v2, [Ljava/lang/Object;

    .line 220
    .line 221
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 222
    .line 223
    .line 224
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logHandleTaskAppearedFailed(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 225
    .line 226
    .line 227
    invoke-direct {p0, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_6
    invoke-direct {p0, v3, p1, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->animateSplashScreenExit(Landroid/content/Context;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_7
    :goto_1
    const-string p1, "Splash not needed"

    .line 236
    .line 237
    new-array v1, v2, [Ljava/lang/Object;

    .line 238
    .line 239
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    .line 240
    .line 241
    .line 242
    invoke-static {v0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logHandleTaskAppearedFailed(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 243
    .line 244
    .line 245
    invoke-direct {p0, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->finishRecentsAnimationOnTasksAppeared(Ljava/lang/Runnable;)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public onWindowAnimationEnd(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;->getMJustNotifyEndCallback()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    move-object v0, v1

    .line 29
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v3, "#"

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v3, " onWindowAnimationEnd(), isJustNotifyEndCallback: "

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-string v3, "QuickStep"

    .line 55
    .line 56
    const-string v4, "AbsSwipeUpHandler"

    .line 57
    .line 58
    invoke-static {v3, v4, v2}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 62
    .line 63
    if-eqz v2, :cond_4

    .line 64
    .line 65
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    sget-object v0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 76
    .line 77
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMAnimationId()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-virtual {v0, p1, v2}, Lcom/android/quickstep/utils/MFVAnimManager;->matchAnimationId(II)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 91
    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/animation/AnimationRecord;->releaseIconLayerIfNeeded(I)Z

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppTransitionManager:Lcom/android/launcher3/q5;

    .line 98
    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    invoke-virtual {p1, v1}, Lcom/android/launcher3/q5;->W0(Lcom/android/quickstep/util/animation/AnimationRecord;)V

    .line 102
    .line 103
    .line 104
    :cond_3
    iput-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mAppToHomeAnimRecord:Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 105
    .line 106
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->NEW_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 113
    .line 114
    if-ne p1, v0, :cond_8

    .line 115
    .line 116
    const-string p1, "bottom swipe to switch apps"

    .line 117
    .line 118
    invoke-static {v3, v4, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    if-eqz p1, :cond_5

    .line 132
    .line 133
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    :cond_5
    const-string p1, "com.android.launcher"

    .line 138
    .line 139
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_8

    .line 144
    .line 145
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 146
    .line 147
    if-eqz p1, :cond_7

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    instance-of p1, p1, Lcom/android/launcher3/C2;

    .line 154
    .line 155
    if-nez p1, :cond_6

    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_6
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-static {p1}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    const-string v0, "getLauncher(recentsView.getContext())"

    .line 169
    .line 170
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_7
    :goto_2
    const-string p1, "launcher has destroyed"

    .line 175
    .line 176
    invoke-static {v3, v4, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_8
    :goto_3
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 185
    .line 186
    if-eqz p1, :cond_9

    .line 187
    .line 188
    const/high16 v0, 0x3f800000    # 1.0f

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 191
    .line 192
    .line 193
    :cond_9
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mRemoteTargetHandles:[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;

    .line 194
    .line 195
    const-string v0, "mRemoteTargetHandles"

    .line 196
    .line 197
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 201
    .line 202
    if-eqz p1, :cond_a

    .line 203
    .line 204
    const/4 v0, 0x0

    .line 205
    invoke-virtual {p1, p0, v0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 206
    .line 207
    .line 208
    :cond_a
    return-void
.end method

.method protected overrideDisplacementForTransientTaskbar(F)F
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTransientTaskbar:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    :cond_0
    :goto_0
    move v2, p1

    .line 6
    goto :goto_1

    .line 7
    :cond_1
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarAlreadyOpen:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsTaskbarAllAppsOpen:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarAppWindowThreshold:I

    .line 25
    .line 26
    int-to-float v1, v0

    .line 27
    cmpg-float v1, p1, v1

    .line 28
    .line 29
    if-gez v1, :cond_3

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_3
    iget p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskbarCatchUpThreshold:I

    .line 34
    .line 35
    int-to-float v1, p0

    .line 36
    cmpg-float v1, p1, v1

    .line 37
    .line 38
    if-gez v1, :cond_0

    .line 39
    .line 40
    int-to-float v3, v0

    .line 41
    int-to-float v4, p0

    .line 42
    int-to-float v6, p0

    .line 43
    sget-object v7, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    move v2, p1

    .line 47
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :goto_1
    return v2
.end method

.method public performHapticFeedback()V
    .locals 2

    .line 1
    invoke-static {}, Lx1/d;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "AbsSwipeUpHandler"

    .line 8
    .line 9
    const-string v1, "performHapticFeedback: useAAC"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "launcher_recent"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {}, Lcom/android/launcher3/y0;->n0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mMSDLPlayerWrapper:Lcom/android/launcher3/util/s1;

    .line 33
    .line 34
    sget-object v0, Lw3/e;->v:Lw3/e;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    sget-object v0, Lcom/android/launcher3/util/V2;->e:Lcom/android/launcher3/util/I;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Lcom/android/launcher3/util/V2;

    .line 49
    .line 50
    sget-object v0, Lcom/android/launcher3/util/V2;->i:Landroid/os/VibrationEffect;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/V2;->n(Landroid/os/VibrationEffect;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public playBackGroundAnim()V
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {}, Lx1/O;->m1()Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-eqz v2, :cond_b

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->Y2()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_4

    .line 16
    .line 17
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    sget-object v3, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 24
    .line 25
    invoke-virtual {v3, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/android/launcher3/anim/C;

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iget-boolean v4, v4, Lu2/e;->m:Z

    .line 36
    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    :cond_1
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    instance-of v3, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 56
    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 68
    .line 69
    sget-object v4, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 70
    .line 71
    new-instance v5, LQ1/f;

    .line 72
    .line 73
    invoke-direct {v5}, LQ1/f;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, v3, v4, v5}, Lcom/android/launcher3/N6;->k(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/Y;LQ1/f;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-static {}, Lx1/O;->U2()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_3

    .line 84
    .line 85
    goto/16 :goto_4

    .line 86
    .line 87
    :cond_3
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 88
    .line 89
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 93
    .line 94
    sget-object v4, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 95
    .line 96
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 97
    .line 98
    invoke-virtual {v5}, Lcom/android/quickstep/TaskAnimationManager;->getCurrentCallbacks()Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    const-wide/16 v6, 0x12c

    .line 103
    .line 104
    invoke-virtual {v3, v4, v6, v7, v5}, Lcom/android/quickstep/BaseContainerInterface;->getParallelAnimationToGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iput-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    .line 109
    .line 110
    if-eqz v3, :cond_4

    .line 111
    .line 112
    invoke-static {}, Lx1/O;->N1()Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-eqz v3, :cond_4

    .line 117
    .line 118
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    .line 119
    .line 120
    sget-object v5, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 121
    .line 122
    invoke-virtual {v3, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 123
    .line 124
    .line 125
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mParallelRunningAnim:Landroid/animation/Animator;

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 128
    .line 129
    .line 130
    :cond_4
    invoke-static {}, Lx1/O;->N1()Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    const/4 v5, 0x0

    .line 135
    const/high16 v8, 0x3f800000    # 1.0f

    .line 136
    .line 137
    if-nez v3, :cond_6

    .line 138
    .line 139
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 140
    .line 141
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    instance-of v3, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 146
    .line 147
    if-eqz v3, :cond_a

    .line 148
    .line 149
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 150
    .line 151
    if-eqz v3, :cond_5

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_5
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 155
    .line 156
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Landroid/content/Context;

    .line 161
    .line 162
    :goto_0
    if-eqz v3, :cond_a

    .line 163
    .line 164
    move-object v9, v3

    .line 165
    check-cast v9, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 166
    .line 167
    invoke-interface {v9}, Lcom/android/quickstep/views/RecentsViewContainer;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 168
    .line 169
    .line 170
    move-result-object v10

    .line 171
    if-eqz v10, :cond_a

    .line 172
    .line 173
    invoke-interface {v9}, Lcom/android/quickstep/views/RecentsViewContainer;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 174
    .line 175
    .line 176
    move-result-object v9

    .line 177
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 178
    .line 179
    invoke-virtual {p0, v4}, Lcom/android/quickstep/BaseContainerInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    check-cast p0, Lcom/android/launcher3/V3;

    .line 184
    .line 185
    check-cast v3, Lcom/android/launcher3/C2;

    .line 186
    .line 187
    invoke-virtual {p0, v3}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    invoke-virtual {v9, p0}, Lcom/android/launcher3/views/ScrimView;->setBackgroundBlur(I)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v9, v5}, Landroid/view/View;->setAlpha(F)V

    .line 195
    .line 196
    .line 197
    sget-object p0, Lcom/android/launcher3/G2;->k:Landroid/util/FloatProperty;

    .line 198
    .line 199
    new-array v1, v1, [F

    .line 200
    .line 201
    aput v8, v1, v0

    .line 202
    .line 203
    invoke-static {v9, p0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {v2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 208
    .line 209
    .line 210
    goto :goto_3

    .line 211
    :cond_6
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 212
    .line 213
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    instance-of v3, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 218
    .line 219
    if-eqz v3, :cond_a

    .line 220
    .line 221
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 222
    .line 223
    invoke-virtual {v3}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 224
    .line 225
    .line 226
    move-result-object v3

    .line 227
    check-cast v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 228
    .line 229
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 234
    .line 235
    if-eqz v4, :cond_7

    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_7
    iget-object v4, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 239
    .line 240
    invoke-virtual {v4}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    check-cast v4, Landroid/content/Context;

    .line 245
    .line 246
    :goto_1
    if-eqz v4, :cond_8

    .line 247
    .line 248
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 249
    .line 250
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 255
    .line 256
    if-eqz p0, :cond_8

    .line 257
    .line 258
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 259
    .line 260
    invoke-static {v4}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    if-eqz p0, :cond_8

    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_8
    move v1, v0

    .line 268
    :goto_2
    if-eqz v3, :cond_a

    .line 269
    .line 270
    if-nez v1, :cond_a

    .line 271
    .line 272
    new-instance p0, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;

    .line 273
    .line 274
    invoke-direct {p0, v5, v8}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;-><init>(FF)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p0, v3}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->get(LP1/h;)Ljava/lang/Float;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    invoke-static {v1, v8}, Ljava/lang/Float;->compare(FF)I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-nez v1, :cond_9

    .line 290
    .line 291
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/BaseDepthController$ClampedDepthProperty;->setZoom(Z)V

    .line 292
    .line 293
    .line 294
    :cond_9
    const/4 v0, 0x2

    .line 295
    new-array v0, v0, [F

    .line 296
    .line 297
    fill-array-data v0, :array_0

    .line 298
    .line 299
    .line 300
    invoke-static {v3, p0, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    new-instance v0, Lcom/android/quickstep/AbsSwipeUpHandler$DepthAnimatorListenerAdapter;

    .line 305
    .line 306
    invoke-direct {v0, v3}, Lcom/android/quickstep/AbsSwipeUpHandler$DepthAnimatorListenerAdapter;-><init>(LP1/h;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 310
    .line 311
    .line 312
    :cond_a
    :goto_3
    invoke-virtual {v2, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 313
    .line 314
    .line 315
    sget-object p0, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 316
    .line 317
    invoke-virtual {v2, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 321
    .line 322
    .line 323
    :cond_b
    :goto_4
    return-void

    .line 324
    nop

    .line 325
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected resetLauncherListeners()V
    .locals 4

    .line 1
    const-string v0, "AbsSwipeUpHandler"

    .line 2
    .line 3
    const-string v1, "resetLauncherListeners"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/quickstep/BaseContainerInterface;->setOnDeferredActivityLaunchCallback(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnStartCallback:Ljava/lang/Runnable;

    .line 32
    .line 33
    invoke-interface {v0, v2, v3}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 37
    .line 38
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherOnDestroyCallback:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-interface {v0, v2, v3}, Lcom/android/quickstep/views/RecentsViewContainer;->removeEventCallback(ILjava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 47
    .line 48
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getRootView()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mOnRecentsScrollListener:Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/RecentsView;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, v1}, Lcom/android/quickstep/BaseContainerInterface;->setOnDeferredActivityLaunchCallback(Ljava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public runOnRecentsAnimationAndLauncherBound(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationStartCallbacks:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->flushOnRecentsAnimationAndLauncherBound()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCanSlowSwipeGoHome(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanSlowSwipeGoHome:Z

    .line 2
    .line 3
    return-void
.end method

.method public setGestureEndCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mGestureEndCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setIsLikelyToStartNewTask(Z)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setIsLikelyToStartNewTask(ZZ)V

    return-void
.end method

.method public setMiniWindowWeaken(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final setWrapperVelocity(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mWrapperVelocity:Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public showMiniWindowTipsView()V
    .locals 0

    .line 1
    return-void
.end method

.method protected startNewTask(Ljava/util/function/Consumer;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 4
    iget-boolean v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_5

    .line 5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getNextPageTaskView()Lcom/android/quickstep/views/TaskView;

    move-result-object v0

    :goto_0
    const/4 v2, 0x1

    if-eqz v0, :cond_3

    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getFirstTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v3

    iget-object v3, v3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    if-eqz v3, :cond_3

    .line 7
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskIds()[I

    move-result-object v3

    .line 8
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->newEmptyString()Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    move-result-object v4

    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getTaskContainers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/quickstep/views/TaskContainer;

    .line 10
    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v7

    iget-object v7, v7, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget v7, v7, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 11
    invoke-virtual {v6}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    move-result-object v6

    iget-object v6, v6, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    invoke-virtual {v6}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->getPackageName()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v7, v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 12
    const-string v7, "[id: %d, pkg: %s] | "

    invoke-virtual {v4, v7, v6}, Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;->append(Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;

    goto :goto_1

    .line 13
    :cond_1
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v5, v3}, Lcom/android/quickstep/GestureState;->updateLastStartedTaskIds([I)V

    .line 14
    invoke-static {v3}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    move-result-object v3

    new-instance v5, Lcom/android/quickstep/I;

    invoke-direct {v5, p0}, Lcom/android/quickstep/I;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-interface {v3, v5}, Ljava/util/stream/IntStream;->anyMatch(Ljava/util/function/IntPredicate;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 15
    sget-object v5, Lcom/android/quickstep/util/ActiveGestureLog;->INSTANCE:Lcom/android/quickstep/util/ActiveGestureLog;

    sget-object v6, Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;->EXPECTING_TASK_APPEARED:Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;

    invoke-virtual {v5, v6}, Lcom/android/quickstep/util/ActiveGestureLog;->trackEvent(Lcom/android/quickstep/util/ActiveGestureErrorDetector$GestureEvent;)V

    .line 16
    :cond_2
    invoke-static {v4}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logStartNewTask(Lcom/android/quickstep/util/ActiveGestureLog$CompoundString;)V

    .line 17
    new-instance v4, Lcom/android/quickstep/J;

    invoke-direct {v4, p0, p1, v3}, Lcom/android/quickstep/J;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;Ljava/util/function/Consumer;Z)V

    invoke-virtual {v0, v2, v4}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation(ZLu4/l;)V

    goto :goto_2

    .line 18
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->onLaunchTaskFailed()V

    .line 19
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    const v0, 0x7f140046

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 20
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    if-eqz p1, :cond_4

    .line 21
    new-instance v0, Lcom/android/quickstep/p0;

    invoke-direct {v0, p0}, Lcom/android/quickstep/p0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {p1, v2, v0}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 22
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    new-instance v0, Lcom/android/quickstep/K;

    invoke-direct {v0, p0}, Lcom/android/quickstep/K;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    invoke-virtual {p1, v0}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimDelayed(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 23
    :cond_5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p1, v0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 24
    :goto_3
    iput-boolean v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mCanceled:Z

    return-void
.end method

.method protected switchToScreenshot()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hasTargets()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 8
    .line 9
    sget v0, Lcom/android/quickstep/AbsSwipeUpHandler;->STATE_SCREENSHOT_CAPTURED:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setStateOnUiThread(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object v0, Lf1/a;->J:Lf1/a$a;

    .line 16
    .line 17
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mIsSwipeForSplit:Z

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/android/quickstep/GestureState;->getRunningTaskIds(Z)[I

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    array-length v1, v0

    .line 29
    const/4 v2, 0x0

    .line 30
    move v3, v2

    .line 31
    :goto_0
    if-ge v3, v1, :cond_2

    .line 32
    .line 33
    aget v4, v0, v3

    .line 34
    .line 35
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskSnapshotCache:Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-nez v4, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v1, v2

    .line 53
    :goto_1
    iget-object v3, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 54
    .line 55
    if-eqz v3, :cond_4

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    sget-object v1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 60
    .line 61
    new-instance v2, Lcom/android/quickstep/t;

    .line 62
    .line 63
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/t;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler;[I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateThumbnailMFV()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    :cond_4
    if-nez v2, :cond_5

    .line 75
    .line 76
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setScreenshotCapturedState()V

    .line 77
    .line 78
    .line 79
    :cond_5
    return-void
.end method

.method public updateDisplacement(F)V
    .locals 4

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->ifEdgeEffectFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    iput v1, v0, Lcom/android/launcher3/anim/d;->d:F

    :cond_0
    neg-float p1, p1

    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->overrideDisplacementForTransientTaskbar(F)F

    move-result p1

    .line 5
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentDisplacement:F

    .line 6
    iget v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    int-to-float v2, v0

    iget v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDragLengthFactor:F

    mul-float/2addr v2, v3

    cmpl-float v2, p1, v2

    if-lez v2, :cond_1

    if-lez v0, :cond_1

    goto :goto_1

    .line 7
    :cond_1
    invoke-static {p1, v1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 8
    iget v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mTransitionDragLength:I

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    int-to-float v0, v0

    div-float v1, p1, v0

    :goto_0
    move v3, v1

    .line 9
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    if-eqz p1, :cond_3

    invoke-virtual {p1, v3}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->handleUpdateDisplacementWithShift(F)Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    .line 10
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mCurrentShift:Lcom/android/launcher3/anim/d;

    invoke-virtual {p0, v3}, Lcom/android/launcher3/anim/d;->n(F)V

    return-void
.end method

.method public updateDisplacement(Landroid/graphics/PointF;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final updateRecentsViewScaleProgress(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mLauncherTransitionController:Lcom/android/quickstep/util/AnimatorControllerWithResistance;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->getNormalController()Lcom/android/launcher3/anim/q;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method protected updateSysUiFlags(F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    if-eqz v0, :cond_8

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskView()Lcom/android/quickstep/views/TaskView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getTaskViewNearestToCenterOfScreen()Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    move v3, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getSysUiStatusNavFlags()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    :goto_0
    const v4, 0x3e199998    # 0.14999998f

    .line 29
    .line 30
    .line 31
    cmpl-float p1, p1, v4

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    move p1, v4

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move p1, v2

    .line 39
    :goto_1
    if-eq v1, v0, :cond_2

    .line 40
    .line 41
    move v1, v4

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    iget-object v5, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_3
    move v4, v2

    .line 54
    :cond_4
    :goto_3
    invoke-virtual {v5, v4}, Lcom/android/quickstep/RecentsAnimationController;->setUseLauncherSystemBarFlags(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Lcom/android/quickstep/RecentsAnimationController;->setWillFinishToHome(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 63
    .line 64
    if-nez v1, :cond_5

    .line 65
    .line 66
    goto :goto_5

    .line 67
    :cond_5
    const/4 v1, 0x3

    .line 68
    if-nez p1, :cond_7

    .line 69
    .line 70
    invoke-direct {p0, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isCurrentZVoice(Lcom/android/quickstep/views/TaskView;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_6

    .line 75
    .line 76
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getEndTarget()Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->LAST_TASK:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 83
    .line 84
    if-ne p1, v0, :cond_6

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 88
    .line 89
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 90
    .line 91
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, v1, v3}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_7
    :goto_4
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 100
    .line 101
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 102
    .line 103
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 108
    .line 109
    .line 110
    :cond_8
    :goto_5
    return-void
.end method
