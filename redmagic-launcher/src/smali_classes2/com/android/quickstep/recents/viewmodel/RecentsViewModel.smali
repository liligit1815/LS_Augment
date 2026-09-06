.class public final Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;
.super Ljava/lang/Object;
.source "RecentsViewModel.kt"


# instance fields
.field private final recentsTasksRepository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

.field private final recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/data/RecentTasksRepository;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;)V
    .locals 1

    .line 1
    const-string v0, "recentsTasksRepository"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "recentsViewData"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsTasksRepository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final onReset()V
    .locals 1

    .line 1
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->updateVisibleTasks(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final refreshAllTaskData()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsTasksRepository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p0, v0}, Lcom/android/quickstep/recents/data/RecentTasksRepository;->getAllTaskData(Z)LI4/d;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final setOverlayEnabled(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getOverlayEnabled()LI4/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final setRunningTaskShowScreenshot(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getRunningTaskShowScreenshot()LI4/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final updateCentralTaskIds(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "taskIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getCentralTaskIds()LI4/r;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final updateRunningTask(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "taskIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getRunningTaskIds()LI4/r;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final updateTasksFullyVisible(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "taskIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getSettledFullyVisibleTaskIds()LI4/r;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, LI4/r;->setValue(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final updateVisibleTasks(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "visibleTaskIdList"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsTasksRepository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 7
    .line 8
    invoke-static {p1}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-interface {p0, p1}, Lcom/android/quickstep/recents/data/RecentTasksRepository;->setVisibleTasks(Ljava/util/Set;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final waitForRunningTaskShowScreenshotToUpdate(Ll4/d;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsViewData:Lcom/android/quickstep/recents/viewmodel/RecentsViewData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewData;->getRunningTaskShowScreenshot()LI4/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForRunningTaskShowScreenshotToUpdate$$inlined$filter$1;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForRunningTaskShowScreenshotToUpdate$$inlined$filter$1;-><init>(LI4/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, p1}, LI4/f;->n(LI4/d;Ll4/d;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-ne p0, p1, :cond_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 24
    .line 25
    return-object p0
.end method

.method public final waitForThumbnailsToUpdate(Ljava/util/Map;Ll4/d;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/util/Map$Entry;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel;->recentsTasksRepository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 40
    .line 41
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/Number;

    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-interface {v2, v3}, Lcom/android/quickstep/recents/data/RecentTasksRepository;->getThumbnailById(I)LI4/d;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    new-instance v3, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;

    .line 56
    .line 57
    invoke-direct {v3, v2, v1}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$lambda$1$$inlined$filter$1;-><init>(LI4/d;Ljava/util/Map$Entry;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-static {v0}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/4 p1, 0x0

    .line 69
    new-array p1, p1, [LI4/d;

    .line 70
    .line 71
    invoke-interface {p0, p1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, [LI4/d;

    .line 76
    .line 77
    new-instance p1, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;

    .line 78
    .line 79
    invoke-direct {p1, p0}, Lcom/android/quickstep/recents/viewmodel/RecentsViewModel$waitForThumbnailsToUpdate$$inlined$combine$1;-><init>([LI4/d;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, p2}, LI4/f;->n(LI4/d;Ll4/d;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-ne p0, p1, :cond_2

    .line 91
    .line 92
    return-object p0

    .line 93
    :cond_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_3
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 97
    .line 98
    return-object p0
.end method
