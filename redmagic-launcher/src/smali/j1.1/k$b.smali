.class final Lj1/k$b;
.super Landroid/window/RemoteTransitionStub;
.source "DesktopRecentsTransitionController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj1/k;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final g:Lcom/android/quickstep/views/TaskView;

.field private final h:Z

.field private final i:Lcom/android/launcher3/statemanager/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d<",
            "**>;"
        }
    .end annotation
.end field

.field private final j:LP1/h;

.field private final k:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/TaskView;ZLcom/android/launcher3/statemanager/d;LP1/h;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/TaskView;",
            "Z",
            "Lcom/android/launcher3/statemanager/d<",
            "**>;",
            "LP1/h;",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "taskView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "stateManager"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Landroid/window/RemoteTransitionStub;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lj1/k$b;->g:Lcom/android/quickstep/views/TaskView;

    .line 15
    .line 16
    iput-boolean p2, p0, Lj1/k$b;->h:Z

    .line 17
    .line 18
    iput-object p3, p0, Lj1/k$b;->i:Lcom/android/launcher3/statemanager/d;

    .line 19
    .line 20
    iput-object p4, p0, Lj1/k$b;->j:LP1/h;

    .line 21
    .line 22
    iput-object p5, p0, Lj1/k$b;->k:Ljava/util/function/Consumer;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic o2(Ljava/lang/Runnable;Lj1/k$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lj1/k$b;->u2(Ljava/lang/Runnable;Lj1/k$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lj1/k$b;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lj1/k$b;->t2(Lj1/k$b;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lj1/k$b;->s2(Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final r2(Landroid/window/TransitionInfo;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/window/TransitionInfo;->getChanges()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "getChanges(...)"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Landroid/window/TransitionInfo$Change;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getMode()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x3

    .line 31
    if-ne v0, v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getTaskInfo()Landroid/app/ActivityManager$RunningTaskInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/app/ActivityManager$RunningTaskInfo;->isFreeform()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x1

    .line 44
    if-ne v0, v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getStartAbsBounds()Landroid/graphics/Rect;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget v0, v0, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    if-nez v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/window/TransitionInfo$Change;->getEndAbsBounds()Landroid/graphics/Rect;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0}, Landroid/window/TransitionInfo$Change;->setStartAbsBounds(Landroid/graphics/Rect;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method

.method private static final s2(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-interface {p0, v0, v0}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    .line 4
    .line 5
    return-void

    .line 6
    :catch_0
    move-exception p0

    .line 7
    const-string v0, "DesktopRecentsTransitionController"

    .line 8
    .line 9
    const-string v1, "Failed to call finish callback for desktop recents animation"

    .line 10
    .line 11
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final t2(Lj1/k$b;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lj1/k$b;->g:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object v1, p0, Lj1/k$b;->i:Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    iget-object v2, p0, Lj1/k$b;->j:LP1/h;

    .line 6
    .line 7
    new-instance v5, Lj1/n;

    .line 8
    .line 9
    invoke-direct {v5, p3, p0}, Lj1/n;-><init>(Ljava/lang/Runnable;Lj1/k$b;)V

    .line 10
    .line 11
    .line 12
    move-object v3, p1

    .line 13
    move-object v4, p2

    .line 14
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/TaskViewUtils;->composeRecentsDesktopLaunchAnimator(Lcom/android/quickstep/views/TaskView;Lcom/android/launcher3/statemanager/d;LP1/h;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-boolean p0, p0, Lj1/k$b;->h:Z

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const-wide/16 p2, 0x0

    .line 23
    .line 24
    invoke-virtual {p1, p2, p3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private static final u2(Ljava/lang/Runnable;Lj1/k$b;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lj1/k$b;->k:Ljava/util/function/Consumer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 1

    .line 1
    const-string v0, "token"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "info"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "t"

    .line 12
    .line 13
    invoke-static {p3, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "finishCallback"

    .line 17
    .line 18
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Lj1/l;

    .line 22
    .line 23
    invoke-direct {p1, p4}, Lj1/l;-><init>(Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, LG2/c;->e()Z

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    if-eqz p4, :cond_0

    .line 31
    .line 32
    invoke-direct {p0, p2}, Lj1/k$b;->r2(Landroid/window/TransitionInfo;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object p4, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 36
    .line 37
    new-instance v0, Lj1/m;

    .line 38
    .line 39
    invoke-direct {v0, p0, p2, p3, p1}, Lj1/m;-><init>(Lj1/k$b;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p4, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
