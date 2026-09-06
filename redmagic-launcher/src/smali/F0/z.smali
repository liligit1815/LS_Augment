.class LF0/z;
.super Ljava/lang/Object;
.source "PathKeyframeParser.java"


# direct methods
.method static a(LG0/c;Lv0/h;)Ly0/i;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LG0/c;->D()LG0/c$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, LG0/c$b;->i:LG0/c$b;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    :goto_0
    move v5, v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    invoke-static {}, LH0/h;->e()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    sget-object v4, LF0/A;->a:LF0/A;

    .line 19
    .line 20
    const/4 v6, 0x0

    .line 21
    move-object v1, p0

    .line 22
    move-object v2, p1

    .line 23
    invoke-static/range {v1 .. v6}, LF0/t;->c(LG0/c;Lv0/h;FLF0/N;ZZ)LI0/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ly0/i;

    .line 28
    .line 29
    invoke-direct {p1, v2, p0}, Ly0/i;-><init>(Lv0/h;LI0/a;)V

    .line 30
    .line 31
    .line 32
    return-object p1
.end method
