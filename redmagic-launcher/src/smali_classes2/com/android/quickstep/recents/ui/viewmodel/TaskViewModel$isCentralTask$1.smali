.class final Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "TaskViewModel.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;-><init>(Lcom/android/quickstep/views/TaskViewType;Lcom/android/quickstep/recents/viewmodel/RecentsViewData;Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;Lcom/android/quickstep/recents/domain/usecase/GetSysUiStatusNavFlagsUseCase;Lcom/android/quickstep/recents/domain/usecase/IsThumbnailValidUseCase;Lcom/android/quickstep/recents/domain/usecase/GetThumbnailPositionUseCase;Li2/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/q<",
        "Ljava/util/Set<",
        "+",
        "Ljava/lang/Integer;",
        ">;",
        "Ljava/util/Set<",
        "+",
        "Ljava/lang/Integer;",
        ">;",
        "Ll4/d<",
        "-",
        "Ljava/lang/Boolean;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.recents.ui.viewmodel.TaskViewModel$isCentralTask$1"
    f = "TaskViewModel.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Ll4/d;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0, p1}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/util/Set;

    check-cast p2, Ljava/util/Set;

    check-cast p3, Ll4/d;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->invoke(Ljava/util/Set;Ljava/util/Set;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ljava/util/Set;Ljava/util/Set;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll4/d<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 2
    new-instance p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;

    invoke-direct {p0, p3}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;-><init>(Ll4/d;)V

    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->L$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->L$1:Ljava/lang/Object;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->L$0:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/Set;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$isCentralTask$1;->L$1:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Ljava/util/Set;

    .line 18
    .line 19
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0}, Lkotlin/coroutines/jvm/internal/b;->a(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 31
    .line 32
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p0
.end method
