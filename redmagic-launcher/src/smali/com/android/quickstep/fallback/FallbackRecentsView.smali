.class public Lcom/android/quickstep/fallback/FallbackRecentsView;
.super Lcom/android/quickstep/views/RecentsView;
.source "FallbackRecentsView.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CONTAINER_TYPE:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ":",
        "Lcom/android/launcher3/statemanager/i<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;>",
        "Lcom/android/quickstep/views/RecentsView<",
        "TCONTAINER_TYPE;",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/quickstep/fallback/RecentsState;",
        ">;"
    }
.end annotation


# static fields
.field private static final TASK_DISMISS_DURATION:I = 0x96


# instance fields
.field private mHomeTask:Lcom/android/systemui/shared/recents/model/Task;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/fallback/FallbackRecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast p1, Lcom/android/launcher3/statemanager/i;

    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    return-void
.end method

.method public static synthetic h2(Lcom/android/quickstep/fallback/FallbackRecentsView;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->lambda$setCurrentTask$1(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i2(Lcom/android/quickstep/fallback/FallbackRecentsView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->lambda$onPrepareGestureEndAnimation$0(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j2(Lcom/android/quickstep/fallback/FallbackRecentsView;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->lambda$applyLoadPlan$2(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic lambda$applyLoadPlan$2(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

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

.method private synthetic lambda$onPrepareGestureEndAnimation$0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->setCurrentTask(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic lambda$setCurrentTask$1(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

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


# virtual methods
.method protected applyLoadPlan(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskIdsForRunningTaskView()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lcom/android/quickstep/fallback/d;

    .line 14
    .line 15
    invoke-direct {v2, p0}, Lcom/android/quickstep/fallback/d;-><init>(Lcom/android/quickstep/fallback/FallbackRecentsView;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v1, v2}, Ljava/util/stream/IntStream;->allMatch(Ljava/util/function/IntPredicate;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/android/quickstep/util/GroupTask;

    .line 45
    .line 46
    invoke-static {v0}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    new-instance v4, Lcom/android/quickstep/fallback/e;

    .line 54
    .line 55
    invoke-direct {v4, v2}, Lcom/android/quickstep/fallback/e;-><init>(Lcom/android/quickstep/util/GroupTask;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v3, v4}, Ljava/util/stream/IntStream;->allMatch(Ljava/util/function/IntPredicate;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    new-instance p1, Lcom/android/quickstep/util/SingleTask;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 82
    .line 83
    invoke-direct {p1, v1}, Lcom/android/quickstep/util/SingleTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-object p1, v0

    .line 90
    :cond_2
    :goto_0
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->applyLoadPlan(Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public canLaunchFullscreenTask()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 4
    .line 5
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method protected canStartHomeSafely()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->canStartHomeSafely()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "*>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Landroid/view/ViewGroup;->mContext:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getFallbackWindowInterface(I)Lcom/android/quickstep/FallbackWindowInterface;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lcom/android/quickstep/FallbackActivityInterface;->INSTANCE:Lcom/android/quickstep/FallbackActivityInterface;

    .line 27
    .line 28
    return-object p0
.end method

.method protected getHomeTaskView()Lcom/android/quickstep/views/TaskView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 6
    .line 7
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getStateManager()Lcom/android/launcher3/statemanager/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/statemanager/d<",
            "Lcom/android/quickstep/fallback/RecentsState;",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method protected handleStartHome(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->startHome()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 9
    .line 10
    move-object p1, p0

    .line 11
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 12
    .line 13
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->isStarted()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p1, p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->setOverviewStateEnabled(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setOverlayEnabled(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V
    .locals 0

    .line 3
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V

    .line 4
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast p0, Lcom/android/launcher3/statemanager/i;

    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p0

    sget-object p1, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    return-void
.end method

.method public initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;ILcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/quickstep/views/TaskContainer;ILcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast p0, Lcom/android/launcher3/statemanager/i;

    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object p0

    sget-object p1, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    return-void
.end method

.method public onGestureAnimationEnd()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mCurrentGestureEndTarget:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/GestureState$GestureEndTarget;->HOME:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->reset()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationEnd()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onGestureAnimationStartOnHome(Lcom/android/wm/shell/shared/i;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/systemui/shared/recents/model/Task;->from(Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onGestureAnimationStart(Lcom/android/wm/shell/shared/i;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public bridge synthetic onIsInDesktopModeChanged(IZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/window/d$a;->onIsInDesktopModeChanged(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPrepareGestureEndAnimation(Landroid/animation/AnimatorSet;Lcom/android/quickstep/GestureState$GestureEndTarget;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V
    .locals 10

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/quickstep/views/RecentsView;->onPrepareGestureEndAnimation(Landroid/animation/AnimatorSet;Lcom/android/quickstep/GestureState$GestureEndTarget;[Lcom/android/quickstep/RemoteTargetGluer$RemoteTargetHandle;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/android/quickstep/GestureState$GestureEndTarget;->RECENTS:Lcom/android/quickstep/GestureState$GestureEndTarget;

    .line 9
    .line 10
    if-ne p2, v0, :cond_0

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p2, p3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 15
    .line 16
    iget p2, p2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/RecentsView;->getTaskViewByTaskId(I)Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    new-instance v1, Lcom/android/launcher3/anim/V;

    .line 25
    .line 26
    const-wide/16 p2, 0x96

    .line 27
    .line 28
    invoke-direct {v1, p2, p3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 29
    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    const/4 v9, 0x0

    .line 33
    const/4 v3, 0x1

    .line 34
    const/4 v4, 0x0

    .line 35
    const-wide/16 v5, 0x96

    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    move-object v0, p0

    .line 39
    invoke-virtual/range {v0 .. v9}, Lcom/android/quickstep/views/RecentsView;->createTaskDismissAnimation(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/TaskView;ZZJZZZ)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Lcom/android/quickstep/fallback/f;

    .line 43
    .line 44
    invoke-direct {p0, v0}, Lcom/android/quickstep/fallback/f;-><init>(Lcom/android/quickstep/fallback/FallbackRecentsView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p0}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public onStateTransitionComplete(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 4

    .line 2
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LP1/k;

    invoke-virtual {v0, p1}, LP1/k;->K(Lcom/android/quickstep/fallback/RecentsState;)V

    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v0, Lcom/android/launcher3/views/k;

    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/quickstep/fallback/RecentsState;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    move-result v0

    if-nez v0, :cond_1

    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->reset()V

    .line 8
    :cond_1
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    if-ne p1, v0, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    :goto_0
    move v0, v2

    .line 9
    :goto_1
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverlayEnabled(Z)V

    .line 10
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    .line 11
    sget-object v3, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    if-eq p1, v3, :cond_4

    .line 12
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewSelectEnabled(Z)V

    .line 13
    :cond_4
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    move-result v1

    if-eqz v1, :cond_5

    if-eq p1, v3, :cond_5

    .line 14
    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 15
    :cond_5
    sget-object v1, Lcom/android/quickstep/fallback/RecentsState;->OVERVIEW_SPLIT_SELECT:Lcom/android/quickstep/fallback/RecentsState;

    if-eq p1, v1, :cond_6

    .line 16
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mSplitSelectStateController:Lcom/android/quickstep/util/SplitSelectStateController;

    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    :cond_6
    if-eqz v0, :cond_7

    .line 17
    sget-object p1, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    move-result p1

    if-nez p1, :cond_7

    .line 18
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mBlurUtils:Lcom/android/quickstep/views/BlurUtils;

    invoke-virtual {p0, v2}, Lcom/android/quickstep/views/BlurUtils;->setDrawLiveTileBelowRecents(Z)V

    :cond_7
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->onStateTransitionComplete(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public onStateTransitionStart(Lcom/android/quickstep/fallback/RecentsState;)V
    .locals 3

    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/FallbackRecentsView;->setOverviewStateEnabled(Z)V

    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v1, Lcom/android/launcher3/views/k;

    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/quickstep/fallback/RecentsState;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    check-cast v1, Lcom/android/launcher3/views/k;

    .line 7
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/android/quickstep/fallback/RecentsState;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    move-result v1

    .line 8
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewGridEnabled(Z)V

    .line 9
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isFullScreen()Z

    move-result v1

    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setOverviewFullscreenEnabled(Z)V

    .line 10
    sget-object v1, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    if-ne p1, v1, :cond_2

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setOverviewSelectEnabled(Z)V

    goto :goto_1

    .line 12
    :cond_2
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetModalVisuals()V

    .line 13
    :goto_1
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    move-result v2

    if-eqz v2, :cond_3

    if-ne p1, v1, :cond_4

    :cond_3
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setTaskBorderEnabled(Z)V

    .line 15
    :cond_4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setFreezeViewVisibility(Z)V

    return-void
.end method

.method public bridge synthetic onStateTransitionStart(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->onStateTransitionStart(Lcom/android/quickstep/fallback/RecentsState;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/android/quickstep/fallback/RecentsState;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/RecentsState;->isRecentsViewVisible()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public setCurrentTask(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setCurrentTask(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getTaskIdsForRunningTaskView()[I

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Ljava/util/Arrays;->stream([I)Ljava/util/stream/IntStream;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Lcom/android/quickstep/fallback/c;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/c;-><init>(Lcom/android/quickstep/fallback/FallbackRecentsView;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/stream/IntStream;->noneMatch(Ljava/util/function/IntPredicate;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/FallbackRecentsView;->setRunningTaskHidden(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public setModalStateEnabled(IZ)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setSelectedTask(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 8
    .line 9
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object p1, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/statemanager/i;

    .line 24
    .line 25
    sget-object v0, Lcom/android/quickstep/fallback/RecentsState;->MODAL_TASK:Lcom/android/quickstep/fallback/RecentsState;

    .line 26
    .line 27
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 34
    .line 35
    check-cast p0, Lcom/android/launcher3/statemanager/i;

    .line 36
    .line 37
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget-object p1, Lcom/android/quickstep/fallback/RecentsState;->DEFAULT:Lcom/android/quickstep/fallback/RecentsState;

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public setOverviewStateEnabled(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setOverviewStateEnabled(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/views/RecentsView;->mContainer:Landroid/content/Context;

    .line 7
    .line 8
    check-cast p1, Lcom/android/launcher3/statemanager/i;

    .line 9
    .line 10
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/android/quickstep/fallback/RecentsState;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->hasClearAllButton()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setDisallowScrollToClearAll(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/RecentsState;->hasAddDeskButton()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    xor-int/lit8 p1, p1, 0x1

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setDisallowScrollToAddDesk(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public setRunningTaskHidden(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    :cond_0
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->setRunningTaskHidden(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected shouldAddStubTaskView(Lcom/android/wm/shell/shared/i;)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Lcom/android/wm/shell/shared/i;->F(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->shouldAddStubTaskView(Lcom/android/wm/shell/shared/i;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/android/wm/shell/shared/i;->B()Landroid/app/TaskInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/android/systemui/shared/recents/model/Task;->from(Landroid/app/TaskInfo;)Lcom/android/systemui/shared/recents/model/Task;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/android/quickstep/fallback/FallbackRecentsView;->mHomeTask:Lcom/android/systemui/shared/recents/model/Task;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 28
    .line 29
    iget v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 30
    .line 31
    iget-object v0, v0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 32
    .line 33
    iget v0, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 34
    .line 35
    if-ne v1, v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-boolean v0, p0, Lcom/android/quickstep/views/RecentsView;->mLoadPlanEverApplied:Z

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0

    .line 49
    :cond_1
    invoke-super {p0, p1}, Lcom/android/quickstep/views/RecentsView;->shouldAddStubTaskView(Lcom/android/wm/shell/shared/i;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method public supportsAppPairs()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
