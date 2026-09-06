.class public Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;
.super Landroid/content/ContextWrapper;
.source "OtherActivityInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;
    }
.end annotation


# static fields
.field private static final ANGLE_MAX:I = -0xa

.field private static final ANGLE_MIN:I = -0x46

.field private static final DEBUG:Z = false

.field public static final DOWN_EVT:Ljava/lang/String; = "OtherActivityInputConsumer.DOWN"

.field public static final OVERVIEW_MIN_DEGREES:I = 0xf

.field private static final SWIPE_TIMEOUT_MS:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "OtherActivityInputConsumer"

.field private static final UP_EVT:Ljava/lang/String; = "OtherActivityInputConsumer.UP"


# instance fields
.field private mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field private mActivePointerId:I

.field private final mCleanupHandler:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

.field private final mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

.field private final mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private final mDisableHorizontalSwipe:Z

.field private final mDownPos:Landroid/graphics/PointF;

.field private mDownTime:J

.field private mForceFinishRecentsTransitionCallback:Ljava/lang/Runnable;

.field private mGameSpaceHomeSwipeTimeout:Z

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private final mHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

.field private mIfIgnoreOtherActivityGesture:Z

.field private final mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

.field private final mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

.field private final mIsDeferredDownTarget:Z

.field private mIsNotSupportSmallWindowToastShown:Z

.field private mIsRecentsStared:Z

.field private mIsSlideTwiceToastShown:Z

.field private mIsStartMove:Z

.field private final mLastPos:Landroid/graphics/PointF;

.field private mMayTriggerFullScreenToWindow:Z

.field private final mMiniWindowTipsShowingSop:F

.field private final mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

.field private final mMotionPauseMinDisplacement:F

.field private final mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

.field private final mOnCompleteCallback:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;",
            ">;"
        }
    .end annotation
.end field

.field private mPassedMinimumMoveSlop:Z

.field private mPassedPilferInputSlop:Z

.field private mPassedSlopOnThisGesture:Z

.field private mPassedWindowMoveSlop:Z

.field private final mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

.field private final mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

.field private final mSlideTwiceTouchSlop:F

.field private final mSquaredMinimumTouchSlop:F

.field private final mSquaredTouchSlop:F

.field private mStartDisplacement:F

.field private mSwipeTimeout:Z

.field private final mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

.field private final mTouchSlop:F

.field private mTriggerFullScreenToWindow:Z

.field protected mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;ZLjava/util/function/Consumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;ZLcom/android/quickstep/AbsSwipeUpHandler$Factory;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/quickstep/RecentsAnimationDeviceState;",
            "Lcom/android/quickstep/TaskAnimationManager;",
            "Lcom/android/quickstep/GestureState;",
            "Z",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;",
            ">;",
            "Lcom/android/systemui/shared/system/InputMonitorCompat;",
            "Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;",
            "Z",
            "Lcom/android/quickstep/AbsSwipeUpHandler$Factory;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance v0, Lcom/android/quickstep/util/CachedEventDispatcher;

    invoke-direct {v0}, Lcom/android/quickstep/util/CachedEventDispatcher;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    .line 3
    new-instance v0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

    invoke-direct {v0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mCleanupHandler:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

    .line 4
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 5
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    const/4 v0, -0x1

    .line 6
    iput v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    .line 8
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsSlideTwiceToastShown:Z

    .line 9
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsNotSupportSmallWindowToastShown:Z

    .line 10
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMayTriggerFullScreenToWindow:Z

    .line 11
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTriggerFullScreenToWindow:Z

    .line 12
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsRecentsStared:Z

    .line 13
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 14
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getNavBarPosition()Lcom/android/quickstep/util/NavBarPosition;

    move-result-object v1

    iput-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 15
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 16
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 17
    iput-object p10, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 18
    invoke-virtual {p4}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    move-result-object p4

    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 19
    iput-boolean v0, p4, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 20
    iput-boolean v0, p4, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindowSmallOrMini:Z

    .line 21
    new-instance p4, Lcom/android/quickstep/util/MotionPauseDetector;

    .line 22
    invoke-virtual {v1}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    move-result p10

    const/4 v2, 0x1

    if-nez p10, :cond_1

    invoke-virtual {v1}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    move-result p10

    if-eqz p10, :cond_0

    goto :goto_0

    :cond_0
    move p10, v2

    goto :goto_1

    :cond_1
    :goto_0
    move p10, v0

    .line 23
    :goto_1
    invoke-direct {p4, p1, v0, p10, v0}, Lcom/android/quickstep/util/MotionPauseDetector;-><init>(Landroid/content/Context;ZIZ)V

    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 24
    invoke-virtual {p4}, Lcom/android/quickstep/util/MotionPauseDetector;->setMFVSpeedSlowSlop()V

    .line 25
    sget-object p4, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {p4, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p10

    check-cast p10, Lcom/android/quickstep/RotationTouchHelper;

    invoke-virtual {p10}, Lcom/android/quickstep/RotationTouchHelper;->getDisplayRotation()I

    move-result p10

    if-eq p10, v2, :cond_3

    const/4 v1, 0x3

    if-ne p10, v1, :cond_2

    goto :goto_2

    :cond_2
    move p10, v0

    goto :goto_3

    :cond_3
    :goto_2
    move p10, v2

    .line 26
    :goto_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f070853

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseMinDisplacement:F

    .line 27
    iput-object p6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mOnCompleteCallback:Ljava/util/function/Consumer;

    .line 28
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p6

    iput-object p6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 29
    iput-object p7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 30
    iput-object p8, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 31
    invoke-virtual {p3}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    move-result p3

    if-nez p3, :cond_4

    if-eqz p5, :cond_4

    move p5, v2

    goto :goto_4

    :cond_4
    move p5, v0

    .line 32
    :goto_4
    iput-boolean p5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsDeferredDownTarget:Z

    .line 33
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getTouchSlop()F

    move-result p6

    iput p6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTouchSlop:F

    .line 34
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSquaredTouchSlop()F

    move-result p2

    iput p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSquaredTouchSlop:F

    .line 35
    iput-boolean p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    iput-boolean p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    if-eqz p3, :cond_5

    const/4 p7, 0x0

    goto :goto_5

    :cond_5
    neg-float p7, p6

    .line 36
    :goto_5
    iput p7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mStartDisplacement:F

    if-nez p3, :cond_6

    if-eqz p9, :cond_6

    move v0, v2

    .line 37
    :cond_6
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDisableHorizontalSwipe:Z

    .line 38
    invoke-virtual {p4, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/quickstep/RotationTouchHelper;

    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    const/high16 p3, 0x40800000    # 4.0f

    div-float p3, p2, p3

    .line 39
    iput p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSlideTwiceTouchSlop:F

    mul-float p3, p6, p6

    const/high16 p4, 0x40000000    # 2.0f

    div-float/2addr p3, p4

    .line 40
    iput p3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSquaredMinimumTouchSlop:F

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    if-eqz p10, :cond_7

    const p3, 0x7f070839

    goto :goto_6

    :cond_7
    const p3, 0x7f07083a

    :goto_6
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMiniWindowTipsShowingSop:F

    .line 42
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p4, " , "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "OtherActivityInputConsumer"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    new-instance p1, Lcom/android/quickstep/util/VelocityTrackerWrapper;

    invoke-direct {p1}, Lcom/android/quickstep/util/VelocityTrackerWrapper;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->onInteractionGestureFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->lambda$onMotionEvent$0(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    .line 2
    .line 3
    return p0
.end method

.method private cleanupAfterGesture()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/util/CachedEventDispatcher;->clearConsumer()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method private finishTouchTracking(Landroid/view/MotionEvent;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "OtherActivityInputConsumer.UP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x3

    .line 13
    const/4 v2, 0x1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    move v0, v2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v3

    .line 20
    :goto_0
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    .line 21
    .line 22
    if-eqz v1, :cond_6

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 25
    .line 26
    if-eqz v1, :cond_6

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureCancelled()V

    .line 31
    .line 32
    .line 33
    goto/16 :goto_4

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 41
    .line 42
    iget v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 49
    .line 50
    iget v4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    .line 51
    .line 52
    invoke-virtual {v1, v4}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    move v4, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_3

    .line 73
    .line 74
    neg-float v4, v0

    .line 75
    goto :goto_1

    .line 76
    :cond_3
    move v4, v1

    .line 77
    :goto_1
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 78
    .line 79
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->getDisplacement(Landroid/view/MotionEvent;)F

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    iget v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mStartDisplacement:F

    .line 84
    .line 85
    sub-float/2addr v6, v7

    .line 86
    invoke-virtual {v5, v6}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateDisplacement(F)V

    .line 87
    .line 88
    .line 89
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 90
    .line 91
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->ifUpDisplacementLonger(Landroid/view/MotionEvent;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput-boolean p1, v5, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfUpDisplacementLonger:Z

    .line 96
    .line 97
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

    .line 98
    .line 99
    if-eqz p1, :cond_4

    .line 100
    .line 101
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/android/quickstep/util/VelocityTrackerWrapper;->getWrapperVelocity()Landroid/graphics/PointF;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v5, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->setWrapperVelocity(Landroid/graphics/PointF;)V

    .line 108
    .line 109
    .line 110
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 111
    .line 112
    new-instance v5, Landroid/graphics/PointF;

    .line 113
    .line 114
    invoke-direct {v5, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 118
    .line 119
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 120
    .line 121
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 122
    .line 123
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 124
    .line 125
    sub-float/2addr v0, v1

    .line 126
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTouchSlop:F

    .line 131
    .line 132
    cmpl-float v0, v0, v1

    .line 133
    .line 134
    if-lez v0, :cond_5

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_5
    move v2, v3

    .line 138
    :goto_2
    invoke-virtual {p1, v4, v5, v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureEnded(FLandroid/graphics/PointF;Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_4

    .line 142
    :cond_6
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 143
    .line 144
    if-eqz v1, :cond_8

    .line 145
    .line 146
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 147
    .line 148
    if-eqz v1, :cond_8

    .line 149
    .line 150
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-eqz v1, :cond_7

    .line 157
    .line 158
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 159
    .line 160
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mForceFinishRecentsTransitionCallback:Ljava/lang/Runnable;

    .line 161
    .line 162
    invoke-virtual {v1, v3, v0, v2}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 163
    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_7
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 167
    .line 168
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mCleanupHandler:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 171
    .line 172
    .line 173
    :cond_8
    :goto_3
    invoke-virtual {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->onConsumerAboutToBeSwitched()V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->onInteractionGestureFinished()V

    .line 177
    .line 178
    .line 179
    const-string v0, "OtherActivityInputConsumer"

    .line 180
    .line 181
    const-string v1, "finishTouchTracking: post CancelRecentsAnimationRunnable "

    .line 182
    .line 183
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 187
    .line 188
    if-eqz v0, :cond_9

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 194
    .line 195
    invoke-virtual {v0, v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->setMiniWindowWeaken(Z)V

    .line 196
    .line 197
    .line 198
    :cond_9
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 199
    .line 200
    if-nez v0, :cond_a

    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 203
    .line 204
    if-nez v0, :cond_a

    .line 205
    .line 206
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    .line 207
    .line 208
    if-nez v0, :cond_a

    .line 209
    .line 210
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-eqz v0, :cond_a

    .line 219
    .line 220
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    .line 229
    .line 230
    invoke-virtual {v0, p1, v1}, Lcom/android/quickstep/util/InputInjectHelper;->addMotionEvent(Landroid/view/MotionEvent;Z)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-static {p1}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-virtual {p1}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 242
    .line 243
    .line 244
    :cond_a
    :goto_4
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->cleanupAfterGesture()V

    .line 245
    .line 246
    .line 247
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 248
    .line 249
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 250
    .line 251
    .line 252
    return-void
.end method

.method private forceCancelGesture(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    const-string v0, "OtherActivityInputConsumer"

    .line 2
    .line 3
    const-string v1, "forceCancelGesture: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownAndUpEvent()V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x3

    .line 34
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private getDisplacement(Landroid/view/MotionEvent;)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/NavBarPosition;->isRightEdge()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    :goto_0
    sub-float/2addr p1, p0

    .line 18
    return p1

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/util/NavBarPosition;->isLeftEdge()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 28
    .line 29
    iget p0, p0, Landroid/graphics/PointF;->x:F

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    sub-float/2addr p0, p1

    .line 36
    return p0

    .line 37
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 42
    .line 43
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 44
    .line 45
    goto :goto_0
.end method

.method private ifUpDisplacementLonger(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 6
    .line 7
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 8
    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 19
    .line 20
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 21
    .line 22
    sub-float/2addr p1, p0

    .line 23
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    cmpg-float p0, v0, p0

    .line 28
    .line 29
    if-gtz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private synthetic lambda$onMotionEvent$0(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsStartMove:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->forceCancelGesture(Landroid/view/MotionEvent;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 12
    .line 13
    const-string p0, "OtherActivityInputConsumer"

    .line 14
    .line 15
    const-string p1, "mSwipeTimeout Down forceCancelGesture"

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method private notifyGestureStarted(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "Pilfer"

    .line 7
    .line 8
    const-string v1, "pilferPointers"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->setBatchingEnabled(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->onGestureStarted(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private onInteractionGestureFinished()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->removeListener()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->cleanupAfterGesture()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mOnCompleteCallback:Ljava/util/function/Consumer;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private removeListener()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private startTouchTrackingForWindowAnimation(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mHandlerFactory:Lcom/android/quickstep/AbsSwipeUpHandler$Factory;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    invoke-interface {v0, v1, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler$Factory;->newHandler(Lcom/android/quickstep/GestureState;J)Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 10
    .line 11
    new-instance p2, Lcom/android/quickstep/inputconsumers/k;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Lcom/android/quickstep/inputconsumers/k;-><init>(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->setGestureEndCallback(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getMotionPauseListener()Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->setOnMotionPauseListener(Lcom/android/quickstep/util/MotionPauseDetector$OnMotionPauseListener;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    .line 31
    .line 32
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/MotionPauseDetector;->setIsTrackpadGesture(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 42
    .line 43
    const-string p2, "OtherActivityInputConsumer.startTouchTrackingForWindowAnimation"

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->initWhenReady(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logGestureStartSwipeHandler(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/quickstep/TaskAnimationManager;->cancelDelayedFinishRunningRecentsAnim()V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 75
    .line 76
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 77
    .line 78
    invoke-virtual {p1, p2}, Lcom/android/quickstep/TaskAnimationManager;->continueRecentsAnimation(Lcom/android/quickstep/GestureState;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 83
    .line 84
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mCleanupHandler:Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$FinishImmediatelyHandler;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 90
    .line 91
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 97
    .line 98
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 99
    .line 100
    invoke-virtual {p1, p2}, Lcom/android/quickstep/TaskAnimationManager;->notifyRecentsAnimationState(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 104
    .line 105
    if-eqz p1, :cond_1

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getIsReverseGestureAnimationRunning()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_0

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    const/4 p1, 0x0

    .line 115
    goto :goto_1

    .line 116
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 117
    :goto_1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->notifyGestureStarted(Z)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    new-instance p1, Landroid/content/Intent;

    .line 122
    .line 123
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 124
    .line 125
    invoke-virtual {p2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getLaunchIntent()Landroid/content/Intent;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 130
    .line 131
    .line 132
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 133
    .line 134
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getGestureId()I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    const-string v0, "INTENT_EXTRA_LOG_TRACE_ID"

    .line 139
    .line 140
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 148
    .line 149
    invoke-virtual {p2, v0, p1, v1}, Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActiveCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 154
    .line 155
    new-instance p2, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;

    .line 156
    .line 157
    invoke-direct {p2, p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer$1;-><init>(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 161
    .line 162
    .line 163
    return-void
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    return p0
.end method

.method public getDisplayId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public hasStartedTouchTracking()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public interceptMotionEventOrNot(Landroid/view/MotionEvent;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_5

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    const/4 v1, 0x0

    .line 9
    const-wide/16 v2, 0xfa

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v5

    .line 18
    iget-wide v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownTime:J

    .line 19
    .line 20
    sub-long/2addr v5, v7

    .line 21
    cmp-long p1, v5, v2

    .line 22
    .line 23
    if-lez p1, :cond_0

    .line 24
    .line 25
    iput-boolean v4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSwipeTimeout:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSwipeTimeout:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    if-eq p1, v4, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    if-ne p1, v0, :cond_2

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return-void

    .line 42
    :cond_3
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v5

    .line 46
    iget-wide v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownTime:J

    .line 47
    .line 48
    sub-long/2addr v5, v7

    .line 49
    cmp-long p1, v5, v2

    .line 50
    .line 51
    if-lez p1, :cond_4

    .line 52
    .line 53
    move v1, v4

    .line 54
    :cond_4
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGameSpaceHomeSwipeTimeout:Z

    .line 55
    .line 56
    return-void

    .line 57
    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    iput-wide v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownTime:J

    .line 62
    .line 63
    return-void
.end method

.method public isConsumerDetachedFromGesture()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public notifyOrientationSetup()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/RotationTouchHelper;->onStartGesture()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onConsumerAboutToBeSwitched()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->removeListener()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->onConsumerAboutToBeSwitched()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    const-string v1, "OtherActivityInputConsumer"

    if-nez v0, :cond_1

    .line 2
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    invoke-virtual {v0, p1}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/InputInjectHelper;->injectDownImmediately(Landroid/view/MotionEvent;)V

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p0

    if-nez p0, :cond_39

    .line 5
    const-string p0, "onMotionEvent: mVelocityTracker null"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 6
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVTrackerWrapper:Lcom/android/quickstep/util/VelocityTrackerWrapper;

    if-eqz v0, :cond_2

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/VelocityTrackerWrapper;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 8
    :cond_2
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/util/CachedEventDispatcher;->hasConsumer()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 10
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->isLauncherStart()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mNavBarPosition:Lcom/android/quickstep/util/NavBarPosition;

    .line 12
    invoke-virtual {v3}, Lcom/android/quickstep/util/NavBarPosition;->getRotation()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/android/quickstep/AbsSwipeUpHandler;->getRecentsViewDispatcher(F)Ljava/util/function/Consumer;

    move-result-object v2

    .line 13
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/CachedEventDispatcher;->setConsumer(Ljava/util/function/Consumer;)V

    .line 14
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/16 v2, 0xfe

    .line 15
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 16
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/CachedEventDispatcher;->dispatchEvent(Landroid/view/MotionEvent;)V

    .line 17
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 18
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v0

    or-int/lit16 v2, v0, 0x100

    .line 19
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setEdgeFlags(I)V

    .line 20
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v2

    const/4 v3, 0x2

    if-eqz v2, :cond_5

    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    if-eq v2, v3, :cond_4

    .line 22
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/CachedEventDispatcher;->dispatchEvent(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 23
    :cond_4
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->isFourFingerTrackpadGesture()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 24
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/CachedEventDispatcher;->dispatchEvent(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 25
    :cond_5
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRecentsViewDispatcher:Lcom/android/quickstep/util/CachedEventDispatcher;

    invoke-virtual {v2, p1}, Lcom/android/quickstep/util/CachedEventDispatcher;->dispatchEvent(Landroid/view/MotionEvent;)V

    .line 26
    :cond_6
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setEdgeFlags(I)V

    .line 27
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x6

    if-ne v0, v2, :cond_7

    .line 29
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 30
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->clear()V

    .line 31
    :cond_7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->interceptMotionEventOrNot(Landroid/view/MotionEvent;)V

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_34

    if-eq v0, v5, :cond_32

    if-eq v0, v3, :cond_b

    const/4 v3, 0x3

    if-eq v0, v3, :cond_32

    const/4 v1, 0x5

    if-eq v0, v1, :cond_a

    if-eq v0, v2, :cond_8

    goto/16 :goto_15

    .line 33
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 34
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 35
    iget v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    if-ne v1, v2, :cond_38

    if-nez v0, :cond_9

    move v4, v5

    .line 36
    :cond_9
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 37
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    sub-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 38
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->y:F

    sub-float/2addr v3, v5

    sub-float/2addr v2, v3

    .line 39
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 40
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 41
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    goto/16 :goto_15

    .line 42
    :cond_a
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    if-nez v0, :cond_38

    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 44
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    invoke-virtual {v1, p1, v0}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;I)Z

    move-result v0

    if-nez v0, :cond_38

    .line 45
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->forceCancelGesture(Landroid/view/MotionEvent;)V

    goto/16 :goto_15

    .line 46
    :cond_b
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsStartMove:Z

    .line 47
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    move-result-object v0

    .line 48
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    instance-of v3, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    if-eqz v3, :cond_c

    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/X3;->b()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iget-boolean v0, v0, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    if-nez v0, :cond_c

    move v0, v5

    goto :goto_1

    :cond_c
    move v0, v4

    :goto_1
    iput-boolean v0, v2, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 50
    iget v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_d

    .line 51
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v4, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    goto/16 :goto_15

    .line 52
    :cond_d
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {v2, v3, v0}, Landroid/graphics/PointF;->set(FF)V

    .line 53
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->getDisplacement(Landroid/view/MotionEvent;)F

    move-result v0

    .line 54
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    iget v7, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v7

    .line 55
    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v6, v6, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v6

    .line 56
    invoke-static {v3, v2}, Lcom/android/launcher3/N5;->e0(FF)F

    move-result v6

    .line 57
    iget v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSquaredMinimumTouchSlop:F

    cmpl-float v7, v6, v7

    if-ltz v7, :cond_e

    move v7, v5

    goto :goto_2

    :cond_e
    move v7, v4

    :goto_2
    iput-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    .line 58
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_f

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/quickstep/util/InputInjectHelper;->getLandscape()Z

    move-result v7

    if-nez v7, :cond_f

    iget-object v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifSwipeMoveStartRecents()Z

    move-result v7

    if-eqz v7, :cond_11

    :cond_f
    invoke-static {}, Lx1/O;->p3()Z

    move-result v7

    if-nez v7, :cond_11

    .line 59
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsRecentsStared:Z

    if-nez v7, :cond_11

    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    if-eqz v7, :cond_11

    .line 60
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsDeferredDownTarget:Z

    if-nez v7, :cond_10

    iget-object v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v7}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v7

    if-nez v7, :cond_10

    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    if-nez v7, :cond_10

    .line 61
    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v7

    invoke-direct {p0, v7, v8}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->startTouchTrackingForWindowAnimation(J)V

    .line 62
    iget-object v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    invoke-virtual {v7}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    move-result v7

    if-nez v7, :cond_10

    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    if-eqz v7, :cond_10

    .line 63
    iput-boolean v4, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v7

    .line 64
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 65
    :cond_10
    :goto_3
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsRecentsStared:Z

    .line 66
    :cond_11
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    if-nez v7, :cond_12

    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-nez v7, :cond_12

    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSwipeTimeout:Z

    if-eqz v7, :cond_12

    .line 67
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->forceCancelGesture(Landroid/view/MotionEvent;)V

    .line 68
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v4, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 69
    const-string v0, "mSwipeTimeout forceCancelGesture"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_15

    .line 70
    :cond_12
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    if-eqz v7, :cond_15

    .line 71
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v0

    if-eqz v0, :cond_13

    mul-float/2addr v2, v2

    .line 72
    iget v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSlideTwiceTouchSlop:F

    cmpl-float v0, v2, v0

    if-lez v0, :cond_14

    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsSlideTwiceToastShown:Z

    if-nez v0, :cond_14

    .line 73
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->showSlideTwiceMessage()V

    .line 74
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsSlideTwiceToastShown:Z

    goto :goto_4

    .line 75
    :cond_13
    iget v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSlideTwiceTouchSlop:F

    cmpl-float v0, v6, v0

    if-lez v0, :cond_14

    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsSlideTwiceToastShown:Z

    if-nez v0, :cond_14

    .line 76
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->showSlideTwiceMessage()V

    .line 77
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsSlideTwiceToastShown:Z

    .line 78
    :cond_14
    :goto_4
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v4, v5, v1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 79
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v4, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    goto/16 :goto_15

    .line 80
    :cond_15
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v6}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v6

    if-eqz v6, :cond_16

    .line 81
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v4, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    goto/16 :goto_15

    .line 82
    :cond_16
    iget-boolean v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-nez v6, :cond_18

    iget-boolean v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMayTriggerFullScreenToWindow:Z

    if-eqz v6, :cond_18

    iget-boolean v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTriggerFullScreenToWindow:Z

    if-nez v6, :cond_18

    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    if-eqz v6, :cond_18

    instance-of v6, v6, Lcom/android/quickstep/LauncherSwipeHandlerV2;

    if-eqz v6, :cond_18

    neg-float v6, v3

    float-to-double v6, v6

    neg-float v8, v2

    float-to-double v8, v8

    .line 83
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-float v6, v6

    const/high16 v7, -0x3ee00000    # -10.0f

    cmpg-float v7, v6, v7

    if-gez v7, :cond_17

    const/high16 v7, -0x3d740000    # -70.0f

    cmpl-float v7, v6, v7

    if-lez v7, :cond_17

    move v7, v5

    goto :goto_5

    :cond_17
    move v7, v4

    .line 84
    :goto_5
    iput-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTriggerFullScreenToWindow:Z

    .line 85
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "angle "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTriggerFullScreenToWindow:Z

    if-eqz v1, :cond_18

    .line 87
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v5, v1, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 88
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-boolean v6, v6, Lcom/android/quickstep/AbsSwipeUpHandler;->mIfRunningTaskSupportMiniWindow:Z

    iput-boolean v6, v1, Lcom/android/quickstep/BaseContainerInterface;->mIfRunningTaskSupportMiniWindow:Z

    xor-int/2addr v6, v5

    .line 89
    iput-boolean v6, v1, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    .line 90
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    invoke-virtual {v1, v4}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 91
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 92
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {v1, v4}, Lcom/android/quickstep/AbsSwipeUpHandler;->setIsLikelyToStartNewTask(Z)V

    .line 93
    :cond_18
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-nez v1, :cond_1a

    .line 94
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsDeferredDownTarget:Z

    if-nez v1, :cond_1a

    .line 95
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v1

    if-nez v1, :cond_19

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v6, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTouchSlop:F

    cmpl-float v1, v1, v6

    if-lez v1, :cond_1a

    .line 96
    :cond_19
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    .line 97
    iget v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTouchSlop:F

    neg-float v1, v1

    iput v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mStartDisplacement:F

    .line 98
    :cond_1a
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v1

    neg-float v6, v0

    .line 99
    iget-object v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v7

    .line 100
    invoke-static {v3, v2}, Lcom/android/launcher3/N5;->e0(FF)F

    move-result v8

    .line 101
    iget-object v9, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v9}, Lcom/android/quickstep/GestureState;->isInExtendedSlopRegion()Z

    move-result v9

    if-nez v7, :cond_1c

    .line 102
    iget v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSquaredTouchSlop:F

    cmpl-float v7, v8, v7

    if-ltz v7, :cond_1b

    if-nez v9, :cond_1b

    goto :goto_6

    :cond_1b
    move v7, v4

    goto :goto_7

    :cond_1c
    :goto_6
    move v7, v5

    .line 103
    :goto_7
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedSlopOnThisGesture:Z

    if-nez v8, :cond_1d

    if-eqz v7, :cond_1d

    .line 104
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedSlopOnThisGesture:Z

    .line 105
    :cond_1d
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedSlopOnThisGesture:Z

    if-nez v8, :cond_1e

    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    if-eqz v8, :cond_1e

    move v8, v5

    goto :goto_8

    :cond_1e
    move v8, v4

    :goto_8
    div-float v1, v6, v1

    float-to-double v9, v1

    .line 106
    invoke-static {v9, v10}, Ljava/lang/Math;->atan(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v9

    const-wide/high16 v11, 0x402e000000000000L    # 15.0

    cmpg-double v1, v9, v11

    if-gtz v1, :cond_20

    .line 107
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 108
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v1

    if-eqz v1, :cond_1f

    const-wide/high16 v11, -0x3fd2000000000000L    # -15.0

    cmpl-double v1, v9, v11

    if-ltz v1, :cond_20

    :cond_1f
    move v1, v5

    goto :goto_9

    :cond_20
    move v1, v4

    :goto_9
    if-nez v8, :cond_22

    if-eqz v1, :cond_21

    goto :goto_a

    :cond_21
    move v1, v4

    goto :goto_b

    :cond_22
    :goto_a
    move v1, v5

    .line 109
    :goto_b
    iget-boolean v8, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    if-nez v8, :cond_2a

    if-eqz v7, :cond_2a

    .line 110
    iget-boolean v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDisableHorizontalSwipe:Z

    if-eqz v7, :cond_23

    .line 111
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v3, v2

    if-lez v2, :cond_23

    move v2, v5

    goto :goto_c

    :cond_23
    move v2, v4

    :goto_c
    if-eqz v1, :cond_24

    .line 112
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 113
    invoke-virtual {v3}, Lcom/android/quickstep/GestureState;->isThreeFingerTrackpadGesture()Z

    move-result v3

    if-eqz v3, :cond_24

    move v3, v5

    goto :goto_d

    :cond_24
    move v3, v4

    :goto_d
    if-nez v1, :cond_25

    .line 114
    iget-object v7, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 115
    invoke-virtual {v7}, Lcom/android/quickstep/GestureState;->isFourFingerTrackpadGesture()Z

    move-result v7

    if-eqz v7, :cond_25

    move v7, v5

    goto :goto_e

    :cond_25
    move v7, v4

    :goto_e
    if-nez v2, :cond_29

    if-nez v3, :cond_29

    if-eqz v7, :cond_26

    goto :goto_f

    .line 116
    :cond_26
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedPilferInputSlop:Z

    .line 117
    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsDeferredDownTarget:Z

    if-eqz v2, :cond_27

    .line 118
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->startTouchTrackingForWindowAnimation(J)V

    .line 119
    :cond_27
    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-nez v2, :cond_28

    .line 120
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    .line 121
    iget v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTouchSlop:F

    neg-float v2, v2

    iput v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mStartDisplacement:F

    .line 122
    :cond_28
    invoke-direct {p0, v1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->notifyGestureStarted(Z)V

    goto :goto_10

    .line 123
    :cond_29
    :goto_f
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->forceCancelGesture(Landroid/view/MotionEvent;)V

    .line 124
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    iput-boolean v4, v0, Lcom/android/quickstep/BaseContainerInterface;->mNeedOffsetTaskRect:Z

    goto/16 :goto_15

    .line 125
    :cond_2a
    :goto_10
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    if-eqz v2, :cond_38

    .line 126
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedWindowMoveSlop:Z

    if-eqz v3, :cond_2b

    .line 127
    iget v3, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mStartDisplacement:F

    sub-float/2addr v0, v3

    invoke-virtual {v2, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateDisplacement(F)V

    .line 128
    :cond_2b
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isFullyGesturalNavMode()Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 129
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->isTrackpadGesture()Z

    move-result v0

    if-eqz v0, :cond_38

    :cond_2c
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTriggerFullScreenToWindow:Z

    if-nez v0, :cond_38

    .line 130
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    invoke-virtual {v0}, Lcom/android/quickstep/util/MotionPauseDetector;->getMotionDetectInfo()Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;

    move-result-object v0

    iget v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseMinDisplacement:F

    cmpg-float v2, v6, v2

    if-ltz v2, :cond_2d

    move v2, v5

    goto :goto_11

    :cond_2d
    move v2, v4

    :goto_11
    invoke-virtual {v0, v2}, Lcom/android/quickstep/util/MotionPauseDetector$MotionPauseDetectorInfo;->setPassedRecentSlop(Z)V

    .line 131
    iget v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMiniWindowTipsShowingSop:F

    cmpl-float v0, v6, v0

    if-lez v0, :cond_2e

    .line 132
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->showMiniWindowTipsView()V

    .line 133
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    invoke-virtual {v0, v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->updateDisplacement(Landroid/graphics/PointF;)Z

    .line 134
    :cond_2e
    iget v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseMinDisplacement:F

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 135
    invoke-virtual {v2}, Lcom/android/quickstep/AbsSwipeUpHandler;->getThresholdToAllowMotionPause()F

    move-result v2

    .line 136
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    cmpl-float v0, v6, v0

    if-ltz v0, :cond_2f

    move v0, v5

    goto :goto_12

    :cond_2f
    move v0, v4

    .line 137
    :goto_12
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {v2, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->setCanSlowSwipeGoHome(Z)V

    .line 138
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    if-eqz v0, :cond_30

    if-nez v1, :cond_30

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 139
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->ifReachedMaxPausedProgress()Z

    move-result v0

    if-eqz v0, :cond_31

    :cond_30
    move v4, v5

    .line 140
    :cond_31
    invoke-virtual {v2, v4}, Lcom/android/quickstep/util/MotionPauseDetector;->setDisallowPause(Z)V

    .line 141
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMotionPauseDetector:Lcom/android/quickstep/util/MotionPauseDetector;

    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/MotionPauseDetector;->addPosition(Landroid/view/MotionEvent;)V

    .line 142
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInteractionHandler:Lcom/android/quickstep/AbsSwipeUpHandler;

    invoke-virtual {v0, v1}, Lcom/android/quickstep/AbsSwipeUpHandler;->setIsLikelyToStartNewTask(Z)V

    goto/16 :goto_15

    .line 143
    :cond_32
    const-string v0, "onMotionEvent: ACTION_UP"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsStartMove:Z

    .line 145
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v0

    if-eqz v0, :cond_33

    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    if-nez v0, :cond_33

    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGameSpaceHomeSwipeTimeout:Z

    if-nez v0, :cond_33

    .line 146
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v0, v1

    .line 147
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mSlideTwiceTouchSlop:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_38

    .line 148
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/ContextWrapper;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_15

    .line 149
    :cond_33
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    goto/16 :goto_15

    .line 150
    :cond_34
    :try_start_1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    const-string v2, "OtherActivityInputConsumer.DOWN"

    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 151
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mActivePointerId:I

    .line 152
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 153
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mLastPos:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDownPos:Landroid/graphics/PointF;

    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 154
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifIgnoreOtherActivityGesture()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    .line 155
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->mayTriggerFullScreenToWindow(Landroid/view/MotionEvent;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mMayTriggerFullScreenToWindow:Z

    .line 156
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getLandscape()Z

    move-result v0

    if-nez v0, :cond_35

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifSwipeMoveStartRecents()Z

    move-result v0

    if-eqz v0, :cond_36

    goto :goto_13

    :catch_1
    move-exception v0

    goto/16 :goto_14

    :cond_35
    :goto_13
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 157
    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_36

    invoke-static {}, Lx1/O;->p3()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 158
    :cond_36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onMotionEvent: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsDeferredDownTarget:Z

    if-nez v0, :cond_37

    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->ifNeedHomeToGameLauncher()Z

    move-result v0

    if-nez v0, :cond_37

    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIfIgnoreOtherActivityGesture:Z

    if-nez v0, :cond_37

    .line 160
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->startTouchTrackingForWindowAnimation(J)V

    .line 161
    iput-boolean v5, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mIsRecentsStared:Z

    .line 162
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_37

    .line 163
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/quickstep/inputconsumers/j;

    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/inputconsumers/j;-><init>(Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;Landroid/view/MotionEvent;)V

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 164
    :cond_37
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    invoke-virtual {v0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 165
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    invoke-virtual {v0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    move-result v0

    if-nez v0, :cond_38

    .line 166
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mInputEventReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;

    invoke-virtual {v0, v4}, Lcom/android/systemui/shared/system/InputChannelCompat$InputEventReceiver;->setBatchingEnabled(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoSuchMethodError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_15

    .line 167
    :goto_14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 168
    :cond_38
    :goto_15
    invoke-static {}, Lx1/O;->k2()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 169
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/quickstep/util/InputInjectHelper;->getInstance(Landroid/content/Context;)Lcom/android/quickstep/util/InputInjectHelper;

    move-result-object v0

    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mPassedMinimumMoveSlop:Z

    invoke-virtual {v0, p1, p0}, Lcom/android/quickstep/util/InputInjectHelper;->addMotionEvent(Landroid/view/MotionEvent;Z)V

    :cond_39
    return-void
.end method

.method public setForceFinishRecentsTransitionCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/OtherActivityInputConsumer;->mForceFinishRecentsTransitionCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
