.class final LA/m;
.super Ljava/lang/Object;
.source "ViewingConditions.java"


# static fields
.field static final k:LA/m;


# instance fields
.field private final a:F

.field private final b:F

.field private final c:F

.field private final d:F

.field private final e:F

.field private final f:F

.field private final g:[F

.field private final h:F

.field private final i:F

.field private final j:F


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    sget-object v0, LA/b;->c:[F

    .line 2
    .line 3
    const/high16 v1, 0x42480000    # 50.0f

    .line 4
    .line 5
    invoke-static {v1}, LA/b;->h(F)F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    float-to-double v2, v2

    .line 10
    const-wide v4, 0x404fd4bbab8b494cL    # 63.66197723675813

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    mul-double/2addr v2, v4

    .line 16
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 17
    .line 18
    div-double/2addr v2, v4

    .line 19
    double-to-float v2, v2

    .line 20
    const/high16 v3, 0x40000000    # 2.0f

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-static {v0, v2, v1, v3, v4}, LA/m;->k([FFFFZ)LA/m;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, LA/m;->k:LA/m;

    .line 28
    .line 29
    return-void
.end method

.method private constructor <init>(FFFFFF[FFFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LA/m;->f:F

    .line 5
    .line 6
    iput p2, p0, LA/m;->a:F

    .line 7
    .line 8
    iput p3, p0, LA/m;->b:F

    .line 9
    .line 10
    iput p4, p0, LA/m;->c:F

    .line 11
    .line 12
    iput p5, p0, LA/m;->d:F

    .line 13
    .line 14
    iput p6, p0, LA/m;->e:F

    .line 15
    .line 16
    iput-object p7, p0, LA/m;->g:[F

    .line 17
    .line 18
    iput p8, p0, LA/m;->h:F

    .line 19
    .line 20
    iput p9, p0, LA/m;->i:F

    .line 21
    .line 22
    iput p10, p0, LA/m;->j:F

    .line 23
    .line 24
    return-void
.end method

.method static k([FFFFZ)LA/m;
    .locals 23

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    sget-object v2, LA/b;->a:[[F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aget v4, p0, v3

    .line 8
    .line 9
    aget-object v5, v2, v3

    .line 10
    .line 11
    aget v6, v5, v3

    .line 12
    .line 13
    mul-float/2addr v6, v4

    .line 14
    const/4 v7, 0x1

    .line 15
    aget v8, p0, v7

    .line 16
    .line 17
    aget v9, v5, v7

    .line 18
    .line 19
    mul-float/2addr v9, v8

    .line 20
    add-float/2addr v6, v9

    .line 21
    const/4 v9, 0x2

    .line 22
    aget v10, p0, v9

    .line 23
    .line 24
    aget v5, v5, v9

    .line 25
    .line 26
    mul-float/2addr v5, v10

    .line 27
    add-float/2addr v6, v5

    .line 28
    aget-object v5, v2, v7

    .line 29
    .line 30
    aget v11, v5, v3

    .line 31
    .line 32
    mul-float/2addr v11, v4

    .line 33
    aget v12, v5, v7

    .line 34
    .line 35
    mul-float/2addr v12, v8

    .line 36
    add-float/2addr v11, v12

    .line 37
    aget v5, v5, v9

    .line 38
    .line 39
    mul-float/2addr v5, v10

    .line 40
    add-float/2addr v11, v5

    .line 41
    aget-object v2, v2, v9

    .line 42
    .line 43
    aget v5, v2, v3

    .line 44
    .line 45
    mul-float/2addr v4, v5

    .line 46
    aget v5, v2, v7

    .line 47
    .line 48
    mul-float/2addr v8, v5

    .line 49
    add-float/2addr v4, v8

    .line 50
    aget v2, v2, v9

    .line 51
    .line 52
    mul-float/2addr v10, v2

    .line 53
    add-float/2addr v4, v10

    .line 54
    const/high16 v2, 0x41200000    # 10.0f

    .line 55
    .line 56
    div-float v5, p3, v2

    .line 57
    .line 58
    const v8, 0x3f4ccccd    # 0.8f

    .line 59
    .line 60
    .line 61
    add-float/2addr v5, v8

    .line 62
    float-to-double v12, v5

    .line 63
    const-wide v14, 0x3feccccccccccccdL    # 0.9

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    cmpl-double v10, v12, v14

    .line 69
    .line 70
    const v12, 0x3f170a3d    # 0.59f

    .line 71
    .line 72
    .line 73
    if-ltz v10, :cond_0

    .line 74
    .line 75
    const v8, 0x3f666666    # 0.9f

    .line 76
    .line 77
    .line 78
    sub-float v8, v5, v8

    .line 79
    .line 80
    mul-float/2addr v8, v2

    .line 81
    const v2, 0x3f30a3d7    # 0.69f

    .line 82
    .line 83
    .line 84
    invoke-static {v12, v2, v8}, LA/b;->d(FFF)F

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    :goto_0
    move/from16 v17, v2

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_0
    sub-float v8, v5, v8

    .line 92
    .line 93
    mul-float/2addr v8, v2

    .line 94
    const v2, 0x3f066666    # 0.525f

    .line 95
    .line 96
    .line 97
    invoke-static {v2, v12, v8}, LA/b;->d(FFF)F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    goto :goto_0

    .line 102
    :goto_1
    const/high16 v2, 0x3f800000    # 1.0f

    .line 103
    .line 104
    if-eqz p4, :cond_1

    .line 105
    .line 106
    move v8, v2

    .line 107
    goto :goto_2

    .line 108
    :cond_1
    neg-float v8, v0

    .line 109
    const/high16 v10, 0x42280000    # 42.0f

    .line 110
    .line 111
    sub-float/2addr v8, v10

    .line 112
    const/high16 v10, 0x42b80000    # 92.0f

    .line 113
    .line 114
    div-float/2addr v8, v10

    .line 115
    float-to-double v12, v8

    .line 116
    invoke-static {v12, v13}, Ljava/lang/Math;->exp(D)D

    .line 117
    .line 118
    .line 119
    move-result-wide v12

    .line 120
    double-to-float v8, v12

    .line 121
    const v10, 0x3e8e38e4

    .line 122
    .line 123
    .line 124
    mul-float/2addr v8, v10

    .line 125
    sub-float v8, v2, v8

    .line 126
    .line 127
    mul-float/2addr v8, v5

    .line 128
    :goto_2
    float-to-double v12, v8

    .line 129
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 130
    .line 131
    cmpl-double v10, v12, v14

    .line 132
    .line 133
    if-lez v10, :cond_2

    .line 134
    .line 135
    move v8, v2

    .line 136
    goto :goto_3

    .line 137
    :cond_2
    const-wide/16 v14, 0x0

    .line 138
    .line 139
    cmpg-double v10, v12, v14

    .line 140
    .line 141
    if-gez v10, :cond_3

    .line 142
    .line 143
    const/4 v8, 0x0

    .line 144
    :cond_3
    :goto_3
    const/high16 v10, 0x42c80000    # 100.0f

    .line 145
    .line 146
    div-float v12, v10, v6

    .line 147
    .line 148
    mul-float/2addr v12, v8

    .line 149
    add-float/2addr v12, v2

    .line 150
    sub-float/2addr v12, v8

    .line 151
    div-float v13, v10, v11

    .line 152
    .line 153
    mul-float/2addr v13, v8

    .line 154
    add-float/2addr v13, v2

    .line 155
    sub-float/2addr v13, v8

    .line 156
    div-float/2addr v10, v4

    .line 157
    mul-float/2addr v10, v8

    .line 158
    add-float/2addr v10, v2

    .line 159
    sub-float/2addr v10, v8

    .line 160
    new-array v8, v1, [F

    .line 161
    .line 162
    aput v12, v8, v3

    .line 163
    .line 164
    aput v13, v8, v7

    .line 165
    .line 166
    aput v10, v8, v9

    .line 167
    .line 168
    const/high16 v10, 0x40a00000    # 5.0f

    .line 169
    .line 170
    mul-float/2addr v10, v0

    .line 171
    add-float/2addr v10, v2

    .line 172
    div-float v10, v2, v10

    .line 173
    .line 174
    mul-float v12, v10, v10

    .line 175
    .line 176
    mul-float/2addr v12, v10

    .line 177
    mul-float/2addr v12, v10

    .line 178
    sub-float/2addr v2, v12

    .line 179
    mul-float/2addr v12, v0

    .line 180
    const v10, 0x3dcccccd    # 0.1f

    .line 181
    .line 182
    .line 183
    mul-float/2addr v10, v2

    .line 184
    mul-float/2addr v10, v2

    .line 185
    const-wide/high16 v13, 0x4014000000000000L    # 5.0

    .line 186
    .line 187
    move v2, v3

    .line 188
    move v15, v4

    .line 189
    float-to-double v3, v0

    .line 190
    mul-double/2addr v3, v13

    .line 191
    invoke-static {v3, v4}, Ljava/lang/Math;->cbrt(D)D

    .line 192
    .line 193
    .line 194
    move-result-wide v3

    .line 195
    double-to-float v0, v3

    .line 196
    mul-float/2addr v10, v0

    .line 197
    add-float/2addr v12, v10

    .line 198
    invoke-static/range {p2 .. p2}, LA/b;->h(F)F

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    aget v3, p0, v7

    .line 203
    .line 204
    div-float v13, v0, v3

    .line 205
    .line 206
    float-to-double v3, v13

    .line 207
    move v0, v7

    .line 208
    move-object/from16 v19, v8

    .line 209
    .line 210
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 211
    .line 212
    .line 213
    move-result-wide v7

    .line 214
    double-to-float v7, v7

    .line 215
    const v8, 0x3fbd70a4    # 1.48f

    .line 216
    .line 217
    .line 218
    add-float v22, v7, v8

    .line 219
    .line 220
    const-wide v7, 0x3fc999999999999aL    # 0.2

    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 226
    .line 227
    .line 228
    move-result-wide v3

    .line 229
    double-to-float v3, v3

    .line 230
    const v4, 0x3f39999a    # 0.725f

    .line 231
    .line 232
    .line 233
    div-float/2addr v4, v3

    .line 234
    aget v3, v19, v2

    .line 235
    .line 236
    mul-float/2addr v3, v12

    .line 237
    mul-float/2addr v3, v6

    .line 238
    float-to-double v6, v3

    .line 239
    const-wide/high16 v20, 0x4059000000000000L    # 100.0

    .line 240
    .line 241
    div-double v6, v6, v20

    .line 242
    .line 243
    move/from16 p3, v2

    .line 244
    .line 245
    const-wide v2, 0x3fdae147ae147ae1L    # 0.42

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 251
    .line 252
    .line 253
    move-result-wide v6

    .line 254
    double-to-float v6, v6

    .line 255
    aget v7, v19, v0

    .line 256
    .line 257
    mul-float/2addr v7, v12

    .line 258
    mul-float/2addr v7, v11

    .line 259
    float-to-double v7, v7

    .line 260
    div-double v7, v7, v20

    .line 261
    .line 262
    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 263
    .line 264
    .line 265
    move-result-wide v7

    .line 266
    double-to-float v7, v7

    .line 267
    aget v8, v19, v9

    .line 268
    .line 269
    mul-float/2addr v8, v12

    .line 270
    mul-float/2addr v8, v15

    .line 271
    float-to-double v10, v8

    .line 272
    div-double v10, v10, v20

    .line 273
    .line 274
    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 275
    .line 276
    .line 277
    move-result-wide v2

    .line 278
    double-to-float v2, v2

    .line 279
    new-array v3, v1, [F

    .line 280
    .line 281
    aput v6, v3, p3

    .line 282
    .line 283
    aput v7, v3, v0

    .line 284
    .line 285
    aput v2, v3, v9

    .line 286
    .line 287
    aget v2, v3, p3

    .line 288
    .line 289
    const/high16 v6, 0x43c80000    # 400.0f

    .line 290
    .line 291
    mul-float v7, v2, v6

    .line 292
    .line 293
    const v8, 0x41d90a3d    # 27.13f

    .line 294
    .line 295
    .line 296
    add-float/2addr v2, v8

    .line 297
    div-float/2addr v7, v2

    .line 298
    aget v2, v3, v0

    .line 299
    .line 300
    mul-float v10, v2, v6

    .line 301
    .line 302
    add-float/2addr v2, v8

    .line 303
    div-float/2addr v10, v2

    .line 304
    aget v2, v3, v9

    .line 305
    .line 306
    mul-float/2addr v6, v2

    .line 307
    add-float/2addr v2, v8

    .line 308
    div-float/2addr v6, v2

    .line 309
    new-array v1, v1, [F

    .line 310
    .line 311
    aput v7, v1, p3

    .line 312
    .line 313
    aput v10, v1, v0

    .line 314
    .line 315
    aput v6, v1, v9

    .line 316
    .line 317
    const/high16 v2, 0x40000000    # 2.0f

    .line 318
    .line 319
    aget v3, v1, p3

    .line 320
    .line 321
    mul-float/2addr v3, v2

    .line 322
    aget v0, v1, v0

    .line 323
    .line 324
    add-float/2addr v3, v0

    .line 325
    const v0, 0x3d4ccccd    # 0.05f

    .line 326
    .line 327
    .line 328
    aget v1, v1, v9

    .line 329
    .line 330
    mul-float/2addr v1, v0

    .line 331
    add-float/2addr v3, v1

    .line 332
    mul-float v14, v3, v4

    .line 333
    .line 334
    new-instance v0, LA/m;

    .line 335
    .line 336
    float-to-double v1, v12

    .line 337
    const-wide/high16 v6, 0x3fd0000000000000L    # 0.25

    .line 338
    .line 339
    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->pow(DD)D

    .line 340
    .line 341
    .line 342
    move-result-wide v1

    .line 343
    double-to-float v1, v1

    .line 344
    move/from16 v16, v4

    .line 345
    .line 346
    move/from16 v21, v1

    .line 347
    .line 348
    move v15, v4

    .line 349
    move/from16 v18, v5

    .line 350
    .line 351
    move/from16 v20, v12

    .line 352
    .line 353
    move-object v12, v0

    .line 354
    invoke-direct/range {v12 .. v22}, LA/m;-><init>(FFFFFF[FFFF)V

    .line 355
    .line 356
    .line 357
    return-object v12
.end method


# virtual methods
.method a()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->a:F

    .line 2
    .line 3
    return p0
.end method

.method b()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->d:F

    .line 2
    .line 3
    return p0
.end method

.method c()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->h:F

    .line 2
    .line 3
    return p0
.end method

.method d()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->i:F

    .line 2
    .line 3
    return p0
.end method

.method e()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->f:F

    .line 2
    .line 3
    return p0
.end method

.method f()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->b:F

    .line 2
    .line 3
    return p0
.end method

.method g()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->e:F

    .line 2
    .line 3
    return p0
.end method

.method h()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->c:F

    .line 2
    .line 3
    return p0
.end method

.method i()[F
    .locals 0

    .line 1
    iget-object p0, p0, LA/m;->g:[F

    .line 2
    .line 3
    return-object p0
.end method

.method j()F
    .locals 0

    .line 1
    iget p0, p0, LA/m;->j:F

    .line 2
    .line 3
    return p0
.end method
