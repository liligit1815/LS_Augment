.class public final Lk3/a;
.super Ljava/lang/Object;
.source "MathUtils.java"


# direct methods
.method public static a(FFFF)F
    .locals 0

    .line 1
    sub-float/2addr p2, p0

    .line 2
    sub-float/2addr p3, p1

    .line 3
    float-to-double p0, p2

    .line 4
    float-to-double p2, p3

    .line 5
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->hypot(DD)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    double-to-float p0, p0

    .line 10
    return p0
.end method

.method public static b(FFFFFF)F
    .locals 1

    .line 1
    invoke-static {p0, p1, p2, p3}, Lk3/a;->a(FFFF)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, p4, p3}, Lk3/a;->a(FFFF)F

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-static {p0, p1, p4, p5}, Lk3/a;->a(FFFF)F

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    invoke-static {p0, p1, p2, p5}, Lk3/a;->a(FFFF)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {v0, p3, p4, p0}, Lk3/a;->d(FFFF)F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static c(FFF)F
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
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

.method private static d(FFFF)F
    .locals 1

    .line 1
    cmpl-float v0, p0, p1

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    cmpl-float v0, p0, p2

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    cmpl-float v0, p0, p3

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    cmpl-float p0, p1, p2

    .line 15
    .line 16
    if-lez p0, :cond_1

    .line 17
    .line 18
    cmpl-float p0, p1, p3

    .line 19
    .line 20
    if-lez p0, :cond_1

    .line 21
    .line 22
    return p1

    .line 23
    :cond_1
    cmpl-float p0, p2, p3

    .line 24
    .line 25
    if-lez p0, :cond_2

    .line 26
    .line 27
    return p2

    .line 28
    :cond_2
    return p3
.end method
