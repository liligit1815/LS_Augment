.class final Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "TasksRepository.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    c = "com.android.quickstep.recents.data.TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1"
    f = "TasksRepository.kt"
    l = {
        0x6d
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $task:Lcom/android/systemui/shared/recents/model/Task;

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/recents/data/TasksRepository;


# direct methods
.method constructor <init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/recents/data/TasksRepository;",
            "Lcom/android/systemui/shared/recents/model/Task;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 1
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
    new-instance p1, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 6
    .line 7
    invoke-direct {p1, v0, p0, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;-><init>(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)V

    .line 8
    .line 9
    .line 10
    return-object p1
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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->label:I

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
    iget-object p1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->this$0:Lcom/android/quickstep/recents/data/TasksRepository;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->$task:Lcom/android/systemui/shared/recents/model/Task;

    .line 30
    .line 31
    iput v2, p0, Lcom/android/quickstep/recents/data/TasksRepository$requestTaskData$1$thumbnailFetchDeferred$1;->label:I

    .line 32
    .line 33
    invoke-static {p1, v1, p0}, Lcom/android/quickstep/recents/data/TasksRepository;->access$fetchThumbnail(Lcom/android/quickstep/recents/data/TasksRepository;Lcom/android/systemui/shared/recents/model/Task;Ll4/d;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-ne p0, v0, :cond_2

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 41
    .line 42
    return-object p0
.end method
