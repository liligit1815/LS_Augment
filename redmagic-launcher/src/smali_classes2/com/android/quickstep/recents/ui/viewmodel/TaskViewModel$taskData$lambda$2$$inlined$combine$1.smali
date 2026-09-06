.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;
.super Ljava/lang/Object;
.source "SafeCollector.common.kt"

# interfaces
.implements LI4/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;-><init>(Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;Li2/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LI4/d<",
        "Ljava/util/List<",
        "+",
        "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic $flowArray$inlined:[LI4/d;

.field final synthetic receiver$inlined:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;


# direct methods
.method public constructor <init>([LI4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;->$flowArray$inlined:[LI4/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;->receiver$inlined:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public collect(LI4/e;Ll4/d;)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;->$flowArray$inlined:[LI4/d;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$2;-><init>([LI4/d;)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$3;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;->receiver$inlined:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 12
    .line 13
    invoke-direct {v2, v3, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1$3;-><init>(Ll4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0, v1, v2, p2}, LJ4/k;->a(LI4/e;[LI4/d;Lu4/a;Lu4/q;Ll4/d;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-ne p0, p1, :cond_0

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 28
    .line 29
    return-object p0
.end method
