.class public final LU/C;
.super Ljava/lang/Object;
.source "Utils.kt"


# static fields
.field private static final a:J

.field private static final b:F

.field private static final c:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, v0}, Lo/e;->b(FF)J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    sput-wide v0, LU/C;->a:J

    .line 7
    .line 8
    const v0, 0x40490fdb    # (float)Math.PI

    .line 9
    .line 10
    .line 11
    sput v0, LU/C;->b:F

    .line 12
    .line 13
    const v0, 0x40c90fdb

    .line 14
    .line 15
    .line 16
    sput v0, LU/C;->c:F

    .line 17
    .line 18
    return-void
.end method

.method public static final a(FFFFFFF)Z
    .locals 0

    .line 1
    sub-float/2addr p2, p0

    .line 2
    sub-float/2addr p3, p1

    .line 3
    invoke-static {p2, p3}, Lo/e;->b(FF)J

    .line 4
    .line 5
    .line 6
    move-result-wide p2

    .line 7
    invoke-static {p2, p3}, LU/C;->g(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p2

    .line 11
    sub-float/2addr p4, p0

    .line 12
    sub-float/2addr p5, p1

    .line 13
    invoke-static {p4, p5}, Lo/e;->b(FF)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    invoke-static {p2, p3, p0, p1}, LU/r;->d(JJ)F

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    invoke-static {p2, p3}, LU/r;->f(J)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    mul-float/2addr p2, p6

    .line 30
    invoke-static {p0, p1}, LU/r;->f(J)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    mul-float/2addr p2, p0

    .line 35
    cmpg-float p0, p4, p6

    .line 36
    .line 37
    if-ltz p0, :cond_1

    .line 38
    .line 39
    cmpg-float p0, p4, p2

    .line 40
    .line 41
    if-gez p0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 47
    return p0
.end method

.method public static final b(JJJ)Z
    .locals 0

    .line 1
    invoke-static {p2, p3, p0, p1}, LU/r;->k(JJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p4, p5, p2, p3}, LU/r;->k(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p2

    .line 9
    invoke-static {p0, p1, p2, p3}, LU/r;->a(JJ)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static final c(FF)J
    .locals 2

    .line 1
    invoke-static {p0, p1}, LU/C;->d(FF)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v1, v0, v1

    .line 7
    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    div-float/2addr p0, v0

    .line 11
    div-float/2addr p1, v0

    .line 12
    invoke-static {p0, p1}, Lo/e;->b(FF)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    return-wide p0

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    const-string p1, "Required distance greater than zero"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public static final d(FF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p0

    .line 2
    mul-float/2addr p1, p1

    .line 3
    add-float/2addr p0, p1

    .line 4
    float-to-double p0, p0

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    double-to-float p0, p0

    .line 10
    return p0
.end method

.method public static final e(FFF)F
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    int-to-float v0, v0

    .line 3
    sub-float/2addr v0, p2

    .line 4
    mul-float/2addr v0, p0

    .line 5
    mul-float/2addr p2, p1

    .line 6
    add-float/2addr v0, p2

    .line 7
    return v0
.end method

.method public static final f(FF)F
    .locals 0

    .line 1
    rem-float/2addr p0, p1

    .line 2
    add-float/2addr p0, p1

    .line 3
    rem-float/2addr p0, p1

    .line 4
    return p0
.end method

.method public static final g(J)J
    .locals 1

    .line 1
    invoke-static {p0, p1}, LU/r;->i(J)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-float v0, v0

    .line 6
    invoke-static {p0, p1}, LU/r;->h(J)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lo/e;->b(FF)J

    .line 11
    .line 12
    .line 13
    move-result-wide p0

    .line 14
    return-wide p0
.end method

.method public static final h(F)F
    .locals 0

    .line 1
    mul-float/2addr p0, p0

    .line 2
    return p0
.end method
