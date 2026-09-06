.class public interface abstract Lcom/android/quickstep/recents/data/RecentTasksRepository;
.super Ljava/lang/Object;
.source "RecentTasksRepository.kt"


# direct methods
.method public static synthetic getAllTaskData$default(Lcom/android/quickstep/recents/data/RecentTasksRepository;ZILjava/lang/Object;)LI4/d;
    .locals 0

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    and-int/lit8 p2, p2, 0x1

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/quickstep/recents/data/RecentTasksRepository;->getAllTaskData(Z)LI4/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 14
    .line 15
    const-string p1, "Super calls with default arguments not supported in this target, function: getAllTaskData"

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw p0
.end method


# virtual methods
.method public abstract getAllTaskData(Z)LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "LI4/d<",
            "Ljava/util/List<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getCurrentThumbnailById(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;
.end method

.method public abstract getTaskDataById(I)LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "LI4/d<",
            "Lcom/android/systemui/shared/recents/model/Task;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getThumbnailById(I)LI4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "LI4/d<",
            "Lcom/android/systemui/shared/recents/model/ThumbnailData;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setVisibleTasks(Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method
