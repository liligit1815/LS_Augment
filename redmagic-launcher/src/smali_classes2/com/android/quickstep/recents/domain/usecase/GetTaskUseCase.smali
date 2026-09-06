.class public final Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;
.super Ljava/lang/Object;
.source "GetTaskUseCase.kt"


# instance fields
.field private final repository:Lcom/android/quickstep/recents/data/RecentTasksRepository;


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/data/RecentTasksRepository;)V
    .locals 1

    .line 1
    const-string v0, "repository"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;->repository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final invoke(I)LI4/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "LI4/d<",
            "Lcom/android/quickstep/recents/domain/model/TaskModel;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;->repository:Lcom/android/quickstep/recents/data/RecentTasksRepository;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/quickstep/recents/data/RecentTasksRepository;->getTaskDataById(I)LI4/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase$invoke$$inlined$map$1;-><init>(LI4/d;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method
