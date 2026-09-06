.class public Lcom/android/launcher3/touch/B;
.super Ljava/lang/Object;
.source "OverScroll.java"


# direct methods
.method public static a(FI)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    int-to-float p1, p1

    .line 11
    div-float/2addr p0, p1

    .line 12
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    div-float v0, p0, v0

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Lcom/android/launcher3/touch/B;->b(F)F

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    mul-float/2addr v0, p0

    .line 27
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    cmpl-float p0, p0, v1

    .line 34
    .line 35
    if-ltz p0, :cond_1

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    div-float/2addr v0, p0

    .line 42
    :cond_1
    const p0, 0x3e99999a    # 0.3f

    .line 43
    .line 44
    .line 45
    mul-float/2addr v0, p0

    .line 46
    mul-float/2addr v0, p1

    .line 47
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method private static b(F)F
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p0, v0

    .line 4
    mul-float v1, p0, p0

    .line 5
    .line 6
    mul-float/2addr v1, p0

    .line 7
    add-float/2addr v1, v0

    .line 8
    return v1
.end method
