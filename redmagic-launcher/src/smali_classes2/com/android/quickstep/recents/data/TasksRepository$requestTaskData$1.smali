.class final Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "TasksRepository.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository;->requestTaskData(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/p<",
        "LF4/I;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "com.android.quickstep.recents.data.TasksRepository$requestTaskData$1"
    f = "TasksRepository.kt"
    l = {
        0x6f
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $task:Lcom/android/systemui/shared/recents/model/Task;

.field final synthetic $taskId:I

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/recents/data/TasksRepository;


# direct methods
.method constructor <init>(ILcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/android/quickstep/recents/data/TasksRepository;",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$taskId:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ll4/d<",
            "*>;)",
            "Ll4/d<",
            "Lh4/t;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$taskId:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;-><init>(ILcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, v0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    return-object v0
.end method

.method public final invoke(LF4/I;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/I;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget v2, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->label:I

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    if-ne v2, v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

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
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->L$0:Ljava/lang/Object;

    .line 28
    .line 29
    move-object v2, p1

    .line 30
    check-cast v2, LF4/I;

    .line 31
    .line 32
    iget p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$taskId:I

    .line 33
    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v4, "requestTaskData: "

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v3, "TasksRepository"

    .line 52
    .line 53
    invoke-static {v3, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    new-instance v5, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;

    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 61
    .line 62
    const/4 v8, 0x0

    .line 63
    invoke-direct {v5, p1, v3, v8}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 64
    .line 65
    .line 66
    const/4 v6, 0x3

    .line 67
    const/4 v7, 0x0

    .line 68
    const/4 v3, 0x0

    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-static/range {v2 .. v7}, LF4/h;->b(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/P;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance v5, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$iconFetchDeferred$1;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 79
    .line 80
    invoke-direct {v5, v3, v4, v8}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$iconFetchDeferred$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 81
    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    const/4 v4, 0x0

    .line 85
    invoke-static/range {v2 .. v7}, LF4/h;->b(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/P;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const/4 v3, 0x2

    .line 90
    new-array v3, v3, [LF4/P;

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    aput-object p1, v3, v4

    .line 94
    .line 95
    aput-object v2, v3, v0

    .line 96
    .line 97
    iput v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->label:I

    .line 98
    .line 99
    invoke-static {v3, p0}, LF4/f;->a([LF4/P;Ll4/d;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    if-ne p0, v1, :cond_2

    .line 104
    .line 105
    return-object v1

    .line 106
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 107
    .line 108
    return-object p0
.end method
