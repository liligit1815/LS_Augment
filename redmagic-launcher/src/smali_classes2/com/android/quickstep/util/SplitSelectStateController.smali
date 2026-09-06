.class public Lcom/android/quickstep/util/SplitSelectStateController;
.super Ljava/lang/Object;
.source "SplitSelectStateController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;,
        Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;,
        Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SplitSelectStateCtor"


# instance fields
.field private mActivityBackCallback:Ljava/lang/Runnable;

.field private mAnimateCurrentTaskDismissal:Z

.field private final mAppPairsController:Lcom/android/quickstep/util/AppPairsController;

.field private mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private mDepthController:LP1/h;

.field private mDismissingFromSplitPair:Z

.field private mFirstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

.field private mIsDestroyed:Z

.field private mLaunchCuj:I

.field private mLaunchingFirstAppFullscreen:Z

.field private mLaunchingIconView:Lcom/android/launcher3/apppairs/AppPairIcon;

.field private mLaunchingTaskView:Lcom/android/quickstep/views/GroupedTaskView;

.field private mLaunchingViewCuj:Landroid/view/View;

.field private final mRecentTasksModel:Lcom/android/quickstep/RecentsModel;

.field private mRecentsAnimationRunning:Z

.field private mSessionInstanceIds:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Lcom/android/internal/logging/InstanceId;",
            "Lcom/android/launcher3/logging/d;",
            ">;"
        }
    .end annotation
.end field

.field private final mSplitAnimationController:Lcom/android/quickstep/util/SplitAnimationController;

.field private final mSplitBackHandler:Lcom/android/launcher3/util/l;

.field private mSplitFromDesktopController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

.field private mSplitInstructionsView:Lcom/android/quickstep/views/SplitInstructionsView;

.field private final mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

.field private final mSplitSelectionListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/SplitSelectionListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mStateManager:Lcom/android/launcher3/statemanager/d;

.field private final mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

.field private final mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/d;LP1/h;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/RecentsModel;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchCuj:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectionListeners:Ljava/util/List;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mIsDestroyed:Z

    .line 16
    .line 17
    new-instance v0, Lcom/android/quickstep/util/SplitSelectStateController$1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/SplitSelectStateController$1;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitBackHandler:Lcom/android/launcher3/util/l;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 25
    .line 26
    iput-object p4, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 27
    .line 28
    iput-object p5, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 31
    .line 32
    iput-object p3, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mDepthController:LP1/h;

    .line 33
    .line 34
    iput-object p6, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mRecentTasksModel:Lcom/android/quickstep/RecentsModel;

    .line 35
    .line 36
    iput-object p7, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mActivityBackCallback:Ljava/lang/Runnable;

    .line 37
    .line 38
    new-instance p1, Lcom/android/quickstep/util/SplitAnimationController;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/SplitAnimationController;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitAnimationController:Lcom/android/quickstep/util/SplitAnimationController;

    .line 44
    .line 45
    new-instance p1, Lcom/android/quickstep/util/AppPairsController;

    .line 46
    .line 47
    iget-object p2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 48
    .line 49
    invoke-direct {p1, p2, p0, p4}, Lcom/android/quickstep/util/AppPairsController;-><init>(Lcom/android/launcher3/views/k;Lcom/android/quickstep/util/SplitSelectStateController;Lcom/android/launcher3/logging/StatsLogManager;)V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAppPairsController:Lcom/android/quickstep/util/AppPairsController;

    .line 53
    .line 54
    new-instance p1, Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 55
    .line 56
    iget-object p2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 57
    .line 58
    invoke-interface {p2}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-direct {p1, p2}, Lcom/android/quickstep/util/SplitSelectDataHolder;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 66
    .line 67
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitSelectStateController;Ljava/util/List;Ljava/util/function/Consumer;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/SplitSelectStateController;->lambda$findLastActiveTasksAndRunCallback$0(Ljava/util/List;Ljava/util/function/Consumer;ZLjava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lcom/android/quickstep/util/SplitSelectStateController;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mActivityBackCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method private createAndLogInstanceIdsForSession()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "SplitSelectStateCtor"

    .line 6
    .line 7
    const-string v1, "SessionIds should be null"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {}, Lcom/android/quickstep/util/LogUtils;->getShellShareableInstanceId()Landroid/util/Pair;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 25
    .line 26
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Lcom/android/launcher3/logging/d;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->l3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getItemInfo()Lcom/android/launcher3/model/data/y;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 56
    .line 57
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v1, Lcom/android/launcher3/logging/d;

    .line 60
    .line 61
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/SplitSelectStateController;)LP1/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mDepthController:LP1/h;

    .line 2
    .line 3
    return-object p0
.end method

.method private dispatchOnSplitSelectionExit()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectionListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/quickstep/SplitSelectionListener;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {v0, v1}, Lcom/android/quickstep/SplitSelectionListener;->onSplitSelectionExit(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/SplitSelectStateController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchCuj:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/launcher3/apppairs/AppPairIcon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingIconView:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/quickstep/views/GroupedTaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingTaskView:Lcom/android/quickstep/views/GroupedTaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method private getRemoteTransition(IILjava/util/function/Consumer;Ljava/lang/String;)Landroid/window/RemoteTransition;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/window/RemoteTransition;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;IILjava/util/function/Consumer;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/window/RemoteTransition;

    .line 7
    .line 8
    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/app/ActivityThread;->getApplicationThread()Landroid/app/ActivityThread$ApplicationThread;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-direct {p0, v0, p1, p4}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/quickstep/util/SplitSelectStateController;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingViewCuj:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/quickstep/util/SplitAnimationController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitAnimationController:Lcom/android/quickstep/util/SplitAnimationController;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/launcher3/statemanager/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStateManager:Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$findLastActiveTasksAndRunCallback$0(Ljava/util/List;Ljava/util/function/Consumer;ZLjava/util/List;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_8

    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    new-array v1, v1, [Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    sub-int/2addr p3, v2

    .line 26
    :goto_0
    if-ltz p3, :cond_7

    .line 27
    .line 28
    invoke-interface {p4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    check-cast v3, Lcom/android/quickstep/util/GroupTask;

    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Lcom/android/launcher3/util/E;

    .line 39
    .line 40
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    check-cast v5, Lcom/android/launcher3/util/E;

    .line 45
    .line 46
    invoke-virtual {p0, v3, v4, v5}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfAppPair(Lcom/android/quickstep/util/GroupTask;Lcom/android/launcher3/util/E;Lcom/android/launcher3/util/E;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    check-cast v3, Lcom/android/quickstep/util/SplitTask;

    .line 53
    .line 54
    invoke-virtual {v3}, Lcom/android/quickstep/util/SplitTask;->getTopLeftTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    aput-object p0, v1, v0

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_1
    add-int/lit8 p3, p3, -0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-ge v0, p3, :cond_7

    .line 69
    .line 70
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    check-cast p3, Lcom/android/launcher3/util/E;

    .line 75
    .line 76
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    sub-int/2addr v3, v2

    .line 81
    const/4 v4, 0x0

    .line 82
    :goto_2
    if-ltz v3, :cond_6

    .line 83
    .line 84
    invoke-interface {p4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lcom/android/quickstep/util/GroupTask;

    .line 89
    .line 90
    invoke-virtual {v5}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_4

    .line 103
    .line 104
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    check-cast v6, Lcom/android/systemui/shared/recents/model/Task;

    .line 109
    .line 110
    invoke-virtual {p0, v6, p3}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-eqz v7, :cond_3

    .line 115
    .line 116
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    invoke-interface {v7, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    if-nez v7, :cond_3

    .line 125
    .line 126
    move-object v4, v6

    .line 127
    :cond_4
    if-eqz v4, :cond_5

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    add-int/lit8 v3, v3, -0x1

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_6
    :goto_3
    aput-object v4, v1, v0

    .line 134
    .line 135
    add-int/lit8 v0, v0, 0x1

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_7
    :goto_4
    invoke-interface {p2, v1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_8
    :goto_5
    new-array p0, v0, [Lcom/android/systemui/shared/recents/model/Task;

    .line 143
    .line 144
    invoke-interface {p2, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/E;",
            ">;Z",
            "Ljava/util/function/Consumer<",
            "[",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mRecentTasksModel:Lcom/android/quickstep/RecentsModel;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/S0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p3, p2}, Lcom/android/quickstep/util/S0;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;Ljava/util/List;Ljava/util/function/Consumer;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;)I

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getActiveSplitStagePosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getInitialStagePosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAppPairsController()Lcom/android/quickstep/util/AppPairsController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAppPairsController:Lcom/android/quickstep/util/AppPairsController;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFirstFloatingTaskView()Lcom/android/quickstep/views/FloatingTaskView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mFirstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInitialTaskId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getInitialTaskId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSecondTaskId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSecondTaskId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitAnimationController:Lcom/android/quickstep/util/SplitAnimationController;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSplitBackHandler()Lcom/android/launcher3/util/l;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitBackHandler:Lcom/android/launcher3/util/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitInstructionsView:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public initSplitFromDesktopController(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    invoke-virtual {p0, v0}, Lcom/android/quickstep/util/SplitSelectStateController;->initSplitFromDesktopController(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)V

    return-void
.end method

.method initSplitFromDesktopController(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitFromDesktopController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    return-void
.end method

.method public isAnimateCurrentTaskDismissal()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAnimateCurrentTaskDismissal:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBothSplitAppsConfirmed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isBothSplitAppsConfirmed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isDismissingFromSplitPair()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mDismissingFromSplitPair:Z

    .line 2
    .line 3
    return p0
.end method

.method public isInstanceOfAppPair(Lcom/android/quickstep/util/GroupTask;Lcom/android/launcher3/util/E;Lcom/android/launcher3/util/E;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/quickstep/util/SplitTask;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p1, Lcom/android/quickstep/util/SplitTask;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getTopLeftTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p2}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getBottomRightTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0, p3}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getTopLeftTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0, p3}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    if-eqz p3, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getBottomRightTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitSelectStateController;->isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    :cond_1
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    return v1
.end method

.method public isInstanceOfComponent(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/util/E;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object v1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 5
    .line 6
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getInitialTaskId()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ne v1, p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object v1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 34
    .line 35
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 36
    .line 37
    iget-object p1, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-ne p0, p1, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    :goto_0
    return v0
.end method

.method public isLaunchingFirstAppFullscreen()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingFirstAppFullscreen:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSplitSelectActive()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->isSplitSelectActive()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public launchExistingSplitPair(Lcom/android/quickstep/views/GroupedTaskView;IIILjava/util/function/Consumer;ZI)V
    .locals 9
    .param p7    # I
        .annotation build Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/GroupedTaskView;",
            "III",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;ZI)V"
        }
    .end annotation

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    move/from16 v7, p7

    .line 1
    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/util/SplitSelectStateController;->launchExistingSplitPair(Lcom/android/quickstep/views/GroupedTaskView;IIILjava/util/function/Consumer;ZILandroid/window/RemoteTransition;)V

    return-void
.end method

.method public launchExistingSplitPair(Lcom/android/quickstep/views/GroupedTaskView;IIILjava/util/function/Consumer;ZILandroid/window/RemoteTransition;)V
    .locals 9
    .param p7    # I
        .annotation build Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/views/GroupedTaskView;",
            "III",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;ZI",
            "Landroid/window/RemoteTransition;",
            ")V"
        }
    .end annotation

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingTaskView:Lcom/android/quickstep/views/GroupedTaskView;

    .line 3
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    move-result-object p1

    if-eqz p6, :cond_0

    .line 4
    invoke-virtual {p1}, Landroid/app/ActivityOptions;->setFreezeRecentTasksReordering()V

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    if-nez p8, :cond_1

    .line 6
    const-string p1, "LaunchExistingPair"

    invoke-direct {p0, p2, p3, p5, p1}, Lcom/android/quickstep/util/SplitSelectStateController;->getRemoteTransition(IILjava/util/function/Consumer;Ljava/lang/String;)Landroid/window/RemoteTransition;

    move-result-object p1

    move-object v7, p1

    goto :goto_0

    :cond_1
    move-object/from16 v7, p8

    .line 7
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    const/4 v4, 0x0

    const/4 v8, 0x0

    move v1, p2

    move v3, p3

    move v5, p4

    move/from16 v6, p7

    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/SystemUiProxy;->startTasks(ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    return-void
.end method

.method public launchInitialAppFullscreen(Ljava/util/function/Consumer;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getFullscreenLaunchData()Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialTaskId()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSecondTaskId()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    move v8, v5

    .line 20
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialPendingIntent()Landroid/app/PendingIntent;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialUserId()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialStagePosition()I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    move-object v2, v5

    .line 33
    move v5, v3

    .line 34
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialShortcut()Landroid/content/pm/ShortcutInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    new-instance v0, Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;

    .line 43
    .line 44
    invoke-direct {v0, p0, v5, v8, p1}, Lcom/android/quickstep/util/SplitSelectStateController$RemoteSplitLaunchTransitionRunner;-><init>(Lcom/android/quickstep/util/SplitSelectStateController;IILjava/util/function/Consumer;)V

    .line 45
    .line 46
    .line 47
    new-instance v9, Landroid/window/RemoteTransition;

    .line 48
    .line 49
    invoke-static {}, Landroid/app/ActivityThread;->currentActivityThread()Landroid/app/ActivityThread;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/app/ActivityThread;->getApplicationThread()Landroid/app/ActivityThread$ApplicationThread;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v10, "LaunchAppFullscreen"

    .line 58
    .line 59
    invoke-direct {v9, v0, p1, v10}, Landroid/window/RemoteTransition;-><init>(Landroid/window/IRemoteTransition;Landroid/app/IApplicationThread;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 63
    .line 64
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 65
    .line 66
    move-object v10, p1

    .line 67
    check-cast v10, Lcom/android/internal/logging/InstanceId;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSplitLaunchType()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/4 v0, 0x6

    .line 74
    if-eq p1, v0, :cond_2

    .line 75
    .line 76
    const/4 v0, 0x7

    .line 77
    if-eq p1, v0, :cond_1

    .line 78
    .line 79
    const/16 v0, 0x8

    .line 80
    .line 81
    if-eq p1, v0, :cond_0

    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 85
    .line 86
    const/4 v6, 0x0

    .line 87
    const/4 v8, 0x1

    .line 88
    invoke-virtual/range {v2 .. v10}, Lcom/android/quickstep/SystemUiProxy;->startShortcutAndTask(Landroid/content/pm/ShortcutInfo;Landroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 93
    .line 94
    move-object v12, v9

    .line 95
    const/4 v9, 0x0

    .line 96
    const/4 v11, 0x1

    .line 97
    move-object v5, v2

    .line 98
    move-object v13, v10

    .line 99
    move v10, v7

    .line 100
    move-object v7, v4

    .line 101
    move-object v4, p0

    .line 102
    invoke-virtual/range {v4 .. v13}, Lcom/android/quickstep/SystemUiProxy;->startIntentAndTask(Landroid/app/PendingIntent;ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 107
    .line 108
    const/4 v6, 0x0

    .line 109
    move v3, v5

    .line 110
    move v5, v8

    .line 111
    const/4 v8, 0x1

    .line 112
    invoke-virtual/range {v2 .. v10}, Lcom/android/quickstep/SystemUiProxy;->startTasks(ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public launchSplitTasks()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/util/SplitSelectStateController;->launchSplitTasks(ILjava/util/function/Consumer;)V

    return-void
.end method

.method public launchSplitTasks(I)V
    .locals 1
    .param p1    # I
        .annotation build Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/util/SplitSelectStateController;->launchSplitTasks(ILjava/util/function/Consumer;)V

    return-void
.end method

.method public launchSplitTasks(ILjava/util/function/Consumer;)V
    .locals 2
    .param p1    # I
        .annotation build Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/logging/InstanceId;

    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1, p1, v0}, Lcom/android/quickstep/util/SplitSelectStateController;->launchTasks(Ljava/util/function/Consumer;ZILcom/android/internal/logging/InstanceId;)V

    .line 2
    iget-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    move-result-object p1

    iget-object p2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 3
    invoke-virtual {p2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSecondItemInfo()Lcom/android/launcher3/model/data/y;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    move-result-object p1

    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Lcom/android/launcher3/logging/d;

    .line 4
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    move-result-object p0

    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->n3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 5
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    return-void
.end method

.method public launchSplitTasks(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/util/SplitSelectStateController;->launchSplitTasks(ILjava/util/function/Consumer;)V

    return-void
.end method

.method public launchTasks(Ljava/util/function/Consumer;ZILcom/android/internal/logging/InstanceId;)V
    .locals 20
    .param p3    # I
        .annotation build Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Boolean;",
            ">;ZI",
            "Lcom/android/internal/logging/InstanceId;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "Main"

    .line 4
    .line 5
    const-string v2, "launchSplitTasks"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->setFreezeRecentTasksReordering()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v2, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->getSplitLaunchData()Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialTaskId()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSecondTaskId()I

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialShortcut()Landroid/content/pm/ShortcutInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSecondShortcut()Landroid/content/pm/ShortcutInfo;

    .line 38
    .line 39
    .line 40
    move-result-object v14

    .line 41
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialPendingIntent()Landroid/app/PendingIntent;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSecondPendingIntent()Landroid/app/PendingIntent;

    .line 46
    .line 47
    .line 48
    move-result-object v12

    .line 49
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getWidgetSecondIntent()Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialUserId()I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSecondUserId()I

    .line 58
    .line 59
    .line 60
    move-result v13

    .line 61
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getInitialStagePosition()I

    .line 62
    .line 63
    .line 64
    move-result v11

    .line 65
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    new-instance v15, Landroid/os/Bundle;

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    invoke-direct {v15, v1}, Landroid/os/Bundle;-><init>(I)V

    .line 73
    .line 74
    .line 75
    const-string v9, "key_extra_widget_intent"

    .line 76
    .line 77
    invoke-virtual {v15, v9, v3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 78
    .line 79
    .line 80
    const-string v3, "LaunchSplitPair"

    .line 81
    .line 82
    move-object/from16 v9, p1

    .line 83
    .line 84
    invoke-direct {v0, v4, v6, v9, v3}, Lcom/android/quickstep/util/SplitSelectStateController;->getRemoteTransition(IILjava/util/function/Consumer;Ljava/lang/String;)Landroid/window/RemoteTransition;

    .line 85
    .line 86
    .line 87
    move-result-object v18

    .line 88
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectDataHolder$SplitLaunchData;->getSplitLaunchType()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_6

    .line 93
    .line 94
    if-eq v2, v1, :cond_5

    .line 95
    .line 96
    const/4 v1, 0x2

    .line 97
    if-eq v2, v1, :cond_4

    .line 98
    .line 99
    const/4 v1, 0x3

    .line 100
    if-eq v2, v1, :cond_3

    .line 101
    .line 102
    const/4 v1, 0x4

    .line 103
    if-eq v2, v1, :cond_2

    .line 104
    .line 105
    const/4 v1, 0x5

    .line 106
    if-eq v2, v1, :cond_1

    .line 107
    .line 108
    return-void

    .line 109
    :cond_1
    move v9, v7

    .line 110
    iget-object v7, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 111
    .line 112
    move/from16 v17, p3

    .line 113
    .line 114
    move-object/from16 v19, p4

    .line 115
    .line 116
    move/from16 v16, v11

    .line 117
    .line 118
    move-object v11, v5

    .line 119
    invoke-virtual/range {v7 .. v19}, Lcom/android/quickstep/SystemUiProxy;->startIntents(Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    move v8, v11

    .line 124
    move-object/from16 v11, v18

    .line 125
    .line 126
    iget-object v0, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 127
    .line 128
    const/4 v9, 0x0

    .line 129
    move v7, v8

    .line 130
    move v8, v6

    .line 131
    move-object v6, v10

    .line 132
    move v10, v7

    .line 133
    move-object/from16 v13, p4

    .line 134
    .line 135
    move-object v7, v5

    .line 136
    move-object v12, v11

    .line 137
    move/from16 v11, p3

    .line 138
    .line 139
    move-object v5, v0

    .line 140
    invoke-virtual/range {v5 .. v13}, Lcom/android/quickstep/SystemUiProxy;->startShortcutAndTask(Landroid/content/pm/ShortcutInfo;Landroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_3
    move v9, v7

    .line 145
    move-object/from16 v10, v18

    .line 146
    .line 147
    iget-object v0, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 148
    .line 149
    move-object v12, v10

    .line 150
    const/4 v10, 0x0

    .line 151
    move-object/from16 v14, p4

    .line 152
    .line 153
    move-object v13, v12

    .line 154
    move/from16 v12, p3

    .line 155
    .line 156
    move v9, v6

    .line 157
    move-object v6, v8

    .line 158
    move-object v8, v5

    .line 159
    move-object v5, v0

    .line 160
    invoke-virtual/range {v5 .. v14}, Lcom/android/quickstep/SystemUiProxy;->startIntentAndTask(Landroid/app/PendingIntent;ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_4
    move v8, v11

    .line 165
    move-object/from16 v10, v18

    .line 166
    .line 167
    iget-object v3, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 168
    .line 169
    const/4 v7, 0x0

    .line 170
    move/from16 v9, p3

    .line 171
    .line 172
    move-object/from16 v11, p4

    .line 173
    .line 174
    move v6, v4

    .line 175
    move-object v4, v14

    .line 176
    invoke-virtual/range {v3 .. v11}, Lcom/android/quickstep/SystemUiProxy;->startShortcutAndTask(Landroid/content/pm/ShortcutInfo;Landroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_5
    move v8, v11

    .line 181
    move-object/from16 v10, v18

    .line 182
    .line 183
    iget-object v3, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 184
    .line 185
    move v7, v4

    .line 186
    move-object v6, v5

    .line 187
    move v9, v8

    .line 188
    move-object v11, v10

    .line 189
    move-object v4, v12

    .line 190
    move v5, v13

    .line 191
    move-object v8, v15

    .line 192
    move/from16 v10, p3

    .line 193
    .line 194
    move-object/from16 v12, p4

    .line 195
    .line 196
    invoke-virtual/range {v3 .. v12}, Lcom/android/quickstep/SystemUiProxy;->startIntentAndTask(Landroid/app/PendingIntent;ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_6
    move v8, v11

    .line 201
    move-object/from16 v10, v18

    .line 202
    .line 203
    iget-object v3, v0, Lcom/android/quickstep/util/SplitSelectStateController;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 204
    .line 205
    const/4 v7, 0x0

    .line 206
    move/from16 v9, p3

    .line 207
    .line 208
    move-object/from16 v11, p4

    .line 209
    .line 210
    invoke-virtual/range {v3 .. v11}, Lcom/android/quickstep/SystemUiProxy;->startTasks(ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public logExitReason(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/logging/d;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p0, "SplitSelectStateCtor"

    .line 20
    .line 21
    const-string v1, "Missing session instanceIds"

    .line 22
    .line 23
    invoke-static {p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-interface {v0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    iput-boolean v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mIsDestroyed:Z

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mActivityBackCallback:Ljava/lang/Runnable;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAppPairsController:Lcom/android/quickstep/util/AppPairsController;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/util/AppPairsController;->onDestroy()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->onDestroy()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitFromDesktopController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->onDestroy()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public registerSplitListener(Lcom/android/quickstep/SplitSelectionListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectionListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectionListeners:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public resetState()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->resetState()V

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mIsDestroyed:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 11
    .line 12
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->resetDesktopTaskFromSplitSelectState()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->dispatchOnSplitSelectionExit()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mRecentsAnimationRunning:Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingTaskView:Lcom/android/quickstep/views/GroupedTaskView;

    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingIconView:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAnimateCurrentTaskDismissal:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mDismissingFromSplitPair:Z

    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mFirstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitInstructionsView:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingFirstAppFullscreen:Z

    .line 41
    .line 42
    iget v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchCuj:I

    .line 43
    .line 44
    const/4 v2, -0x1

    .line 45
    if-eq v0, v2, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Lcom/android/systemui/shared/system/InteractionJankMonitorWrapper;->end(I)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iput v2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchCuj:I

    .line 51
    .line 52
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingViewCuj:Landroid/view/View;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 65
    .line 66
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v2, Lcom/android/launcher3/logging/d;

    .line 69
    .line 70
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->m3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 75
    .line 76
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iput-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSessionInstanceIds:Landroid/util/Pair;

    .line 80
    .line 81
    return-void
.end method

.method public setAnimateCurrentTaskDismissal(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mAnimateCurrentTaskDismissal:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDismissingFromSplitPair(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mDismissingFromSplitPair:Z

    .line 2
    .line 3
    return-void
.end method

.method public setFirstFloatingTaskView(Lcom/android/quickstep/views/FloatingTaskView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mFirstFloatingTaskView:Lcom/android/quickstep/views/FloatingTaskView;

    .line 2
    .line 3
    return-void
.end method

.method public setInitialTaskSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setInitialTaskSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->createAndLogInstanceIdsForSession()V

    return-void
.end method

.method public setInitialTaskSelect(Landroid/content/Intent;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setInitialTaskSelect(Landroid/content/Intent;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    .line 2
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->createAndLogInstanceIdsForSession()V

    return-void
.end method

.method public setLaunchingCuj(Landroid/view/View;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingViewCuj:Landroid/view/View;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchCuj:I

    .line 4
    .line 5
    return-void
.end method

.method public setLaunchingFirstAppFullscreen()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingFirstAppFullscreen:Z

    .line 3
    .line 4
    return-void
.end method

.method public setLaunchingIconView(Lcom/android/launcher3/apppairs/AppPairIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mLaunchingIconView:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 2
    .line 3
    return-void
.end method

.method public setRecentsAnimationRunning(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mRecentsAnimationRunning:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSecondTask(Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setSecondTask(Landroid/app/PendingIntent;Lcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public setSecondTask(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setSecondTask(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public setSecondTask(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setSecondTask(ILcom/android/launcher3/model/data/y;)V

    return-void
.end method

.method public setSecondWidget(Landroid/app/PendingIntent;Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectDataHolder:Lcom/android/quickstep/util/SplitSelectDataHolder;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/quickstep/util/SplitSelectDataHolder;->setSecondWidget(Landroid/app/PendingIntent;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setSplitInstructionsView(Lcom/android/quickstep/views/SplitInstructionsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitInstructionsView:Lcom/android/quickstep/views/SplitInstructionsView;

    .line 2
    .line 3
    return-void
.end method

.method public unregisterSplitListener(Lcom/android/quickstep/SplitSelectionListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController;->mSplitSelectionListeners:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
