.class final Lj0/a$b;
.super Lkotlin/coroutines/jvm/internal/l;
.source "FoldingFeatureObserver.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lj0/a;->e(Landroid/app/Activity;)V
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
    c = "androidx.slidingpanelayout.widget.FoldingFeatureObserver$registerLayoutStateChangeCallback$1"
    f = "FoldingFeatureObserver.kt"
    l = {
        0x61
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field g:I

.field final synthetic h:Lj0/a;

.field final synthetic i:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lj0/a;Landroid/app/Activity;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lj0/a;",
            "Landroid/app/Activity;",
            "Ll4/d<",
            "-",
            "Lj0/a$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lj0/a$b;->h:Lj0/a;

    .line 2
    .line 3
    iput-object p2, p0, Lj0/a$b;->i:Landroid/app/Activity;

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
    new-instance p1, Lj0/a$b;

    .line 2
    .line 3
    iget-object v0, p0, Lj0/a$b;->h:Lj0/a;

    .line 4
    .line 5
    iget-object p0, p0, Lj0/a$b;->i:Landroid/app/Activity;

    .line 6
    .line 7
    invoke-direct {p1, v0, p0, p2}, Lj0/a$b;-><init>(Lj0/a;Landroid/app/Activity;Ll4/d;)V

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
    invoke-virtual {p0, p1, p2}, Lj0/a$b;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lj0/a$b;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lj0/a$b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LF4/I;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lj0/a$b;->invoke(LF4/I;Ll4/d;)Ljava/lang/Object;

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
    iget v1, p0, Lj0/a$b;->g:I

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
    iget-object p1, p0, Lj0/a$b;->h:Lj0/a;

    .line 28
    .line 29
    invoke-static {p1}, Lj0/a;->c(Lj0/a;)Lp0/f;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v1, p0, Lj0/a$b;->i:Landroid/app/Activity;

    .line 34
    .line 35
    invoke-interface {p1, v1}, Lp0/f;->b(Landroid/app/Activity;)LI4/d;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v1, p0, Lj0/a$b;->h:Lj0/a;

    .line 40
    .line 41
    new-instance v3, Lj0/a$b$b;

    .line 42
    .line 43
    invoke-direct {v3, p1, v1}, Lj0/a$b$b;-><init>(LI4/d;Lj0/a;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v3}, LI4/f;->i(LI4/d;)LI4/d;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v1, p0, Lj0/a$b;->h:Lj0/a;

    .line 51
    .line 52
    new-instance v3, Lj0/a$b$a;

    .line 53
    .line 54
    invoke-direct {v3, v1}, Lj0/a$b$a;-><init>(Lj0/a;)V

    .line 55
    .line 56
    .line 57
    iput v2, p0, Lj0/a$b;->g:I

    .line 58
    .line 59
    invoke-interface {p1, v3, p0}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    if-ne p0, v0, :cond_2

    .line 64
    .line 65
    return-object v0

    .line 66
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 67
    .line 68
    return-object p0
.end method
