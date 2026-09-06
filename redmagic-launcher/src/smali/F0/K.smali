.class LF0/K;
.super Ljava/lang/Object;
.source "ShapePathParser.java"


# static fields
.field static a:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-string v0, "ks"

    .line 2
    .line 3
    const-string v1, "hd"

    .line 4
    .line 5
    const-string v2, "nm"

    .line 6
    .line 7
    const-string v3, "ind"

    .line 8
    .line 9
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, LF0/K;->a:LG0/c$a;

    .line 18
    .line 19
    return-void
.end method

.method static a(LG0/c;Lv0/h;)LC0/q;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    move-object v1, v0

    .line 6
    :goto_0
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    if-eqz v4, :cond_4

    .line 11
    .line 12
    sget-object v4, LF0/K;->a:LG0/c$a;

    .line 13
    .line 14
    invoke-virtual {p0, v4}, LG0/c;->F(LG0/c$a;)I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eqz v4, :cond_3

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    if-eq v4, v5, :cond_2

    .line 22
    .line 23
    const/4 v5, 0x2

    .line 24
    if-eq v4, v5, :cond_1

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    if-eq v4, v5, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, LG0/c;->J()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, LG0/c;->t()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-static {p0, p1}, LF0/d;->k(LG0/c;Lv0/h;)LB0/h;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    invoke-virtual {p0}, LG0/c;->w()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    goto :goto_0

    .line 48
    :cond_3
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    goto :goto_0

    .line 53
    :cond_4
    new-instance p0, LC0/q;

    .line 54
    .line 55
    invoke-direct {p0, v0, v2, v1, v3}, LC0/q;-><init>(Ljava/lang/String;ILB0/h;Z)V

    .line 56
    .line 57
    .line 58
    return-object p0
.end method
