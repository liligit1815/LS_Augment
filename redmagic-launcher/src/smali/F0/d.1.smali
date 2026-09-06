.class public LF0/d;
.super Ljava/lang/Object;
.source "AnimatableValueParser.java"


# direct methods
.method private static a(LG0/c;FLv0/h;LF0/N;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LG0/c;",
            "F",
            "Lv0/h;",
            "LF0/N<",
            "TT;>;)",
            "Ljava/util/List<",
            "LI0/a<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p2, p1, p3, v0}, LF0/u;->a(LG0/c;Lv0/h;FLF0/N;Z)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private static b(LG0/c;Lv0/h;LF0/N;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "LG0/c;",
            "Lv0/h;",
            "LF0/N<",
            "TT;>;)",
            "Ljava/util/List<",
            "LI0/a<",
            "TT;>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, p1, v0, p2, v1}, LF0/u;->a(LG0/c;Lv0/h;FLF0/N;Z)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method static c(LG0/c;Lv0/h;)LB0/a;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/a;

    .line 2
    .line 3
    sget-object v1, LF0/g;->a:LF0/g;

    .line 4
    .line 5
    invoke-static {p0, p1, v1}, LF0/d;->b(LG0/c;Lv0/h;LF0/N;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, LB0/a;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method static d(LG0/c;Lv0/h;)LB0/j;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/j;

    .line 2
    .line 3
    invoke-static {}, LH0/h;->e()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget-object v2, LF0/i;->a:LF0/i;

    .line 8
    .line 9
    invoke-static {p0, v1, p1, v2}, LF0/d;->a(LG0/c;FLv0/h;LF0/N;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, LB0/j;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static e(LG0/c;Lv0/h;)LB0/b;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static f(LG0/c;Lv0/h;Z)LB0/b;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/b;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {}, LH0/h;->e()F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    :goto_0
    sget-object v1, LF0/l;->a:LF0/l;

    .line 13
    .line 14
    invoke-static {p0, p2, p1, v1}, LF0/d;->a(LG0/c;FLv0/h;LF0/N;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v0, p0}, LB0/b;-><init>(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method static g(LG0/c;Lv0/h;I)LB0/c;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/c;

    .line 2
    .line 3
    new-instance v1, LF0/o;

    .line 4
    .line 5
    invoke-direct {v1, p2}, LF0/o;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1, v1}, LF0/d;->b(LG0/c;Lv0/h;LF0/N;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-direct {v0, p0}, LB0/c;-><init>(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method static h(LG0/c;Lv0/h;)LB0/d;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/d;

    .line 2
    .line 3
    sget-object v1, LF0/r;->a:LF0/r;

    .line 4
    .line 5
    invoke-static {p0, p1, v1}, LF0/d;->b(LG0/c;Lv0/h;LF0/N;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, LB0/d;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method static i(LG0/c;Lv0/h;)LB0/f;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/f;

    .line 2
    .line 3
    invoke-static {}, LH0/h;->e()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget-object v2, LF0/B;->a:LF0/B;

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-static {p0, p1, v1, v2, v3}, LF0/u;->a(LG0/c;Lv0/h;FLF0/N;Z)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-direct {v0, p0}, LB0/f;-><init>(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method static j(LG0/c;Lv0/h;)LB0/g;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/g;

    .line 2
    .line 3
    sget-object v1, LF0/G;->a:LF0/G;

    .line 4
    .line 5
    invoke-static {p0, p1, v1}, LF0/d;->b(LG0/c;Lv0/h;LF0/N;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, LB0/g;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method static k(LG0/c;Lv0/h;)LB0/h;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LB0/h;

    .line 2
    .line 3
    invoke-static {}, LH0/h;->e()F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget-object v2, LF0/H;->a:LF0/H;

    .line 8
    .line 9
    invoke-static {p0, v1, p1, v2}, LF0/d;->a(LG0/c;FLv0/h;LF0/N;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p0}, LB0/h;-><init>(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
