.class public final Lj1/i;
.super Landroid/window/RemoteTransitionStub;
.source "DesktopAppLaunchTransition.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lj1/i$a;,
        Lj1/i$b;
    }
.end annotation


# static fields
.field public static final k:Lj1/i$b;

.field private static final l:[I

.field private static final m:LM2/l$a;

.field private static final n:LM2/l$a;


# instance fields
.field private final g:Lj1/i$a;

.field private final h:I

.field private final i:Ljava/util/concurrent/Executor;

.field private final j:Lj1/d;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lj1/i$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lj1/i$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lj1/i;->k:Lj1/i$b;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x3

    .line 11
    filled-new-array {v0, v1}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lj1/i;->l:[I

    .line 16
    .line 17
    new-instance v1, LM2/l$a;

    .line 18
    .line 19
    sget-object v8, LJ0/h;->m:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    const-string v0, "STANDARD_DECELERATE"

    .line 22
    .line 23
    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/16 v9, 0x14

    .line 27
    .line 28
    const/4 v10, 0x0

    .line 29
    const-wide/16 v2, 0x258

    .line 30
    .line 31
    const/high16 v4, 0x42100000    # 36.0f

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    const v6, 0x3f733333    # 0.95f

    .line 35
    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    invoke-direct/range {v1 .. v10}, LM2/l$a;-><init>(JFFFFLandroid/view/animation/Interpolator;ILkotlin/jvm/internal/j;)V

    .line 39
    .line 40
    .line 41
    sput-object v1, Lj1/i;->m:LM2/l$a;

    .line 42
    .line 43
    new-instance v2, LM2/l$a;

    .line 44
    .line 45
    invoke-static {v8, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/16 v10, 0x14

    .line 49
    .line 50
    const/4 v11, 0x0

    .line 51
    const-wide/16 v3, 0x12c

    .line 52
    .line 53
    const/high16 v5, 0x41400000    # 12.0f

    .line 54
    .line 55
    const/4 v6, 0x0

    .line 56
    const v7, 0x3f7851ec    # 0.97f

    .line 57
    .line 58
    .line 59
    move-object v9, v8

    .line 60
    const/4 v8, 0x0

    .line 61
    invoke-direct/range {v2 .. v11}, LM2/l$a;-><init>(JFFFFLandroid/view/animation/Interpolator;ILkotlin/jvm/internal/j;)V

    .line 62
    .line 63
    .line 64
    sput-object v2, Lj1/i;->n:LM2/l$a;

    .line 65
    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;)V
    .locals 9

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "launchType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mainExecutor"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v7, 0x10

    const/4 v8, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v8}, Lj1/i;-><init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;LI/j;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;LI/j;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lj1/i$a;",
            "I",
            "Ljava/util/concurrent/Executor;",
            "LI/j<",
            "Landroid/view/SurfaceControl$Transaction;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "launchType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mainExecutor"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transactionSupplier"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    invoke-direct {p0}, Landroid/window/RemoteTransitionStub;-><init>()V

    .line 5
    iput-object p2, p0, Lj1/i;->g:Lj1/i$a;

    .line 6
    iput p3, p0, Lj1/i;->h:I

    .line 7
    iput-object p4, p0, Lj1/i;->i:Ljava/util/concurrent/Executor;

    .line 8
    new-instance p4, Lj1/d;

    invoke-direct {p4, p1, p2, p3, p5}, Lj1/d;-><init>(Landroid/content/Context;Lj1/i$a;ILI/j;)V

    iput-object p4, p0, Lj1/i;->j:Lj1/d;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;LI/j;ILkotlin/jvm/internal/j;)V
    .locals 6

    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_0

    .line 2
    new-instance p5, Lj1/e;

    invoke-direct {p5}, Lj1/e;-><init>()V

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 3
    invoke-direct/range {v0 .. v5}, Lj1/i;-><init>(Landroid/content/Context;Lj1/i$a;ILjava/util/concurrent/Executor;LI/j;)V

    return-void
.end method

.method public static synthetic o2()Landroid/view/SurfaceControl$Transaction;
    .locals 1

    .line 1
    invoke-static {}, Lj1/i;->s2()Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic p2(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lj1/i;->y2(Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lj1/i;->z2(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;Landroid/animation/Animator;)Lh4/t;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lj1/i;->x2(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;Landroid/animation/Animator;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final s2()Landroid/view/SurfaceControl$Transaction;
    .locals 1

    .line 1
    new-instance v0, Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static final synthetic t2()[I
    .locals 1

    .line 1
    sget-object v0, Lj1/i;->l:[I

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic u2()LM2/l$a;
    .locals 1

    .line 1
    sget-object v0, Lj1/i;->m:LM2/l$a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic v2()LM2/l$a;
    .locals 1

    .line 1
    sget-object v0, Lj1/i;->n:LM2/l$a;

    .line 2
    .line 3
    return-object v0
.end method

.method private final w2(Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lj1/h;

    .line 7
    .line 8
    invoke-direct {v1, v0, p2}, Lj1/h;-><init>(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lj1/i;->j:Lj1/d;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v1}, Lj1/d;->f(Landroid/window/TransitionInfo;Lu4/l;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 18
    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-interface {p2}, Lcom/android/quickstep/RemoteRunnable;->run()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/animation/Animator;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method private static final x2(Ljava/util/List;Lcom/android/quickstep/RemoteRunnable;Landroid/animation/Animator;)Lh4/t;
    .locals 1

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Lcom/android/quickstep/RemoteRunnable;->run()V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 19
    .line 20
    return-object p0
.end method

.method private static final y2(Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, v0, v0}, Landroid/window/IRemoteTransitionFinishedCallback;->onTransitionFinished(Landroid/window/WindowContainerTransaction;Landroid/view/SurfaceControl$Transaction;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private static final z2(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lj1/i;->w2(Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
    .locals 3

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
    const-string p1, "transaction"

    .line 12
    .line 13
    invoke-static {p3, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "transitionFinishedCallback"

    .line 17
    .line 18
    invoke-static {p4, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lj1/i;->g:Lj1/i$a;

    .line 22
    .line 23
    iget v0, p0, Lj1/i;->h:I

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "startAnimation: launchType="

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p1, ", cujType="

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string v0, "DesktopAppLaunchTransition"

    .line 51
    .line 52
    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    new-instance p1, Lj1/f;

    .line 56
    .line 57
    invoke-direct {p1, p4}, Lj1/f;-><init>(Landroid/window/IRemoteTransitionFinishedCallback;)V

    .line 58
    .line 59
    .line 60
    iget-object p4, p0, Lj1/i;->i:Ljava/util/concurrent/Executor;

    .line 61
    .line 62
    new-instance v0, Lj1/g;

    .line 63
    .line 64
    invoke-direct {v0, p0, p2, p1, p3}, Lj1/g;-><init>(Lj1/i;Landroid/window/TransitionInfo;Lcom/android/quickstep/RemoteRunnable;Landroid/view/SurfaceControl$Transaction;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p4, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method
