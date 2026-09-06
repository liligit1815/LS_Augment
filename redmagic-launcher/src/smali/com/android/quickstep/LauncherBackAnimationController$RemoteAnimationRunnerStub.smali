.class Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;
.super Landroid/view/IRemoteAnimationRunner$Stub;
.source "LauncherBackAnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/LauncherBackAnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoteAnimationRunnerStub"
.end annotation


# instance fields
.field private mControllerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/LauncherBackAnimationController;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/os/Handler;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Landroid/view/IRemoteAnimationRunner$Stub;-><init>()V

    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/os/Handler;Lcom/android/quickstep/t1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/os/Handler;)V

    return-void
.end method

.method public static synthetic o2([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    if-ge v1, v0, :cond_2

    .line 4
    .line 5
    aget-object v2, p0, v1

    .line 6
    .line 7
    iget v3, v2, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    if-ne v4, v3, :cond_0

    .line 11
    .line 12
    invoke-static {p1, v2}, Lcom/android/quickstep/LauncherBackAnimationController;->j(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/RemoteAnimationTarget;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget v3, v2, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 16
    .line 17
    if-nez v3, :cond_1

    .line 18
    .line 19
    invoke-static {p1, v2}, Lcom/android/quickstep/LauncherBackAnimationController;->k(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/RemoteAnimationTarget;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    invoke-static {p1, p2}, Lcom/android/quickstep/LauncherBackAnimationController;->h(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, LG2/c;->l()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_3

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    invoke-static {p1}, Lcom/android/quickstep/LauncherBackAnimationController;->r(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Lcom/android/quickstep/LauncherBackAnimationController;->g(Lcom/android/quickstep/LauncherBackAnimationController;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_4

    .line 43
    .line 44
    invoke-static {p1}, Lcom/android/quickstep/LauncherBackAnimationController;->q(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public onAnimationCancelled()V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p3, Lcom/android/quickstep/s1;

    .line 13
    .line 14
    invoke-direct {p3, p2, p1, p5}, Lcom/android/quickstep/s1;-><init>([Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/view/IRemoteAnimationFinishedCallback;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController$RemoteAnimationRunnerStub;->mHandler:Landroid/os/Handler;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
