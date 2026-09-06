.class public Lcom/android/quickstep/TaskAnimationManager;
.super Ljava/lang/Object;
.source "TaskAnimationManager.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# static fields
.field private static final DELAYED_FINISH_RECENTS_TIME:I = 0x5dc

.field public static final SHELL_TRANSITIONS_ROTATION:Z

.field private static final TAG:Ljava/lang/String; = "TaskAnimationManager"


# instance fields
.field private mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

.field private mController:Lcom/android/quickstep/RecentsAnimationController;

.field private final mCtx:Landroid/content/Context;

.field private mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private final mDisplayId:I

.field private mFinishRecentsAnim:Ljava/lang/Runnable;

.field private mIfDelayedfinishRecentsAnim:Z

.field private mLastAppearedTaskTargets:[Landroid/view/RemoteAnimationTarget;

.field private mLastGestureState:Lcom/android/quickstep/GestureState;

.field private mLiveTileCleanUpHandler:Ljava/lang/Runnable;

.field private final mLiveTileRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

.field private mRecentsAnimationStartPending:Z

.field private mResetRecentsAnimationReceiveRegistered:Z

.field private final mResetRecentsAnimationReceiver:Landroid/content/BroadcastReceiver;

.field private mShouldIgnoreMotionEvents:Z

.field private mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

.field private mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

.field private mTransitionInfo:Landroid/window/TransitionInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "persist.wm.debug.shell_transit_rotate"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/android/quickstep/TaskAnimationManager;->SHELL_TRANSITIONS_ROTATION:Z

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/RecentsAnimationDeviceState;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mShouldIgnoreMotionEvents:Z

    .line 8
    .line 9
    new-instance v1, Lcom/android/quickstep/TaskAnimationManager$1;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/android/quickstep/TaskAnimationManager$1;-><init>(Lcom/android/quickstep/TaskAnimationManager;)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mIfDelayedfinishRecentsAnim:Z

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;-><init>(Lcom/android/quickstep/TaskAnimationManager;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiveRegistered:Z

    .line 26
    .line 27
    new-instance v0, Lcom/android/quickstep/TaskAnimationManager$5;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/android/quickstep/TaskAnimationManager$5;-><init>(Lcom/android/quickstep/TaskAnimationManager;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiver:Landroid/content/BroadcastReceiver;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 35
    .line 36
    iput-object p2, p0, Lcom/android/quickstep/TaskAnimationManager;->mDeviceState:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 37
    .line 38
    iput p3, p0, Lcom/android/quickstep/TaskAnimationManager;->mDisplayId:I

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p0, v1, v2, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/TaskAnimationManager;->lambda$startRecentsAnimation$0(Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/TaskAnimationManager;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->lambda$finishRunningRecentsAnimDelayed$3(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private cleanUpRecentsAnimation(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logCleanUpRecentsAnimationSkipped()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logCleanUpRecentsAnimation()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileCleanUpHandler:Ljava/lang/Runnable;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileCleanUpHandler:Ljava/lang/Runnable;

    .line 21
    .line 22
    :cond_1
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->unregisterTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 32
    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/quickstep/RemoteAnimationTargets;->release()V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 39
    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeAllListeners()V

    .line 43
    .line 44
    .line 45
    :cond_3
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTransitionInfo:Landroid/window/TransitionInfo;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastAppearedTaskTargets:[Landroid/view/RemoteAnimationTarget;

    .line 56
    .line 57
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;Lcom/android/launcher3/C2;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    int-to-long v1, p1

    .line 12
    const-wide/16 v3, 0x3

    .line 13
    .line 14
    mul-long/2addr v1, v3

    .line 15
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic e(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationCallbacks;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/TaskAnimationManager;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/TaskAnimationManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mDisplayId:I

    .line 2
    .line 3
    return p0
.end method

.method private hasAnyFlag(JJ)Z
    .locals 0

    .line 1
    and-long p0, p1, p3

    .line 2
    .line 3
    const-wide/16 p2, 0x0

    .line 4
    .line 5
    cmp-long p0, p0, p2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/TaskAnimationManager;)[Landroid/view/RemoteAnimationTarget;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastAppearedTaskTargets:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/GestureState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/systemui/shared/system/TaskStackChangeListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/quickstep/TaskAnimationManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic lambda$finishRunningRecentsAnimDelayed$3(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/RecentsAnimationController;->finish(ZLjava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mIfDelayedfinishRecentsAnim:Z

    .line 18
    .line 19
    iput-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 20
    .line 21
    const-string p0, "TaskAnimationManager"

    .line 22
    .line 23
    const-string p1, "Delayed finish recents animation"

    .line 24
    .line 25
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private synthetic lambda$startRecentsAnimation$0(Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of p1, p1, Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->getSystemUiProxy()Lcom/android/quickstep/SystemUiProxy;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 22
    .line 23
    invoke-virtual {p4}, Lcom/android/quickstep/GestureState;->useSyntheticRecentsTransition()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1, p2, p3, v0, v1}, Lcom/android/quickstep/SystemUiProxy;->startRecentsActivity(Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/systemui/shared/system/RecentsAnimationListener;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput-boolean p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 32
    .line 33
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p2, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 44
    .line 45
    invoke-virtual {p4}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-virtual {p1, p2}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Lcom/android/quickstep/fallback/window/RecentsWindowManager;->startRecentsWindow(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->getSystemUiProxy()Lcom/android/quickstep/SystemUiProxy;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p4, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-virtual {p1, p2, p3, p4, v0}, Lcom/android/quickstep/SystemUiProxy;->startRecentsActivity(Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/systemui/shared/system/RecentsAnimationListener;Z)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iput-boolean p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 71
    .line 72
    :goto_0
    const-string p0, "TaskAnimationManager"

    .line 73
    .line 74
    const-string p1, "startRecentsAnimation really"

    .line 75
    .line 76
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/TaskAnimationManager;)Lcom/android/quickstep/RecentsAnimationTargets;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/android/quickstep/TaskAnimationManager;[Landroid/view/RemoteAnimationTarget;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastAppearedTaskTargets:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic p(Lcom/android/quickstep/TaskAnimationManager;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic q(Lcom/android/quickstep/TaskAnimationManager;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mShouldIgnoreMotionEvents:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic r(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationTargets;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic s(Lcom/android/quickstep/TaskAnimationManager;Landroid/window/TransitionInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mTransitionInfo:Landroid/window/TransitionInfo;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic t(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->cleanUpRecentsAnimation(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public cancelDelayedFinishRunningRecentsAnim()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mIfDelayedfinishRecentsAnim:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mIfDelayedfinishRecentsAnim:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public continueRecentsAnimation(Lcom/android/quickstep/GestureState;)Lcom/android/quickstep/RecentsAnimationCallbacks;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logContinueRecentsAnimation()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->removeListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 16
    .line 17
    .line 18
    sget v0, Lcom/android/quickstep/GestureState;->STATE_RECENTS_ANIMATION_INITIALIZED:I

    .line 19
    .line 20
    sget v1, Lcom/android/quickstep/GestureState;->STATE_RECENTS_ANIMATION_STARTED:I

    .line 21
    .line 22
    or-int/2addr v0, v1

    .line 23
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastAppearedTaskTargets:[Landroid/view/RemoteAnimationTarget;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/android/quickstep/GestureState;->updateLastAppearedTaskTargets([Landroid/view/RemoteAnimationTarget;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 32
    .line 33
    return-object p0
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

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
    const-string v1, "TaskAnimationManager:"

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
    const-string v1, "\tmDisplayId="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mDisplayId:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, "\tmRecentsAnimationStartPending="

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v1, "\tmShouldIgnoreUpcomingGestures="

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mShouldIgnoreMotionEvents:Z

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 103
    .line 104
    const/16 v1, 0x9

    .line 105
    .line 106
    if-eqz v0, :cond_1

    .line 107
    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v0, v2, p2}, Lcom/android/quickstep/RecentsAnimationController;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 127
    .line 128
    if-eqz v0, :cond_2

    .line 129
    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v0, v2, p2}, Lcom/android/quickstep/RecentsAnimationCallbacks;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 146
    .line 147
    .line 148
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 149
    .line 150
    if-eqz v0, :cond_3

    .line 151
    .line 152
    new-instance v2, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v0, v2, p2}, Lcom/android/quickstep/RecentsAnimationTargets;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 171
    .line 172
    if-eqz p0, :cond_4

    .line 173
    .line 174
    new-instance v0, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/GestureState;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 190
    .line 191
    .line 192
    :cond_4
    return-void
.end method

.method public enableLiveTileRestartListener()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->getInstance()Lcom/android/systemui/shared/system/TaskStackChangeListeners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileRestartListener:Lcom/android/systemui/shared/system/TaskStackChangeListener;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/TaskStackChangeListeners;->registerTaskStackListener(Lcom/android/systemui/shared/system/TaskStackChangeListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public endLiveTile()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v1, Lf1/a;->J:Lf1/a$a;

    .line 12
    .line 13
    invoke-virtual {v1}, Lf1/a$a;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    if-eqz p0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    return v0

    .line 47
    :cond_2
    new-instance v0, Lcom/android/quickstep/W4;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/android/quickstep/W4;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p0, v1, v0}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/util/HashMap;Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_3
    :goto_0
    return v0
.end method

.method public finishRunningRecentsAnimDelayed(Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mIfDelayedfinishRecentsAnim:Z

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/X4;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/X4;-><init>(Lcom/android/quickstep/TaskAnimationManager;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mFinishRecentsAnim:Ljava/lang/Runnable;

    .line 30
    .line 31
    const-wide/16 v0, 0x5dc

    .line 32
    .line 33
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public finishRunningRecentsAnimation(Z)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    return-void
.end method

.method public finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V
    .locals 1

    .line 2
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;Lcom/android/quickstep/RecentsAnimationController;)V

    return-void
.end method

.method public finishRunningRecentsAnimation(ZZLjava/lang/Runnable;Lcom/android/quickstep/RecentsAnimationController;)V
    .locals 0

    if-eqz p4, :cond_2

    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logFinishRunningRecentsAnimation(Z)V

    if-eqz p2, :cond_0

    const/4 p0, 0x0

    const/4 p2, 0x1

    .line 4
    invoke-virtual {p4, p1, p3, p0, p2}, Lcom/android/quickstep/RecentsAnimationController;->finishController(ZLjava/lang/Runnable;ZZ)V

    return-void

    .line 5
    :cond_0
    sget-object p0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    invoke-virtual {p0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    move-result-object p0

    if-eqz p1, :cond_1

    .line 6
    new-instance p1, Lcom/android/quickstep/V4;

    invoke-direct {p1, p4}, Lcom/android/quickstep/V4;-><init>(Lcom/android/quickstep/RecentsAnimationController;)V

    goto :goto_0

    .line 7
    :cond_1
    new-instance p1, Lcom/android/quickstep/O2;

    invoke-direct {p1, p4}, Lcom/android/quickstep/O2;-><init>(Lcom/android/quickstep/RecentsAnimationController;)V

    .line 8
    :goto_0
    invoke-static {p0, p1}, Lcom/android/launcher3/N5;->R(Landroid/os/Handler;Ljava/lang/Runnable;)V

    :cond_2
    return-void
.end method

.method public getCurrentCallbacks()Lcom/android/quickstep/RecentsAnimationCallbacks;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 2
    .line 3
    return-object p0
.end method

.method getSystemUiProxy()Lcom/android/quickstep/SystemUiProxy;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 10
    .line 11
    return-object p0
.end method

.method public getTaskWindowSpringScrollerController()Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 2
    .line 3
    return-object p0
.end method

.method public isRecentsAnimationRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsAnimationTargets;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method notifyNewGestureStart()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mShouldIgnoreMotionEvents:Z

    .line 4
    .line 5
    return-void
.end method

.method public notifyRecentsAnimationState(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mTargets:Lcom/android/quickstep/RecentsAnimationTargets;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTransitionInfo:Landroid/window/TransitionInfo;

    .line 12
    .line 13
    invoke-interface {p1, v0, v1, p0}, Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;->onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method onLauncherDestroyed()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-void

    .line 11
    :cond_1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logQueuingForceFinishRecentsAnimation()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 15
    .line 16
    new-instance v1, Lcom/android/quickstep/TaskAnimationManager$4;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/android/quickstep/TaskAnimationManager$4;-><init>(Lcom/android/quickstep/TaskAnimationManager;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onSystemUiFlagsChanged(JJ)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x804

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->hasAnyFlag(JJ)Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    invoke-direct {p0, p3, p4, v0, v1}, Lcom/android/quickstep/TaskAnimationManager;->hasAnyFlag(JJ)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq v2, v0, :cond_0

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->endLiveTile()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-static {p1, p2}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isLocked(J)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p3, p4}, Lcom/android/quickstep/util/SystemUiFlagUtils;->isLocked(J)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eq p1, p2, :cond_2

    .line 31
    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/RecentsAnimationController;->getFinishTargetIsLauncher()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p1, 0x0

    .line 47
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_1
    return-void
.end method

.method public registerRecentsAnimationResetReceiver()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiveRegistered:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    .line 6
    .line 7
    const-string v1, "recent_transition_exception"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiver:Landroid/content/BroadcastReceiver;

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiveRegistered:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    const-string v0, "TaskAnimationManager"

    .line 26
    .line 27
    const-string v1, "registerRecentsAnimationResetReceiver error"

    .line 28
    .line 29
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public setLiveTileCleanUpHandler(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLiveTileCleanUpHandler:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method shouldIgnoreMotionEvents()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/TaskAnimationManager;->mShouldIgnoreMotionEvents:Z

    .line 2
    .line 3
    return p0
.end method

.method public startRecentsAnimation(Lcom/android/quickstep/GestureState;Landroid/content/Intent;Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)Lcom/android/quickstep/RecentsAnimationCallbacks;
    .locals 10

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logStartRecentsAnimation()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mDisplayId:I

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "TaskAnimationManager"

    .line 11
    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 15
    .line 16
    iget v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mDisplayId:I

    .line 17
    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getDisplayId()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v3, "Constructor displayId %d does not equal gestureState display id %d"

    .line 35
    .line 36
    invoke-static {v0, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/Exception;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mController:Lcom/android/quickstep/RecentsAnimationController;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    const-string v0, "Recent_Toggle"

    .line 53
    .line 54
    const-string v1, "startRecentsAnimation: mController != null "

    .line 55
    .line 56
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    new-instance v0, Ljava/lang/Exception;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v1, "New recents animation started before old animation completed"

    .line 65
    .line 66
    invoke-static {v2, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    .line 68
    .line 69
    :cond_1
    const/4 v0, 0x0

    .line 70
    const/4 v1, 0x0

    .line 71
    const/4 v3, 0x1

    .line 72
    invoke-virtual {p0, v1, v3, v0}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-direct {p0, v0}, Lcom/android/quickstep/TaskAnimationManager;->cleanUpRecentsAnimation(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 80
    .line 81
    .line 82
    :cond_2
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    iput-object p1, p0, Lcom/android/quickstep/TaskAnimationManager;->mLastGestureState:Lcom/android/quickstep/GestureState;

    .line 87
    .line 88
    new-instance v0, Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->getSystemUiProxy()Lcom/android/quickstep/SystemUiProxy;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-direct {v0, v4}, Lcom/android/quickstep/RecentsAnimationCallbacks;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 98
    .line 99
    new-instance v4, Lcom/android/quickstep/TaskAnimationManager$2;

    .line 100
    .line 101
    invoke-direct {v4, p0, p1, v0}, Lcom/android/quickstep/TaskAnimationManager$2;-><init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/GestureState;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v4}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/android/quickstep/GestureState;->getSwipeUpStartTimeMs()J

    .line 108
    .line 109
    .line 110
    move-result-wide v4

    .line 111
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 117
    .line 118
    invoke-virtual {v0, p3}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->cancelDelayedFinishRunningRecentsAnim()V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 125
    .line 126
    .line 127
    move-result-object v8

    .line 128
    const/4 p3, 0x3

    .line 129
    invoke-virtual {v8, p3}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v8}, Landroid/app/ActivityOptions;->setTransientLaunch()Landroid/app/ActivityOptions;

    .line 133
    .line 134
    .line 135
    const/4 p3, 0x4

    .line 136
    invoke-virtual {v8, p3, v4, v5}, Landroid/app/ActivityOptions;->setSourceInfo(IJ)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v6}, Lcom/android/quickstep/BaseContainerInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/o4;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-eqz v0, :cond_3

    .line 148
    .line 149
    if-eqz p3, :cond_3

    .line 150
    .line 151
    invoke-virtual {p3, v3}, Lcom/android/launcher3/taskbar/o4;->L(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 155
    .line 156
    new-instance v3, Lcom/android/quickstep/TaskAnimationManager$3;

    .line 157
    .line 158
    invoke-direct {v3, p0, p3}, Lcom/android/quickstep/TaskAnimationManager$3;-><init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/launcher3/taskbar/o4;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v3}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 162
    .line 163
    .line 164
    :cond_3
    new-instance p3, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    const-string v0, "startRecentsAnimation intent:"

    .line 170
    .line 171
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    invoke-static {v2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    new-instance v4, Lcom/android/quickstep/T4;

    .line 185
    .line 186
    move-object v5, p0

    .line 187
    move-object v9, p1

    .line 188
    move-object v7, p2

    .line 189
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/T4;-><init>(Lcom/android/quickstep/TaskAnimationManager;Lcom/android/quickstep/BaseContainerInterface;Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/quickstep/GestureState;)V

    .line 190
    .line 191
    .line 192
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    sget-object p1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 197
    .line 198
    iget-object p2, v5, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 199
    .line 200
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    check-cast p1, Lcom/android/launcher3/anim/C;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-virtual {p2}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    if-nez p2, :cond_4

    .line 215
    .line 216
    iget-boolean p2, p1, Lcom/android/launcher3/anim/C;->D:Z

    .line 217
    .line 218
    if-eqz p2, :cond_6

    .line 219
    .line 220
    :cond_4
    iget-object p2, v5, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 221
    .line 222
    invoke-static {p2}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 223
    .line 224
    .line 225
    move-result-object p2

    .line 226
    sget-object p3, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 227
    .line 228
    if-ne p2, p3, :cond_6

    .line 229
    .line 230
    new-instance p2, Lcom/android/quickstep/U4;

    .line 231
    .line 232
    invoke-direct {p2, v4, p0}, Lcom/android/quickstep/U4;-><init>(Ljava/lang/Runnable;Lcom/android/launcher3/C2;)V

    .line 233
    .line 234
    .line 235
    iget-boolean p3, p1, Lcom/android/launcher3/anim/C;->D:Z

    .line 236
    .line 237
    if-eqz p3, :cond_5

    .line 238
    .line 239
    instance-of p3, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 240
    .line 241
    if-eqz p3, :cond_5

    .line 242
    .line 243
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 246
    .line 247
    .line 248
    move-result-object p3

    .line 249
    if-eqz p3, :cond_5

    .line 250
    .line 251
    iput-boolean v1, p1, Lcom/android/launcher3/anim/C;->D:Z

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-virtual {p0, p2}, Lcom/android/launcher3/q5;->U0(Ljava/lang/Runnable;)V

    .line 258
    .line 259
    .line 260
    goto :goto_0

    .line 261
    :cond_5
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 262
    .line 263
    .line 264
    goto :goto_0

    .line 265
    :cond_6
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 266
    .line 267
    .line 268
    :goto_0
    invoke-static {}, Lcom/android/launcher3/y0;->z()Z

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    if-eqz p0, :cond_7

    .line 273
    .line 274
    iget-boolean p0, v5, Lcom/android/quickstep/TaskAnimationManager;->mRecentsAnimationStartPending:Z

    .line 275
    .line 276
    invoke-static {p0}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logSettingRecentsAnimationStartPending(Z)V

    .line 277
    .line 278
    .line 279
    :cond_7
    sget p0, Lcom/android/quickstep/GestureState;->STATE_RECENTS_ANIMATION_INITIALIZED:I

    .line 280
    .line 281
    invoke-virtual {v9, p0}, Lcom/android/quickstep/GestureState;->setState(I)V

    .line 282
    .line 283
    .line 284
    iget-object p0, v5, Lcom/android/quickstep/TaskAnimationManager;->mCallbacks:Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 285
    .line 286
    return-object p0
.end method

.method public unregisterRecentsAnimationResetReceiver()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiveRegistered:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mCtx:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiver:Landroid/content/BroadcastReceiver;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mResetRecentsAnimationReceiveRegistered:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/quickstep/touch/TaskWindowSpringScrollController;->detach(Z)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/android/quickstep/TaskAnimationManager;->mTaskWindowSpringScrollController:Lcom/android/quickstep/touch/TaskWindowSpringScrollController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v0, "TaskAnimationManager"

    .line 29
    .line 30
    const-string v1, "unregisterRecentsAnimationResetReceiver error"

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
