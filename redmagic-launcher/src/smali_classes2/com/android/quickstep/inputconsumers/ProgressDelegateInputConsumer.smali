.class public Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;
.super Ljava/lang/Object;
.source "ProgressDelegateInputConsumer.java"

# interfaces
.implements Lcom/android/quickstep/InputConsumer;
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;
.implements Lcom/android/launcher3/touch/H$d;


# static fields
.field private static final STATE_FLING_FINISHED:I

.field private static final STATE_HANDLER_INVALIDATED:I

.field private static final STATE_NAMES:[Ljava/lang/String;

.field private static final STATE_TARGET_RECEIVED:I

.field private static final SWIPE_DISTANCE_THRESHOLD:F = 0.2f

.field private static final TAG:Ljava/lang/String; = "ProgressDelegateInputConsumer"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDisplaySize:Landroid/graphics/Point;

.field private mDragStarted:Z

.field private mFlingEndsOnHome:Ljava/lang/Boolean;

.field private final mGestureState:Lcom/android/quickstep/GestureState;

.field private final mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

.field private final mProgress:Lcom/android/launcher3/anim/d;

.field private mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

.field private final mStateCallback:Lcom/android/quickstep/MultiStateCallback;

.field private final mSwipeDetector:Lcom/android/launcher3/touch/H;

.field private final mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    sput-object v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_NAMES:[Ljava/lang/String;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const-string v1, "STATE_TARGET_RECEIVED"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->getFlagForIndex(ILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const-string v1, "STATE_HANDLER_INVALIDATED"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->getFlagForIndex(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sput v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    const-string v1, "STATE_FLING_FINISHED"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->getFlagForIndex(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_FLING_FINISHED:I

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/systemui/shared/system/InputMonitorCompat;Lcom/android/launcher3/anim/d;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mDragStarted:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mContext:Landroid/content/Context;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 14
    .line 15
    iput-object p5, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 16
    .line 17
    sget-object p2, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    check-cast p2, Lcom/android/launcher3/util/Z;

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-object p2, p2, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    .line 32
    .line 33
    new-instance p2, Lcom/android/quickstep/MultiStateCallback;

    .line 34
    .line 35
    sget-object p3, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_NAMES:[Ljava/lang/String;

    .line 36
    .line 37
    invoke-direct {p2, p3}, Lcom/android/quickstep/MultiStateCallback;-><init>([Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 41
    .line 42
    sget p3, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 43
    .line 44
    sget p4, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 45
    .line 46
    or-int/2addr p4, p3

    .line 47
    new-instance p5, Lcom/android/quickstep/inputconsumers/m;

    .line 48
    .line 49
    invoke-direct {p5, p0}, Lcom/android/quickstep/inputconsumers/m;-><init>(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, p4, p5}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    sget p4, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_FLING_FINISHED:I

    .line 56
    .line 57
    or-int/2addr p3, p4

    .line 58
    new-instance p4, Lcom/android/quickstep/inputconsumers/n;

    .line 59
    .line 60
    invoke-direct {p4, p0}, Lcom/android/quickstep/inputconsumers/n;-><init>(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p3, p4}, Lcom/android/quickstep/MultiStateCallback;->runOnceAtState(ILjava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    new-instance p2, Lcom/android/launcher3/touch/H;

    .line 67
    .line 68
    sget-object p3, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 69
    .line 70
    invoke-direct {p2, p1, p0, p3}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 71
    .line 72
    .line 73
    iput-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mSwipeDetector:Lcom/android/launcher3/touch/H;

    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->onFlingFinished()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->lambda$onDragEnd$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->endRemoteAnimation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private endRemoteAnimation()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->onDragEnd(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private static getFlagForIndex(ILjava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_NAMES:[Ljava/lang/String;

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

.method private synthetic lambda$onDragEnd$0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_FLING_FINISHED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private onFlingFinished()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mFlingEndsOnHome:Ljava/lang/Boolean;

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
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-virtual {v1, v0, v2, p0}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mContext:Landroid/content/Context;

    .line 24
    .line 25
    const-string v0, "ProgressDelegateInputConsumer"

    .line 26
    .line 27
    invoke-static {p0, v2, v0}, Lcom/android/quickstep/OverviewComponentObserver;->startHomeIntentSafely(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method


# virtual methods
.method public allowInterceptByParent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mDragStarted:Z

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
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

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
    const/16 p0, 0x200

    .line 2
    .line 3
    return p0
.end method

.method public onConsumerAboutToBeSwitched()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 2
    .line 3
    sget v0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_HANDLER_INVALIDATED:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onDrag(F)Z
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mDisplaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    if-lez v0, :cond_0

    .line 4
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    neg-int v0, v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic onDrag(FFLandroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/touch/H$d;->onDrag(FFLandroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic onDrag(FLandroid/view/MotionEvent;)Z
    .locals 0

    .line 2
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/H$d;->onDrag(FLandroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public onDragEnd(F)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mSwipeDetector:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    cmpg-float v0, p1, v3

    .line 13
    .line 14
    if-gez v0, :cond_1

    .line 15
    .line 16
    :goto_0
    move v1, v2

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 19
    .line 20
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 21
    .line 22
    const v4, 0x3e4ccccd    # 0.2f

    .line 23
    .line 24
    .line 25
    cmpl-float v0, v0, v4

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 31
    .line 32
    const/high16 v3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 35
    .line 36
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 37
    .line 38
    sub-float v0, v3, v0

    .line 39
    .line 40
    invoke-static {p1, v0}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 41
    .line 42
    .line 43
    move-result-wide v4

    .line 44
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mFlingEndsOnHome:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mProgress:Lcom/android/launcher3/anim/d;

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {p1}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v1, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Lcom/android/quickstep/inputconsumers/o;

    .line 68
    .line 69
    invoke-direct {p1, p0}, Lcom/android/quickstep/inputconsumers/o;-><init>(Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mDragStarted:Z

    .line 3
    .line 4
    const-string p1, "Pilfer"

    .line 5
    .line 6
    const-string p2, "pilferPointers"

    .line 7
    .line 8
    invoke-static {p1, p2}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mInputMonitorCompat:Lcom/android/systemui/shared/system/InputMonitorCompat;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/systemui/shared/system/InputMonitorCompat;->pilferPointers()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getHomeIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/android/quickstep/GestureState;->getGestureId()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const-string v0, "INTENT_EXTRA_LOG_TRACE_ID"

    .line 29
    .line 30
    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mTaskAnimationManager:Lcom/android/quickstep/TaskAnimationManager;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p1, p0}, Lcom/android/quickstep/TaskAnimationManager;->startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onMotionEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mFlingEndsOnHome:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mSwipeDetector:Lcom/android/launcher3/touch/H;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onRecentsAnimationCanceled(Ljava/util/HashMap;)V
    .locals 0
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
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 3
    .line 4
    return-void
.end method

.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mRecentsAnimationController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->mStateCallback:Lcom/android/quickstep/MultiStateCallback;

    .line 4
    .line 5
    sget p1, Lcom/android/quickstep/inputconsumers/ProgressDelegateInputConsumer;->STATE_TARGET_RECEIVED:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/android/quickstep/MultiStateCallback;->setState(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
