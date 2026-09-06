.class final Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper;->processNextCommand()V
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
    c = "com.android.quickstep.OverviewCommandHelper$processNextCommand$1$1"
    f = "OverviewCommandHelper.kt"
    l = {
        0xec
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field Z$0:Z

.field label:I

.field final synthetic this$0:Lcom/android/quickstep/OverviewCommandHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper;",
            "Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

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
    new-instance p1, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 6
    .line 7
    invoke-direct {p1, v0, p0, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)V

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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->label:I

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
    iget-boolean p0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->Z$0:Z

    .line 13
    .line 14
    :try_start_0
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 21
    .line 22
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0

    .line 28
    :cond_1
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 34
    .line 35
    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    const-string v4, "OverviewCommandHelper.executeCommandWithTimeout"

    .line 42
    .line 43
    invoke-static {v4}, LK0/a;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    :try_start_1
    new-instance v4, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-direct {v4, p1, v1, v5}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)V

    .line 50
    .line 51
    .line 52
    iput-boolean v3, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->Z$0:Z

    .line 53
    .line 54
    iput v2, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->label:I

    .line 55
    .line 56
    const-wide/16 v1, 0x1388

    .line 57
    .line 58
    invoke-static {v1, v2, v4, p0}, LF4/U0;->c(JLu4/p;Ll4/d;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 62
    if-ne p0, v0, :cond_3

    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_3
    move p0, v3

    .line 66
    :goto_0
    :try_start_2
    sget-object p1, Lh4/t;->a:Lh4/t;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    invoke-static {}, LK0/a;->b()V

    .line 71
    .line 72
    .line 73
    :cond_4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 74
    .line 75
    return-object p0

    .line 76
    :catchall_1
    move-exception p1

    .line 77
    move p0, v3

    .line 78
    :goto_1
    if-eqz p0, :cond_5

    .line 79
    .line 80
    invoke-static {}, LK0/a;->b()V

    .line 81
    .line 82
    .line 83
    :cond_5
    throw p1
.end method
