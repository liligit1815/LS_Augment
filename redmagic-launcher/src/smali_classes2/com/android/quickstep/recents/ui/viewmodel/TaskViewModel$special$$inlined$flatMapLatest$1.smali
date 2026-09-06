.class public final Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "Merge.kt"

# interfaces
.implements Lu4/q;


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
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/q<",
        "LI4/e<",
        "-",
        "Ljava/util/List<",
        "+",
        "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
        ">;>;",
        "Ljava/util/Set<",
        "+",
        "Ljava/lang/Integer;",
        ">;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.recents.ui.viewmodel.TaskViewModel$special$$inlined$flatMapLatest$1"
    f = "TaskViewModel.kt"
    l = {
        0xbd
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field synthetic L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;


# direct methods
.method public constructor <init>(Ll4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 2
    .line 3
    const/4 p2, 0x3

    .line 4
    invoke-direct {p0, p2, p1}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final invoke(LI4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-",
            "Ljava/util/List<",
            "+",
            "Lcom/android/quickstep/recents/ui/viewmodel/TaskData;",
            ">;>;",
            "Ljava/util/Set<",
            "+",
            "Ljava/lang/Integer;",
            ">;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;

    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    invoke-direct {v0, p3, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;-><init>(Ll4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V

    iput-object p1, v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    iput-object p2, v0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    sget-object p0, Lh4/t;->a:Lh4/t;

    invoke-virtual {v0, p0}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LI4/e;

    check-cast p3, Ll4/d;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->invoke(LI4/e;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 17
    .line 18
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    throw p0

    .line 24
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->L$0:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LI4/e;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->L$1:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ljava/util/Set;

    .line 34
    .line 35
    new-instance v3, Ljava/util/ArrayList;

    .line 36
    .line 37
    const/16 v4, 0xa

    .line 38
    .line 39
    invoke-static {v1, v4}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Ljava/lang/Number;

    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    iget-object v5, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 67
    .line 68
    invoke-static {v5}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;->access$getGetTaskUseCase$p(Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v5, v4}, Lcom/android/quickstep/recents/domain/usecase/GetTaskUseCase;->invoke(I)LI4/d;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    new-instance v6, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$lambda$1$$inlined$map$1;

    .line 77
    .line 78
    invoke-direct {v6, v5, v4}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$lambda$1$$inlined$map$1;-><init>(LI4/d;I)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    invoke-static {v3}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const/4 v3, 0x0

    .line 90
    new-array v3, v3, [LI4/d;

    .line 91
    .line 92
    invoke-interface {v1, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, [LI4/d;

    .line 97
    .line 98
    new-instance v3, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;

    .line 99
    .line 100
    iget-object v4, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->this$0:Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;

    .line 101
    .line 102
    invoke-direct {v3, v1, v4}, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$taskData$lambda$2$$inlined$combine$1;-><init>([LI4/d;Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel;)V

    .line 103
    .line 104
    .line 105
    iput v2, p0, Lcom/android/quickstep/recents/ui/viewmodel/TaskViewModel$special$$inlined$flatMapLatest$1;->label:I

    .line 106
    .line 107
    invoke-static {p1, v3, p0}, LI4/f;->l(LI4/e;LI4/d;Ll4/d;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    if-ne p0, v0, :cond_3

    .line 112
    .line 113
    return-object v0

    .line 114
    :cond_3
    :goto_1
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 115
    .line 116
    return-object p0
.end method
