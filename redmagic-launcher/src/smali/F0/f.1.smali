.class LF0/f;
.super Ljava/lang/Object;
.source "CircleShapeParser.java"


# static fields
.field private static final a:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "hd"

    .line 2
    .line 3
    const-string v1, "d"

    .line 4
    .line 5
    const-string v2, "nm"

    .line 6
    .line 7
    const-string v3, "p"

    .line 8
    .line 9
    const-string v4, "s"

    .line 10
    .line 11
    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, LF0/f;->a:LG0/c$a;

    .line 20
    .line 21
    return-void
.end method

.method static a(LG0/c;Lv0/h;I)LC0/b;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x3

    .line 4
    if-ne p2, v2, :cond_0

    .line 5
    .line 6
    move p2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p2, v0

    .line 9
    :goto_0
    const/4 v3, 0x0

    .line 10
    move v8, p2

    .line 11
    move v9, v0

    .line 12
    move-object v5, v3

    .line 13
    move-object v6, v5

    .line 14
    move-object v7, v6

    .line 15
    :goto_1
    invoke-virtual {p0}, LG0/c;->n()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_7

    .line 20
    .line 21
    sget-object p2, LF0/f;->a:LG0/c$a;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, LG0/c;->F(LG0/c$a;)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_6

    .line 28
    .line 29
    if-eq p2, v1, :cond_5

    .line 30
    .line 31
    const/4 v3, 0x2

    .line 32
    if-eq p2, v3, :cond_4

    .line 33
    .line 34
    if-eq p2, v2, :cond_3

    .line 35
    .line 36
    const/4 v3, 0x4

    .line 37
    if-eq p2, v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, LG0/c;->I()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, LG0/c;->J()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p0}, LG0/c;->w()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-ne p2, v2, :cond_2

    .line 51
    .line 52
    move v8, v1

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    move v8, v0

    .line 55
    goto :goto_1

    .line 56
    :cond_3
    invoke-virtual {p0}, LG0/c;->t()Z

    .line 57
    .line 58
    .line 59
    move-result v9

    .line 60
    goto :goto_1

    .line 61
    :cond_4
    invoke-static {p0, p1}, LF0/d;->i(LG0/c;Lv0/h;)LB0/f;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    goto :goto_1

    .line 66
    :cond_5
    invoke-static {p0, p1}, LF0/a;->b(LG0/c;Lv0/h;)LB0/m;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    goto :goto_1

    .line 71
    :cond_6
    invoke-virtual {p0}, LG0/c;->B()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    goto :goto_1

    .line 76
    :cond_7
    new-instance v4, LC0/b;

    .line 77
    .line 78
    invoke-direct/range {v4 .. v9}, LC0/b;-><init>(Ljava/lang/String;LB0/m;LB0/f;ZZ)V

    .line 79
    .line 80
    .line 81
    return-object v4
.end method
