.class final Lp0/i$a;
.super Lkotlin/coroutines/jvm/internal/l;
.source "WindowInfoTrackerImpl.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lp0/i;->b(Landroid/app/Activity;)LI4/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/l;",
        "Lu4/p<",
        "LH4/u<",
        "-",
        "Lp0/j;",
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
    c = "androidx.window.layout.WindowInfoTrackerImpl$windowLayoutInfo$2"
    f = "WindowInfoTrackerImpl.kt"
    l = {
        0x3f
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field g:I

.field private synthetic h:Ljava/lang/Object;

.field final synthetic i:Lp0/i;

.field final synthetic j:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lp0/i;Landroid/app/Activity;Ll4/d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lp0/i;",
            "Landroid/app/Activity;",
            "Ll4/d<",
            "-",
            "Lp0/i$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lp0/i$a;->i:Lp0/i;

    .line 2
    .line 3
    iput-object p2, p0, Lp0/i$a;->j:Landroid/app/Activity;

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

.method public static synthetic b(LH4/u;Lp0/j;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lp0/i$a;->c(LH4/u;Lp0/j;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c(LH4/u;Lp0/j;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, LH4/x;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
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
    new-instance v0, Lp0/i$a;

    .line 2
    .line 3
    iget-object v1, p0, Lp0/i$a;->i:Lp0/i;

    .line 4
    .line 5
    iget-object p0, p0, Lp0/i$a;->j:Landroid/app/Activity;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0, p2}, Lp0/i$a;-><init>(Lp0/i;Landroid/app/Activity;Ll4/d;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, v0, Lp0/i$a;->h:Ljava/lang/Object;

    .line 11
    .line 12
    return-object v0
.end method

.method public final invoke(LH4/u;Ll4/d;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LH4/u<",
            "-",
            "Lp0/j;",
            ">;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lp0/i$a;->create(Ljava/lang/Object;Ll4/d;)Ll4/d;

    move-result-object p0

    check-cast p0, Lp0/i$a;

    sget-object p1, Lh4/t;->a:Lh4/t;

    invoke-virtual {p0, p1}, Lp0/i$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LH4/u;

    check-cast p2, Ll4/d;

    invoke-virtual {p0, p1, p2}, Lp0/i$a;->invoke(LH4/u;Ll4/d;)Ljava/lang/Object;

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
    iget v1, p0, Lp0/i$a;->g:I

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
    iget-object p1, p0, Lp0/i$a;->h:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, LH4/u;

    .line 30
    .line 31
    new-instance v1, Lp0/h;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Lp0/h;-><init>(LH4/u;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lp0/i$a;->i:Lp0/i;

    .line 37
    .line 38
    invoke-static {v3}, Lp0/i;->c(Lp0/i;)Lq0/a;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v4, p0, Lp0/i$a;->j:Landroid/app/Activity;

    .line 43
    .line 44
    new-instance v5, Lc0/b;

    .line 45
    .line 46
    invoke-direct {v5}, Lc0/b;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-interface {v3, v4, v5, v1}, Lq0/a;->a(Landroid/content/Context;Ljava/util/concurrent/Executor;LI/a;)V

    .line 50
    .line 51
    .line 52
    new-instance v3, Lp0/i$a$a;

    .line 53
    .line 54
    iget-object v4, p0, Lp0/i$a;->i:Lp0/i;

    .line 55
    .line 56
    invoke-direct {v3, v4, v1}, Lp0/i$a$a;-><init>(Lp0/i;LI/a;)V

    .line 57
    .line 58
    .line 59
    iput v2, p0, Lp0/i$a;->g:I

    .line 60
    .line 61
    invoke-static {p1, v3, p0}, LH4/s;->a(LH4/u;Lu4/a;Ll4/d;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    if-ne p0, v0, :cond_2

    .line 66
    .line 67
    return-object v0

    .line 68
    :cond_2
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 69
    .line 70
    return-object p0
.end method
