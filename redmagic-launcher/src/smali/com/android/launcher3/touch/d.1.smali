.class public abstract Lcom/android/launcher3/touch/d;
.super Ljava/lang/Object;
.source "AbstractStateChangeTouchController.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;
.implements Lcom/android/launcher3/touch/H$d;


# static fields
.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "ASCTouchController"


# instance fields
.field private mAllAppsOvershootStarted:Z

.field private mCanBlockFling:Z

.field protected final mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

.field protected mCurrentAnimation:Lcom/android/launcher3/anim/q;

.field protected final mDetector:Lcom/android/launcher3/touch/H;

.field private mDisplacementShift:F

.field private final mFlingBlockCheck:Lcom/android/launcher3/util/s0;

.field protected mFromState:Lcom/android/launcher3/V3;

.field protected mGoingBetweenStates:Z

.field private mIsLogContainerSet:Z

.field protected mIsTrackpadReverseScroll:Z

.field protected final mLauncher:Lcom/android/launcher3/C2;

.field private mNoIntercept:Z

.field protected mProgressMultiplier:F

.field protected mStartContainerType:I

.field private mStartProgress:F

.field protected mStartState:Lcom/android/launcher3/V3;

.field protected final mSwipeDirection:Lcom/android/launcher3/touch/H$c;

.field protected mToState:Lcom/android/launcher3/V3;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/touch/a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/touch/a;-><init>(Lcom/android/launcher3/touch/d;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Lcom/android/launcher3/G2;->f(Ljava/lang/Runnable;Z)Landroid/animation/Animator$AnimatorListener;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/util/s0;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/launcher3/util/s0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/android/launcher3/touch/d;->mGoingBetweenStates:Z

    .line 25
    .line 26
    iput-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    new-instance v0, Lcom/android/launcher3/touch/H;

    .line 29
    .line 30
    invoke-direct {v0, p1, p0, p2}, Lcom/android/launcher3/touch/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/touch/H$d;Lcom/android/launcher3/touch/H$c;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 34
    .line 35
    iput-object p2, p0, Lcom/android/launcher3/touch/d;->mSwipeDirection:Lcom/android/launcher3/touch/H$c;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/touch/d;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/d;->lambda$goToTargetState$1(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/touch/d;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/d;->lambda$onDragEnd$0(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private cancelAnimationControllers()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 3
    .line 4
    return-void
.end method

.method private getContainerInfo(Lcom/android/launcher3/V3;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;
    .locals 1

    .line 1
    iget-boolean p1, p1, Lcom/android/launcher3/V3;->c:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;->getDefaultInstance()Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setTaskSwitcherContainer(Lcom/android/launcher3/logger/LauncherAtom$TaskSwitcherContainer;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {v0, p0}, Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;->setPageIndex(I)Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setWorkspace(Lcom/android/launcher3/logger/LauncherAtom$WorkspaceContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 55
    .line 56
    return-object p0
.end method

.method private getSwipeDirection()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/touch/d;->getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eq v2, v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v3

    .line 23
    :goto_0
    invoke-virtual {p0, v0, v3}, Lcom/android/launcher3/touch/d;->getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eq p0, v0, :cond_1

    .line 28
    .line 29
    or-int/lit8 p0, v1, 0x2

    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    return v1
.end method

.method private synthetic lambda$goToTargetState$1(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/d;->logReachedState(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onDragEnd$0(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private logReachedState(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    iget v1, v1, Lcom/android/launcher3/V3;->b:I

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withSrcState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v1, p1, Lcom/android/launcher3/V3;->b:I

    .line 25
    .line 26
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withDstState(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/d;->getContainerInfo(Lcom/android/launcher3/V3;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 39
    .line 40
    iget v1, v1, Lcom/android/launcher3/V3;->b:I

    .line 41
    .line 42
    iget p1, p1, Lcom/android/launcher3/V3;->b:I

    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 45
    .line 46
    iget v2, v2, Lcom/android/launcher3/V3;->a:I

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 49
    .line 50
    iget p0, p0, Lcom/android/launcher3/V3;->a:I

    .line 51
    .line 52
    if-le v2, p0, :cond_1

    .line 53
    .line 54
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->h0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->i0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 58
    .line 59
    :goto_0
    invoke-static {v1, p1, p0}, Lcom/android/launcher3/logging/StatsLogManager;->getLauncherAtomEvent(IILcom/android/launcher3/logging/StatsLogManager$d;)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private reinitCurrentAnimation(ZZ)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    move-object v0, p1

    .line 16
    check-cast v0, Lcom/android/launcher3/V3;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    :cond_1
    :goto_0
    invoke-virtual {p0, v0, p2}, Lcom/android/launcher3/touch/d;->getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->onReinitToState(Lcom/android/launcher3/V3;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    if-ne v0, p2, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 35
    .line 36
    if-eq p1, v1, :cond_3

    .line 37
    .line 38
    :cond_2
    if-ne v0, p1, :cond_4

    .line 39
    .line 40
    if-eqz p2, :cond_4

    .line 41
    .line 42
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 43
    .line 44
    if-eqz p2, :cond_4

    .line 45
    .line 46
    :cond_3
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "reinitCurrentAnimation: newFromState "

    .line 54
    .line 55
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, "  newToState "

    .line 62
    .line 63
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v1, "  mFromState "

    .line 70
    .line 71
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 75
    .line 76
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, " mToState "

    .line 80
    .line 81
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 85
    .line 86
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const-string v1, "ASCTouchController"

    .line 94
    .line 95
    invoke-static {v1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 99
    .line 100
    iput-object p1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    iput p1, p0, Lcom/android/launcher3/touch/d;->mStartProgress:F

    .line 104
    .line 105
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 106
    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 114
    .line 115
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 116
    .line 117
    .line 118
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->initCurrentAnimation()F

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    .line 123
    .line 124
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 125
    .line 126
    if-eqz p0, :cond_6

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 129
    .line 130
    .line 131
    :cond_6
    const/4 p0, 0x1

    .line 132
    return p0
.end method


# virtual methods
.method protected abstract canInterceptTouch(Landroid/view/MotionEvent;)Z
.end method

.method protected clearState()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/touch/d;->cancelAnimationControllers()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/touch/d;->mGoingBetweenStates:Z

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->c()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1, v1}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 16
    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    .line 19
    .line 20
    return-void
.end method

.method protected getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;
    .locals 0

    .line 1
    new-instance p0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {p0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method protected getShiftRange()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->E1()Lcom/android/launcher3/allapps/G;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/G;->n()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method protected abstract getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
.end method

.method protected goToTargetState(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/android/launcher3/touch/c;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/touch/c;-><init>(Lcom/android/launcher3/touch/d;Lcom/android/launcher3/V3;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, p1, v2, v1}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/touch/d;->logReachedState(Lcom/android/launcher3/V3;)V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/android/launcher3/LauncherRootView;->getSysUiScrim()Ln1/x;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ln1/x;->e()Lcom/android/launcher3/anim/d;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/high16 p1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-wide/16 v0, 0x0

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method protected abstract initCurrentAnimation()F
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "ASCTouchController"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_c

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->getLastTouchController()Lcom/android/launcher3/util/G2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/views/BaseDragLayer;->getLastTouchController()Lcom/android/launcher3/util/G2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Lcom/android/launcher3/util/G2;->clearLastStatus()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {v0, v3}, Lcom/android/launcher3/views/BaseDragLayer;->setLastTouchController(Lcom/android/launcher3/util/G2;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->canInterceptTouch(Landroid/view/MotionEvent;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v3, 0x1

    .line 50
    xor-int/2addr v0, v3

    .line 51
    iput-boolean v0, p0, Lcom/android/launcher3/touch/d;->mNoIntercept:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/android/launcher3/W3;->o()Lcom/android/launcher3/W3$e;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget-object v4, Lcom/android/launcher3/W3$e;->l:Lcom/android/launcher3/W3$e;

    .line 88
    .line 89
    if-ne v0, v4, :cond_1

    .line 90
    .line 91
    move v0, v3

    .line 92
    goto :goto_0

    .line 93
    :cond_1
    move v0, v2

    .line 94
    :goto_0
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_2

    .line 99
    .line 100
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->d()Lcom/android/launcher3/globalsearch/r;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v4}, Lcom/android/launcher3/globalsearch/r;->a()Lcom/android/launcher3/globalsearch/s;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-interface {v4}, Lcom/android/launcher3/globalsearch/s;->b()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-nez v4, :cond_3

    .line 113
    .line 114
    :cond_2
    sget-boolean v4, Lcom/android/launcher3/W3;->A:Z

    .line 115
    .line 116
    if-nez v4, :cond_3

    .line 117
    .line 118
    if-eqz v0, :cond_4

    .line 119
    .line 120
    :cond_3
    const-string v0, "onControllerInterceptTouchEvent: isGSAppAnimRunning or springChainRunning!"

    .line 121
    .line 122
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    iput-boolean v3, p0, Lcom/android/launcher3/touch/d;->mNoIntercept:Z

    .line 126
    .line 127
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/touch/d;->mNoIntercept:Z

    .line 128
    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    new-instance p1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v0, "onControllerInterceptTouchEvent: mNoIntercept return false "

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    return v2

    .line 160
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->W2()Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_6

    .line 167
    .line 168
    invoke-static {p1}, Lcom/android/launcher3/H4;->d(Landroid/view/MotionEvent;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_6

    .line 173
    .line 174
    move v0, v3

    .line 175
    goto :goto_1

    .line 176
    :cond_6
    move v0, v2

    .line 177
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    .line 178
    .line 179
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 180
    .line 181
    if-eqz v0, :cond_7

    .line 182
    .line 183
    const/4 v0, 0x3

    .line 184
    goto :goto_3

    .line 185
    :cond_7
    invoke-direct {p0}, Lcom/android/launcher3/touch/d;->getSwipeDirection()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    .line 190
    .line 191
    .line 192
    move-result v4

    .line 193
    const/16 v5, 0x2002

    .line 194
    .line 195
    if-ne v4, v5, :cond_8

    .line 196
    .line 197
    invoke-static {}, Lcom/android/launcher3/y0;->H()Z

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    if-eqz v4, :cond_8

    .line 202
    .line 203
    move v4, v3

    .line 204
    goto :goto_2

    .line 205
    :cond_8
    move v4, v2

    .line 206
    :goto_2
    if-eqz v0, :cond_a

    .line 207
    .line 208
    if-eqz v4, :cond_9

    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_9
    move v3, v2

    .line 212
    :goto_3
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 213
    .line 214
    invoke-virtual {v4, v0, v3}, Lcom/android/launcher3/touch/H;->w(IZ)V

    .line 215
    .line 216
    .line 217
    goto :goto_5

    .line 218
    :cond_a
    :goto_4
    if-nez v0, :cond_b

    .line 219
    .line 220
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 221
    .line 222
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 223
    .line 224
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    if-eqz v0, :cond_b

    .line 229
    .line 230
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-nez v0, :cond_b

    .line 235
    .line 236
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    if-eqz v0, :cond_b

    .line 243
    .line 244
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 245
    .line 246
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0}, Lcom/android/launcher3/u4;->i()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_b

    .line 255
    .line 256
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    new-instance v1, Landroid/graphics/PointF;

    .line 263
    .line 264
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    invoke-direct {v1, v4, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0, v1}, Lcom/android/launcher3/u4;->e(Landroid/graphics/PointF;)Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_b

    .line 280
    .line 281
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 282
    .line 283
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 288
    .line 289
    invoke-virtual {p1, v0, v3}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 293
    .line 294
    invoke-static {p1, v2}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 295
    .line 296
    .line 297
    :cond_b
    iput-boolean v3, p0, Lcom/android/launcher3/touch/d;->mNoIntercept:Z

    .line 298
    .line 299
    return v2

    .line 300
    :cond_c
    :goto_5
    iget-boolean v0, p0, Lcom/android/launcher3/touch/d;->mNoIntercept:Z

    .line 301
    .line 302
    if-eqz v0, :cond_d

    .line 303
    .line 304
    return v2

    .line 305
    :cond_d
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 306
    .line 307
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->H(Lcom/android/launcher3/C2;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    const-string v3, "-dectector status: "

    .line 312
    .line 313
    if-eqz v0, :cond_e

    .line 314
    .line 315
    new-instance p1, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 318
    .line 319
    .line 320
    const-string v0, "onControllerInterceptTouchEvent isTouchingScrollableViewInAIFutureWidget return "

    .line 321
    .line 322
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 340
    .line 341
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    .line 354
    .line 355
    return v2

    .line 356
    :cond_e
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 357
    .line 358
    invoke-static {v0}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->m(Lcom/android/launcher3/C2;)Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-eqz v0, :cond_f

    .line 363
    .line 364
    new-instance p1, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 367
    .line 368
    .line 369
    const-string v0, "onControllerInterceptTouchEvent isTouchingGroupWidget return "

    .line 370
    .line 371
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 389
    .line 390
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 391
    .line 392
    .line 393
    move-result p0

    .line 394
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p0

    .line 401
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    return v2

    .line 405
    :cond_f
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 409
    .line 410
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->c2()Lcom/android/launcher3/helper/a;

    .line 411
    .line 412
    .line 413
    move-result-object p1

    .line 414
    invoke-virtual {p1}, Lcom/android/launcher3/helper/a;->e()V

    .line 415
    .line 416
    .line 417
    new-instance p1, Ljava/lang/StringBuilder;

    .line 418
    .line 419
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 420
    .line 421
    .line 422
    const-string v0, "onControllerInterceptTouchEvent: return "

    .line 423
    .line 424
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 442
    .line 443
    invoke-virtual {v0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 448
    .line 449
    .line 450
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object p1

    .line 454
    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    .line 456
    .line 457
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 458
    .line 459
    invoke-virtual {p0}, Lcom/android/launcher3/touch/g;->e()Z

    .line 460
    .line 461
    .line 462
    move-result p0

    .line 463
    return p0
.end method

.method public final onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/g;->l(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDrag(F)Z
    .locals 5

    .line 1
    iget v0, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    iget v1, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    sub-float v1, p1, v1

    mul-float/2addr v0, v1

    .line 2
    iget v1, p0, Lcom/android/launcher3/touch/d;->mStartProgress:F

    add-float/2addr v1, v0

    .line 3
    invoke-virtual {p0, v1}, Lcom/android/launcher3/touch/d;->updateProgress(F)V

    .line 4
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mSwipeDirection:Lcom/android/launcher3/touch/H$c;

    iget v3, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    sub-float v3, p1, v3

    invoke-virtual {v2, v3}, Lcom/android/launcher3/touch/H$c;->d(F)Z

    move-result v2

    .line 5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDrag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, "-progress "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, "-isDragTowardPositive"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, "///"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lx1/O;->b4(Ljava/lang/String;)V

    const/4 v0, 0x0

    cmpg-float v0, v1, v0

    const/4 v3, 0x1

    if-gtz v0, :cond_1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/touch/d;->reinitCurrentAnimation(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7
    iput p1, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    .line 8
    iget-boolean p1, p0, Lcom/android/launcher3/touch/d;->mCanBlockFling:Z

    if-eqz p1, :cond_0

    .line 9
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    invoke-virtual {p1}, Lcom/android/launcher3/util/s0;->a()V

    .line 10
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v0, :cond_4

    .line 11
    iput-boolean v3, p0, Lcom/android/launcher3/touch/d;->mAllAppsOvershootStarted:Z

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    move-result-object p0

    neg-float p1, v1

    invoke-virtual {p0, p1, p1}, Lcom/android/launcher3/allapps/r;->n0(FF)V

    goto :goto_0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v4, v1, v0

    if-ltz v4, :cond_3

    .line 13
    invoke-direct {p0, v3, v2}, Lcom/android/launcher3/touch/d;->reinitCurrentAnimation(ZZ)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 14
    iput p1, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    .line 15
    iget-boolean p1, p0, Lcom/android/launcher3/touch/d;->mCanBlockFling:Z

    if-eqz p1, :cond_2

    .line 16
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    invoke-virtual {p1}, Lcom/android/launcher3/util/s0;->a()V

    .line 17
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p1, v2, :cond_4

    .line 18
    iput-boolean v3, p0, Lcom/android/launcher3/touch/d;->mAllAppsOvershootStarted:Z

    .line 19
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    move-result-object p0

    sub-float/2addr v1, v0

    invoke-virtual {p0, v1, v1}, Lcom/android/launcher3/allapps/r;->n0(FF)V

    goto :goto_0

    .line 20
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    invoke-virtual {p0}, Lcom/android/launcher3/util/s0;->c()V

    :cond_4
    :goto_0
    return v3
.end method

.method public onDrag(FLandroid/view/MotionEvent;)Z
    .locals 1

    .line 21
    iget-boolean p2, p0, Lcom/android/launcher3/touch/d;->mIsLogContainerSet:Z

    if-nez p2, :cond_3

    .line 22
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    if-ne p2, v0, :cond_0

    const/4 p2, 0x4

    .line 23
    iput p2, p0, Lcom/android/launcher3/touch/d;->mStartContainerType:I

    goto :goto_0

    .line 24
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p2, v0, :cond_1

    const/4 p2, 0x2

    .line 25
    iput p2, p0, Lcom/android/launcher3/touch/d;->mStartContainerType:I

    goto :goto_0

    .line 26
    :cond_1
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    if-ne p2, v0, :cond_2

    const/4 p2, 0x3

    .line 27
    iput p2, p0, Lcom/android/launcher3/touch/d;->mStartContainerType:I

    :cond_2
    :goto_0
    const/4 p2, 0x1

    .line 28
    iput-boolean p2, p0, Lcom/android/launcher3/touch/d;->mIsLogContainerSet:Z

    .line 29
    :cond_3
    iget-boolean p2, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    if-ne p2, v0, :cond_4

    neg-float p1, p1

    .line 30
    :cond_4
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->onDrag(F)Z

    move-result p0

    return p0
.end method

.method public onDragEnd(F)V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 4
    .line 5
    const-string v3, "ASCTouchController"

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    const-string p0, "onDragEnd() mCurrentAnimation is null"

    .line 10
    .line 11
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-boolean v2, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    if-ne v2, v4, :cond_1

    .line 24
    .line 25
    neg-float p1, p1

    .line 26
    :cond_1
    const/high16 v2, 0x40400000    # 3.0f

    .line 27
    .line 28
    mul-float/2addr p1, v2

    .line 29
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->p()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/high16 v4, 0x3f000000    # 0.5f

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    mul-float/2addr p1, v4

    .line 42
    :cond_2
    move v10, p1

    .line 43
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 44
    .line 45
    invoke-virtual {p1, v10}, Lcom/android/launcher3/touch/g;->g(F)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/android/launcher3/util/s0;->b()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    move v2, v1

    .line 60
    goto :goto_0

    .line 61
    :cond_3
    move v2, v0

    .line 62
    :goto_0
    if-eqz v2, :cond_4

    .line 63
    .line 64
    move v11, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_4
    move v11, p1

    .line 67
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->q()F

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget v5, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    .line 74
    .line 75
    mul-float/2addr v5, v10

    .line 76
    iget-object v6, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 77
    .line 78
    invoke-virtual {v6}, Lcom/android/launcher3/anim/q;->o()F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v11, :cond_6

    .line 83
    .line 84
    invoke-static {v10}, Ljava/lang/Math;->signum(F)F

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    iget v6, p0, Lcom/android/launcher3/touch/d;->mProgressMultiplier:F

    .line 89
    .line 90
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-static {v4, v6}, Ljava/lang/Float;->compare(FF)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-nez v4, :cond_5

    .line 99
    .line 100
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_5
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 104
    .line 105
    :goto_2
    move-object v9, v4

    .line 106
    goto/16 :goto_4

    .line 107
    .line 108
    :cond_6
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 109
    .line 110
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 115
    .line 116
    if-eqz v7, :cond_8

    .line 117
    .line 118
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 119
    .line 120
    sget-object v8, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 121
    .line 122
    if-eq v7, v8, :cond_7

    .line 123
    .line 124
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 125
    .line 126
    if-ne v7, v8, :cond_8

    .line 127
    .line 128
    :cond_7
    const v4, 0x3e99999a    # 0.3f

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_8
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 133
    .line 134
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 139
    .line 140
    if-nez v7, :cond_9

    .line 141
    .line 142
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 143
    .line 144
    sget-object v8, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 145
    .line 146
    if-ne v7, v8, :cond_9

    .line 147
    .line 148
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 149
    .line 150
    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 151
    .line 152
    if-ne v7, v8, :cond_9

    .line 153
    .line 154
    const v4, 0x3ecccccd    # 0.4f

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_9
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 159
    .line 160
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 165
    .line 166
    if-nez v7, :cond_a

    .line 167
    .line 168
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 169
    .line 170
    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 171
    .line 172
    if-ne v7, v8, :cond_a

    .line 173
    .line 174
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 175
    .line 176
    sget-object v8, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 177
    .line 178
    if-ne v7, v8, :cond_a

    .line 179
    .line 180
    const v4, 0x3f19999a    # 0.6f

    .line 181
    .line 182
    .line 183
    goto :goto_3

    .line 184
    :cond_a
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 185
    .line 186
    invoke-virtual {v7}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 187
    .line 188
    .line 189
    move-result-object v7

    .line 190
    iget-boolean v7, v7, Lcom/android/launcher3/h0;->G0:Z

    .line 191
    .line 192
    if-nez v7, :cond_b

    .line 193
    .line 194
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 195
    .line 196
    sget-object v8, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 197
    .line 198
    if-ne v7, v8, :cond_b

    .line 199
    .line 200
    iget-object v7, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 201
    .line 202
    sget-object v8, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 203
    .line 204
    if-ne v7, v8, :cond_b

    .line 205
    .line 206
    const v4, 0x3e8f5c29    # 0.28f

    .line 207
    .line 208
    .line 209
    :cond_b
    :goto_3
    cmpl-float v4, v6, v4

    .line 210
    .line 211
    if-lez v4, :cond_c

    .line 212
    .line 213
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_c
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :goto_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    const-string v6, "onDragEnd targetState: "

    .line 225
    .line 226
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v6, " fling: "

    .line 233
    .line 234
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    if-eqz v2, :cond_d

    .line 248
    .line 249
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 250
    .line 251
    if-ne v9, v2, :cond_d

    .line 252
    .line 253
    invoke-static {v10}, Lcom/android/launcher3/G2;->a(F)I

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    goto :goto_5

    .line 258
    :cond_d
    move v2, v1

    .line 259
    :goto_5
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 260
    .line 261
    const-wide/16 v6, 0x0

    .line 262
    .line 263
    const/4 v8, 0x0

    .line 264
    const/high16 v12, 0x3f800000    # 1.0f

    .line 265
    .line 266
    if-ne v9, v4, :cond_10

    .line 267
    .line 268
    cmpl-float v4, p1, v12

    .line 269
    .line 270
    if-ltz v4, :cond_e

    .line 271
    .line 272
    move-wide v7, v6

    .line 273
    move v4, v12

    .line 274
    goto :goto_7

    .line 275
    :cond_e
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 276
    .line 277
    invoke-static {v4}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 278
    .line 279
    .line 280
    move-result v4

    .line 281
    int-to-float v4, v4

    .line 282
    mul-float/2addr v5, v4

    .line 283
    add-float/2addr v5, p1

    .line 284
    invoke-static {v5, v8, v12}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 285
    .line 286
    .line 287
    move-result v4

    .line 288
    invoke-static {p1, v8}, Ljava/lang/Math;->max(FF)F

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    sub-float v5, v12, v5

    .line 293
    .line 294
    invoke-static {v10, v5}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 295
    .line 296
    .line 297
    move-result-wide v5

    .line 298
    int-to-long v7, v2

    .line 299
    mul-long v6, v5, v7

    .line 300
    .line 301
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 302
    .line 303
    if-ne v9, v2, :cond_f

    .line 304
    .line 305
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 306
    .line 307
    sget-object v5, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 308
    .line 309
    if-ne v2, v5, :cond_f

    .line 310
    .line 311
    const-wide/16 v6, 0x64

    .line 312
    .line 313
    :cond_f
    :goto_6
    move-wide v7, v6

    .line 314
    goto :goto_7

    .line 315
    :cond_10
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 316
    .line 317
    invoke-virtual {v4}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 318
    .line 319
    .line 320
    move-result-object v4

    .line 321
    iget-object v13, p0, Lcom/android/launcher3/touch/d;->mClearStateOnCancelListener:Landroid/animation/Animator$AnimatorListener;

    .line 322
    .line 323
    invoke-virtual {v4, v13}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 324
    .line 325
    .line 326
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 327
    .line 328
    invoke-virtual {v4}, Lcom/android/launcher3/anim/q;->i()Lcom/android/launcher3/anim/q;

    .line 329
    .line 330
    .line 331
    cmpg-float v4, p1, v8

    .line 332
    .line 333
    if-gtz v4, :cond_11

    .line 334
    .line 335
    move v4, v8

    .line 336
    move v12, v4

    .line 337
    goto :goto_6

    .line 338
    :cond_11
    iget-object v4, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 339
    .line 340
    invoke-static {v4}, Lcom/android/launcher3/util/window/b;->a(Landroid/content/Context;)I

    .line 341
    .line 342
    .line 343
    move-result v4

    .line 344
    int-to-float v4, v4

    .line 345
    mul-float/2addr v5, v4

    .line 346
    add-float/2addr v5, p1

    .line 347
    invoke-static {v5, v8, v12}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 348
    .line 349
    .line 350
    move-result v4

    .line 351
    invoke-static {p1, v12}, Ljava/lang/Math;->min(FF)F

    .line 352
    .line 353
    .line 354
    move-result v5

    .line 355
    sub-float/2addr v5, v8

    .line 356
    invoke-static {v10, v5}, Lcom/android/launcher3/touch/g;->b(FF)J

    .line 357
    .line 358
    .line 359
    move-result-wide v5

    .line 360
    int-to-long v12, v2

    .line 361
    mul-long v6, v5, v12

    .line 362
    .line 363
    move v12, v8

    .line 364
    goto :goto_6

    .line 365
    :goto_7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 366
    .line 367
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 368
    .line 369
    .line 370
    const-string v5, "onDragEnd: startProgress "

    .line 371
    .line 372
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    const-string v5, "/"

    .line 379
    .line 380
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    .line 398
    .line 399
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 400
    .line 401
    new-instance v3, Lcom/android/launcher3/touch/b;

    .line 402
    .line 403
    invoke-direct {v3, p0, v9}, Lcom/android/launcher3/touch/b;-><init>(Lcom/android/launcher3/touch/d;Lcom/android/launcher3/V3;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v2, v3}, Lcom/android/launcher3/anim/q;->v(Ljava/lang/Runnable;)V

    .line 407
    .line 408
    .line 409
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 410
    .line 411
    invoke-virtual {v2}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 412
    .line 413
    .line 414
    move-result-object v6

    .line 415
    const/4 v2, 0x2

    .line 416
    new-array v2, v2, [F

    .line 417
    .line 418
    aput v4, v2, v0

    .line 419
    .line 420
    aput v12, v2, v1

    .line 421
    .line 422
    invoke-virtual {v6, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 423
    .line 424
    .line 425
    move-object v5, p0

    .line 426
    invoke-virtual/range {v5 .. v11}, Lcom/android/launcher3/touch/d;->updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V

    .line 427
    .line 428
    .line 429
    iget-object p0, v5, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 430
    .line 431
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 432
    .line 433
    .line 434
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 435
    .line 436
    if-ne v9, p0, :cond_13

    .line 437
    .line 438
    iget-boolean p0, v5, Lcom/android/launcher3/touch/d;->mAllAppsOvershootStarted:Z

    .line 439
    .line 440
    if-eqz p0, :cond_12

    .line 441
    .line 442
    iget-object p0, v5, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 443
    .line 444
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    invoke-virtual {p0}, Lcom/android/launcher3/views/SpringRelativeLayout;->h()V

    .line 449
    .line 450
    .line 451
    iput-boolean v0, v5, Lcom/android/launcher3/touch/d;->mAllAppsOvershootStarted:Z

    .line 452
    .line 453
    goto :goto_8

    .line 454
    :cond_12
    iget-object p0, v5, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 455
    .line 456
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    invoke-virtual {p0, v6, v10, p1}, Lcom/android/launcher3/allapps/r;->E(Landroid/animation/ValueAnimator;FF)V

    .line 461
    .line 462
    .line 463
    goto :goto_8

    .line 464
    :cond_13
    sget-object p0, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 465
    .line 466
    if-ne v9, p0, :cond_14

    .line 467
    .line 468
    instance-of p0, v5, Lcom/android/launcher3/uioverrides/touchcontrollers/p;

    .line 469
    .line 470
    if-eqz p0, :cond_14

    .line 471
    .line 472
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    invoke-virtual {p0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 477
    .line 478
    .line 479
    move-result p0

    .line 480
    if-eqz p0, :cond_14

    .line 481
    .line 482
    iget-object p0, v5, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 483
    .line 484
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    invoke-static {p0}, LK1/q;->a(Landroid/content/Context;)V

    .line 489
    .line 490
    .line 491
    :cond_14
    :goto_8
    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    .line 492
    .line 493
    .line 494
    return-void
.end method

.method public onDragStart(ZF)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/launcher3/V3;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/touch/d;->mIsLogContainerSet:Z

    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v0, "reinitCurrentAnimation: onDragStart "

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, "/"

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/touch/H;->y()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string v0, "ASCTouchController"

    .line 52
    .line 53
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 57
    .line 58
    if-nez p2, :cond_0

    .line 59
    .line 60
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mStartState:Lcom/android/launcher3/V3;

    .line 61
    .line 62
    iput-object p2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 63
    .line 64
    const/4 p2, 0x0

    .line 65
    iput-object p2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/android/launcher3/touch/d;->cancelAnimationControllers()V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mDetector:Lcom/android/launcher3/touch/H;

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/android/launcher3/touch/H;->y()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/touch/d;->reinitCurrentAnimation(ZZ)Z

    .line 77
    .line 78
    .line 79
    const/4 p2, 0x0

    .line 80
    iput p2, p0, Lcom/android/launcher3/touch/d;->mDisplacementShift:F

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/anim/q;->u()V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 87
    .line 88
    invoke-virtual {p2}, Lcom/android/launcher3/anim/q;->q()F

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    iput p2, p0, Lcom/android/launcher3/touch/d;->mStartProgress:F

    .line 93
    .line 94
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 95
    .line 96
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 97
    .line 98
    if-ne p2, v0, :cond_1

    .line 99
    .line 100
    const/4 p1, 0x1

    .line 101
    :cond_1
    iput-boolean p1, p0, Lcom/android/launcher3/touch/d;->mCanBlockFling:Z

    .line 102
    .line 103
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mFlingBlockCheck:Lcom/android/launcher3/util/s0;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/util/s0;->d()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method protected onReachedFinalState(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onReinitToState(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected onSwipeInteractionCompleted(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/touch/d;->onReachedFinalState(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->clearState()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/launcher3/touch/d;->mGoingBetweenStates:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    if-eq v0, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/launcher3/touch/d;->logReachedState(Lcom/android/launcher3/V3;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/touch/d;->goToTargetState(Lcom/android/launcher3/V3;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method protected shouldOpenAllApps(Z)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    :cond_0
    if-nez p1, :cond_2

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/android/launcher3/touch/d;->mIsTrackpadReverseScroll:Z

    .line 10
    .line 11
    if-eqz p0, :cond_2

    .line 12
    .line 13
    :cond_1
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_2
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method protected updateProgress(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected updateSwipeCompleteAnimation(Landroid/animation/ValueAnimator;JLcom/android/launcher3/V3;FZ)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p5}, LJ0/h;->o(F)Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
