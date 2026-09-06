.class final LJ4/i$a$a;
.super Ljava/lang/Object;
.source "Merge.kt"

# interfaces
.implements LI4/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LJ4/i$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "LI4/e;"
    }
.end annotation


# instance fields
.field final synthetic g:Lkotlin/jvm/internal/C;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/internal/C<",
            "LF4/u0;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic h:LF4/I;

.field final synthetic i:LJ4/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LJ4/i<",
            "TT;TR;>;"
        }
    .end annotation
.end field

.field final synthetic j:LI4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI4/e<",
            "TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlin/jvm/internal/C;LF4/I;LJ4/i;LI4/e;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/internal/C<",
            "LF4/u0;",
            ">;",
            "LF4/I;",
            "LJ4/i<",
            "TT;TR;>;",
            "LI4/e<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LJ4/i$a$a;->g:Lkotlin/jvm/internal/C;

    .line 2
    .line 3
    iput-object p2, p0, LJ4/i$a$a;->h:LF4/I;

    .line 4
    .line 5
    iput-object p3, p0, LJ4/i$a$a;->i:LJ4/i;

    .line 6
    .line 7
    iput-object p4, p0, LJ4/i$a$a;->j:LI4/e;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p2, LJ4/i$a$a$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, LJ4/i$a$a$b;

    .line 7
    .line 8
    iget v1, v0, LJ4/i$a$a$b;->l:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, LJ4/i$a$a$b;->l:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LJ4/i$a$a$b;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, LJ4/i$a$a$b;-><init>(LJ4/i$a$a;Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, LJ4/i$a$a$b;->j:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LJ4/i$a$a$b;->l:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p0, v0, LJ4/i$a$a$b;->i:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, LF4/u0;

    .line 41
    .line 42
    iget-object p1, v0, LJ4/i$a$a$b;->h:Ljava/lang/Object;

    .line 43
    .line 44
    iget-object p0, v0, LJ4/i$a$a$b;->g:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p0, LJ4/i$a$a;

    .line 47
    .line 48
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    .line 55
    .line 56
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_2
    invoke-static {p2}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, LJ4/i$a$a;->g:Lkotlin/jvm/internal/C;

    .line 64
    .line 65
    iget-object p2, p2, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p2, LF4/u0;

    .line 68
    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    new-instance v2, LJ4/j;

    .line 72
    .line 73
    invoke-direct {v2}, LJ4/j;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-interface {p2, v2}, LF4/u0;->c(Ljava/util/concurrent/CancellationException;)V

    .line 77
    .line 78
    .line 79
    iput-object p0, v0, LJ4/i$a$a$b;->g:Ljava/lang/Object;

    .line 80
    .line 81
    iput-object p1, v0, LJ4/i$a$a$b;->h:Ljava/lang/Object;

    .line 82
    .line 83
    iput-object p2, v0, LJ4/i$a$a$b;->i:Ljava/lang/Object;

    .line 84
    .line 85
    iput v3, v0, LJ4/i$a$a$b;->l:I

    .line 86
    .line 87
    invoke-interface {p2, v0}, LF4/u0;->P(Ll4/d;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    if-ne p2, v1, :cond_3

    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_3
    :goto_1
    iget-object p2, p0, LJ4/i$a$a;->g:Lkotlin/jvm/internal/C;

    .line 95
    .line 96
    iget-object v0, p0, LJ4/i$a$a;->h:LF4/I;

    .line 97
    .line 98
    sget-object v2, LF4/K;->j:LF4/K;

    .line 99
    .line 100
    new-instance v3, LJ4/i$a$a$a;

    .line 101
    .line 102
    iget-object v1, p0, LJ4/i$a$a;->i:LJ4/i;

    .line 103
    .line 104
    iget-object p0, p0, LJ4/i$a$a;->j:LI4/e;

    .line 105
    .line 106
    const/4 v4, 0x0

    .line 107
    invoke-direct {v3, v1, p0, p1, v4}, LJ4/i$a$a$a;-><init>(LJ4/i;LI4/e;Ljava/lang/Object;Ll4/d;)V

    .line 108
    .line 109
    .line 110
    const/4 v4, 0x1

    .line 111
    const/4 v5, 0x0

    .line 112
    const/4 v1, 0x0

    .line 113
    invoke-static/range {v0 .. v5}, LF4/h;->d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iput-object p0, p2, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 118
    .line 119
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 120
    .line 121
    return-object p0
.end method
