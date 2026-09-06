.class final synthetic LF4/i;
.super Ljava/lang/Object;
.source "Builders.common.kt"


# direct methods
.method public static final a(LF4/I;Ll4/g;LF4/K;Lu4/p;)LF4/P;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LF4/I;",
            "Ll4/g;",
            "LF4/K;",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;)",
            "LF4/P<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, LF4/C;->j(LF4/I;Ll4/g;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, LF4/K;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance p1, LF4/C0;

    .line 12
    .line 13
    invoke-direct {p1, p0, p3}, LF4/C0;-><init>(Ll4/g;Lu4/p;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, LF4/Q;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-direct {p1, p0, v0}, LF4/Q;-><init>(Ll4/g;Z)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1, p2, p1, p3}, LF4/a;->O0(LF4/K;Ljava/lang/Object;Lu4/p;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public static synthetic b(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/P;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll4/h;->g:Ll4/h;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x2

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    sget-object p2, LF4/K;->g:LF4/K;

    .line 12
    .line 13
    :cond_1
    invoke-static {p0, p1, p2, p3}, LF4/h;->a(LF4/I;Ll4/g;LF4/K;Lu4/p;)LF4/P;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final c(LF4/I;Ll4/g;LF4/K;Lu4/p;)LF4/u0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LF4/I;",
            "Ll4/g;",
            "LF4/K;",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;)",
            "LF4/u0;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, LF4/C;->j(LF4/I;Ll4/g;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, LF4/K;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance p1, LF4/D0;

    .line 12
    .line 13
    invoke-direct {p1, p0, p3}, LF4/D0;-><init>(Ll4/g;Lu4/p;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance p1, LF4/K0;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-direct {p1, p0, v0}, LF4/K0;-><init>(Ll4/g;Z)V

    .line 21
    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1, p2, p1, p3}, LF4/a;->O0(LF4/K;Ljava/lang/Object;Lu4/p;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public static synthetic d(LF4/I;Ll4/g;LF4/K;Lu4/p;ILjava/lang/Object;)LF4/u0;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll4/h;->g:Ll4/h;

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x2

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    sget-object p2, LF4/K;->g:LF4/K;

    .line 12
    .line 13
    :cond_1
    invoke-static {p0, p1, p2, p3}, LF4/h;->c(LF4/I;Ll4/g;LF4/K;Lu4/p;)LF4/u0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final e(Ll4/g;Lu4/p;Ll4/d;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll4/g;",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Ll4/d<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll4/d;->getContext()Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p0}, LF4/C;->k(Ll4/g;Ll4/g;)Ll4/g;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, LF4/x0;->h(Ll4/g;)V

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    new-instance v0, LK4/z;

    .line 15
    .line 16
    invoke-direct {v0, p0, p2}, LK4/z;-><init>(Ll4/g;Ll4/d;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v0, p1}, LL4/b;->b(LK4/z;Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v1, Ll4/e;->f:Ll4/e$b;

    .line 25
    .line 26
    invoke-interface {p0, v1}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v0, v1}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v2, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, LF4/W0;

    .line 41
    .line 42
    invoke-direct {v0, p0, p2}, LF4/W0;-><init>(Ll4/g;Ll4/d;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, LF4/a;->getContext()Ll4/g;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 v1, 0x0

    .line 50
    invoke-static {p0, v1}, LK4/K;->i(Ll4/g;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    :try_start_0
    invoke-static {v0, v0, p1}, LL4/b;->b(LK4/z;Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    invoke-static {p0, v1}, LK4/K;->f(Ll4/g;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    move-object p0, p1

    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception p1

    .line 64
    invoke-static {p0, v1}, LK4/K;->f(Ll4/g;Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    throw p1

    .line 68
    :cond_1
    new-instance v0, LF4/V;

    .line 69
    .line 70
    invoke-direct {v0, p0, p2}, LF4/V;-><init>(Ll4/g;Ll4/d;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1, v0, v0}, LL4/a;->c(Lu4/p;Ljava/lang/Object;Ll4/d;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, LF4/V;->P0()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :goto_0
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-ne p0, p1, :cond_2

    .line 85
    .line 86
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-object p0
.end method
