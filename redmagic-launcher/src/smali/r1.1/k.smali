.class public Lr1/k;
.super Ljava/lang/Object;
.source "RoundPolygon.java"


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F

.field private e:F

.field private f:F

.field private g:I

.field private h:Landroid/graphics/Path;

.field private i:Z

.field private j:Z

.field k:[I

.field l:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lr1/k;->i:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lr1/k;->j:Z

    .line 8
    .line 9
    const/16 v0, 0xb

    .line 10
    .line 11
    new-array v0, v0, [I

    .line 12
    .line 13
    fill-array-data v0, :array_0

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lr1/k;->k:[I

    .line 17
    .line 18
    const v0, 0x3e4ccccd    # 0.2f

    .line 19
    .line 20
    .line 21
    iput v0, p0, Lr1/k;->l:F

    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0xe1
        0x156
        0x1a4
        0x1e5
        0x21c
        0x24c
        0x274
    .end array-data
.end method

.method private a()Landroid/graphics/Path;
    .locals 15

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lr1/k;->e:F

    .line 7
    .line 8
    float-to-double v1, v1

    .line 9
    iget v3, p0, Lr1/k;->c:F

    .line 10
    .line 11
    float-to-double v3, v3

    .line 12
    iget v5, p0, Lr1/k;->a:F

    .line 13
    .line 14
    iget v6, p0, Lr1/k;->l:F

    .line 15
    .line 16
    iget v7, p0, Lr1/k;->d:F

    .line 17
    .line 18
    mul-float/2addr v6, v7

    .line 19
    sub-float/2addr v5, v6

    .line 20
    float-to-double v5, v5

    .line 21
    invoke-static {v5, v6}, Ljava/lang/Math;->toRadians(D)D

    .line 22
    .line 23
    .line 24
    move-result-wide v5

    .line 25
    const-wide v7, 0x401921fb54442d18L    # 6.283185307179586

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    sub-double v5, v7, v5

    .line 31
    .line 32
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v5

    .line 36
    mul-double/2addr v3, v5

    .line 37
    add-double/2addr v1, v3

    .line 38
    double-to-float v1, v1

    .line 39
    iget v2, p0, Lr1/k;->f:F

    .line 40
    .line 41
    float-to-double v2, v2

    .line 42
    iget v4, p0, Lr1/k;->c:F

    .line 43
    .line 44
    float-to-double v4, v4

    .line 45
    iget v6, p0, Lr1/k;->a:F

    .line 46
    .line 47
    iget v9, p0, Lr1/k;->l:F

    .line 48
    .line 49
    iget v10, p0, Lr1/k;->d:F

    .line 50
    .line 51
    mul-float/2addr v9, v10

    .line 52
    sub-float/2addr v6, v9

    .line 53
    float-to-double v9, v6

    .line 54
    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    .line 55
    .line 56
    .line 57
    move-result-wide v9

    .line 58
    sub-double v9, v7, v9

    .line 59
    .line 60
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 61
    .line 62
    .line 63
    move-result-wide v9

    .line 64
    mul-double/2addr v4, v9

    .line 65
    add-double/2addr v2, v4

    .line 66
    double-to-float v2, v2

    .line 67
    iget v3, p0, Lr1/k;->e:F

    .line 68
    .line 69
    float-to-double v3, v3

    .line 70
    iget v5, p0, Lr1/k;->b:F

    .line 71
    .line 72
    float-to-double v5, v5

    .line 73
    iget v9, p0, Lr1/k;->a:F

    .line 74
    .line 75
    float-to-double v9, v9

    .line 76
    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v9

    .line 80
    sub-double v9, v7, v9

    .line 81
    .line 82
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 83
    .line 84
    .line 85
    move-result-wide v9

    .line 86
    mul-double/2addr v5, v9

    .line 87
    add-double/2addr v3, v5

    .line 88
    double-to-float v3, v3

    .line 89
    iget v4, p0, Lr1/k;->f:F

    .line 90
    .line 91
    float-to-double v4, v4

    .line 92
    iget v6, p0, Lr1/k;->b:F

    .line 93
    .line 94
    float-to-double v9, v6

    .line 95
    iget v6, p0, Lr1/k;->a:F

    .line 96
    .line 97
    float-to-double v11, v6

    .line 98
    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    .line 99
    .line 100
    .line 101
    move-result-wide v11

    .line 102
    sub-double v11, v7, v11

    .line 103
    .line 104
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 105
    .line 106
    .line 107
    move-result-wide v11

    .line 108
    mul-double/2addr v9, v11

    .line 109
    add-double/2addr v4, v9

    .line 110
    double-to-float v4, v4

    .line 111
    iget v5, p0, Lr1/k;->e:F

    .line 112
    .line 113
    float-to-double v5, v5

    .line 114
    iget v9, p0, Lr1/k;->c:F

    .line 115
    .line 116
    float-to-double v9, v9

    .line 117
    iget v11, p0, Lr1/k;->a:F

    .line 118
    .line 119
    iget v12, p0, Lr1/k;->l:F

    .line 120
    .line 121
    iget v13, p0, Lr1/k;->d:F

    .line 122
    .line 123
    mul-float/2addr v12, v13

    .line 124
    add-float/2addr v11, v12

    .line 125
    float-to-double v11, v11

    .line 126
    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    .line 127
    .line 128
    .line 129
    move-result-wide v11

    .line 130
    sub-double v11, v7, v11

    .line 131
    .line 132
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 133
    .line 134
    .line 135
    move-result-wide v11

    .line 136
    mul-double/2addr v9, v11

    .line 137
    add-double/2addr v5, v9

    .line 138
    double-to-float v5, v5

    .line 139
    iget v6, p0, Lr1/k;->f:F

    .line 140
    .line 141
    float-to-double v9, v6

    .line 142
    iget v6, p0, Lr1/k;->c:F

    .line 143
    .line 144
    float-to-double v11, v6

    .line 145
    iget v6, p0, Lr1/k;->a:F

    .line 146
    .line 147
    iget v13, p0, Lr1/k;->l:F

    .line 148
    .line 149
    iget v14, p0, Lr1/k;->d:F

    .line 150
    .line 151
    mul-float/2addr v13, v14

    .line 152
    add-float/2addr v6, v13

    .line 153
    float-to-double v13, v6

    .line 154
    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    .line 155
    .line 156
    .line 157
    move-result-wide v13

    .line 158
    sub-double v13, v7, v13

    .line 159
    .line 160
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 161
    .line 162
    .line 163
    move-result-wide v13

    .line 164
    mul-double/2addr v11, v13

    .line 165
    add-double/2addr v9, v11

    .line 166
    double-to-float v6, v9

    .line 167
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 171
    .line 172
    .line 173
    const/4 v1, 0x1

    .line 174
    :goto_0
    iget v2, p0, Lr1/k;->g:I

    .line 175
    .line 176
    if-ge v1, v2, :cond_0

    .line 177
    .line 178
    iget v2, p0, Lr1/k;->a:F

    .line 179
    .line 180
    invoke-direct {p0, v2, v1}, Lr1/k;->b(FI)F

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    iget v3, p0, Lr1/k;->e:F

    .line 185
    .line 186
    float-to-double v3, v3

    .line 187
    iget v5, p0, Lr1/k;->c:F

    .line 188
    .line 189
    float-to-double v5, v5

    .line 190
    iget v9, p0, Lr1/k;->l:F

    .line 191
    .line 192
    iget v10, p0, Lr1/k;->d:F

    .line 193
    .line 194
    mul-float/2addr v9, v10

    .line 195
    sub-float v9, v2, v9

    .line 196
    .line 197
    float-to-double v9, v9

    .line 198
    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    .line 199
    .line 200
    .line 201
    move-result-wide v9

    .line 202
    sub-double v9, v7, v9

    .line 203
    .line 204
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 205
    .line 206
    .line 207
    move-result-wide v9

    .line 208
    mul-double/2addr v5, v9

    .line 209
    add-double/2addr v3, v5

    .line 210
    double-to-float v3, v3

    .line 211
    iget v4, p0, Lr1/k;->f:F

    .line 212
    .line 213
    float-to-double v4, v4

    .line 214
    iget v6, p0, Lr1/k;->c:F

    .line 215
    .line 216
    float-to-double v9, v6

    .line 217
    iget v6, p0, Lr1/k;->l:F

    .line 218
    .line 219
    iget v11, p0, Lr1/k;->d:F

    .line 220
    .line 221
    mul-float/2addr v6, v11

    .line 222
    sub-float v6, v2, v6

    .line 223
    .line 224
    float-to-double v11, v6

    .line 225
    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    .line 226
    .line 227
    .line 228
    move-result-wide v11

    .line 229
    sub-double v11, v7, v11

    .line 230
    .line 231
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 232
    .line 233
    .line 234
    move-result-wide v11

    .line 235
    mul-double/2addr v9, v11

    .line 236
    add-double/2addr v4, v9

    .line 237
    double-to-float v4, v4

    .line 238
    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 239
    .line 240
    .line 241
    iget v3, p0, Lr1/k;->e:F

    .line 242
    .line 243
    float-to-double v3, v3

    .line 244
    iget v5, p0, Lr1/k;->b:F

    .line 245
    .line 246
    float-to-double v5, v5

    .line 247
    float-to-double v9, v2

    .line 248
    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    .line 249
    .line 250
    .line 251
    move-result-wide v11

    .line 252
    sub-double v11, v7, v11

    .line 253
    .line 254
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 255
    .line 256
    .line 257
    move-result-wide v11

    .line 258
    mul-double/2addr v5, v11

    .line 259
    add-double/2addr v3, v5

    .line 260
    double-to-float v3, v3

    .line 261
    iget v4, p0, Lr1/k;->f:F

    .line 262
    .line 263
    float-to-double v4, v4

    .line 264
    iget v6, p0, Lr1/k;->b:F

    .line 265
    .line 266
    float-to-double v11, v6

    .line 267
    invoke-static {v9, v10}, Ljava/lang/Math;->toRadians(D)D

    .line 268
    .line 269
    .line 270
    move-result-wide v9

    .line 271
    sub-double v9, v7, v9

    .line 272
    .line 273
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 274
    .line 275
    .line 276
    move-result-wide v9

    .line 277
    mul-double/2addr v11, v9

    .line 278
    add-double/2addr v4, v11

    .line 279
    double-to-float v4, v4

    .line 280
    iget v5, p0, Lr1/k;->e:F

    .line 281
    .line 282
    float-to-double v5, v5

    .line 283
    iget v9, p0, Lr1/k;->c:F

    .line 284
    .line 285
    float-to-double v9, v9

    .line 286
    iget v11, p0, Lr1/k;->l:F

    .line 287
    .line 288
    iget v12, p0, Lr1/k;->d:F

    .line 289
    .line 290
    mul-float/2addr v11, v12

    .line 291
    add-float/2addr v11, v2

    .line 292
    float-to-double v11, v11

    .line 293
    invoke-static {v11, v12}, Ljava/lang/Math;->toRadians(D)D

    .line 294
    .line 295
    .line 296
    move-result-wide v11

    .line 297
    sub-double v11, v7, v11

    .line 298
    .line 299
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 300
    .line 301
    .line 302
    move-result-wide v11

    .line 303
    mul-double/2addr v9, v11

    .line 304
    add-double/2addr v5, v9

    .line 305
    double-to-float v5, v5

    .line 306
    iget v6, p0, Lr1/k;->f:F

    .line 307
    .line 308
    float-to-double v9, v6

    .line 309
    iget v6, p0, Lr1/k;->c:F

    .line 310
    .line 311
    float-to-double v11, v6

    .line 312
    iget v6, p0, Lr1/k;->l:F

    .line 313
    .line 314
    iget v13, p0, Lr1/k;->d:F

    .line 315
    .line 316
    mul-float/2addr v6, v13

    .line 317
    add-float/2addr v2, v6

    .line 318
    float-to-double v13, v2

    .line 319
    invoke-static {v13, v14}, Ljava/lang/Math;->toRadians(D)D

    .line 320
    .line 321
    .line 322
    move-result-wide v13

    .line 323
    sub-double v13, v7, v13

    .line 324
    .line 325
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 326
    .line 327
    .line 328
    move-result-wide v13

    .line 329
    mul-double/2addr v11, v13

    .line 330
    add-double/2addr v9, v11

    .line 331
    double-to-float v2, v9

    .line 332
    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 333
    .line 334
    .line 335
    add-int/lit8 v1, v1, 0x1

    .line 336
    .line 337
    goto/16 :goto_0

    .line 338
    .line 339
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 340
    .line 341
    .line 342
    return-object v0
.end method

.method private b(FI)F
    .locals 6

    .line 1
    iget v0, p0, Lr1/k;->g:I

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-boolean v1, p0, Lr1/k;->i:Z

    .line 6
    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    iget-boolean v1, p0, Lr1/k;->j:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v1, p0, Lr1/k;->k:[I

    .line 15
    .line 16
    add-int/lit8 v2, v0, -0x1

    .line 17
    .line 18
    aget v2, v1, v2

    .line 19
    .line 20
    int-to-float v2, v2

    .line 21
    aget v0, v1, v0

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_0
    if-ge v1, p2, :cond_1

    .line 26
    .line 27
    iget v3, p0, Lr1/k;->g:I

    .line 28
    .line 29
    add-int/lit8 v4, v3, -0x1

    .line 30
    .line 31
    int-to-float v4, v4

    .line 32
    const/high16 v5, 0x43b40000    # 360.0f

    .line 33
    .line 34
    div-float v4, v5, v4

    .line 35
    .line 36
    add-float/2addr v2, v4

    .line 37
    int-to-float v3, v3

    .line 38
    div-float/2addr v5, v3

    .line 39
    add-float/2addr v0, v5

    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sub-float/2addr v0, v2

    .line 44
    iget-object p2, p0, Lr1/k;->k:[I

    .line 45
    .line 46
    iget p0, p0, Lr1/k;->g:I

    .line 47
    .line 48
    aget v1, p2, p0

    .line 49
    .line 50
    add-int/lit8 v3, p0, -0x1

    .line 51
    .line 52
    aget v3, p2, v3

    .line 53
    .line 54
    sub-int/2addr v1, v3

    .line 55
    int-to-float v1, v1

    .line 56
    div-float/2addr v0, v1

    .line 57
    add-int/lit8 p0, p0, -0x1

    .line 58
    .line 59
    aget p0, p2, p0

    .line 60
    .line 61
    int-to-float p0, p0

    .line 62
    sub-float/2addr p1, p0

    .line 63
    mul-float/2addr p1, v0

    .line 64
    add-float/2addr p1, v2

    .line 65
    return p1

    .line 66
    :cond_2
    :goto_1
    int-to-float p2, p2

    .line 67
    iget p0, p0, Lr1/k;->d:F

    .line 68
    .line 69
    mul-float/2addr p2, p0

    .line 70
    add-float/2addr p1, p2

    .line 71
    return p1
.end method

.method private d(F)I
    .locals 1

    .line 1
    const/high16 p0, 0x43610000    # 225.0f

    .line 2
    .line 3
    cmpg-float p0, p1, p0

    .line 4
    .line 5
    const/4 v0, 0x4

    .line 6
    if-gez p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/high16 p0, 0x43ab0000    # 342.0f

    .line 10
    .line 11
    cmpg-float p0, p1, p0

    .line 12
    .line 13
    if-gez p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x5

    .line 16
    return p0

    .line 17
    :cond_1
    const/high16 p0, 0x43d20000    # 420.0f

    .line 18
    .line 19
    cmpg-float p0, p1, p0

    .line 20
    .line 21
    if-gez p0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x6

    .line 24
    return p0

    .line 25
    :cond_2
    const p0, 0x43f28000    # 485.0f

    .line 26
    .line 27
    .line 28
    cmpg-float p0, p1, p0

    .line 29
    .line 30
    if-gez p0, :cond_3

    .line 31
    .line 32
    const/4 p0, 0x7

    .line 33
    return p0

    .line 34
    :cond_3
    const/high16 p0, 0x44070000    # 540.0f

    .line 35
    .line 36
    cmpg-float p0, p1, p0

    .line 37
    .line 38
    if-gez p0, :cond_4

    .line 39
    .line 40
    const/16 p0, 0x8

    .line 41
    .line 42
    return p0

    .line 43
    :cond_4
    const/high16 p0, 0x44130000    # 588.0f

    .line 44
    .line 45
    cmpg-float p0, p1, p0

    .line 46
    .line 47
    if-gez p0, :cond_5

    .line 48
    .line 49
    const/16 p0, 0x9

    .line 50
    .line 51
    return p0

    .line 52
    :cond_5
    const/high16 p0, 0x441d0000    # 628.0f

    .line 53
    .line 54
    cmpg-float p0, p1, p0

    .line 55
    .line 56
    if-gez p0, :cond_6

    .line 57
    .line 58
    const/16 p0, 0xa

    .line 59
    .line 60
    return p0

    .line 61
    :cond_6
    return v0
.end method

.method private e()F
    .locals 6

    .line 1
    iget v0, p0, Lr1/k;->g:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x2

    .line 4
    .line 5
    mul-int/lit8 v1, v1, 0x5a

    .line 6
    .line 7
    div-int/2addr v1, v0

    .line 8
    int-to-float v0, v1

    .line 9
    iget v1, p0, Lr1/k;->d:F

    .line 10
    .line 11
    iget v2, p0, Lr1/k;->l:F

    .line 12
    .line 13
    mul-float/2addr v1, v2

    .line 14
    float-to-double v2, v0

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    iget p0, p0, Lr1/k;->b:F

    .line 24
    .line 25
    float-to-double v4, p0

    .line 26
    mul-double/2addr v2, v4

    .line 27
    add-float/2addr v0, v1

    .line 28
    float-to-double v0, v0

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    const-wide v4, 0x400921fb54442d18L    # Math.PI

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    sub-double/2addr v4, v0

    .line 39
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    div-double/2addr v2, v0

    .line 44
    double-to-float p0, v2

    .line 45
    return p0
.end method


# virtual methods
.method public c()Landroid/graphics/Path;
    .locals 0

    .line 1
    iget-object p0, p0, Lr1/k;->h:Landroid/graphics/Path;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(FFFF)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lr1/k;->j:Z

    .line 3
    .line 4
    iput p1, p0, Lr1/k;->a:F

    .line 5
    .line 6
    iput p2, p0, Lr1/k;->b:F

    .line 7
    .line 8
    const/16 p1, 0xa

    .line 9
    .line 10
    iput p1, p0, Lr1/k;->g:I

    .line 11
    .line 12
    iput p3, p0, Lr1/k;->e:F

    .line 13
    .line 14
    iput p4, p0, Lr1/k;->f:F

    .line 15
    .line 16
    const/high16 p2, 0x43b40000    # 360.0f

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    div-float/2addr p2, p1

    .line 20
    iput p2, p0, Lr1/k;->d:F

    .line 21
    .line 22
    invoke-direct {p0}, Lr1/k;->e()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lr1/k;->c:F

    .line 27
    .line 28
    invoke-direct {p0}, Lr1/k;->a()Landroid/graphics/Path;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lr1/k;->h:Landroid/graphics/Path;

    .line 33
    .line 34
    return-void
.end method

.method public g(FFFF)V
    .locals 4

    .line 1
    iput p1, p0, Lr1/k;->a:F

    .line 2
    .line 3
    const/high16 v0, 0x42340000    # 45.0f

    .line 4
    .line 5
    sub-float v0, p1, v0

    .line 6
    .line 7
    mul-float/2addr v0, p2

    .line 8
    float-to-double v0, v0

    .line 9
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 10
    .line 11
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    mul-double/2addr v0, v2

    .line 16
    const-wide v2, 0x40a2380000000000L    # 2332.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v0, v2

    .line 22
    double-to-float p2, v0

    .line 23
    iput p2, p0, Lr1/k;->b:F

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lr1/k;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lr1/k;->g:I

    .line 30
    .line 31
    iput p3, p0, Lr1/k;->e:F

    .line 32
    .line 33
    iput p4, p0, Lr1/k;->f:F

    .line 34
    .line 35
    const/high16 p2, 0x43b40000    # 360.0f

    .line 36
    .line 37
    int-to-float p1, p1

    .line 38
    div-float/2addr p2, p1

    .line 39
    iput p2, p0, Lr1/k;->d:F

    .line 40
    .line 41
    invoke-direct {p0}, Lr1/k;->e()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lr1/k;->c:F

    .line 46
    .line 47
    invoke-direct {p0}, Lr1/k;->a()Landroid/graphics/Path;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lr1/k;->h:Landroid/graphics/Path;

    .line 52
    .line 53
    return-void
.end method

.method public h(FFFF)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lr1/k;->i:Z

    .line 3
    .line 4
    iput p1, p0, Lr1/k;->a:F

    .line 5
    .line 6
    const p1, 0x43f78000    # 495.0f

    .line 7
    .line 8
    .line 9
    mul-float/2addr p2, p1

    .line 10
    float-to-double p1, p2

    .line 11
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    mul-double/2addr p1, v0

    .line 18
    const-wide v0, 0x40a2380000000000L    # 2332.0

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    div-double/2addr p1, v0

    .line 24
    double-to-float p1, p1

    .line 25
    iput p1, p0, Lr1/k;->b:F

    .line 26
    .line 27
    const/16 p1, 0x8

    .line 28
    .line 29
    iput p1, p0, Lr1/k;->g:I

    .line 30
    .line 31
    iput p3, p0, Lr1/k;->e:F

    .line 32
    .line 33
    iput p4, p0, Lr1/k;->f:F

    .line 34
    .line 35
    const/high16 p2, 0x43b40000    # 360.0f

    .line 36
    .line 37
    int-to-float p1, p1

    .line 38
    div-float/2addr p2, p1

    .line 39
    iput p2, p0, Lr1/k;->d:F

    .line 40
    .line 41
    invoke-direct {p0}, Lr1/k;->e()F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Lr1/k;->c:F

    .line 46
    .line 47
    invoke-direct {p0}, Lr1/k;->a()Landroid/graphics/Path;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lr1/k;->h:Landroid/graphics/Path;

    .line 52
    .line 53
    return-void
.end method
