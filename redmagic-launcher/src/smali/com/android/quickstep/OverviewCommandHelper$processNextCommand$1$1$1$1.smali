.class final Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;
.super Lkotlin/coroutines/jvm/internal/l;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    c = "com.android.quickstep.OverviewCommandHelper$processNextCommand$1$1$1$1"
    f = "OverviewCommandHelper.kt"
    l = {
        0xed
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

.field private synthetic L$0:Ljava/lang/Object;

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
            "Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

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
    .locals 2
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
    new-instance v0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, v0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->L$0:Ljava/lang/Object;

    .line 11
    .line 12
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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

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
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->label:I

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
    iget-object v0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, LF4/I;

    .line 15
    .line 16
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

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
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->L$0:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p1, LF4/I;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 38
    .line 39
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->L$0:Ljava/lang/Object;

    .line 40
    .line 41
    iput v2, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->label:I

    .line 42
    .line 43
    invoke-static {v1, v3, p0}, Lcom/android/quickstep/OverviewCommandHelper;->access$executeCommandSuspended(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;Ll4/d;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-ne v1, v0, :cond_2

    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_2
    move-object v0, p1

    .line 51
    :goto_0
    invoke-static {v0}, LF4/J;->f(LF4/I;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$processNextCommand$1$1$1$1;->$command:Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 57
    .line 58
    invoke-static {p1, p0}, Lcom/android/quickstep/OverviewCommandHelper;->access$onCommandFinished(Lcom/android/quickstep/OverviewCommandHelper;Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 62
    .line 63
    return-object p0
.end method
