.class final LJ4/e$a;
.super Lkotlin/coroutines/jvm/internal/l;
.source "ChannelFlow.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ4/e;->d(LJ4/e;LI4/e;Ll4/d;)Ljava/lang/Object;
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
    c = "kotlinx.coroutines.flow.internal.ChannelFlow$collect$2"
    f = "ChannelFlow.kt"
    l = {
        0x77
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field g:I

.field private synthetic h:Ljava/lang/Object;

.field final synthetic i:LI4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/e<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic j:LJ4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LJ4/e<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(LI4/e;LJ4/e;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TT;>;",
            "LJ4/e<",
            "TT;>;",
            "Ll4/d<",
            "-",
            "LJ4/e$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LJ4/e$a;->i:LI4/e;

    .line 2
    .line 3
    iput-object p2, p0, LJ4/e$a;->j:LJ4/e;

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
    new-instance v0, LJ4/e$a;

    .line 2
    .line 3
    iget-object v1, p0, LJ4/e$a;->i:LI4/e;

    .line 4
    .line 5
    iget-object p0, p0, LJ4/e$a;->j:LJ4/e;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p2}, LJ4/e$a;-><init>(LI4/e;LJ4/e;Ll4/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, v0, LJ4/e$a;->h:Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, LJ4/e$a;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, LJ4/e$a;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, LJ4/e$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, LJ4/e$a;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

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
    iget v1, p0, LJ4/e$a;->g:I

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
    iget-object p1, p0, LJ4/e$a;->h:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LF4/I;

    .line 30
    .line 31
    iget-object v1, p0, LJ4/e$a;->i:LI4/e;

    .line 32
    .line 33
    iget-object v3, p0, LJ4/e$a;->j:LJ4/e;

    .line 34
    .line 35
    invoke-virtual {v3, p1}, LJ4/e;->i(LF4/I;)LH4/w;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput v2, p0, LJ4/e$a;->g:I

    .line 40
    .line 41
    invoke-static {v1, p1, p0}, LI4/f;->k(LI4/e;LH4/w;Ll4/d;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-ne p0, v0, :cond_2

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 49
    .line 50
    return-object p0
.end method
