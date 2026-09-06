.class Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;
.super Landroid/window/IOnBackInvokedCallback$Stub;
.source "LauncherBackAnimationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/LauncherBackAnimationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnBackInvokedCallbackStub"
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

.field private mHandler:Landroid/os/Handler;

.field private mProgressAnimator:Landroid/window/BackProgressAnimator;

.field private final mProgressInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method private constructor <init>(Landroid/os/Handler;Landroid/window/BackProgressAnimator;Landroid/view/animation/Interpolator;Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Landroid/window/IOnBackInvokedCallback$Stub;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mHandler:Landroid/os/Handler;

    .line 4
    iput-object p2, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 5
    iput-object p3, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressInterpolator:Landroid/view/animation/Interpolator;

    .line 6
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Handler;Landroid/window/BackProgressAnimator;Landroid/view/animation/Interpolator;Lcom/android/quickstep/LauncherBackAnimationController;Lcom/android/quickstep/t1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;-><init>(Landroid/os/Handler;Landroid/window/BackProgressAnimator;Landroid/view/animation/Interpolator;Lcom/android/quickstep/LauncherBackAnimationController;)V

    return-void
.end method

.method private synthetic lambda$onBackCancelled$0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 12
    .line 13
    new-instance v1, Lcom/android/quickstep/m1;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Lcom/android/quickstep/m1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/window/BackProgressAnimator;->onBackCancelled(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic lambda$onBackInvoked$1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, LG2/c;->l()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->q(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Lcom/android/quickstep/LauncherBackAnimationController;->l(Lcom/android/quickstep/LauncherBackAnimationController;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->e(Lcom/android/quickstep/LauncherBackAnimationController;)Landroid/view/RemoteAnimationTarget;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->c(Lcom/android/quickstep/LauncherBackAnimationController;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->q(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/window/BackProgressAnimator;->reset()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private synthetic lambda$onBackProgressed$2(Landroid/window/BackMotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->f(Lcom/android/quickstep/LauncherBackAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->f(Lcom/android/quickstep/LauncherBackAnimationController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/window/BackProgressAnimator;->onBackProgressed(Landroid/window/BackMotionEvent;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic lambda$onBackStarted$3(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/window/BackEvent;->getProgress()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressInterpolator:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p1, p0}, Lcom/android/quickstep/LauncherBackAnimationController;->i(Lcom/android/quickstep/LauncherBackAnimationController;F)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/quickstep/LauncherBackAnimationController;->d(Lcom/android/quickstep/LauncherBackAnimationController;)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p1, p0, p2}, Lcom/android/quickstep/LauncherBackAnimationController;->s(Lcom/android/quickstep/LauncherBackAnimationController;FLandroid/window/BackEvent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic lambda$onBackStarted$4(Landroid/window/BackMotionEvent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mControllerRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/LauncherBackAnimationController;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0, p1}, Lcom/android/quickstep/LauncherBackAnimationController;->m(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackMotionEvent;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/quickstep/LauncherBackAnimationController;->r(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mProgressAnimator:Landroid/window/BackProgressAnimator;

    .line 18
    .line 19
    new-instance v2, Lcom/android/quickstep/r1;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/r1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, p1, v2}, Landroid/window/BackProgressAnimator;->onBackStarted(Landroid/window/BackMotionEvent;Landroid/window/BackProgressAnimator$ProgressCallback;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->lambda$onBackCancelled$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Landroid/window/BackMotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->lambda$onBackProgressed$2(Landroid/window/BackMotionEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->lambda$onBackInvoked$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Landroid/window/BackMotionEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->lambda$onBackStarted$4(Landroid/window/BackMotionEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s2(Lcom/android/quickstep/LauncherBackAnimationController;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/LauncherBackAnimationController;->o(Lcom/android/quickstep/LauncherBackAnimationController;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t2(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->lambda$onBackStarted$3(Lcom/android/quickstep/LauncherBackAnimationController;Landroid/window/BackEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onBackCancelled()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/n1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/n1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onBackInvoked()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/o1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/o1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onBackProgressed(Landroid/window/BackMotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/p1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/p1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Landroid/window/BackMotionEvent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onBackStarted(Landroid/window/BackMotionEvent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/q1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/q1;-><init>(Lcom/android/quickstep/LauncherBackAnimationController$OnBackInvokedCallbackStub;Landroid/window/BackMotionEvent;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setHandoffHandler(Landroid/window/IBackAnimationHandoffHandler;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setTriggerBack(Z)V
    .locals 0

    .line 1
    return-void
.end method
