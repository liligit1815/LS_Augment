.class public final LI4/q$b$a;
.super Lkotlin/coroutines/jvm/internal/l;
.source "Zip.kt"

# interfaces
.implements Lu4/q;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LI4/q$b;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;
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
        "-TR;>;[",
        "Ljava/lang/Object;",
        "Ll4/d<",
        "-",
        "Lh4/t;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/f;
    c = "kotlinx.coroutines.flow.FlowKt__ZipKt$combine$$inlined$combineUnsafe$FlowKt__ZipKt$2$2"
    f = "Zip.kt"
    l = {
        0x103,
        0x102
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field g:I

.field private synthetic h:Ljava/lang/Object;

.field synthetic i:Ljava/lang/Object;

.field final synthetic j:Lu4/s;


# direct methods
.method public constructor <init>(Ll4/d;Lu4/s;)V
    .locals 0

    .line 1
    iput-object p2, p0, LI4/q$b$a;->j:Lu4/s;

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
.method public final invoke(LI4/e;[Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI4/e<",
            "-TR;>;[",
            "Ljava/lang/Object;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance v0, LI4/q$b$a;

    iget-object p0, p0, LI4/q$b$a;->j:Lu4/s;

    invoke-direct {v0, p3, p0}, LI4/q$b$a;-><init>(Ll4/d;Lu4/s;)V

    iput-object p1, v0, LI4/q$b$a;->h:Ljava/lang/Object;

    iput-object p2, v0, LI4/q$b$a;->i:Ljava/lang/Object;

    sget-object p0, Lh4/t;->a:Lh4/t;

    invoke-virtual {v0, p0}, LI4/q$b$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, LI4/e;

    check-cast p2, [Ljava/lang/Object;

    check-cast p3, Ll4/d;

    invoke-virtual {p0, p1, p2, p3}, LI4/q$b$a;->invoke(LI4/e;[Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, LI4/q$b$a;->g:I

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    if-eq v1, v3, :cond_1

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    goto :goto_2

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

    .line 27
    :cond_1
    iget-object v1, p0, LI4/q$b$a;->h:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v1, LI4/e;

    .line 30
    .line 31
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    move-object v9, p0

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, LI4/q$b$a;->h:Ljava/lang/Object;

    .line 40
    .line 41
    move-object v1, p1

    .line 42
    check-cast v1, LI4/e;

    .line 43
    .line 44
    iget-object p1, p0, LI4/q$b$a;->i:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, [Ljava/lang/Object;

    .line 47
    .line 48
    iget-object v4, p0, LI4/q$b$a;->j:Lu4/s;

    .line 49
    .line 50
    const/4 v5, 0x0

    .line 51
    aget-object v5, p1, v5

    .line 52
    .line 53
    aget-object v6, p1, v3

    .line 54
    .line 55
    aget-object v7, p1, v2

    .line 56
    .line 57
    const/4 v8, 0x3

    .line 58
    aget-object v8, p1, v8

    .line 59
    .line 60
    iput-object v1, p0, LI4/q$b$a;->h:Ljava/lang/Object;

    .line 61
    .line 62
    iput v3, p0, LI4/q$b$a;->g:I

    .line 63
    .line 64
    const/4 p1, 0x6

    .line 65
    invoke-static {p1}, Lkotlin/jvm/internal/n;->c(I)V

    .line 66
    .line 67
    .line 68
    move-object v9, p0

    .line 69
    invoke-interface/range {v4 .. v9}, Lu4/s;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/4 p0, 0x7

    .line 74
    invoke-static {p0}, Lkotlin/jvm/internal/n;->c(I)V

    .line 75
    .line 76
    .line 77
    if-ne p1, v0, :cond_3

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 81
    iput-object p0, v9, LI4/q$b$a;->h:Ljava/lang/Object;

    .line 82
    .line 83
    iput v2, v9, LI4/q$b$a;->g:I

    .line 84
    .line 85
    invoke-interface {v1, p1, v9}, LI4/e;->emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-ne p0, v0, :cond_4

    .line 90
    .line 91
    :goto_1
    return-object v0

    .line 92
    :cond_4
    :goto_2
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 93
    .line 94
    return-object p0
.end method
