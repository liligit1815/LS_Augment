.class final synthetic Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1$1;
.super Lkotlin/jvm/internal/a;
.source "TaskView.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1000
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/a;",
        "Lu4/p<",
        "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 7

    .line 1
    const-string v5, "updateTaskViewState(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;)V"

    .line 2
    .line 3
    const/4 v6, 0x4

    .line 4
    const/4 v1, 0x2

    .line 5
    const-class v3, Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    const-string v4, "updateTaskViewState"

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
.method public final invoke(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lkotlin/jvm/internal/a;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/android/quickstep/views/TaskView;

    invoke-static {p0, p1, p2}, Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1;->access$invokeSuspend$updateTaskViewState(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView$onAttachedToWindow$1$1$1;->invoke(Lcom/android/quickstep/recents/ui/viewmodel/TaskTileUiState;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
