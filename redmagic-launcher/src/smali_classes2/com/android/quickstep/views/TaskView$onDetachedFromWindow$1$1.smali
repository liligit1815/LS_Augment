.class final Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "TaskView.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/TaskView;->onDetachedFromWindow()V
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
    c = "com.android.quickstep.views.TaskView$onDetachedFromWindow$1$1"
    f = "TaskView.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $coroutineJobsToCancel:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LF4/u0;",
            ">;"
        }
    .end annotation
.end field

.field label:I


# direct methods
.method constructor <init>(Ljava/util/List;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LF4/u0;",
            ">;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->$coroutineJobsToCancel:Ljava/util/List;

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/l;-><init>(ILl4/d;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Ll4/d;)Ll4/d;
    .locals 0
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
    new-instance p1, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->$coroutineJobsToCancel:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;-><init>(Ljava/util/List;Ll4/d;)V

    .line 6
    .line 7
    .line 8
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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/views/TaskView$onDetachedFromWindow$1$1;->$coroutineJobsToCancel:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string v0, "TaskView.onDetachedFromWindow.cancellingJobs"

    .line 20
    .line 21
    invoke-static {v0}, LK0/a;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, LF4/u0;

    .line 39
    .line 40
    const-string v1, "TaskView detaching from window"

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-static {v0, v1, v3, v2, v3}, LF4/x0;->e(LF4/u0;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    sget-object p0, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-static {}, LK0/a;->b()V

    .line 55
    .line 56
    .line 57
    :cond_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 58
    .line 59
    return-object p0

    .line 60
    :goto_1
    if-eqz p1, :cond_3

    .line 61
    .line 62
    invoke-static {}, LK0/a;->b()V

    .line 63
    .line 64
    .line 65
    :cond_3
    throw p0

    .line 66
    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 67
    .line 68
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 69
    .line 70
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0
.end method
