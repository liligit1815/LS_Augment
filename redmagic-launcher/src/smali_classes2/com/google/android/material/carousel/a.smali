.class final Lcom/google/android/material/carousel/a;
.super Ljava/lang/Object;
.source "Arrangement.java"


# instance fields
.field final a:I

.field b:F

.field c:I

.field d:I

.field e:F

.field f:F

.field final g:I

.field final h:F


# direct methods
.method constructor <init>(IFFFIFIFIF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/material/carousel/a;->a:I

    .line 5
    .line 6
    invoke-static {p2, p3, p4}, LE/a;->a(FFF)F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 11
    .line 12
    iput p5, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 13
    .line 14
    iput p6, p0, Lcom/google/android/material/carousel/a;->e:F

    .line 15
    .line 16
    iput p7, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 17
    .line 18
    iput p8, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 19
    .line 20
    iput p9, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 21
    .line 22
    invoke-direct {p0, p10, p3, p4, p8}, Lcom/google/android/material/carousel/a;->d(FFFF)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, p8}, Lcom/google/android/material/carousel/a;->b(F)F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/google/android/material/carousel/a;->h:F

    .line 30
    .line 31
    return-void
.end method

.method private a(FIFII)F
    .locals 0

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/4 p3, 0x0

    .line 5
    :goto_0
    int-to-float p0, p2

    .line 6
    int-to-float p2, p4

    .line 7
    const/high16 p4, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr p2, p4

    .line 10
    add-float/2addr p0, p2

    .line 11
    mul-float/2addr p0, p3

    .line 12
    sub-float/2addr p1, p0

    .line 13
    int-to-float p0, p5

    .line 14
    add-float/2addr p0, p2

    .line 15
    div-float/2addr p1, p0

    .line 16
    return p1
.end method

.method private b(F)F
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/carousel/a;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const p0, 0x7f7fffff    # Float.MAX_VALUE

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    iget v0, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 12
    .line 13
    sub-float/2addr p1, v0

    .line 14
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget p0, p0, Lcom/google/android/material/carousel/a;->a:I

    .line 19
    .line 20
    int-to-float p0, p0

    .line 21
    mul-float/2addr p1, p0

    .line 22
    return p1
.end method

.method static c(FFFF[IF[IF[I)Lcom/google/android/material/carousel/a;
    .locals 22

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    move-object/from16 v1, p6

    .line 4
    .line 5
    move-object/from16 v2, p8

    .line 6
    .line 7
    array-length v3, v2

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    move v7, v6

    .line 12
    :goto_0
    if-ge v7, v3, :cond_5

    .line 13
    .line 14
    aget v17, v2, v7

    .line 15
    .line 16
    array-length v8, v1

    .line 17
    move v9, v6

    .line 18
    :goto_1
    if-ge v9, v8, :cond_4

    .line 19
    .line 20
    aget v15, v1, v9

    .line 21
    .line 22
    array-length v10, v0

    .line 23
    move v11, v6

    .line 24
    :goto_2
    if-ge v11, v10, :cond_3

    .line 25
    .line 26
    aget v13, v0, v11

    .line 27
    .line 28
    move v12, v8

    .line 29
    new-instance v8, Lcom/google/android/material/carousel/a;

    .line 30
    .line 31
    move v14, v9

    .line 32
    move v9, v5

    .line 33
    move v5, v14

    .line 34
    move/from16 v18, p0

    .line 35
    .line 36
    move/from16 v14, p5

    .line 37
    .line 38
    move/from16 v16, p7

    .line 39
    .line 40
    move/from16 v20, v10

    .line 41
    .line 42
    move/from16 v21, v11

    .line 43
    .line 44
    move/from16 v19, v12

    .line 45
    .line 46
    move/from16 v10, p1

    .line 47
    .line 48
    move/from16 v11, p2

    .line 49
    .line 50
    move/from16 v12, p3

    .line 51
    .line 52
    invoke-direct/range {v8 .. v18}, Lcom/google/android/material/carousel/a;-><init>(IFFFIFIFIF)V

    .line 53
    .line 54
    .line 55
    if-eqz v4, :cond_0

    .line 56
    .line 57
    iget v10, v8, Lcom/google/android/material/carousel/a;->h:F

    .line 58
    .line 59
    iget v11, v4, Lcom/google/android/material/carousel/a;->h:F

    .line 60
    .line 61
    cmpg-float v10, v10, v11

    .line 62
    .line 63
    if-gez v10, :cond_2

    .line 64
    .line 65
    :cond_0
    iget v4, v8, Lcom/google/android/material/carousel/a;->h:F

    .line 66
    .line 67
    const/4 v10, 0x0

    .line 68
    cmpl-float v4, v4, v10

    .line 69
    .line 70
    if-nez v4, :cond_1

    .line 71
    .line 72
    return-object v8

    .line 73
    :cond_1
    move-object v4, v8

    .line 74
    :cond_2
    add-int/lit8 v8, v9, 0x1

    .line 75
    .line 76
    add-int/lit8 v11, v21, 0x1

    .line 77
    .line 78
    move v9, v5

    .line 79
    move v5, v8

    .line 80
    move/from16 v8, v19

    .line 81
    .line 82
    move/from16 v10, v20

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    move/from16 v19, v9

    .line 86
    .line 87
    move v9, v5

    .line 88
    move/from16 v5, v19

    .line 89
    .line 90
    move/from16 v19, v8

    .line 91
    .line 92
    add-int/lit8 v5, v5, 0x1

    .line 93
    .line 94
    move v8, v9

    .line 95
    move v9, v5

    .line 96
    move v5, v8

    .line 97
    move/from16 v8, v19

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    add-int/lit8 v7, v7, 0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    return-object v4
.end method

.method private d(FFFF)V
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/carousel/a;->f()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-float v0, p1, v0

    .line 6
    .line 7
    iget v1, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    cmpl-float v3, v0, v2

    .line 13
    .line 14
    if-lez v3, :cond_0

    .line 15
    .line 16
    iget p2, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    div-float/2addr v0, v1

    .line 20
    sub-float/2addr p3, p2

    .line 21
    invoke-static {v0, p3}, Ljava/lang/Math;->min(FF)F

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    add-float/2addr p2, p3

    .line 26
    iput p2, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-lez v1, :cond_1

    .line 30
    .line 31
    cmpg-float p3, v0, v2

    .line 32
    .line 33
    if-gez p3, :cond_1

    .line 34
    .line 35
    iget p3, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 36
    .line 37
    int-to-float v1, v1

    .line 38
    div-float/2addr v0, v1

    .line 39
    sub-float/2addr p2, p3

    .line 40
    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    add-float/2addr p3, p2

    .line 45
    iput p3, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 46
    .line 47
    :cond_1
    :goto_0
    iget v5, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 48
    .line 49
    if-lez v5, :cond_2

    .line 50
    .line 51
    iget p2, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 52
    .line 53
    move v6, p2

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move v6, v2

    .line 56
    :goto_1
    iput v6, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 57
    .line 58
    iget v7, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 59
    .line 60
    iget v8, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 61
    .line 62
    move-object v3, p0

    .line 63
    move v4, p1

    .line 64
    invoke-direct/range {v3 .. v8}, Lcom/google/android/material/carousel/a;->a(FIFII)F

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    iput p0, v3, Lcom/google/android/material/carousel/a;->f:F

    .line 69
    .line 70
    iget p1, v3, Lcom/google/android/material/carousel/a;->b:F

    .line 71
    .line 72
    add-float/2addr p1, p0

    .line 73
    const/high16 p2, 0x40000000    # 2.0f

    .line 74
    .line 75
    div-float/2addr p1, p2

    .line 76
    iput p1, v3, Lcom/google/android/material/carousel/a;->e:F

    .line 77
    .line 78
    iget p2, v3, Lcom/google/android/material/carousel/a;->d:I

    .line 79
    .line 80
    if-lez p2, :cond_4

    .line 81
    .line 82
    cmpl-float p3, p0, p4

    .line 83
    .line 84
    if-eqz p3, :cond_4

    .line 85
    .line 86
    sub-float/2addr p4, p0

    .line 87
    iget p0, v3, Lcom/google/android/material/carousel/a;->g:I

    .line 88
    .line 89
    int-to-float p0, p0

    .line 90
    mul-float/2addr p4, p0

    .line 91
    const p0, 0x3dcccccd    # 0.1f

    .line 92
    .line 93
    .line 94
    mul-float/2addr p1, p0

    .line 95
    int-to-float p0, p2

    .line 96
    mul-float/2addr p1, p0

    .line 97
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    cmpl-float p1, p4, v2

    .line 106
    .line 107
    if-lez p1, :cond_3

    .line 108
    .line 109
    iget p1, v3, Lcom/google/android/material/carousel/a;->e:F

    .line 110
    .line 111
    iget p2, v3, Lcom/google/android/material/carousel/a;->d:I

    .line 112
    .line 113
    int-to-float p2, p2

    .line 114
    div-float p2, p0, p2

    .line 115
    .line 116
    sub-float/2addr p1, p2

    .line 117
    iput p1, v3, Lcom/google/android/material/carousel/a;->e:F

    .line 118
    .line 119
    iget p1, v3, Lcom/google/android/material/carousel/a;->f:F

    .line 120
    .line 121
    iget p2, v3, Lcom/google/android/material/carousel/a;->g:I

    .line 122
    .line 123
    int-to-float p2, p2

    .line 124
    div-float/2addr p0, p2

    .line 125
    add-float/2addr p1, p0

    .line 126
    iput p1, v3, Lcom/google/android/material/carousel/a;->f:F

    .line 127
    .line 128
    return-void

    .line 129
    :cond_3
    iget p1, v3, Lcom/google/android/material/carousel/a;->e:F

    .line 130
    .line 131
    iget p2, v3, Lcom/google/android/material/carousel/a;->d:I

    .line 132
    .line 133
    int-to-float p2, p2

    .line 134
    div-float p2, p0, p2

    .line 135
    .line 136
    add-float/2addr p1, p2

    .line 137
    iput p1, v3, Lcom/google/android/material/carousel/a;->e:F

    .line 138
    .line 139
    iget p1, v3, Lcom/google/android/material/carousel/a;->f:F

    .line 140
    .line 141
    iget p2, v3, Lcom/google/android/material/carousel/a;->g:I

    .line 142
    .line 143
    int-to-float p2, p2

    .line 144
    div-float/2addr p0, p2

    .line 145
    sub-float/2addr p1, p0

    .line 146
    iput p1, v3, Lcom/google/android/material/carousel/a;->f:F

    .line 147
    .line 148
    :cond_4
    return-void
.end method

.method private f()F
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget v1, p0, Lcom/google/android/material/carousel/a;->e:F

    .line 8
    .line 9
    iget v2, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    mul-float/2addr v1, v2

    .line 13
    add-float/2addr v0, v1

    .line 14
    iget v1, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 15
    .line 16
    iget p0, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 17
    .line 18
    int-to-float p0, p0

    .line 19
    mul-float/2addr v1, p0

    .line 20
    add-float/2addr v0, v1

    .line 21
    return v0
.end method

.method private g()Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget v3, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 8
    .line 9
    if-lez v3, :cond_1

    .line 10
    .line 11
    iget v3, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 12
    .line 13
    if-lez v3, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 16
    .line 17
    iget v3, p0, Lcom/google/android/material/carousel/a;->e:F

    .line 18
    .line 19
    cmpl-float v0, v0, v3

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget p0, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 24
    .line 25
    cmpl-float p0, v3, p0

    .line 26
    .line 27
    if-lez p0, :cond_0

    .line 28
    .line 29
    return v2

    .line 30
    :cond_0
    return v1

    .line 31
    :cond_1
    if-lez v0, :cond_3

    .line 32
    .line 33
    iget v0, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 34
    .line 35
    if-lez v0, :cond_3

    .line 36
    .line 37
    iget v0, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 38
    .line 39
    iget p0, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 40
    .line 41
    cmpl-float p0, v0, p0

    .line 42
    .line 43
    if-lez p0, :cond_2

    .line 44
    .line 45
    return v2

    .line 46
    :cond_2
    return v1

    .line 47
    :cond_3
    return v2
.end method


# virtual methods
.method e()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 2
    .line 3
    iget v1, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget p0, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 7
    .line 8
    add-int/2addr v0, p0

    .line 9
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Arrangement [priority="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/google/android/material/carousel/a;->a:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", smallCount="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/google/android/material/carousel/a;->c:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", smallSize="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/google/android/material/carousel/a;->b:F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", mediumCount="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/google/android/material/carousel/a;->d:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", mediumSize="

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v1, p0, Lcom/google/android/material/carousel/a;->e:F

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v1, ", largeCount="

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v1, p0, Lcom/google/android/material/carousel/a;->g:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, ", largeSize="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v1, p0, Lcom/google/android/material/carousel/a;->f:F

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, ", cost="

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget p0, p0, Lcom/google/android/material/carousel/a;->h:F

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p0, "]"

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
