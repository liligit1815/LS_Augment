.class final Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;
.super Lkotlin/coroutines/jvm/internal/l;
.source "OverviewCommandHelper.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;IZ)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;
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
    c = "com.android.quickstep.OverviewCommandHelper$addCommand$2"
    f = "OverviewCommandHelper.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/android/quickstep/OverviewCommandHelper;


# direct methods
.method constructor <init>(Lcom/android/quickstep/OverviewCommandHelper;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/OverviewCommandHelper;",
            "Ll4/d<",
            "-",
            "Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

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
    new-instance p1, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;-><init>(Lcom/android/quickstep/OverviewCommandHelper;Ll4/d;)V

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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

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
    iget v0, p0, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/OverviewCommandHelper$addCommand$2;->this$0:Lcom/android/quickstep/OverviewCommandHelper;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/quickstep/OverviewCommandHelper;->access$processNextCommand(Lcom/android/quickstep/OverviewCommandHelper;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 20
    .line 21
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 22
    .line 23
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method
