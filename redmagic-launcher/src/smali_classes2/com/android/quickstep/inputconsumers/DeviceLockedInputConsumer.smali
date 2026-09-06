.class public Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;
.super Ljava/lang/Object;
.source "DeviceLockedInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;
.implements Lcom/android/quickstep/util/TransformParams$BuilderProxy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$DeviceLockedReleaseCheck;
    }
.end annotation


# static fields
.field private static final STATE_HANDLER_INVALIDATED:I

.field private static final STATE_NAMES:[Ljava/lang/String;

.field private static final STATE_TARGET_RECEIVED:I


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCancelWhenRecentsStart:Z

.field private final mContext:Landroid/content/Context;

.field private mDismissTask:Z

.field private final mDisplaySize:Landroid/graphics/Point;

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private mHomeLaunched:Z

.field private final mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mMaxTranslationY:F

.field private final mProgress:Lcom/android/launcher3/anim/d;

.field private mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

.field private final mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

.field private final mStateCallback:Lcom/android/quickstep/MultiStateCallback;

.field private final mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

.field private mThresholdCrossed:Z

.field private final mTouchDown:Landroid/graphics/PointF;

.field private final mTouchSlopSquared:F

.field private final mTransformParams:Lcom/android/quickstep/util/TransformParams;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    sput-object v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_NAMES:[Ljava/lang/String;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const-string v1, "STATE_TARGET_RECEIVED"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->getFlagForIndex(ILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const-string v1, "STATE_HANDLER_INVALIDATED"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->getFlagForIndex(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sput v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "DeviceLockedInputConsumer"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/PointF;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchDown:Landroid/graphics/PointF;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/Matrix;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mMatrix:Landroid/graphics/Matrix;

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    new-instance v1, Lcom/android/quickstep/inputconsumers/e;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Lcom/android/quickstep/inputconsumers/e;-><init>(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

    .line 36
    .line 37
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mHomeLaunched:Z

    .line 38
    .line 39
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mCancelWhenRecentsStart:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mDismissTask:Z

    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mContext:Landroid/content/Context;

    .line 44
    .line 45
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 46
    .line 47
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSquaredTouchSlop()F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    iput p2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchSlopSquared:F

    .line 54
    .line 55
    new-instance p2, Lcom/android/quickstep/util/TransformParams;

    .line 56
    .line 57
    invoke-direct {p2}, Lcom/android/quickstep/util/TransformParams;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 61
    .line 62
    iput-object p5, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 63
    .line 64
    sget-object p2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    check-cast p3, Lcom/android/launcher3/util/Z;

    .line 71
    .line 72
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/Z;->v(Landroid/content/Context;)Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p4

    .line 80
    const p5, 0x7f0702aa

    .line 81
    .line 82
    .line 83
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 84
    .line 85
    .line 86
    move-result p4

    .line 87
    int-to-float p4, p4

    .line 88
    iput p4, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mMaxTranslationY:F

    .line 89
    .line 90
    sget-object p4, Lcom/android/quickstep/RotationTouchHelper;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 91
    .line 92
    invoke-virtual {p4, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/android/quickstep/RotationTouchHelper;

    .line 97
    .line 98
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 99
    .line 100
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/android/launcher3/util/Z;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iget-object p1, p1, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 111
    .line 112
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    .line 113
    .line 114
    new-instance p1, Lcom/android/quickstep/MultiStateCallback;

    .line 115
    .line 116
    sget-object p2, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_NAMES:[Ljava/lang/String;

    .line 117
    .line 118
    invoke-direct {p1, p2}, Lcom/android/quickstep/MultiStateCallback;-><init>([Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 122
    .line 123
    sget p2, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 124
    .line 125
    sget p3, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 126
    .line 127
    or-int/2addr p2, p3

    .line 128
    new-instance p3, Lcom/android/quickstep/inputconsumers/f;

    .line 129
    .line 130
    invoke-direct {p3, p0}, Lcom/android/quickstep/inputconsumers/f;-><init>(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, p2, p3}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 141
    .line 142
    return-void
.end method

.method private applyTransform()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget v1, v1, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/TransformParams;->setProgress(F)Lcom/android/quickstep/util/TransformParams;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/TransformParams;->createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/TransformParams;->applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->applyTransform()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->endRemoteAnimation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method private endRemoteAnimation()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mHomeLaunched:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1, v0, v1}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Recent_Toggle"

    .line 16
    .line 17
    const-string v0, "endRemoteAnimation: "

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method static bridge synthetic f(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/GestureState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    return-object p0
.end method

.method private finishRecentsAnimationForShell(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mCancelWhenRecentsStart:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mHomeLaunched:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private finishTouchTracking(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_3

    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const v3, 0x7f070a1f

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    cmpl-float v2, v3, v2

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    const/4 v4, 0x0

    .line 45
    if-lez v2, :cond_1

    .line 46
    .line 47
    cmpg-float p1, p1, v4

    .line 48
    .line 49
    if-gez p1, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v0, v3

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 55
    .line 56
    iget p1, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 57
    .line 58
    const v2, 0x3e99999a    # 0.3f

    .line 59
    .line 60
    .line 61
    cmpl-float p1, p1, v2

    .line 62
    .line 63
    if-ltz p1, :cond_0

    .line 64
    .line 65
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 66
    .line 67
    iget v2, p1, Lcom/android/launcher3/anim/d;->d:F

    .line 68
    .line 69
    invoke-virtual {p1, v2, v4}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-wide/16 v2, 0x64

    .line 74
    .line 75
    invoke-virtual {p1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 76
    .line 77
    .line 78
    sget-object v2, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 81
    .line 82
    .line 83
    new-instance v2, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;

    .line 84
    .line 85
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$1;-><init>(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/android/quickstep/util/TransformParams;->getTargetSet()Lcom/android/quickstep/RemoteAnimationTargets;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    new-instance v2, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$DeviceLockedReleaseCheck;

    .line 100
    .line 101
    invoke-direct {v2, p1, v1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer$DeviceLockedReleaseCheck;-><init>(Landroid/animation/Animator;Lcom/android/quickstep/inputconsumers/g;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v2}, Lcom/android/quickstep/RemoteAnimationTargets;->addReleaseCheck(Lcom/android/quickstep/RemoteAnimationTargets$ReleaseCheck;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 108
    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_3
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 112
    .line 113
    sget v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 116
    .line 117
    .line 118
    :goto_1
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->recycle()V

    .line 121
    .line 122
    .line 123
    iput-object v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 124
    .line 125
    return-void
.end method

.method static bridge synthetic g(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/RecentsAnimationController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    return-object p0
.end method

.method private static getFlagForIndex(ILjava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_NAMES:[Ljava/lang/String;

    .line 2
    .line 3
    aput-object p1, v0, p0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    shl-int p0, p1, p0

    .line 7
    .line 8
    return p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/MultiStateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;)Lcom/android/quickstep/TaskAnimationManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mCancelWhenRecentsStart:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic k(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mDismissTask:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic l(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mHomeLaunched:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->finishRecentsAnimationForShell(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic n()I
    .locals 1

    .line 1
    sget v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 2
    .line 3
    return v0
.end method

.method private startRecentsTransition()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mHomeLaunched:Z

    .line 6
    .line 7
    const-string v0, "Pilfer"

    .line 8
    .line 9
    const-string v1, "pilferPointers"

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/quickstep/GestureState;->getGestureId()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const-string v2, "INTENT_EXTRA_LOG_TRACE_ID"

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 40
    .line 41
    invoke-virtual {v1, v2, v0, p0}, Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

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
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

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
    const/16 p0, 0x10

    .line 2
    .line 3
    return p0
.end method

.method public onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object p3, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 4
    .line 5
    iget p3, p3, Lcom/android/launcher3/anim/d;->d:F

    .line 6
    .line 7
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mMaxTranslationY:F

    .line 8
    .line 9
    mul-float/2addr p3, v0

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p2, v0, p3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mMatrix:Landroid/graphics/Matrix;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onConsumerAboutToBeSwitched()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_6

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    if-eq v2, v3, :cond_5

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    if-eq v2, v3, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    if-eq v2, v0, :cond_5

    .line 31
    .line 32
    const/4 v1, 0x5

    .line 33
    if-eq v2, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-boolean v1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

    .line 37
    .line 38
    if-nez v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v2, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRotationTouchHelper:Lcom/android/quickstep/RotationTouchHelper;

    .line 45
    .line 46
    invoke-virtual {v2, p1, v1}, Lcom/android/quickstep/RotationTouchHelper;->isInSwipeUpTouchRegion(Landroid/view/MotionEvent;I)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mThresholdCrossed:Z

    .line 67
    .line 68
    if-nez p1, :cond_4

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchDown:Landroid/graphics/PointF;

    .line 71
    .line 72
    iget v2, p1, Landroid/graphics/PointF;->x:F

    .line 73
    .line 74
    sub-float/2addr v0, v2

    .line 75
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 76
    .line 77
    sub-float/2addr v1, p1

    .line 78
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->e0(FF)F

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iget v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchSlopSquared:F

    .line 83
    .line 84
    cmpl-float p1, p1, v0

    .line 85
    .line 86
    if-lez p1, :cond_3

    .line 87
    .line 88
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->startRecentsTransition()V

    .line 89
    .line 90
    .line 91
    :cond_3
    :goto_0
    return-void

    .line 92
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchDown:Landroid/graphics/PointF;

    .line 93
    .line 94
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 95
    .line 96
    sub-float/2addr p1, v1

    .line 97
    const/4 v0, 0x0

    .line 98
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    .line 105
    .line 106
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 107
    .line 108
    int-to-float p0, p0

    .line 109
    div-float/2addr p1, p0

    .line 110
    invoke-virtual {v0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_5
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->finishTouchTracking(Landroid/view/MotionEvent;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTouchDown:Landroid/graphics/PointF;

    .line 119
    .line 120
    invoke-virtual {p0, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 1
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
    const-string p1, "DeviceLockedInputConsumer"

    .line 2
    .line 3
    const-string v0, "onRecentsAnimationCanceled: "

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mCancelWhenRecentsStart:Z

    .line 18
    .line 19
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/TransformParams;->setTargetSet(Lcom/android/quickstep/RemoteAnimationTargets;)Lcom/android/quickstep/util/TransformParams;

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->applyTransform()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 12
    .line 13
    sget p2, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 16
    .line 17
    .line 18
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mCancelWhenRecentsStart:Z

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->mDismissTask:Z

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/android/quickstep/inputconsumers/DeviceLockedInputConsumer;->finishRecentsAnimationForShell(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
