.class public Ly/u;
.super Ljava/lang/Object;
.source "PathInterpolator.java"

# interfaces
.implements Ly/n;


# instance fields
.field private a:[F


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Ly/u;->f(FFFF)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-direct {p0, p1}, Ly/u;->g(Landroid/graphics/Path;)V

    return-void
.end method

.method private static a(FF)Z
    .locals 0

    .line 1
    sub-float/2addr p0, p1

    .line 2
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const p1, 0x3c23d70a    # 0.01f

    .line 7
    .line 8
    .line 9
    cmpg-float p0, p0, p1

    .line 10
    .line 11
    if-gez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private b(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Ly/u;->a:[F

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    aget p0, p0, p1

    .line 6
    .line 7
    return p0
.end method

.method private c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ly/u;->a:[F

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    div-int/lit8 p0, p0, 0x3

    .line 5
    .line 6
    return p0
.end method

.method private d(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Ly/u;->a:[F

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    return p0
.end method

.method private e(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Ly/u;->a:[F

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0x3

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    return p0
.end method

.method private f(FFFF)V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 8
    .line 9
    .line 10
    const/high16 v5, 0x3f800000    # 1.0f

    .line 11
    .line 12
    const/high16 v6, 0x3f800000    # 1.0f

    .line 13
    .line 14
    move v1, p1

    .line 15
    move v2, p2

    .line 16
    move v3, p3

    .line 17
    move v4, p4

    .line 18
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Ly/u;->g(Landroid/graphics/Path;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private g(Landroid/graphics/Path;)V
    .locals 5

    .line 1
    const v0, 0x3b03126f    # 0.002f

    .line 2
    .line 3
    .line 4
    invoke-static {p1, v0}, Ly/v;->a(Landroid/graphics/Path;F)[F

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ly/u;->a:[F

    .line 9
    .line 10
    invoke-direct {p0}, Ly/u;->c()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, v0}, Ly/u;->d(I)F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v1, v2}, Ly/u;->a(FF)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    invoke-direct {p0, v0}, Ly/u;->e(I)F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-static {v1, v2}, Ly/u;->a(FF)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_4

    .line 35
    .line 36
    add-int/lit8 v1, p1, -0x1

    .line 37
    .line 38
    invoke-direct {p0, v1}, Ly/u;->d(I)F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const/high16 v4, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-static {v3, v4}, Ly/u;->a(FF)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_4

    .line 49
    .line 50
    invoke-direct {p0, v1}, Ly/u;->e(I)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v1, v4}, Ly/u;->a(FF)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_4

    .line 59
    .line 60
    move v1, v2

    .line 61
    :goto_0
    if-ge v0, p1, :cond_3

    .line 62
    .line 63
    invoke-direct {p0, v0}, Ly/u;->b(I)F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-direct {p0, v0}, Ly/u;->d(I)F

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    cmpl-float v2, v3, v2

    .line 72
    .line 73
    if-nez v2, :cond_1

    .line 74
    .line 75
    cmpl-float v2, v4, v1

    .line 76
    .line 77
    if-nez v2, :cond_0

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 81
    .line 82
    const-string p1, "The Path cannot have discontinuity in the X axis."

    .line 83
    .line 84
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    throw p0

    .line 88
    :cond_1
    :goto_1
    cmpg-float v1, v4, v1

    .line 89
    .line 90
    if-ltz v1, :cond_2

    .line 91
    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 93
    .line 94
    move v2, v3

    .line 95
    move v1, v4

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 98
    .line 99
    const-string p1, "The Path cannot loop back on itself."

    .line 100
    .line 101
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw p0

    .line 105
    :cond_3
    return-void

    .line 106
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 107
    .line 108
    const-string p1, "The Path must start at (0,0) and end at (1,1)"

    .line 109
    .line 110
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    throw p0
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gtz v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    cmpl-float v2, p1, v1

    .line 10
    .line 11
    if-ltz v2, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    invoke-direct {p0}, Ly/u;->c()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    sub-int/2addr v1, v2

    .line 20
    const/4 v3, 0x0

    .line 21
    :goto_0
    sub-int v4, v1, v3

    .line 22
    .line 23
    if-le v4, v2, :cond_3

    .line 24
    .line 25
    add-int v4, v3, v1

    .line 26
    .line 27
    div-int/lit8 v4, v4, 0x2

    .line 28
    .line 29
    invoke-direct {p0, v4}, Ly/u;->d(I)F

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    cmpg-float v5, p1, v5

    .line 34
    .line 35
    if-gez v5, :cond_2

    .line 36
    .line 37
    move v1, v4

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move v3, v4

    .line 40
    goto :goto_0

    .line 41
    :cond_3
    invoke-direct {p0, v1}, Ly/u;->d(I)F

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-direct {p0, v3}, Ly/u;->d(I)F

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sub-float/2addr v2, v4

    .line 50
    cmpl-float v0, v2, v0

    .line 51
    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    invoke-direct {p0, v3}, Ly/u;->e(I)F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_4
    invoke-direct {p0, v3}, Ly/u;->d(I)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    sub-float/2addr p1, v0

    .line 64
    div-float/2addr p1, v2

    .line 65
    invoke-direct {p0, v3}, Ly/u;->e(I)F

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-direct {p0, v1}, Ly/u;->e(I)F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    sub-float/2addr p0, v0

    .line 74
    mul-float/2addr p1, p0

    .line 75
    add-float/2addr v0, p1

    .line 76
    return v0
.end method
