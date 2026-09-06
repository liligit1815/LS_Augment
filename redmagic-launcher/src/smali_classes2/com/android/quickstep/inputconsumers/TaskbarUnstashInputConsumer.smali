.class public Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;
.super Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;
.source "TaskbarUnstashInputConsumer.java"


# static fields
.field private static final HOVER_TASKBAR_UNSTASH_TIMEOUT:I = 0x1f4

.field private static final NUM_MOTION_MOVE_THRESHOLD:I = 0x3

.field private static final sUnstashHandler:Landroid/os/Handler;


# instance fields
.field private mActivePointerId:I

.field private final mBottomEdgeBounds:Landroid/graphics/Rect;

.field private final mBottomScreenEdge:I

.field private mCanPlayTaskbarBgAlphaAnimation:Z

.field private final mDownPos:Landroid/graphics/PointF;

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private mHasPassedTaskbarNavThreshold:Z

.field private mIsStashedTaskbarHovered:Z

.field private final mIsTaskbarAllAppsOpen:Z

.field private final mIsTransientTaskbar:Z

.field private final mLastPos:Landroid/graphics/PointF;

.field private mMotionMoveCount:I

.field private final mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

.field private final mStashedTaskbarBottomEdge:I

.field private final mStashedTaskbarHandleBounds:Landroid/graphics/Rect;

.field private final mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

.field private final mTaskbarNavThreshold:I

.field private final mTaskbarNavThresholdY:I

.field private mTaskbarSlowVelocityYThreshold:F

.field private final mTouchSlop:I

.field private final mTransitionCallback:Lcom/android/launcher3/taskbar/j4$b;

.field private final mUnstashArea:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->sUnstashHandler:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/launcher3/taskbar/I1;Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/GestureState;)V
    .locals 1

    .line 1
    invoke-virtual {p6}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0, p2, p3}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;-><init>(ILcom/android/quickstep/InputConsumer;Lcom/android/systemui/shared/system/InputMonitorCompat;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 14
    .line 15
    new-instance p2, Landroid/graphics/PointF;

    .line 16
    .line 17
    invoke-direct {p2}, Landroid/graphics/PointF;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 21
    .line 22
    const/4 p2, -0x1

    .line 23
    iput p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mActivePointerId:I

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    iput-boolean p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsStashedTaskbarHovered:Z

    .line 27
    .line 28
    new-instance p3, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mStashedTaskbarHandleBounds:Landroid/graphics/Rect;

    .line 34
    .line 35
    new-instance p3, Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomEdgeBounds:Landroid/graphics/Rect;

    .line 41
    .line 42
    const/4 p3, 0x1

    .line 43
    iput-boolean p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mCanPlayTaskbarBgAlphaAnimation:Z

    .line 44
    .line 45
    iput p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mMotionMoveCount:I

    .line 46
    .line 47
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 48
    .line 49
    iput-object p5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 50
    .line 51
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    iput p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTouchSlop:I

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const p3, 0x7f070bc3

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    int-to-float p3, p3

    .line 73
    iput p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mUnstashArea:F

    .line 74
    .line 75
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-static {p2, p3}, Lcom/android/launcher3/taskbar/c4;->c(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 80
    .line 81
    .line 82
    move-result p3

    .line 83
    iput p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarNavThreshold:I

    .line 84
    .line 85
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 86
    .line 87
    .line 88
    move-result-object p5

    .line 89
    iget p5, p5, Lcom/android/launcher3/h0;->U0:I

    .line 90
    .line 91
    sub-int/2addr p5, p3

    .line 92
    iput p5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarNavThresholdY:I

    .line 93
    .line 94
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->f1()Z

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    iput-boolean p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTaskbarAllAppsOpen:Z

    .line 99
    .line 100
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->D(Landroid/content/Context;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTransientTaskbar:Z

    .line 105
    .line 106
    const p3, 0x7f070bb0

    .line 107
    .line 108
    .line 109
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    int-to-float p3, p3

    .line 114
    iput p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarSlowVelocityYThreshold:F

    .line 115
    .line 116
    const p3, 0x7f070bb5

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 120
    .line 121
    .line 122
    move-result p3

    .line 123
    iput p3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomScreenEdge:I

    .line 124
    .line 125
    const p3, 0x7f070bb2

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 129
    .line 130
    .line 131
    move-result p2

    .line 132
    iput p2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mStashedTaskbarBottomEdge:I

    .line 133
    .line 134
    if-eqz p1, :cond_0

    .line 135
    .line 136
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->J0()Lcom/android/launcher3/taskbar/j4$b;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    goto :goto_0

    .line 141
    :cond_0
    const/4 p1, 0x0

    .line 142
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTransitionCallback:Lcom/android/launcher3/taskbar/j4$b;

    .line 143
    .line 144
    iput-object p6, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 145
    .line 146
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->lambda$updateHoveredTaskbarState$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private checkVelocityForTaskbarBackground(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 30
    .line 31
    const/16 v1, 0x3e8

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x2

    .line 41
    if-ne p1, v0, :cond_2

    .line 42
    .line 43
    iget p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mMotionMoveCount:I

    .line 44
    .line 45
    add-int/lit8 p1, p1, 0x1

    .line 46
    .line 47
    iput p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mMotionMoveCount:I

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 56
    .line 57
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 60
    .line 61
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    sub-float/2addr v0, v1

    .line 64
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mCanPlayTaskbarBgAlphaAnimation:Z

    .line 69
    .line 70
    if-eqz v1, :cond_3

    .line 71
    .line 72
    iget v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mMotionMoveCount:I

    .line 73
    .line 74
    const/4 v2, 0x3

    .line 75
    if-lt v1, v2, :cond_3

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    cmpl-float v2, p1, v1

    .line 79
    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    iget v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarSlowVelocityYThreshold:F

    .line 83
    .line 84
    cmpl-float p1, p1, v2

    .line 85
    .line 86
    if-ltz p1, :cond_3

    .line 87
    .line 88
    cmpl-float p1, v0, v1

    .line 89
    .line 90
    if-eqz p1, :cond_3

    .line 91
    .line 92
    iget p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTouchSlop:I

    .line 93
    .line 94
    int-to-float p1, p1

    .line 95
    cmpl-float p1, v0, p1

    .line 96
    .line 97
    if-lez p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->d2()V

    .line 102
    .line 103
    .line 104
    const/4 p1, 0x0

    .line 105
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mCanPlayTaskbarBgAlphaAnimation:Z

    .line 106
    .line 107
    :cond_3
    return-void
.end method

.method private cleanupAfterMotionEvent()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTransitionCallback:Lcom/android/launcher3/taskbar/j4$b;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/j4$b;->b()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mHasPassedTaskbarNavThreshold:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mCanPlayTaskbarBgAlphaAnimation:Z

    .line 29
    .line 30
    iput v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mMotionMoveCount:I

    .line 31
    .line 32
    return-void
.end method

.method private isMouseEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0x2002

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private isStashedTaskbarHovered(II)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->g1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->f1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mStashedTaskbarHandleBounds:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget v2, v0, Lcom/android/launcher3/h0;->T0:I

    .line 33
    .line 34
    iget v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mUnstashArea:F

    .line 35
    .line 36
    float-to-int v4, v3

    .line 37
    sub-int v4, v2, v4

    .line 38
    .line 39
    div-int/lit8 v4, v4, 0x2

    .line 40
    .line 41
    iget v5, v0, Lcom/android/launcher3/h0;->U0:I

    .line 42
    .line 43
    iget v0, v0, Lcom/android/launcher3/h0;->s3:I

    .line 44
    .line 45
    sub-int v0, v5, v0

    .line 46
    .line 47
    int-to-float v2, v2

    .line 48
    sub-float/2addr v2, v3

    .line 49
    const/high16 v6, 0x40000000    # 2.0f

    .line 50
    .line 51
    div-float/2addr v2, v6

    .line 52
    add-float/2addr v2, v3

    .line 53
    float-to-int v2, v2

    .line 54
    invoke-virtual {v1, v4, v0, v2, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mStashedTaskbarHandleBounds:Landroid/graphics/Rect;

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 65
    return p0
.end method

.method private synthetic lambda$updateHoveredTaskbarState$0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/I1;->Y1(Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsStashedTaskbarHovered:Z

    .line 8
    .line 9
    return-void
.end method

.method private startStashedTaskbarHover(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/I1;->v2(Z)V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsStashedTaskbarHovered:Z

    .line 7
    .line 8
    return-void
.end method

.method private updateHoveredTaskbarState(II)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomEdgeBounds:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget v2, v0, Lcom/android/launcher3/h0;->T0:I

    .line 10
    .line 11
    iget v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mUnstashArea:F

    .line 12
    .line 13
    float-to-int v4, v3

    .line 14
    sub-int v4, v2, v4

    .line 15
    .line 16
    div-int/lit8 v4, v4, 0x2

    .line 17
    .line 18
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 19
    .line 20
    iget v5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mStashedTaskbarBottomEdge:I

    .line 21
    .line 22
    sub-int v5, v0, v5

    .line 23
    .line 24
    int-to-float v2, v2

    .line 25
    sub-float/2addr v2, v3

    .line 26
    const/high16 v6, 0x40000000    # 2.0f

    .line 27
    .line 28
    div-float/2addr v2, v6

    .line 29
    add-float/2addr v2, v3

    .line 30
    float-to-int v2, v2

    .line 31
    invoke-virtual {v1, v4, v5, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomEdgeBounds:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    sget-object p1, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->sUnstashHandler:Landroid/os/Handler;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/os/Handler;->hasMessagesOrCallbacks()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_0

    .line 49
    .line 50
    new-instance p2, Lcom/android/quickstep/inputconsumers/q;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Lcom/android/quickstep/inputconsumers/q;-><init>(Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v0, 0x1f4

    .line 56
    .line 57
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void

    .line 61
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->isStashedTaskbarHovered(II)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/4 p2, 0x0

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    sget-object p1, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->sUnstashHandler:Landroid/os/Handler;

    .line 69
    .line 70
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    const/4 p1, 0x0

    .line 74
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->startStashedTaskbarHover(Z)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    sget-object p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->sUnstashHandler:Landroid/os/Handler;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private updateUnhoveredTaskbarState(II)V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->sUnstashHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomEdgeBounds:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget v2, v0, Lcom/android/launcher3/h0;->U0:I

    .line 16
    .line 17
    iget v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomScreenEdge:I

    .line 18
    .line 19
    sub-int v3, v2, v3

    .line 20
    .line 21
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    invoke-virtual {v1, v4, v3, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->isStashedTaskbarHovered(II)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->startStashedTaskbarHover(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mBottomEdgeBounds:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 47
    .line 48
    invoke-virtual {p0, v4}, Lcom/android/launcher3/taskbar/I1;->Y1(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->allowInterceptByParent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mHasPassedTaskbarNavThreshold:Z

    .line 8
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

.method protected getDelegatorName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "TaskbarUnstashInputConsumer"

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/quickstep/InputConsumer;->getType()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    or-int/lit16 p0, p0, 0x5000

    .line 8
    .line 9
    return p0
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->g1()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsStashedTaskbarHovered:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    float-to-int v0, v0

    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    float-to-int p1, p1

    .line 32
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->updateHoveredTaskbarState(II)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    float-to-int v0, v0

    .line 41
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    float-to-int p1, p1

    .line 46
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->updateUnhoveredTaskbarState(II)V

    .line 47
    .line 48
    .line 49
    :cond_2
    :goto_0
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTransientTaskbar:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->checkVelocityForTaskbarBackground(Landroid/view/MotionEvent;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mState:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_c

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->isMouseEvent(Landroid/view/MotionEvent;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    float-to-int v0, v0

    .line 31
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    float-to-int v3, v3

    .line 36
    invoke-direct {p0, v0, v3}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->isStashedTaskbarHovered(II)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    move v0, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v0, v2

    .line 45
    :goto_0
    invoke-static {p1}, Lcom/android/launcher3/H4;->b(Landroid/view/MotionEvent;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_b

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_a

    .line 62
    .line 63
    if-eq v3, v1, :cond_9

    .line 64
    .line 65
    const/4 v4, 0x2

    .line 66
    if-eq v3, v4, :cond_5

    .line 67
    .line 68
    const/4 v4, 0x3

    .line 69
    if-eq v3, v4, :cond_9

    .line 70
    .line 71
    const/4 v4, 0x6

    .line 72
    if-eq v3, v4, :cond_3

    .line 73
    .line 74
    const/16 v1, 0xc

    .line 75
    .line 76
    if-eq v3, v1, :cond_2

    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_2
    if-eqz v0, :cond_b

    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mOverviewCommandHelper:Lcom/android/quickstep/OverviewCommandHelper;

    .line 83
    .line 84
    sget-object v2, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->HOME:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 87
    .line 88
    .line 89
    goto/16 :goto_2

    .line 90
    .line 91
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    iget v5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mActivePointerId:I

    .line 100
    .line 101
    if-ne v4, v5, :cond_b

    .line 102
    .line 103
    if-nez v3, :cond_4

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    move v1, v2

    .line 107
    :goto_1
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 108
    .line 109
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 114
    .line 115
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 116
    .line 117
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 118
    .line 119
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 120
    .line 121
    sub-float/2addr v4, v5

    .line 122
    sub-float/2addr v3, v4

    .line 123
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    iget-object v5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 128
    .line 129
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 130
    .line 131
    iget-object v6, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 132
    .line 133
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 134
    .line 135
    sub-float/2addr v5, v6

    .line 136
    sub-float/2addr v4, v5

    .line 137
    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 138
    .line 139
    .line 140
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    iput v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mActivePointerId:I

    .line 158
    .line 159
    goto/16 :goto_2

    .line 160
    .line 161
    :cond_5
    iget v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mActivePointerId:I

    .line 162
    .line 163
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    const/4 v4, -0x1

    .line 168
    if-ne v3, v4, :cond_6

    .line 169
    .line 170
    goto/16 :goto_2

    .line 171
    .line 172
    :cond_6
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 173
    .line 174
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    .line 175
    .line 176
    .line 177
    move-result v5

    .line 178
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    invoke-virtual {v4, v5, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 183
    .line 184
    .line 185
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 186
    .line 187
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 188
    .line 189
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 190
    .line 191
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 192
    .line 193
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 194
    .line 195
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 196
    .line 197
    sub-float/2addr v3, v4

    .line 198
    iget-boolean v4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTransientTaskbar:Z

    .line 199
    .line 200
    if-eqz v4, :cond_b

    .line 201
    .line 202
    const/4 v4, 0x0

    .line 203
    cmpg-float v4, v3, v4

    .line 204
    .line 205
    if-gez v4, :cond_7

    .line 206
    .line 207
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    iget v6, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarNavThreshold:I

    .line 212
    .line 213
    int-to-float v6, v6

    .line 214
    cmpl-float v5, v5, v6

    .line 215
    .line 216
    if-ltz v5, :cond_7

    .line 217
    .line 218
    move v2, v1

    .line 219
    :cond_7
    iget-boolean v5, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mHasPassedTaskbarNavThreshold:Z

    .line 220
    .line 221
    if-nez v5, :cond_8

    .line 222
    .line 223
    if-eqz v2, :cond_8

    .line 224
    .line 225
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/android/quickstep/GestureState;->isInExtendedSlopRegion()Z

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    if-nez v2, :cond_8

    .line 232
    .line 233
    iput-boolean v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mHasPassedTaskbarNavThreshold:Z

    .line 234
    .line 235
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 236
    .line 237
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/I1;->Y1(Z)V

    .line 238
    .line 239
    .line 240
    :cond_8
    if-gez v4, :cond_b

    .line 241
    .line 242
    neg-float v1, v3

    .line 243
    iget v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarNavThresholdY:I

    .line 244
    .line 245
    invoke-static {v1, v2}, Lcom/android/launcher3/touch/B;->a(FI)I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    neg-int v1, v1

    .line 250
    int-to-float v1, v1

    .line 251
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTransitionCallback:Lcom/android/launcher3/taskbar/j4$b;

    .line 252
    .line 253
    if-eqz v2, :cond_b

    .line 254
    .line 255
    iget-boolean v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTaskbarAllAppsOpen:Z

    .line 256
    .line 257
    if-nez v3, :cond_b

    .line 258
    .line 259
    invoke-virtual {v2, v1}, Lcom/android/launcher3/taskbar/j4$b;->c(F)V

    .line 260
    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_9
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->cleanupAfterMotionEvent()V

    .line 264
    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_a
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    iput v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mActivePointerId:I

    .line 272
    .line 273
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 274
    .line 275
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 280
    .line 281
    .line 282
    move-result v5

    .line 283
    invoke-virtual {v3, v4, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 284
    .line 285
    .line 286
    iget-object v3, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mLastPos:Landroid/graphics/PointF;

    .line 287
    .line 288
    iget-object v4, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mDownPos:Landroid/graphics/PointF;

    .line 289
    .line 290
    invoke-virtual {v3, v4}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 291
    .line 292
    .line 293
    iput-boolean v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mHasPassedTaskbarNavThreshold:Z

    .line 294
    .line 295
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTaskbarActivityContext:Lcom/android/launcher3/taskbar/I1;

    .line 296
    .line 297
    const/4 v3, 0x4

    .line 298
    invoke-virtual {v2, v3, v1}, Lcom/android/launcher3/taskbar/I1;->g2(IZ)V

    .line 299
    .line 300
    .line 301
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mTransitionCallback:Lcom/android/launcher3/taskbar/j4$b;

    .line 302
    .line 303
    if-eqz v1, :cond_b

    .line 304
    .line 305
    iget-boolean v2, p0, Lcom/android/quickstep/inputconsumers/TaskbarUnstashInputConsumer;->mIsTaskbarAllAppsOpen:Z

    .line 306
    .line 307
    if-nez v2, :cond_b

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/j4$b;->a()V

    .line 310
    .line 311
    .line 312
    :cond_b
    :goto_2
    if-nez v0, :cond_c

    .line 313
    .line 314
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DelegateInputConsumer;->mDelegate:Lcom/android/quickstep/InputConsumer;

    .line 315
    .line 316
    invoke-interface {p0, p1}, Lcom/android/quickstep/InputConsumer;->onMotionEvent(Landroid/view/MotionEvent;)V

    .line 317
    .line 318
    .line 319
    :cond_c
    return-void
.end method
