.class final synthetic Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$state$1;
.super Lkotlin/jvm/internal/a;
.source "TaskViewModel.kt"

# interfaces
.implements Lu4/s;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;-><init>(Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;Li2/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/a;",
        "Lu4/s<",
        "Ljava/util/List<",
        "+",
        "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
        ">;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "Ll4/d<",
        "-",
        "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "mapToTaskTile(Ljava/util/List;ZZZ)Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;"

    .line 2
    .line 3
    const/4 v6, 0x4

    .line 4
    const/4 v1, 0x5

    .line 5
    const-class v3, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 6
    .line 7
    const-string v4, "mapToTaskTile"

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v2, p1

    .line 11
    invoke-direct/range {v0 .. v6}, Lkotlin/jvm/internal/a;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/List;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    check-cast p5, Ll4/d;

    invoke-virtual/range {p0 .. p5}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$state$1;->invoke(Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;ZZZ",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lkotlin/jvm/internal/a;->receiver:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->access$state$mapToTaskTile(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;Ljava/util/List;ZZZLl4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
