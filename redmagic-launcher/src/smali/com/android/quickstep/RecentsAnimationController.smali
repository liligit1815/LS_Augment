.class public Lcom/android/quickstep/RecentsAnimationController;
.super Ljava/lang/Object;
.source "RecentsAnimationController.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "RecentsAnimationController"


# instance fields
.field private final mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

.field private mEndTarget:Lcom/android/quickstep/GestureState$GestureEndTarget;

.field private mFinishRequested:Z

.field private mFinishTargetIsLauncher:Z

.field private mLauncherIsVisibleAtFinish:Z

.field public mNeedCancleRecents:Z

.field private final mOnFinishedListener:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/RecentsAnimationController;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingFinishCallbacks:Lcom/android/launcher3/util/Y1;

.field private mPointerX:F

.field private mPointerY:F

.field private mUseLauncherSysBarFlags:Z


# direct methods
.method public constructor <init>(Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/RecentsAnimationController;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mUseLauncherSysBarFlags:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishRequested:Z

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mPendingFinishCallbacks:Lcom/android/launcher3/util/Y1;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/quickstep/RecentsAnimationController;->mOnFinishedListener:Ljava/util/function/Consumer;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/RecentsAnimationController;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/RecentsAnimationController;->lambda$finishController$2(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/RecentsAnimationController;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationController;->lambda$setWillFinishToHome$4(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationController;->lambda$disableInputConsumer$7()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/RecentsAnimationController;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/RecentsAnimationController;->lambda$detachNavigationBarFromApp$3(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/RecentsAnimationController;[Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/RecentsAnimationController;->lambda$handOffAnimation$1([Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/RecentsAnimationController;ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/RecentsAnimationController;->lambda$setFinishTaskTransaction$5(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/RecentsAnimationController;->lambda$enableInputConsumer$6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Z)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Landroid/view/IWindowManager;->setRecentsAppBehindSystemBars(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "RecentsAnimationController"

    .line 11
    .line 12
    const-string v1, "Unable to reach window manager"

    .line 13
    .line 14
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/RecentsAnimationController;)Lcom/android/launcher3/util/Y1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mPendingFinishCallbacks:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$detachNavigationBarFromApp$3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->detachNavigationBarFromApp(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$disableInputConsumer$7()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->setInputConsumerEnabled(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$enableInputConsumer$6()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->setInputConsumerEnabled(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic lambda$finishController$2(ZZ)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/anim/C;->I(Z)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 6
    .line 7
    new-instance v1, Lcom/android/quickstep/RecentsAnimationController$1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/quickstep/RecentsAnimationController$1;-><init>(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, p2, v1}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->finish(ZZLcom/android/internal/os/IResultReceiver;)V

    .line 13
    .line 14
    .line 15
    const/16 p0, 0xb

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 18
    .line 19
    .line 20
    const/16 p0, 0x9

    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 23
    .line 24
    .line 25
    const/16 p0, 0x42

    .line 26
    .line 27
    invoke-static {p0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic lambda$handOffAnimation$1([Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->handOffAnimation([Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$setFinishTaskTransaction$5(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->setFinishTaskTransaction(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$setWillFinishToHome$4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;->setWillFinishToHome(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public detachNavigationBarFromApp(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/Z2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/Z2;-><init>(Lcom/android/quickstep/RecentsAnimationController;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public disableInputConsumer()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/W2;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/W2;-><init>(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "RecentsAnimationController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tmUseLauncherSysBarFlags="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationController;->mUseLauncherSysBarFlags:Z

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmFinishRequested="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishRequested:Z

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "\tmFinishTargetIsLauncher="

    .line 80
    .line 81
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishTargetIsLauncher:Z

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public enableInputConsumer()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/c3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/c3;-><init>(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public finish(ZLjava/lang/Runnable;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method public finish(ZLjava/lang/Runnable;Z)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;Z)V

    return-void
.end method

.method public finish(ZZLjava/lang/Runnable;Z)V
    .locals 6

    .line 4
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .line 5
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZZLjava/lang/Runnable;ZZ)V

    return-void
.end method

.method public finishAnimationToApp()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v0}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public finishAnimationToHome()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public finishController(ZLjava/lang/Runnable;Z)V
    .locals 6

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move v4, p3

    .line 1
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZZLjava/lang/Runnable;ZZ)V

    return-void
.end method

.method public finishController(ZLjava/lang/Runnable;ZZ)V
    .locals 6

    move v2, p1

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    .line 2
    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZZLjava/lang/Runnable;ZZ)V

    return-void
.end method

.method public finishController(ZZLjava/lang/Runnable;ZZ)V
    .locals 2

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "finishController calling "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " mFinishRequested "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishRequested:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RecentsAnimationController"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mPendingFinishCallbacks:Lcom/android/launcher3/util/Y1;

    invoke-virtual {v0, p3}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    if-nez p5, :cond_0

    .line 5
    iget-boolean p3, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishRequested:Z

    if-eqz p3, :cond_0

    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logFinishRecentsAnimation(Z)V

    const/4 p3, 0x1

    .line 7
    iput-boolean p3, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishRequested:Z

    .line 8
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishTargetIsLauncher:Z

    .line 9
    iput-boolean p2, p0, Lcom/android/quickstep/RecentsAnimationController;->mLauncherIsVisibleAtFinish:Z

    .line 10
    iget-object p2, p0, Lcom/android/quickstep/RecentsAnimationController;->mOnFinishedListener:Ljava/util/function/Consumer;

    invoke-interface {p2, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 11
    new-instance p2, Lcom/android/quickstep/b3;

    invoke-direct {p2, p0, p1, p4}, Lcom/android/quickstep/b3;-><init>(Lcom/android/quickstep/RecentsAnimationController;ZZ)V

    if-eqz p5, :cond_1

    .line 12
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    .line 13
    :cond_1
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getController()Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mController:Lcom/android/systemui/shared/system/RecentsAnimationControllerCompat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFinishTargetIsLauncher()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mFinishTargetIsLauncher:Z

    .line 2
    .line 3
    return p0
.end method

.method public getLauncherIsVisibleAtFinish()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/RecentsAnimationController;->mLauncherIsVisibleAtFinish:Z

    .line 2
    .line 3
    return p0
.end method

.method public handOffAnimation([Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V
    .locals 2

    .line 1
    sget-object v0, Lu2/F;->i:Lu2/F$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lu2/F$b;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/V2;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/V2;-><init>(Lcom/android/quickstep/RecentsAnimationController;[Landroid/view/RemoteAnimationTarget;[Landroid/window/WindowAnimationState;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/Exception;

    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string p1, "RecentsAnimationController"

    .line 26
    .line 27
    const-string p2, "Tried to hand off the animation, but the feature is disabled"

    .line 28
    .line 29
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public removeTaskTarget(Lu2/s;)V
    .locals 0

    .line 1
    return-void
.end method

.method public screenshotTask(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->takeTaskThumbnail(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/RecentsAnimationController;->mEndTarget:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    return-void
.end method

.method public setFinishTaskTransaction(ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/X2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/quickstep/X2;-><init>(Lcom/android/quickstep/RecentsAnimationController;ILandroid/window/PictureInPictureSurfaceTransaction;Landroid/view/SurfaceControl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setUseLauncherSystemBarFlags(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/RecentsAnimationController;->mUseLauncherSysBarFlags:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationController;->mUseLauncherSysBarFlags:Z

    .line 6
    .line 7
    sget-object p0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/a3;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lcom/android/quickstep/a3;-><init>(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public setWillFinishToHome(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/Y2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/Y2;-><init>(Lcom/android/quickstep/RecentsAnimationController;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
