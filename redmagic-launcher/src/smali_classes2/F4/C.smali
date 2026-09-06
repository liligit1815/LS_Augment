.class public final LF4/C;
.super Ljava/lang/Object;
.source "CoroutineContext.kt"


# direct methods
.method public static synthetic a(Lkotlin/jvm/internal/C;ZLl4/g;Ll4/g$b;)Ll4/g;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LF4/C;->e(Lkotlin/jvm/internal/C;ZLl4/g;Ll4/g$b;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ll4/g;Ll4/g$b;)Ll4/g;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LF4/C;->f(Ll4/g;Ll4/g$b;)Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(ZLl4/g$b;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, LF4/C;->i(ZLl4/g$b;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static final d(Ll4/g;Ll4/g;Z)Ll4/g;
    .locals 3

    .line 1
    invoke-static {p0}, LF4/C;->h(Ll4/g;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, LF4/C;->h(Ll4/g;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance v0, Lkotlin/jvm/internal/C;

    .line 19
    .line 20
    invoke-direct {v0}, Lkotlin/jvm/internal/C;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 24
    .line 25
    sget-object p1, Ll4/h;->g:Ll4/h;

    .line 26
    .line 27
    new-instance v2, LF4/A;

    .line 28
    .line 29
    invoke-direct {v2, v0, p2}, LF4/A;-><init>(Lkotlin/jvm/internal/C;Z)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, p1, v2}, Ll4/g;->F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ll4/g;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p2, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p2, Ll4/g;

    .line 43
    .line 44
    new-instance v1, LF4/B;

    .line 45
    .line 46
    invoke-direct {v1}, LF4/B;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-interface {p2, p1, v1}, Ll4/g;->F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 54
    .line 55
    :cond_1
    iget-object p1, v0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Ll4/g;

    .line 58
    .line 59
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method private static final e(Lkotlin/jvm/internal/C;ZLl4/g;Ll4/g$b;)Ll4/g;
    .locals 2

    .line 1
    instance-of v0, p3, LF4/y;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p2, p3}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ll4/g;

    .line 13
    .line 14
    invoke-interface {p3}, Ll4/g$b;->getKey()Ll4/g$c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    check-cast p3, LF4/y;

    .line 27
    .line 28
    invoke-interface {p3}, LF4/y;->v()LF4/y;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object p0, p3

    .line 34
    check-cast p0, LF4/y;

    .line 35
    .line 36
    :goto_0
    invoke-interface {p2, p0}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    iget-object p1, p0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p1, Ll4/g;

    .line 44
    .line 45
    invoke-interface {p3}, Ll4/g$b;->getKey()Ll4/g$c;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {p1, v1}, Ll4/g;->E(Ll4/g$c;)Ll4/g;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lkotlin/jvm/internal/C;->g:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p3, LF4/y;

    .line 56
    .line 57
    invoke-interface {p3, v0}, LF4/y;->T(Ll4/g$b;)Ll4/g;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p2, p0}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method private static final f(Ll4/g;Ll4/g$b;)Ll4/g;
    .locals 1

    .line 1
    instance-of v0, p1, LF4/y;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, LF4/y;

    .line 6
    .line 7
    invoke-interface {p1}, LF4/y;->v()LF4/y;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static final g(Ll4/g;)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method private static final h(Ll4/g;)Z
    .locals 2

    .line 1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance v1, LF4/z;

    .line 4
    .line 5
    invoke-direct {v1}, LF4/z;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, v1}, Ll4/g;->F(Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static final i(ZLl4/g$b;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_1

    .line 2
    .line 3
    instance-of p0, p1, LF4/y;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public static final j(LF4/I;Ll4/g;)Ll4/g;
    .locals 1

    .line 1
    invoke-interface {p0}, LF4/I;->o()Ll4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, p1, v0}, LF4/C;->d(Ll4/g;Ll4/g;Z)Ll4/g;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, LF4/Z;->a()LF4/E;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eq p0, p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Ll4/e;->f:Ll4/e$b;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    invoke-static {}, LF4/Z;->a()LF4/E;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :cond_0
    return-object p0
.end method

.method public static final k(Ll4/g;Ll4/g;)Ll4/g;
    .locals 1

    .line 1
    invoke-static {p1}, LF4/C;->h(Ll4/g;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll4/g;->J(Ll4/g;)Ll4/g;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, p1, v0}, LF4/C;->d(Ll4/g;Ll4/g;Z)Ll4/g;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final l(Lkotlin/coroutines/jvm/internal/e;)LF4/W0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/jvm/internal/e;",
            ")",
            "LF4/W0<",
            "*>;"
        }
    .end annotation

    .line 1
    :cond_0
    instance-of v0, p0, LF4/V;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_1
    invoke-interface {p0}, Lkotlin/coroutines/jvm/internal/e;->getCallerFrame()Lkotlin/coroutines/jvm/internal/e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_2

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_2
    instance-of v0, p0, LF4/W0;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, LF4/W0;

    .line 19
    .line 20
    return-object p0
.end method

.method public static final m(Ll4/d;Ll4/g;Ljava/lang/Object;)LF4/W0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/d<",
            "*>;",
            "Ll4/g;",
            "Ljava/lang/Object;",
            ")",
            "LF4/W0<",
            "*>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, Lkotlin/coroutines/jvm/internal/e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    sget-object v0, LF4/X0;->g:LF4/X0;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    check-cast p0, Lkotlin/coroutines/jvm/internal/e;

    .line 16
    .line 17
    invoke-static {p0}, LF4/C;->l(Lkotlin/coroutines/jvm/internal/e;)LF4/W0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, LF4/W0;->Q0(Ll4/g;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-object p0

    .line 27
    :cond_2
    return-object v1
.end method
