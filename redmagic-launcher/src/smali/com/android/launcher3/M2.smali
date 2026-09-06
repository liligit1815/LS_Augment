.class public Lcom/android/launcher3/M2;
.super Lu2/p;
.source "LauncherAnimationRunner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/M2$b;,
        Lcom/android/launcher3/M2$a;
    }
.end annotation


# static fields
.field private static final m:Lcom/android/launcher3/M2$b;


# instance fields
.field private final h:Landroid/os/Handler;

.field private final i:Z

.field private final j:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/M2$b;",
            ">;"
        }
    .end annotation
.end field

.field private k:Lcom/android/launcher3/M2$a;

.field private l:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/H2;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/H2;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/M2;->m:Lcom/android/launcher3/M2$b;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Handler;Lcom/android/launcher3/M2$b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lu2/p;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/M2;->h:Landroid/os/Handler;

    .line 5
    .line 6
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/M2;->j:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    iput-boolean p3, p0, Lcom/android/launcher3/M2;->i:Z

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/M2;->l:Z

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic B2(Lcom/android/launcher3/M2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2;->H2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C2(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p4, p0, p0}, Lcom/android/launcher3/M2$a;->t2(Landroid/animation/AnimatorSet;Landroid/content/Context;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic D2(Lcom/android/launcher3/M2;Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/launcher3/M2;->J2(Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E2(Lcom/android/launcher3/M2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2;->I2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private F2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/M2;->k:Lcom/android/launcher3/M2$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/M2$a;->p2(Lcom/android/launcher3/M2$a;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/M2;->k:Lcom/android/launcher3/M2$a;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private G2()Lcom/android/launcher3/M2$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/M2;->j:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/M2$b;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lcom/android/launcher3/M2;->m:Lcom/android/launcher3/M2$b;

    .line 13
    .line 14
    return-object p0
.end method

.method private synthetic H2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2;->F2()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/M2;->G2()Lcom/android/launcher3/M2$b;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/M2$b;->onAnimationCancelled()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic I2()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/M2;->k:Lcom/android/launcher3/M2$a;

    .line 3
    .line 4
    return-void
.end method

.method private synthetic J2(Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2;->F2()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/M2$a;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/K2;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/K2;-><init>(Lcom/android/launcher3/M2;)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, p1, v2}, Lcom/android/launcher3/M2$a;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;Lcom/android/launcher3/N2;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/android/launcher3/M2;->k:Lcom/android/launcher3/M2$a;

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lcom/android/launcher3/M2$a;->w2(Lu2/s$a;)V

    .line 18
    .line 19
    .line 20
    move-object p1, p0

    .line 21
    invoke-direct {p1}, Lcom/android/launcher3/M2;->G2()Lcom/android/launcher3/M2$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p1, Lcom/android/launcher3/M2;->k:Lcom/android/launcher3/M2$a;

    .line 26
    .line 27
    move-object p2, p5

    .line 28
    move-object p5, p1

    .line 29
    move p1, p3

    .line 30
    move-object p3, p2

    .line 31
    move-object p2, p4

    .line 32
    move-object p4, p6

    .line 33
    invoke-interface/range {p0 .. p5}, Lcom/android/launcher3/M2$b;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public onAnimationCancelled()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/M2;->h:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/I2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/I2;-><init>(Lcom/android/launcher3/M2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r2()Lu2/e;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/M2;->G2()Lcom/android/launcher3/M2$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/M2$b;->getAppTransitionParamForInterrupt()Lu2/e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public s2(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/M2;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/M2;->G2()Lcom/android/launcher3/M2$b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/android/launcher3/M2$b;->handleAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p0, v1

    .line 19
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string p2, "Continue recents result = "

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string p2, "LauncherAnimationRunner"

    .line 37
    .line 38
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    if-nez p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->cleanUpRecentsAnim()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return v1
.end method

.method public t2()Z
    .locals 0

    .line 1
    invoke-static {}, Lx1/O;->T2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public u2(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Ljava/lang/Runnable;Lu2/s$a;)V
    .locals 8

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    const-string v1, "Launcher.remoteAnimationStart"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/M2;->t2()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 p6, 0x0

    .line 15
    :cond_0
    move-object v3, p6

    .line 16
    const-wide/16 v0, 0x3e8

    .line 17
    .line 18
    invoke-static {v0, v1}, Lx1/O;->p4(J)Z

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/android/launcher3/J2;

    .line 22
    .line 23
    move-object v1, p0

    .line 24
    move v4, p1

    .line 25
    move-object v5, p2

    .line 26
    move-object v6, p3

    .line 27
    move-object v7, p4

    .line 28
    move-object v2, p5

    .line 29
    invoke-direct/range {v0 .. v7}, Lcom/android/launcher3/J2;-><init>(Lcom/android/launcher3/M2;Ljava/lang/Runnable;Lu2/s$a;I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;)V

    .line 30
    .line 31
    .line 32
    iget-boolean p0, v1, Lcom/android/launcher3/M2;->i:Z

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    iget-object p0, v1, Lcom/android/launcher3/M2;->h:Landroid/os/Handler;

    .line 37
    .line 38
    invoke-static {p0, v0}, Lcom/android/systemui/shared/recents/utilities/Utilities;->postAtFrontOfQueueAsynchronously(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object p0, v1, Lcom/android/launcher3/M2;->h:Landroid/os/Handler;

    .line 43
    .line 44
    invoke-static {p0, v0}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
