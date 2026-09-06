.class Lcom/android/quickstep/AbsSwipeUpHandler$7;
.super Lcom/android/launcher3/anim/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;->animateToProgressInternal(FFJLandroid/view/animation/Interpolator;Lcom/android/quickstep/GestureState$GestureEndTarget;Landroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

.field final synthetic val$appTransferProxy:Lx1/r;

.field final synthetic val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/RemoteAnimationTarget;Lx1/r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$appTransferProxy:Lx1/r;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lh1/a;->v(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/AbsSwipeUpHandler$7;Landroid/view/RemoteAnimationTarget;Lx1/r;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler$7;->lambda$onAnimationSuccess$2(Landroid/view/RemoteAnimationTarget;Lx1/r;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/AbsSwipeUpHandler$7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler$7;->lambda$onAnimationSuccess$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/AbsSwipeUpHandler$7;Ljava/lang/Runnable;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/AbsSwipeUpHandler$7;->lambda$onAnimationSuccess$4(Ljava/lang/Runnable;Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/AbsSwipeUpHandler$7;Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AbsSwipeUpHandler$7;->lambda$onAnimationSuccess$1(Landroid/view/RemoteAnimationTarget;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$1(Landroid/view/RemoteAnimationTarget;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 18
    .line 19
    iget-object p1, p1, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 20
    .line 21
    iget-object p1, p1, Landroid/app/ActivityManager$RunningTaskInfo;->baseIntent:Landroid/content/Intent;

    .line 22
    .line 23
    const/high16 v1, 0x10a0000

    .line 24
    .line 25
    const v2, 0x10a0001

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1, v2}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$2(Landroid/view/RemoteAnimationTarget;Lx1/r;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mMiniWindowTipsView:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x3

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setCurrentState(I)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Lcom/android/quickstep/C0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/C0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$7;Landroid/view/RemoteAnimationTarget;)V

    .line 21
    .line 22
    .line 23
    const-wide/16 p0, 0x1f4

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {p2, p0}, Lx1/r;->H0(Ljava/util/function/Consumer;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "AbsSwipeUpHandler"

    .line 33
    .line 34
    const-string p1, "App transfer failure"

    .line 35
    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 9
    .line 10
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$4(Ljava/lang/Runnable;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setAppCastResultCallback "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AbsSwipeUpHandler"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mMiniWindowTipsView:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 41
    .line 42
    const/4 p2, 0x4

    .line 43
    invoke-virtual {p1, p2}, Lcom/android/quickstep/views/MiniWindowTipsView;->setCurrentState(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance p2, Lcom/android/quickstep/y0;

    .line 51
    .line 52
    invoke-direct {p2, p0}, Lcom/android/quickstep/y0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$7;)V

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
    return-void

    .line 61
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindow:Z

    .line 10
    .line 11
    iput-boolean v1, v0, Lcom/android/quickstep/BaseContainerInterface;->mFullScreenToWindowSmallOrMini:Z

    .line 12
    .line 13
    iget-object p1, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mGestureState:Lcom/android/quickstep/GestureState;

    .line 14
    .line 15
    sget v0, Lcom/android/quickstep/GestureState;->STATE_END_TARGET_ANIMATION_FINISHED:I

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1, p0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Lcom/android/quickstep/AbsSwipeUpHandler;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/z0;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Lcom/android/quickstep/z0;-><init>(Landroid/view/RemoteAnimationTarget;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$appTransferProxy:Lx1/r;

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-boolean v2, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v2, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-object v2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 38
    .line 39
    iget-object v3, v2, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v3, v3, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 44
    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    new-instance p1, Lcom/android/quickstep/A0;

    .line 48
    .line 49
    invoke-direct {p1, p0, v2, v0}, Lcom/android/quickstep/A0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$7;Landroid/view/RemoteAnimationTarget;Lx1/r;)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-wide/16 v1, 0x7530

    .line 59
    .line 60
    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$appTransferProxy:Lx1/r;

    .line 64
    .line 65
    new-instance v1, Lcom/android/quickstep/B0;

    .line 66
    .line 67
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/B0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$7;Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lx1/r;->H0(Ljava/util/function/Consumer;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$appTransferProxy:Lx1/r;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 76
    .line 77
    iget-object v0, p0, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 78
    .line 79
    iget-object p0, p0, Landroid/view/RemoteAnimationTarget;->windowConfiguration:Landroid/app/WindowConfiguration;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/app/WindowConfiguration;->getRotation()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {p1, v0, p0}, Lx1/r;->I0(Landroid/app/ActivityManager$RunningTaskInfo;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-virtual {p1}, Lcom/android/quickstep/AbsSwipeUpHandler;->hideMiniWindowTipsView()V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 95
    .line 96
    if-eqz p0, :cond_2

    .line 97
    .line 98
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 99
    .line 100
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void

    .line 108
    :cond_3
    :goto_0
    iget-object v0, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$7;->val$runningTaskTarget:Landroid/view/RemoteAnimationTarget;

    .line 111
    .line 112
    iget p0, p0, Landroid/view/RemoteAnimationTarget;->taskId:I

    .line 113
    .line 114
    iget-boolean v2, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowToHome:Z

    .line 115
    .line 116
    const/4 v3, 0x2

    .line 117
    if-nez v2, :cond_5

    .line 118
    .line 119
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mFullScreenToWindowSmallOrMini:Z

    .line 120
    .line 121
    if-eqz p1, :cond_6

    .line 122
    .line 123
    :cond_4
    move v1, v3

    .line 124
    goto :goto_1

    .line 125
    :cond_5
    iget-boolean p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mIsMiniWindowLeft:Z

    .line 126
    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    const/4 v1, 0x1

    .line 130
    :cond_6
    :goto_1
    invoke-static {v0, p0, v1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->startActivityFromRecentsMiniWindowMode(Landroid/content/Context;II)V

    .line 131
    .line 132
    .line 133
    return-void
.end method
