.class public final LJ4/f;
.super Ljava/lang/Object;
.source "ChannelFlow.kt"


# direct methods
.method public static final synthetic a(LI4/e;Ll4/g;)LI4/e;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LJ4/f;->d(LI4/e;Ll4/g;)LI4/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final b(Ll4/g;Ljava/lang/Object;Ljava/lang/Object;Lu4/p;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll4/g;",
            "TV;",
            "Ljava/lang/Object;",
            "Lu4/p<",
            "-TV;-",
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
    invoke-static {p0, p2}, LK4/K;->i(Ll4/g;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :try_start_0
    new-instance v0, LJ4/z;

    .line 6
    .line 7
    invoke-direct {v0, p4, p0}, LJ4/z;-><init>(Ll4/d;Ll4/g;)V

    .line 8
    .line 9
    .line 10
    instance-of v1, p3, Lkotlin/coroutines/jvm/internal/a;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-static {p3, p1, v0}, Lm4/b;->d(Lu4/p;Ljava/lang/Object;Ll4/d;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 v1, 0x2

    .line 22
    invoke-static {p3, v1}, Lkotlin/jvm/internal/H;->d(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    check-cast p3, Lu4/p;

    .line 27
    .line 28
    invoke-interface {p3, p1, v0}, Lu4/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :goto_0
    invoke-static {p0, p2}, LK4/K;->f(Ll4/g;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-ne p1, p0, :cond_1

    .line 40
    .line 41
    invoke-static {p4}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-object p1

    .line 45
    :goto_1
    invoke-static {p0, p2}, LK4/K;->f(Ll4/g;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    throw p1
.end method

.method public static synthetic c(Ll4/g;Ljava/lang/Object;Ljava/lang/Object;Lu4/p;Ll4/d;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    and-int/lit8 p5, p5, 0x4

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, LK4/K;->g(Ll4/g;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    :cond_0
    invoke-static {p0, p1, p2, p3, p4}, LJ4/f;->b(Ll4/g;Ljava/lang/Object;Ljava/lang/Object;Lu4/p;Ll4/d;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private static final d(LI4/e;Ll4/g;)LI4/e;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LI4/e<",
            "-TT;>;",
            "Ll4/g;",
            ")",
            "LI4/e<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LJ4/y;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p0, LJ4/r;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, LJ4/A;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, LJ4/A;-><init>(LI4/e;Ll4/g;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    return-object p0
.end method
