.class public Lcom/android/launcher3/folder/a;
.super Ljava/lang/Object;
.source "ClippedFolderIconLayoutRule.java"


# instance fields
.field private a:[F

.field private b:F

.field private c:F

.field private d:F

.field private e:Z

.field private f:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 8
    .line 9
    return-void
.end method

.method private b(II[F)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    invoke-direct {p0, v0, v1, p3}, Lcom/android/launcher3/folder/a;->e(II[F)V

    .line 4
    .line 5
    .line 6
    aget v2, p3, v0

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    aget v4, p3, v3

    .line 10
    .line 11
    const/4 v5, 0x3

    .line 12
    invoke-direct {p0, v5, v1, p3}, Lcom/android/launcher3/folder/a;->e(II[F)V

    .line 13
    .line 14
    .line 15
    aget p0, p3, v0

    .line 16
    .line 17
    sub-float/2addr p0, v2

    .line 18
    aget v1, p3, v3

    .line 19
    .line 20
    sub-float/2addr v1, v4

    .line 21
    int-to-float p2, p2

    .line 22
    mul-float/2addr p2, p0

    .line 23
    add-float/2addr v2, p2

    .line 24
    aput v2, p3, v0

    .line 25
    .line 26
    int-to-float p0, p1

    .line 27
    mul-float/2addr p0, v1

    .line 28
    add-float/2addr v4, p0

    .line 29
    aput v4, p3, v3

    .line 30
    .line 31
    return-void
.end method

.method public static c()F
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/high16 v0, 0x3f900000    # 1.125f

    .line 11
    .line 12
    return v0
.end method

.method private e(II[F)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    move/from16 v3, p2

    .line 7
    .line 8
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    iget-boolean v4, v0, Lcom/android/launcher3/folder/a;->e:Z

    .line 13
    .line 14
    const-wide/16 v5, 0x0

    .line 15
    .line 16
    if-eqz v4, :cond_0

    .line 17
    .line 18
    move-wide v7, v5

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-wide v7, 0x400921fb54442d18L    # Math.PI

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    :goto_0
    const/4 v9, 0x1

    .line 26
    if-eqz v4, :cond_1

    .line 27
    .line 28
    move v4, v9

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const/4 v4, -0x1

    .line 31
    :goto_1
    const/4 v10, 0x4

    .line 32
    const/4 v11, 0x3

    .line 33
    if-ne v3, v11, :cond_2

    .line 34
    .line 35
    const-wide v5, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    if-ne v3, v10, :cond_3

    .line 42
    .line 43
    const-wide v5, 0x3fe921fb54442d18L    # 0.7853981633974483

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_2
    int-to-double v12, v4

    .line 49
    mul-double/2addr v5, v12

    .line 50
    add-double/2addr v7, v5

    .line 51
    if-ne v3, v10, :cond_4

    .line 52
    .line 53
    if-ne v1, v11, :cond_4

    .line 54
    .line 55
    move v1, v2

    .line 56
    goto :goto_3

    .line 57
    :cond_4
    if-ne v3, v10, :cond_5

    .line 58
    .line 59
    if-ne v1, v2, :cond_5

    .line 60
    .line 61
    move v1, v11

    .line 62
    :cond_5
    :goto_3
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_6

    .line 67
    .line 68
    const v2, 0x3e19999a    # 0.15f

    .line 69
    .line 70
    .line 71
    goto :goto_4

    .line 72
    :cond_6
    const/high16 v2, 0x3e800000    # 0.25f

    .line 73
    .line 74
    :goto_4
    iget v4, v0, Lcom/android/launcher3/folder/a;->c:F

    .line 75
    .line 76
    add-int/lit8 v5, v3, -0x2

    .line 77
    .line 78
    int-to-float v5, v5

    .line 79
    mul-float/2addr v2, v5

    .line 80
    const/high16 v5, 0x40000000    # 2.0f

    .line 81
    .line 82
    div-float/2addr v2, v5

    .line 83
    const/high16 v6, 0x3f800000    # 1.0f

    .line 84
    .line 85
    add-float/2addr v2, v6

    .line 86
    mul-float/2addr v4, v2

    .line 87
    int-to-double v1, v1

    .line 88
    const-wide v10, 0x401921fb54442d18L    # 6.283185307179586

    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    int-to-double v14, v3

    .line 94
    div-double/2addr v10, v14

    .line 95
    mul-double/2addr v1, v10

    .line 96
    mul-double/2addr v1, v12

    .line 97
    add-double/2addr v7, v1

    .line 98
    iget v1, v0, Lcom/android/launcher3/folder/a;->d:F

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Lcom/android/launcher3/folder/a;->g(I)F

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    mul-float/2addr v1, v2

    .line 105
    div-float/2addr v1, v5

    .line 106
    iget v2, v0, Lcom/android/launcher3/folder/a;->b:F

    .line 107
    .line 108
    div-float/2addr v2, v5

    .line 109
    float-to-double v10, v4

    .line 110
    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    .line 111
    .line 112
    .line 113
    move-result-wide v12

    .line 114
    mul-double/2addr v10, v12

    .line 115
    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    .line 116
    .line 117
    div-double/2addr v10, v12

    .line 118
    double-to-float v3, v10

    .line 119
    add-float/2addr v2, v3

    .line 120
    sub-float/2addr v2, v1

    .line 121
    const/4 v3, 0x0

    .line 122
    aput v2, p3, v3

    .line 123
    .line 124
    iget v0, v0, Lcom/android/launcher3/folder/a;->b:F

    .line 125
    .line 126
    div-float/2addr v0, v5

    .line 127
    neg-float v2, v4

    .line 128
    float-to-double v2, v2

    .line 129
    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    .line 130
    .line 131
    .line 132
    move-result-wide v4

    .line 133
    mul-double/2addr v2, v4

    .line 134
    div-double/2addr v2, v12

    .line 135
    double-to-float v2, v2

    .line 136
    add-float/2addr v0, v2

    .line 137
    sub-float/2addr v0, v1

    .line 138
    aput v0, p3, v9

    .line 139
    .line 140
    return-void
.end method


# virtual methods
.method public a(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;
    .locals 5

    .line 1
    invoke-virtual {p0, p2}, Lcom/android/launcher3/folder/a;->g(I)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x2

    .line 6
    const/4 v2, 0x2

    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-ne p1, v1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 12
    .line 13
    invoke-direct {p0, v3, v2, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v1, -0x3

    .line 18
    if-ne p1, v1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 21
    .line 22
    invoke-direct {p0, v4, v2, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v1, 0x4

    .line 27
    if-lt p1, v1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 30
    .line 31
    iget p2, p0, Lcom/android/launcher3/folder/a;->b:F

    .line 32
    .line 33
    const/high16 v1, 0x40000000    # 2.0f

    .line 34
    .line 35
    div-float/2addr p2, v1

    .line 36
    iget v2, p0, Lcom/android/launcher3/folder/a;->d:F

    .line 37
    .line 38
    mul-float/2addr v2, v0

    .line 39
    div-float/2addr v2, v1

    .line 40
    sub-float/2addr p2, v2

    .line 41
    aput p2, p1, v4

    .line 42
    .line 43
    aput p2, p1, v3

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_6

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 55
    .line 56
    invoke-direct {p0, v3, v3, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    if-ne p1, v4, :cond_4

    .line 61
    .line 62
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 63
    .line 64
    invoke-direct {p0, v3, v4, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    if-ne p1, v2, :cond_5

    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 71
    .line 72
    invoke-direct {p0, v4, v3, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_5
    const/4 p2, 0x3

    .line 77
    if-ne p1, p2, :cond_7

    .line 78
    .line 79
    iget-object p1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 80
    .line 81
    invoke-direct {p0, v4, v4, p1}, Lcom/android/launcher3/folder/a;->b(II[F)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_6
    iget-object v1, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 86
    .line 87
    invoke-direct {p0, p1, p2, v1}, Lcom/android/launcher3/folder/a;->e(II[F)V

    .line 88
    .line 89
    .line 90
    :cond_7
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/folder/a;->a:[F

    .line 91
    .line 92
    aget p1, p0, v3

    .line 93
    .line 94
    aget p0, p0, v4

    .line 95
    .line 96
    if-nez p3, :cond_8

    .line 97
    .line 98
    new-instance p2, Lcom/android/launcher3/folder/y0;

    .line 99
    .line 100
    invoke-direct {p2, p1, p0, v0}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 101
    .line 102
    .line 103
    return-object p2

    .line 104
    :cond_8
    invoke-virtual {p3, p1, p0, v0}, Lcom/android/launcher3/folder/y0;->a(FFF)V

    .line 105
    .line 106
    .line 107
    return-object p3
.end method

.method public d()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/a;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public f(IFZ)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/android/launcher3/folder/a;->b:F

    .line 3
    .line 4
    const v0, 0x3f933333    # 1.15f

    .line 5
    .line 6
    .line 7
    mul-float/2addr v0, p1

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    div-float/2addr v0, v1

    .line 11
    iput v0, p0, Lcom/android/launcher3/folder/a;->c:F

    .line 12
    .line 13
    iput p2, p0, Lcom/android/launcher3/folder/a;->d:F

    .line 14
    .line 15
    iput-boolean p3, p0, Lcom/android/launcher3/folder/a;->e:Z

    .line 16
    .line 17
    div-float/2addr p1, p2

    .line 18
    iput p1, p0, Lcom/android/launcher3/folder/a;->f:F

    .line 19
    .line 20
    return-void
.end method

.method public g(I)F
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-gt p1, v0, :cond_0

    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    const p1, 0x3f028f5c    # 0.51f

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const p1, 0x3ee147ae    # 0.44f

    .line 15
    .line 16
    .line 17
    :goto_0
    iget p0, p0, Lcom/android/launcher3/folder/a;->f:F

    .line 18
    .line 19
    mul-float/2addr p1, p0

    .line 20
    return p1
.end method
