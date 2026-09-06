.class public Ls1/S;
.super Ljava/lang/Object;
.source "IconNormalizer.java"


# instance fields
.field private final a:I

.field private final b:Landroid/graphics/Bitmap;

.field private final c:Landroid/graphics/Canvas;

.field private final d:[B

.field private final e:[F

.field private final f:[F

.field private final g:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    mul-int/lit8 p1, p1, 0x2

    .line 5
    .line 6
    iput p1, p0, Ls1/S;->a:I

    .line 7
    .line 8
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 9
    .line 10
    invoke-static {p1, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ls1/S;->b:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    new-instance v1, Landroid/graphics/Canvas;

    .line 17
    .line 18
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ls1/S;->c:Landroid/graphics/Canvas;

    .line 22
    .line 23
    mul-int v0, p1, p1

    .line 24
    .line 25
    new-array v0, v0, [B

    .line 26
    .line 27
    iput-object v0, p0, Ls1/S;->d:[B

    .line 28
    .line 29
    new-array v0, p1, [F

    .line 30
    .line 31
    iput-object v0, p0, Ls1/S;->e:[F

    .line 32
    .line 33
    new-array p1, p1, [F

    .line 34
    .line 35
    iput-object p1, p0, Ls1/S;->f:[F

    .line 36
    .line 37
    new-instance p1, Landroid/graphics/Rect;

    .line 38
    .line 39
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ls1/S;->g:Landroid/graphics/Rect;

    .line 43
    .line 44
    return-void
.end method

.method private static a([FIII)V
    .locals 8

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, -0x1

    .line 3
    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    add-int/lit8 v1, p2, 0x1

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    .line 10
    .line 11
    .line 12
    move v4, v3

    .line 13
    :goto_0
    if-gt v1, p3, :cond_5

    .line 14
    .line 15
    aget v5, p0, v1

    .line 16
    .line 17
    const/high16 v6, -0x40800000    # -1.0f

    .line 18
    .line 19
    cmpg-float v6, v5, v6

    .line 20
    .line 21
    if-gtz v6, :cond_0

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_0
    cmpl-float v6, v4, v3

    .line 25
    .line 26
    if-nez v6, :cond_1

    .line 27
    .line 28
    move v2, p2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    aget v6, p0, v2

    .line 31
    .line 32
    sub-float/2addr v5, v6

    .line 33
    sub-int v6, v1, v2

    .line 34
    .line 35
    int-to-float v6, v6

    .line 36
    div-float/2addr v5, v6

    .line 37
    sub-float/2addr v5, v4

    .line 38
    int-to-float v4, p1

    .line 39
    mul-float/2addr v5, v4

    .line 40
    const/4 v6, 0x0

    .line 41
    cmpg-float v5, v5, v6

    .line 42
    .line 43
    if-gez v5, :cond_3

    .line 44
    .line 45
    :cond_2
    if-le v2, p2, :cond_3

    .line 46
    .line 47
    add-int/lit8 v2, v2, -0x1

    .line 48
    .line 49
    aget v5, p0, v1

    .line 50
    .line 51
    aget v7, p0, v2

    .line 52
    .line 53
    sub-float/2addr v5, v7

    .line 54
    sub-int v7, v1, v2

    .line 55
    .line 56
    int-to-float v7, v7

    .line 57
    div-float/2addr v5, v7

    .line 58
    aget v7, v0, v2

    .line 59
    .line 60
    sub-float/2addr v5, v7

    .line 61
    mul-float/2addr v5, v4

    .line 62
    cmpl-float v5, v5, v6

    .line 63
    .line 64
    if-ltz v5, :cond_2

    .line 65
    .line 66
    :cond_3
    :goto_1
    aget v4, p0, v1

    .line 67
    .line 68
    aget v5, p0, v2

    .line 69
    .line 70
    sub-float/2addr v4, v5

    .line 71
    sub-int v5, v1, v2

    .line 72
    .line 73
    int-to-float v5, v5

    .line 74
    div-float/2addr v4, v5

    .line 75
    move v5, v2

    .line 76
    :goto_2
    if-ge v5, v1, :cond_4

    .line 77
    .line 78
    aput v4, v0, v5

    .line 79
    .line 80
    aget v6, p0, v2

    .line 81
    .line 82
    sub-int v7, v5, v2

    .line 83
    .line 84
    int-to-float v7, v7

    .line 85
    mul-float/2addr v7, v4

    .line 86
    add-float/2addr v6, v7

    .line 87
    aput v6, p0, v5

    .line 88
    .line 89
    add-int/lit8 v5, v5, 0x1

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    move v2, v1

    .line 93
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_5
    return-void
.end method

.method private static b(FFF)F
    .locals 2

    .line 1
    div-float p1, p0, p1

    .line 2
    .line 3
    const v0, 0x3f490fdb

    .line 4
    .line 5
    .line 6
    cmpg-float v0, p1, v0

    .line 7
    .line 8
    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    const p1, 0x3f28e38e

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const v0, 0x3d25ae4f

    .line 17
    .line 18
    .line 19
    sub-float p1, v1, p1

    .line 20
    .line 21
    mul-float/2addr p1, v0

    .line 22
    const v0, 0x3f26aaab

    .line 23
    .line 24
    .line 25
    add-float/2addr p1, v0

    .line 26
    :goto_0
    div-float/2addr p0, p2

    .line 27
    cmpl-float p2, p0, p1

    .line 28
    .line 29
    if-lez p2, :cond_1

    .line 30
    .line 31
    div-float/2addr p1, p0

    .line 32
    float-to-double p0, p1

    .line 33
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 34
    .line 35
    .line 36
    move-result-wide p0

    .line 37
    double-to-float p0, p0

    .line 38
    return p0

    .line 39
    :cond_1
    return v1
.end method


# virtual methods
.method public declared-synchronized c(Landroid/graphics/drawable/Drawable;)F
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    instance-of v2, v0, Landroid/graphics/drawable/AdaptiveIconDrawable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    const v0, 0x3f6b851f    # 0.92f

    .line 12
    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-lez v2, :cond_3

    .line 24
    .line 25
    if-gtz v3, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget v4, v1, Ls1/S;->a:I

    .line 29
    .line 30
    if-gt v2, v4, :cond_2

    .line 31
    .line 32
    if-le v3, v4, :cond_7

    .line 33
    .line 34
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    iget v5, v1, Ls1/S;->a:I

    .line 39
    .line 40
    mul-int/2addr v2, v5

    .line 41
    div-int/2addr v2, v4

    .line 42
    mul-int/2addr v5, v3

    .line 43
    div-int v3, v5, v4

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto/16 :goto_7

    .line 48
    .line 49
    :cond_3
    :goto_0
    if-lez v2, :cond_4

    .line 50
    .line 51
    iget v4, v1, Ls1/S;->a:I

    .line 52
    .line 53
    if-le v2, v4, :cond_5

    .line 54
    .line 55
    :cond_4
    iget v2, v1, Ls1/S;->a:I

    .line 56
    .line 57
    :cond_5
    if-lez v3, :cond_6

    .line 58
    .line 59
    iget v4, v1, Ls1/S;->a:I

    .line 60
    .line 61
    if-le v3, v4, :cond_7

    .line 62
    .line 63
    :cond_6
    iget v3, v1, Ls1/S;->a:I

    .line 64
    .line 65
    :cond_7
    :goto_1
    iget-object v4, v1, Ls1/S;->b:Landroid/graphics/Bitmap;

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-virtual {v4, v5}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v5, v5, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 72
    .line 73
    .line 74
    iget-object v4, v1, Ls1/S;->c:Landroid/graphics/Canvas;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, v1, Ls1/S;->d:[B

    .line 80
    .line 81
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 86
    .line 87
    .line 88
    iget-object v4, v1, Ls1/S;->b:Landroid/graphics/Bitmap;

    .line 89
    .line 90
    invoke-virtual {v4, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 91
    .line 92
    .line 93
    iget v0, v1, Ls1/S;->a:I

    .line 94
    .line 95
    add-int/lit8 v4, v0, 0x1

    .line 96
    .line 97
    sub-int/2addr v0, v2

    .line 98
    const/4 v6, -0x1

    .line 99
    move v7, v5

    .line 100
    move v11, v7

    .line 101
    move v8, v6

    .line 102
    move v9, v8

    .line 103
    move v10, v9

    .line 104
    :goto_2
    if-ge v7, v3, :cond_d

    .line 105
    .line 106
    move v12, v5

    .line 107
    move v13, v6

    .line 108
    move v14, v13

    .line 109
    :goto_3
    if-ge v12, v2, :cond_a

    .line 110
    .line 111
    iget-object v15, v1, Ls1/S;->d:[B

    .line 112
    .line 113
    aget-byte v15, v15, v11

    .line 114
    .line 115
    and-int/lit16 v15, v15, 0xff

    .line 116
    .line 117
    const/16 v5, 0x28

    .line 118
    .line 119
    if-le v15, v5, :cond_9

    .line 120
    .line 121
    if-ne v13, v6, :cond_8

    .line 122
    .line 123
    move v13, v12

    .line 124
    :cond_8
    move v14, v12

    .line 125
    :cond_9
    add-int/lit8 v11, v11, 0x1

    .line 126
    .line 127
    add-int/lit8 v12, v12, 0x1

    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    goto :goto_3

    .line 131
    :cond_a
    add-int/2addr v11, v0

    .line 132
    iget-object v5, v1, Ls1/S;->e:[F

    .line 133
    .line 134
    int-to-float v12, v13

    .line 135
    aput v12, v5, v7

    .line 136
    .line 137
    iget-object v5, v1, Ls1/S;->f:[F

    .line 138
    .line 139
    int-to-float v12, v14

    .line 140
    aput v12, v5, v7

    .line 141
    .line 142
    if-eq v13, v6, :cond_c

    .line 143
    .line 144
    if-ne v8, v6, :cond_b

    .line 145
    .line 146
    move v8, v7

    .line 147
    :cond_b
    invoke-static {v4, v13}, Ljava/lang/Math;->min(II)I

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    invoke-static {v9, v14}, Ljava/lang/Math;->max(II)I

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    move v10, v7

    .line 156
    :cond_c
    add-int/lit8 v7, v7, 0x1

    .line 157
    .line 158
    const/4 v5, 0x0

    .line 159
    goto :goto_2

    .line 160
    :cond_d
    const/high16 v0, 0x3f800000    # 1.0f

    .line 161
    .line 162
    if-eq v8, v6, :cond_11

    .line 163
    .line 164
    if-ne v9, v6, :cond_e

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :cond_e
    iget-object v5, v1, Ls1/S;->e:[F

    .line 168
    .line 169
    const/4 v7, 0x1

    .line 170
    invoke-static {v5, v7, v8, v10}, Ls1/S;->a([FIII)V

    .line 171
    .line 172
    .line 173
    iget-object v5, v1, Ls1/S;->f:[F

    .line 174
    .line 175
    invoke-static {v5, v6, v8, v10}, Ls1/S;->a([FIII)V

    .line 176
    .line 177
    .line 178
    const/4 v5, 0x0

    .line 179
    move v6, v5

    .line 180
    const/4 v5, 0x0

    .line 181
    :goto_4
    if-ge v5, v3, :cond_10

    .line 182
    .line 183
    iget-object v11, v1, Ls1/S;->e:[F

    .line 184
    .line 185
    aget v11, v11, v5

    .line 186
    .line 187
    const/high16 v12, -0x40800000    # -1.0f

    .line 188
    .line 189
    cmpg-float v12, v11, v12

    .line 190
    .line 191
    if-gtz v12, :cond_f

    .line 192
    .line 193
    goto :goto_5

    .line 194
    :cond_f
    iget-object v12, v1, Ls1/S;->f:[F

    .line 195
    .line 196
    aget v12, v12, v5

    .line 197
    .line 198
    sub-float/2addr v12, v11

    .line 199
    add-float/2addr v12, v0

    .line 200
    add-float/2addr v6, v12

    .line 201
    :goto_5
    add-int/lit8 v5, v5, 0x1

    .line 202
    .line 203
    goto :goto_4

    .line 204
    :cond_10
    iget-object v0, v1, Ls1/S;->g:Landroid/graphics/Rect;

    .line 205
    .line 206
    iput v4, v0, Landroid/graphics/Rect;->left:I

    .line 207
    .line 208
    iput v9, v0, Landroid/graphics/Rect;->right:I

    .line 209
    .line 210
    iput v8, v0, Landroid/graphics/Rect;->top:I

    .line 211
    .line 212
    iput v10, v0, Landroid/graphics/Rect;->bottom:I

    .line 213
    .line 214
    add-int/2addr v10, v7

    .line 215
    sub-int/2addr v10, v8

    .line 216
    add-int/2addr v9, v7

    .line 217
    sub-int/2addr v9, v4

    .line 218
    mul-int/2addr v10, v9

    .line 219
    int-to-float v0, v10

    .line 220
    mul-int/2addr v2, v3

    .line 221
    int-to-float v2, v2

    .line 222
    invoke-static {v6, v0, v2}, Ls1/S;->b(FFF)F

    .line 223
    .line 224
    .line 225
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 226
    monitor-exit p0

    .line 227
    return v0

    .line 228
    :cond_11
    :goto_6
    monitor-exit p0

    .line 229
    return v0

    .line 230
    :goto_7
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 231
    throw v0
.end method
