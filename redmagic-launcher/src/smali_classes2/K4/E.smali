.class public final LK4/E;
.super Ljava/lang/Object;


# direct methods
.method public static final a()I
    .locals 1

    .line 1
    invoke-static {}, LK4/F;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static final b(Ljava/lang/String;III)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, LK4/G;->a(Ljava/lang/String;III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final c(Ljava/lang/String;JJJ)J
    .locals 0

    .line 1
    invoke-static/range {p0 .. p6}, LK4/G;->b(Ljava/lang/String;JJJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static final d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, LK4/F;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0, p1}, LK4/G;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final f(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, LK4/G;->d(Ljava/lang/String;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Ljava/lang/String;IIIILjava/lang/Object;)I
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, LK4/G;->e(Ljava/lang/String;IIIILjava/lang/Object;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h(Ljava/lang/String;JJJILjava/lang/Object;)J
    .locals 0

    .line 1
    invoke-static/range {p0 .. p8}, LK4/G;->f(Ljava/lang/String;JJJILjava/lang/Object;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method
