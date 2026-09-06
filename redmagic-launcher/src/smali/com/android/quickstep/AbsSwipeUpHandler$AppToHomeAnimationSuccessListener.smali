.class public final Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;
.super Lcom/android/launcher3/anim/g;
.source "AbsSwipeUpHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/AbsSwipeUpHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AppToHomeAnimationSuccessListener"
.end annotation


# instance fields
.field final $forceInvisibleRecentsView:Lkotlin/jvm/internal/z;

.field final $homeAnim:Lcom/android/launcher3/anim/q;

.field final $homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

.field final $transformParams:Lcom/android/quickstep/util/TransformParams;

.field final this$0:Lcom/android/quickstep/AbsSwipeUpHandler;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Lkotlin/jvm/internal/z;Lcom/android/quickstep/AbsSwipeUpHandler;Lcom/android/launcher3/anim/q;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$forceInvisibleRecentsView:Lkotlin/jvm/internal/z;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnim:Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$transformParams:Lcom/android/quickstep/util/TransformParams;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->lambda$onAnimationSuccess$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onAnimationSuccess$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->onAnimationSuccess$lambda$1(Lcom/android/quickstep/AbsSwipeUpHandler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static final onAnimationSuccess$lambda$1(Lcom/android/quickstep/AbsSwipeUpHandler;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public onAnimActualEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "createWindowAnimationToHome onAnimActualEnd, #"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "QuickStep"

    .line 23
    .line 24
    const-string v1, "BaseSwipeUpHandler"

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p1, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->onEnd(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$transformParams:Lcom/android/quickstep/util/TransformParams;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->setAsyncAnimStarted(Z)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "createWindowAnimationToHome onAnimationEnd, #"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "QuickStep"

    .line 26
    .line 27
    const-string v1, "BaseSwipeUpHandler"

    .line 28
    .line 29
    invoke-static {v0, v1, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWorkspaceView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 42
    .line 43
    check-cast p1, Lcom/android/launcher3/statemanager/h;

    .line 44
    .line 45
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    check-cast p1, Lcom/android/launcher3/C2;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move-object p1, v1

    .line 54
    :goto_0
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Lcom/android/launcher3/C2;->C4(Lcom/android/launcher3/util/O1;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$transformParams:Lcom/android/quickstep/util/TransformParams;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->setAsyncAnimStarted(Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "createWindowAnimationToHome onAnimationStart, #"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "QuickStep"

    .line 23
    .line 24
    const-string v1, "BaseSwipeUpHandler"

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->onStart()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$forceInvisibleRecentsView:Lkotlin/jvm/internal/z;

    .line 35
    .line 36
    iget-boolean p1, p1, Lkotlin/jvm/internal/z;->g:Z

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 53
    .line 54
    instance-of v0, p1, Lcom/android/launcher3/C2;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    check-cast p1, Lcom/android/launcher3/statemanager/h;

    .line 59
    .line 60
    const-string v0, "null cannot be cast to non-null type com.android.launcher.Launcher"

    .line 61
    .line 62
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnim:Lcom/android/launcher3/anim/q;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "createWindowAnimationToHome onAnimationSuccess, #"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/U;->getAnimationId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "QuickStep"

    .line 23
    .line 24
    const-string v1, "BaseSwipeUpHandler"

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, LM3/a;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$homeAnim:Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    new-instance v0, Lcom/android/quickstep/D0;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/android/quickstep/D0;-><init>(Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-virtual {p1, v0}, Lcom/android/quickstep/AbsSwipeUpHandler;->maybeUpdateRecentsAttachedState(Z)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->onSwipeUpToHomeComplete()V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler$AppToHomeAnimationSuccessListener;->$transformParams:Lcom/android/quickstep/util/TransformParams;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/quickstep/util/TransformParams;->getApplier()Lcom/android/quickstep/util/SurfaceTransactionApplier;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/SurfaceTransactionApplier;->setAsyncAnimStarted(Z)V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method
