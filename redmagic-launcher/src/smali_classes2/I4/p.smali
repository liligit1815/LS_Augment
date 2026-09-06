.class final synthetic LI4/p;
.super Ljava/lang/Object;
.source "Reduce.kt"


# direct methods
.method public static final a(LI4/d;Ll4/d;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/d<",
            "+TT;>;",
            "Ll4/d<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, LI4/p$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, LI4/p$b;

    .line 7
    .line 8
    iget v1, v0, LI4/p$b;->j:I

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
    iput v1, v0, LI4/p$b;->j:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, LI4/p$b;

    .line 21
    .line 22
    invoke-direct {v0, p1}, LI4/p$b;-><init>(Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, LI4/p$b;->i:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, LI4/p$b;->j:I

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
    iget-object p0, v0, LI4/p$b;->h:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, LI4/p$a;

    .line 41
    .line 42
    iget-object v0, v0, LI4/p$b;->g:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, Lkotlin/jvm/internal/C;

    .line 45
    .line 46
    :try_start_0
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch LJ4/a; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :catch_0
    move-exception p1

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
    invoke-static {p1}, Lh4/n;->b(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Lkotlin/jvm/internal/C;

    .line 64
    .line 65
    invoke-direct {p1}, Lkotlin/jvm/internal/C;-><init>()V

    .line 66
    .line 67
    .line 68
    sget-object v2, LJ4/s;->a:LK4/D;

    .line 69
    .line 70
    iput-object v2, p1, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 71
    .line 72
    new-instance v2, LI4/p$a;

    .line 73
    .line 74
    invoke-direct {v2, p1}, LI4/p$a;-><init>(Lkotlin/jvm/internal/C;)V

    .line 75
    .line 76
    .line 77
    :try_start_1
    iput-object p1, v0, LI4/p$b;->g:Ljava/lang/Object;

    .line 78
    .line 79
    iput-object v2, v0, LI4/p$b;->h:Ljava/lang/Object;

    .line 80
    .line 81
    iput v3, v0, LI4/p$b;->j:I

    .line 82
    .line 83
    invoke-interface {p0, v2, v0}, LI4/d;->collect(LI4/e;Ll4/d;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0
    :try_end_1
    .catch LJ4/a; {:try_start_1 .. :try_end_1} :catch_1

    .line 87
    if-ne p0, v1, :cond_3

    .line 88
    .line 89
    return-object v1

    .line 90
    :cond_3
    move-object v0, p1

    .line 91
    goto :goto_2

    .line 92
    :catch_1
    move-exception p0

    .line 93
    move-object v0, p1

    .line 94
    move-object p1, p0

    .line 95
    move-object p0, v2

    .line 96
    :goto_1
    invoke-static {p1, p0}, LJ4/o;->a(LJ4/a;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :goto_2
    iget-object p0, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 100
    .line 101
    sget-object p1, LJ4/s;->a:LK4/D;

    .line 102
    .line 103
    if-eq p0, p1, :cond_4

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_4
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 107
    .line 108
    const-string p1, "Expected at least one element"

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0
.end method
