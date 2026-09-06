.class public Lcom/android/launcher3/resource/t;
.super Ljava/lang/Object;
.source "IconProcess.java"


# static fields
.field private static a:I = 0xcc

.field private static b:F = 0.58f


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private static a(B)I
    .locals 0

    .line 1
    and-int/lit16 p0, p0, 0xff

    .line 2
    .line 3
    return p0
.end method

.method public static b(Landroid/graphics/Bitmap;)F
    .locals 12

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x8

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {p0, v0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/2addr v0, v1

    .line 17
    new-array v0, v0, [B

    .line 18
    .line 19
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    move-wide v3, v2

    .line 30
    move v2, v1

    .line 31
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    array-length v5, v5

    .line 36
    add-int/lit8 v5, v5, -0x4

    .line 37
    .line 38
    if-ge v1, v5, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    add-int/lit8 v6, v1, 0x3

    .line 45
    .line 46
    aget-byte v5, v5, v6

    .line 47
    .line 48
    invoke-static {v5}, Lcom/android/launcher3/resource/t;->a(B)I

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    const/16 v6, 0x32

    .line 53
    .line 54
    if-le v5, v6, :cond_0

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    aget-byte v5, v5, v1

    .line 61
    .line 62
    invoke-static {v5}, Lcom/android/launcher3/resource/t;->a(B)I

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    add-int/lit8 v7, v1, 0x1

    .line 71
    .line 72
    aget-byte v6, v6, v7

    .line 73
    .line 74
    invoke-static {v6}, Lcom/android/launcher3/resource/t;->a(B)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    add-int/lit8 v8, v1, 0x2

    .line 83
    .line 84
    aget-byte v7, v7, v8

    .line 85
    .line 86
    invoke-static {v7}, Lcom/android/launcher3/resource/t;->a(B)I

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    const-wide v8, 0x3fd322d0e5604189L    # 0.299

    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    int-to-double v10, v5

    .line 96
    mul-double/2addr v10, v8

    .line 97
    const-wide v8, 0x3fe2cd9e83e425afL    # 0.5876

    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    int-to-double v5, v6

    .line 103
    mul-double/2addr v5, v8

    .line 104
    add-double/2addr v10, v5

    .line 105
    const-wide v5, 0x3fbd2f1a9fbe76c9L    # 0.114

    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    int-to-double v7, v7

    .line 111
    mul-double/2addr v7, v5

    .line 112
    add-double/2addr v10, v7

    .line 113
    add-double/2addr v3, v10

    .line 114
    add-int/lit8 v2, v2, 0x1

    .line 115
    .line 116
    :cond_0
    add-int/lit8 v1, v1, 0x4

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    invoke-static {p0}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 120
    .line 121
    .line 122
    if-eqz v2, :cond_2

    .line 123
    .line 124
    int-to-double v0, v2

    .line 125
    div-double/2addr v3, v0

    .line 126
    double-to-float p0, v3

    .line 127
    return p0

    .line 128
    :cond_2
    const-string p0, "LauncherIconProcess"

    .line 129
    .line 130
    const-string v0, "calBitmapBrightness: all is 0."

    .line 131
    .line 132
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    const/4 p0, 0x0

    .line 136
    return p0
.end method

.method private static c(ILandroid/graphics/Bitmap;)I
    .locals 18

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    :cond_0
    move/from16 v17, v2

    .line 15
    .line 16
    goto/16 :goto_9

    .line 17
    .line 18
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    new-instance v5, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v6, "canFillColor 0 "

    .line 28
    .line 29
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v6, "/"

    .line 40
    .line 41
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v6, " offset "

    .line 52
    .line 53
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    const-string v6, "LauncherIconProcess"

    .line 64
    .line 65
    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move v5, v0

    .line 69
    move v7, v2

    .line 70
    move v8, v7

    .line 71
    move v9, v8

    .line 72
    move v10, v9

    .line 73
    move v11, v10

    .line 74
    :goto_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v12

    .line 78
    sub-int/2addr v12, v0

    .line 79
    const/4 v13, 0x6

    .line 80
    if-ge v5, v12, :cond_7

    .line 81
    .line 82
    add-int/lit8 v7, v7, 0x1

    .line 83
    .line 84
    invoke-virtual {v1, v5, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 85
    .line 86
    .line 87
    move-result v12

    .line 88
    if-le v5, v0, :cond_2

    .line 89
    .line 90
    add-int/lit8 v11, v5, -0x1

    .line 91
    .line 92
    invoke-virtual {v1, v11, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 93
    .line 94
    .line 95
    move-result v11

    .line 96
    :cond_2
    if-eqz v11, :cond_5

    .line 97
    .line 98
    invoke-static {v12}, Landroid/graphics/Color;->red(I)I

    .line 99
    .line 100
    .line 101
    move-result v14

    .line 102
    if-eqz v14, :cond_3

    .line 103
    .line 104
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 105
    .line 106
    .line 107
    move-result v14

    .line 108
    if-eqz v14, :cond_3

    .line 109
    .line 110
    invoke-static {v12}, Landroid/graphics/Color;->red(I)I

    .line 111
    .line 112
    .line 113
    move-result v14

    .line 114
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 115
    .line 116
    .line 117
    move-result v15

    .line 118
    sub-int/2addr v14, v15

    .line 119
    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    .line 120
    .line 121
    .line 122
    move-result v14

    .line 123
    if-le v14, v13, :cond_3

    .line 124
    .line 125
    return v2

    .line 126
    :cond_3
    invoke-static {v12}, Landroid/graphics/Color;->green(I)I

    .line 127
    .line 128
    .line 129
    move-result v14

    .line 130
    if-eqz v14, :cond_4

    .line 131
    .line 132
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 133
    .line 134
    .line 135
    move-result v14

    .line 136
    if-eqz v14, :cond_4

    .line 137
    .line 138
    invoke-static {v12}, Landroid/graphics/Color;->green(I)I

    .line 139
    .line 140
    .line 141
    move-result v14

    .line 142
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 143
    .line 144
    .line 145
    move-result v15

    .line 146
    sub-int/2addr v14, v15

    .line 147
    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    .line 148
    .line 149
    .line 150
    move-result v14

    .line 151
    if-le v14, v13, :cond_4

    .line 152
    .line 153
    return v2

    .line 154
    :cond_4
    invoke-static {v12}, Landroid/graphics/Color;->blue(I)I

    .line 155
    .line 156
    .line 157
    move-result v14

    .line 158
    if-eqz v14, :cond_5

    .line 159
    .line 160
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 161
    .line 162
    .line 163
    move-result v14

    .line 164
    if-eqz v14, :cond_5

    .line 165
    .line 166
    invoke-static {v12}, Landroid/graphics/Color;->blue(I)I

    .line 167
    .line 168
    .line 169
    move-result v14

    .line 170
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 171
    .line 172
    .line 173
    move-result v15

    .line 174
    sub-int/2addr v14, v15

    .line 175
    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    .line 176
    .line 177
    .line 178
    move-result v14

    .line 179
    if-le v14, v13, :cond_5

    .line 180
    .line 181
    return v2

    .line 182
    :cond_5
    if-eqz v12, :cond_6

    .line 183
    .line 184
    const/high16 v13, -0x1000000

    .line 185
    .line 186
    if-eq v12, v13, :cond_6

    .line 187
    .line 188
    invoke-static {v12}, Landroid/graphics/Color;->red(I)I

    .line 189
    .line 190
    .line 191
    move-result v13

    .line 192
    add-int/2addr v8, v13

    .line 193
    invoke-static {v12}, Landroid/graphics/Color;->green(I)I

    .line 194
    .line 195
    .line 196
    move-result v13

    .line 197
    add-int/2addr v9, v13

    .line 198
    invoke-static {v12}, Landroid/graphics/Color;->blue(I)I

    .line 199
    .line 200
    .line 201
    move-result v12

    .line 202
    add-int/2addr v10, v12

    .line 203
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_7
    if-eqz v7, :cond_8

    .line 208
    .line 209
    div-int/2addr v8, v7

    .line 210
    div-int/2addr v9, v7

    .line 211
    div-int/2addr v10, v7

    .line 212
    invoke-static {v8, v9, v10}, Landroid/graphics/Color;->rgb(III)I

    .line 213
    .line 214
    .line 215
    move-result v5

    .line 216
    goto :goto_1

    .line 217
    :cond_8
    move v5, v2

    .line 218
    :goto_1
    move v7, v0

    .line 219
    move v8, v2

    .line 220
    move v9, v8

    .line 221
    move v10, v9

    .line 222
    move v12, v10

    .line 223
    :goto_2
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 224
    .line 225
    .line 226
    move-result v14

    .line 227
    sub-int/2addr v14, v0

    .line 228
    if-ge v7, v14, :cond_e

    .line 229
    .line 230
    add-int/lit8 v8, v8, 0x1

    .line 231
    .line 232
    invoke-virtual {v1, v0, v7}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 233
    .line 234
    .line 235
    move-result v14

    .line 236
    if-le v7, v0, :cond_9

    .line 237
    .line 238
    add-int/lit8 v11, v7, -0x1

    .line 239
    .line 240
    invoke-virtual {v1, v0, v11}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 241
    .line 242
    .line 243
    move-result v11

    .line 244
    :cond_9
    if-eqz v11, :cond_c

    .line 245
    .line 246
    invoke-static {v14}, Landroid/graphics/Color;->red(I)I

    .line 247
    .line 248
    .line 249
    move-result v15

    .line 250
    if-eqz v15, :cond_a

    .line 251
    .line 252
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 253
    .line 254
    .line 255
    move-result v15

    .line 256
    if-eqz v15, :cond_a

    .line 257
    .line 258
    invoke-static {v14}, Landroid/graphics/Color;->red(I)I

    .line 259
    .line 260
    .line 261
    move-result v15

    .line 262
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 263
    .line 264
    .line 265
    move-result v16

    .line 266
    sub-int v15, v15, v16

    .line 267
    .line 268
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    .line 269
    .line 270
    .line 271
    move-result v15

    .line 272
    if-le v15, v13, :cond_a

    .line 273
    .line 274
    return v2

    .line 275
    :cond_a
    invoke-static {v14}, Landroid/graphics/Color;->green(I)I

    .line 276
    .line 277
    .line 278
    move-result v15

    .line 279
    if-eqz v15, :cond_b

    .line 280
    .line 281
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 282
    .line 283
    .line 284
    move-result v15

    .line 285
    if-eqz v15, :cond_b

    .line 286
    .line 287
    invoke-static {v14}, Landroid/graphics/Color;->green(I)I

    .line 288
    .line 289
    .line 290
    move-result v15

    .line 291
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 292
    .line 293
    .line 294
    move-result v16

    .line 295
    sub-int v15, v15, v16

    .line 296
    .line 297
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    .line 298
    .line 299
    .line 300
    move-result v15

    .line 301
    if-le v15, v13, :cond_b

    .line 302
    .line 303
    return v2

    .line 304
    :cond_b
    invoke-static {v14}, Landroid/graphics/Color;->blue(I)I

    .line 305
    .line 306
    .line 307
    move-result v15

    .line 308
    if-eqz v15, :cond_c

    .line 309
    .line 310
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 311
    .line 312
    .line 313
    move-result v15

    .line 314
    if-eqz v15, :cond_c

    .line 315
    .line 316
    invoke-static {v14}, Landroid/graphics/Color;->blue(I)I

    .line 317
    .line 318
    .line 319
    move-result v15

    .line 320
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 321
    .line 322
    .line 323
    move-result v16

    .line 324
    sub-int v15, v15, v16

    .line 325
    .line 326
    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    .line 327
    .line 328
    .line 329
    move-result v15

    .line 330
    if-le v15, v13, :cond_c

    .line 331
    .line 332
    return v2

    .line 333
    :cond_c
    invoke-static {v14}, Landroid/graphics/Color;->blue(I)I

    .line 334
    .line 335
    .line 336
    move-result v15

    .line 337
    if-eqz v15, :cond_d

    .line 338
    .line 339
    invoke-static {v14}, Landroid/graphics/Color;->red(I)I

    .line 340
    .line 341
    .line 342
    move-result v15

    .line 343
    if-eqz v15, :cond_d

    .line 344
    .line 345
    invoke-static {v14}, Landroid/graphics/Color;->blue(I)I

    .line 346
    .line 347
    .line 348
    move-result v15

    .line 349
    if-eqz v15, :cond_d

    .line 350
    .line 351
    invoke-static {v14}, Landroid/graphics/Color;->red(I)I

    .line 352
    .line 353
    .line 354
    move-result v15

    .line 355
    add-int/2addr v9, v15

    .line 356
    invoke-static {v14}, Landroid/graphics/Color;->green(I)I

    .line 357
    .line 358
    .line 359
    move-result v15

    .line 360
    add-int/2addr v10, v15

    .line 361
    invoke-static {v14}, Landroid/graphics/Color;->blue(I)I

    .line 362
    .line 363
    .line 364
    move-result v14

    .line 365
    add-int/2addr v12, v14

    .line 366
    :cond_d
    add-int/lit8 v7, v7, 0x1

    .line 367
    .line 368
    goto/16 :goto_2

    .line 369
    .line 370
    :cond_e
    if-eqz v8, :cond_f

    .line 371
    .line 372
    div-int/2addr v9, v8

    .line 373
    div-int/2addr v10, v8

    .line 374
    div-int/2addr v12, v8

    .line 375
    invoke-static {v9, v10, v12}, Landroid/graphics/Color;->rgb(III)I

    .line 376
    .line 377
    .line 378
    move-result v7

    .line 379
    goto :goto_3

    .line 380
    :cond_f
    move v7, v2

    .line 381
    :goto_3
    move v8, v0

    .line 382
    move v9, v2

    .line 383
    move v10, v9

    .line 384
    move v12, v10

    .line 385
    move v14, v12

    .line 386
    :goto_4
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 387
    .line 388
    .line 389
    move-result v15

    .line 390
    sub-int/2addr v15, v0

    .line 391
    if-ge v8, v15, :cond_15

    .line 392
    .line 393
    add-int/lit8 v9, v9, 0x1

    .line 394
    .line 395
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 396
    .line 397
    .line 398
    move-result v15

    .line 399
    sub-int/2addr v15, v0

    .line 400
    invoke-virtual {v1, v8, v15}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 401
    .line 402
    .line 403
    move-result v15

    .line 404
    if-le v8, v0, :cond_10

    .line 405
    .line 406
    sub-int v11, v8, v0

    .line 407
    .line 408
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 409
    .line 410
    .line 411
    move-result v16

    .line 412
    move/from16 v17, v2

    .line 413
    .line 414
    sub-int v2, v16, v0

    .line 415
    .line 416
    invoke-virtual {v1, v11, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    move v11, v2

    .line 421
    goto :goto_5

    .line 422
    :cond_10
    move/from16 v17, v2

    .line 423
    .line 424
    :goto_5
    if-eqz v11, :cond_13

    .line 425
    .line 426
    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    .line 427
    .line 428
    .line 429
    move-result v2

    .line 430
    if-eqz v2, :cond_11

    .line 431
    .line 432
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 433
    .line 434
    .line 435
    move-result v2

    .line 436
    if-eqz v2, :cond_11

    .line 437
    .line 438
    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    .line 439
    .line 440
    .line 441
    move-result v2

    .line 442
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 443
    .line 444
    .line 445
    move-result v16

    .line 446
    sub-int v2, v2, v16

    .line 447
    .line 448
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 449
    .line 450
    .line 451
    move-result v2

    .line 452
    if-le v2, v13, :cond_11

    .line 453
    .line 454
    return v17

    .line 455
    :cond_11
    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    .line 456
    .line 457
    .line 458
    move-result v2

    .line 459
    if-eqz v2, :cond_12

    .line 460
    .line 461
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 462
    .line 463
    .line 464
    move-result v2

    .line 465
    if-eqz v2, :cond_12

    .line 466
    .line 467
    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    .line 468
    .line 469
    .line 470
    move-result v2

    .line 471
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 472
    .line 473
    .line 474
    move-result v16

    .line 475
    sub-int v2, v2, v16

    .line 476
    .line 477
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    if-le v2, v13, :cond_12

    .line 482
    .line 483
    return v17

    .line 484
    :cond_12
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 485
    .line 486
    .line 487
    move-result v2

    .line 488
    if-eqz v2, :cond_13

    .line 489
    .line 490
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 491
    .line 492
    .line 493
    move-result v2

    .line 494
    if-eqz v2, :cond_13

    .line 495
    .line 496
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 497
    .line 498
    .line 499
    move-result v2

    .line 500
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 501
    .line 502
    .line 503
    move-result v16

    .line 504
    sub-int v2, v2, v16

    .line 505
    .line 506
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 507
    .line 508
    .line 509
    move-result v2

    .line 510
    if-le v2, v13, :cond_13

    .line 511
    .line 512
    return v17

    .line 513
    :cond_13
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 514
    .line 515
    .line 516
    move-result v2

    .line 517
    if-eqz v2, :cond_14

    .line 518
    .line 519
    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    if-eqz v2, :cond_14

    .line 524
    .line 525
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 526
    .line 527
    .line 528
    move-result v2

    .line 529
    if-eqz v2, :cond_14

    .line 530
    .line 531
    invoke-static {v15}, Landroid/graphics/Color;->red(I)I

    .line 532
    .line 533
    .line 534
    move-result v2

    .line 535
    add-int/2addr v10, v2

    .line 536
    invoke-static {v15}, Landroid/graphics/Color;->green(I)I

    .line 537
    .line 538
    .line 539
    move-result v2

    .line 540
    add-int/2addr v12, v2

    .line 541
    invoke-static {v15}, Landroid/graphics/Color;->blue(I)I

    .line 542
    .line 543
    .line 544
    move-result v2

    .line 545
    add-int/2addr v14, v2

    .line 546
    :cond_14
    add-int/lit8 v8, v8, 0x1

    .line 547
    .line 548
    move/from16 v2, v17

    .line 549
    .line 550
    goto/16 :goto_4

    .line 551
    .line 552
    :cond_15
    move/from16 v17, v2

    .line 553
    .line 554
    if-eqz v9, :cond_16

    .line 555
    .line 556
    div-int/2addr v10, v9

    .line 557
    div-int/2addr v12, v9

    .line 558
    div-int/2addr v14, v9

    .line 559
    invoke-static {v10, v12, v14}, Landroid/graphics/Color;->rgb(III)I

    .line 560
    .line 561
    .line 562
    move-result v0

    .line 563
    goto :goto_6

    .line 564
    :cond_16
    move/from16 v0, v17

    .line 565
    .line 566
    :goto_6
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 567
    .line 568
    .line 569
    move-result v1

    .line 570
    invoke-static {v7}, Landroid/graphics/Color;->red(I)I

    .line 571
    .line 572
    .line 573
    move-result v2

    .line 574
    sub-int/2addr v1, v2

    .line 575
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    if-gt v1, v13, :cond_1c

    .line 580
    .line 581
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 582
    .line 583
    .line 584
    move-result v1

    .line 585
    invoke-static {v7}, Landroid/graphics/Color;->green(I)I

    .line 586
    .line 587
    .line 588
    move-result v2

    .line 589
    sub-int/2addr v1, v2

    .line 590
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 591
    .line 592
    .line 593
    move-result v1

    .line 594
    if-gt v1, v13, :cond_1c

    .line 595
    .line 596
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 597
    .line 598
    .line 599
    move-result v1

    .line 600
    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    .line 601
    .line 602
    .line 603
    move-result v2

    .line 604
    sub-int/2addr v1, v2

    .line 605
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    if-le v1, v13, :cond_17

    .line 610
    .line 611
    goto/16 :goto_9

    .line 612
    .line 613
    :cond_17
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 614
    .line 615
    .line 616
    move-result v1

    .line 617
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    .line 618
    .line 619
    .line 620
    move-result v2

    .line 621
    sub-int/2addr v1, v2

    .line 622
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 623
    .line 624
    .line 625
    move-result v1

    .line 626
    if-gt v1, v13, :cond_1c

    .line 627
    .line 628
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 629
    .line 630
    .line 631
    move-result v1

    .line 632
    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    .line 633
    .line 634
    .line 635
    move-result v2

    .line 636
    sub-int/2addr v1, v2

    .line 637
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 638
    .line 639
    .line 640
    move-result v1

    .line 641
    if-gt v1, v13, :cond_1c

    .line 642
    .line 643
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 644
    .line 645
    .line 646
    move-result v1

    .line 647
    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    .line 648
    .line 649
    .line 650
    move-result v2

    .line 651
    sub-int/2addr v1, v2

    .line 652
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 653
    .line 654
    .line 655
    move-result v1

    .line 656
    if-le v1, v13, :cond_18

    .line 657
    .line 658
    goto/16 :goto_9

    .line 659
    .line 660
    :cond_18
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 661
    .line 662
    .line 663
    move-result v1

    .line 664
    int-to-double v1, v1

    .line 665
    const-wide v8, 0x3fd322d0e5604189L    # 0.299

    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    mul-double/2addr v1, v8

    .line 671
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 672
    .line 673
    .line 674
    move-result v10

    .line 675
    int-to-double v10, v10

    .line 676
    const-wide v12, 0x3fe2cd9e83e425afL    # 0.5876

    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    mul-double/2addr v10, v12

    .line 682
    add-double/2addr v1, v10

    .line 683
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 684
    .line 685
    .line 686
    move-result v10

    .line 687
    int-to-double v10, v10

    .line 688
    const-wide v14, 0x3fbd2f1a9fbe76c9L    # 0.114

    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    mul-double/2addr v10, v14

    .line 694
    add-double/2addr v1, v10

    .line 695
    invoke-static {v7}, Landroid/graphics/Color;->red(I)I

    .line 696
    .line 697
    .line 698
    move-result v10

    .line 699
    int-to-double v10, v10

    .line 700
    mul-double/2addr v10, v8

    .line 701
    move-wide/from16 p0, v8

    .line 702
    .line 703
    invoke-static {v7}, Landroid/graphics/Color;->green(I)I

    .line 704
    .line 705
    .line 706
    move-result v8

    .line 707
    int-to-double v8, v8

    .line 708
    mul-double/2addr v8, v12

    .line 709
    add-double/2addr v10, v8

    .line 710
    invoke-static {v7}, Landroid/graphics/Color;->blue(I)I

    .line 711
    .line 712
    .line 713
    move-result v8

    .line 714
    int-to-double v8, v8

    .line 715
    mul-double/2addr v8, v14

    .line 716
    add-double/2addr v10, v8

    .line 717
    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    .line 718
    .line 719
    .line 720
    move-result v8

    .line 721
    int-to-double v8, v8

    .line 722
    mul-double v8, v8, p0

    .line 723
    .line 724
    move-wide/from16 p0, v12

    .line 725
    .line 726
    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    .line 727
    .line 728
    .line 729
    move-result v12

    .line 730
    int-to-double v12, v12

    .line 731
    mul-double v12, v12, p0

    .line 732
    .line 733
    add-double/2addr v8, v12

    .line 734
    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    .line 735
    .line 736
    .line 737
    move-result v12

    .line 738
    int-to-double v12, v12

    .line 739
    mul-double/2addr v12, v14

    .line 740
    add-double/2addr v8, v12

    .line 741
    cmpl-double v12, v1, v10

    .line 742
    .line 743
    if-ltz v12, :cond_19

    .line 744
    .line 745
    cmpl-double v12, v1, v8

    .line 746
    .line 747
    if-ltz v12, :cond_19

    .line 748
    .line 749
    move/from16 v17, v5

    .line 750
    .line 751
    :cond_19
    cmpl-double v5, v10, v1

    .line 752
    .line 753
    if-lez v5, :cond_1a

    .line 754
    .line 755
    cmpl-double v5, v10, v8

    .line 756
    .line 757
    if-lez v5, :cond_1a

    .line 758
    .line 759
    goto :goto_7

    .line 760
    :cond_1a
    move/from16 v7, v17

    .line 761
    .line 762
    :goto_7
    cmpl-double v1, v8, v1

    .line 763
    .line 764
    if-lez v1, :cond_1b

    .line 765
    .line 766
    cmpl-double v1, v8, v10

    .line 767
    .line 768
    if-lez v1, :cond_1b

    .line 769
    .line 770
    goto :goto_8

    .line 771
    :cond_1b
    move v0, v7

    .line 772
    :goto_8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 773
    .line 774
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 775
    .line 776
    .line 777
    const-string v2, "canFillColor^_^"

    .line 778
    .line 779
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 780
    .line 781
    .line 782
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 783
    .line 784
    .line 785
    move-result-object v2

    .line 786
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 787
    .line 788
    .line 789
    const-string v2, " time "

    .line 790
    .line 791
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    .line 793
    .line 794
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 795
    .line 796
    .line 797
    move-result-wide v7

    .line 798
    sub-long/2addr v7, v3

    .line 799
    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 800
    .line 801
    .line 802
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 803
    .line 804
    .line 805
    move-result-object v1

    .line 806
    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 807
    .line 808
    .line 809
    return v0

    .line 810
    :cond_1c
    :goto_9
    return v17
.end method

.method private static d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    const/16 v3, 0x32

    .line 8
    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    div-int/lit8 v2, v2, 0x2

    .line 16
    .line 17
    invoke-virtual {p0, v1, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-le v2, v3, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v1, v0

    .line 32
    :goto_1
    move v2, v0

    .line 33
    :goto_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ge v2, v4, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    div-int/lit8 v4, v4, 0x2

    .line 44
    .line 45
    invoke-virtual {p0, v4, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-le v4, v3, :cond_2

    .line 54
    .line 55
    goto :goto_3

    .line 56
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    move v2, v0

    .line 60
    :goto_3
    move p0, v0

    .line 61
    :goto_4
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-ge p0, v4, :cond_5

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    div-int/lit8 v4, v4, 0x2

    .line 72
    .line 73
    invoke-virtual {p1, p0, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-le v4, v3, :cond_4

    .line 82
    .line 83
    goto :goto_5

    .line 84
    :cond_4
    add-int/lit8 p0, p0, 0x1

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_5
    move p0, v0

    .line 88
    :goto_5
    move v4, v0

    .line 89
    :goto_6
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-ge v4, v5, :cond_7

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    div-int/lit8 v5, v5, 0x2

    .line 100
    .line 101
    invoke-virtual {p1, v5, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    invoke-static {v5}, Landroid/graphics/Color;->alpha(I)I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    if-le v5, v3, :cond_6

    .line 110
    .line 111
    goto :goto_7

    .line 112
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 113
    .line 114
    goto :goto_6

    .line 115
    :cond_7
    move v4, v0

    .line 116
    :goto_7
    if-gt v1, p0, :cond_9

    .line 117
    .line 118
    if-le v2, v4, :cond_8

    .line 119
    .line 120
    goto :goto_8

    .line 121
    :cond_8
    return v0

    .line 122
    :cond_9
    :goto_8
    sub-int/2addr v1, p0

    .line 123
    sub-int/2addr v2, v4

    .line 124
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    return p0
.end method

.method private static e([II)Z
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    if-ge v2, v0, :cond_0

    .line 6
    .line 7
    aget v4, p0, v2

    .line 8
    .line 9
    add-int/2addr v3, v4

    .line 10
    add-int/lit8 v2, v2, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    int-to-float v0, v3

    .line 14
    const/high16 v2, 0x40800000    # 4.0f

    .line 15
    .line 16
    div-float/2addr v0, v2

    .line 17
    invoke-static {p1}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    int-to-float p1, p1

    .line 22
    div-float p1, v0, p1

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const v2, 0x3dcccccd    # 0.1f

    .line 29
    .line 30
    .line 31
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-lt p1, v2, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    array-length p1, p0

    .line 39
    const/4 v2, 0x0

    .line 40
    move v3, v1

    .line 41
    :goto_1
    if-ge v3, p1, :cond_2

    .line 42
    .line 43
    aget v4, p0, v3

    .line 44
    .line 45
    int-to-float v4, v4

    .line 46
    sub-float/2addr v4, v0

    .line 47
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    add-float/2addr v2, v4

    .line 52
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    const/high16 p1, 0x40c00000    # 6.0f

    .line 60
    .line 61
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-gt p0, p1, :cond_3

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_3
    return v1
.end method

.method static f(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const-string v0, "defaultProcessIcon--launcher"

    .line 2
    .line 3
    const-string v1, "LauncherIconProcess"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    if-eqz p0, :cond_9

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto/16 :goto_2

    .line 17
    .line 18
    :cond_0
    if-eqz p2, :cond_8

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_1
    if-eqz p1, :cond_7

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v2, "defaultProcessIcon-appIconBitmap width "

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    sget v0, Lcom/android/launcher3/resource/t;->a:I

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {p2, v0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    sget v0, Lcom/android/launcher3/resource/t;->a:I

    .line 70
    .line 71
    invoke-static {p1, v0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget v0, Lcom/android/launcher3/resource/t;->a:I

    .line 76
    .line 77
    invoke-static {p0, v0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Lcom/android/launcher3/resource/t;->i(Landroid/graphics/Bitmap;)[I

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    array-length v2, v0

    .line 86
    const/4 v3, 0x4

    .line 87
    if-ne v2, v3, :cond_6

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v0, v2}, Lcom/android/launcher3/resource/t;->e([II)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_5

    .line 98
    .line 99
    aget v2, v0, v1

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-static {p0}, Lx1/O;->m(Landroid/graphics/Bitmap;)[B

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-static {v2, v3, v4}, Lcom/android/launcher3/resource/t;->q(II[B)Landroid/graphics/Bitmap;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    if-eqz v2, :cond_3

    .line 114
    .line 115
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-nez v3, :cond_3

    .line 120
    .line 121
    const/4 v3, 0x1

    .line 122
    invoke-static {v3, v2}, Lcom/android/launcher3/resource/t;->c(ILandroid/graphics/Bitmap;)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_3

    .line 127
    .line 128
    invoke-static {v3, v2, p1, p2, p3}, Lcom/android/launcher3/resource/t;->g(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    int-to-double v2, v2

    .line 138
    const-wide v4, 0x3faeb851eb851eb8L    # 0.06

    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    mul-double/2addr v2, v4

    .line 144
    double-to-int v2, v2

    .line 145
    invoke-static {v2, p0}, Lcom/android/launcher3/resource/t;->c(ILandroid/graphics/Bitmap;)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_4

    .line 150
    .line 151
    invoke-static {v2, p0, p1, p2, p3}, Lcom/android/launcher3/resource/t;->g(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_4
    aget v0, v0, v1

    .line 157
    .line 158
    invoke-static {v0, p0, p1, p2, p3}, Lcom/android/launcher3/resource/t;->m(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    return-object p0

    .line 163
    :cond_5
    invoke-static {p0, p2, p1}, Lcom/android/launcher3/resource/t;->r(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    :cond_6
    return-object p0

    .line 168
    :cond_7
    :goto_0
    const-string p1, "defaultProcessIcon--maskSrc.isRecycled()"

    .line 169
    .line 170
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    return-object p0

    .line 174
    :cond_8
    :goto_1
    const-string p1, "defaultProcessIcon--bgIcon.isRecycled()"

    .line 175
    .line 176
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    return-object p0

    .line 180
    :cond_9
    :goto_2
    const-string p1, "defaultProcessIcon--appIconBitmap.isRecycled()"

    .line 181
    .line 182
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    .line 184
    .line 185
    return-object p0
.end method

.method private static g(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/resource/t;->h(I)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p2}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Lcom/android/launcher3/resource/t;->a:I

    .line 10
    .line 11
    int-to-double v0, p2

    .line 12
    const-wide v2, 0x3fe5c28f5c28f5c3L    # 0.68

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    mul-double/2addr v0, v2

    .line 18
    double-to-int p2, v0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, p2, v0}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1, p0}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p4, :cond_0

    .line 29
    .line 30
    invoke-static {p0, p3}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :cond_0
    return-object p0
.end method

.method public static h(I)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/resource/t;->a:I

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 4
    .line 5
    invoke-static {v0, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/graphics/Canvas;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method private static i(Landroid/graphics/Bitmap;)[I
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p0, :cond_9

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_6

    .line 11
    .line 12
    :cond_0
    const/4 v1, 0x4

    .line 13
    new-array v1, v1, [I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    move v3, v2

    .line 17
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/16 v5, 0x32

    .line 22
    .line 23
    if-ge v3, v4, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-ge v3, v4, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0, v3, v3}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-le v4, v5, :cond_1

    .line 40
    .line 41
    invoke-static {v3}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    aput v3, v1, v2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    :goto_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    sub-int/2addr v3, v0

    .line 56
    move v4, v3

    .line 57
    :goto_2
    if-lez v4, :cond_4

    .line 58
    .line 59
    sub-int v6, v3, v4

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    if-ge v6, v7, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0, v4, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 68
    .line 69
    .line 70
    move-result v7

    .line 71
    invoke-static {v7}, Landroid/graphics/Color;->alpha(I)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    if-le v7, v5, :cond_3

    .line 76
    .line 77
    invoke-static {v6}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    aput v4, v1, v0

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_3
    add-int/lit8 v4, v4, -0x1

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    :goto_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-ge v2, v0, :cond_6

    .line 92
    .line 93
    sub-int v0, v3, v2

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-ge v0, v4, :cond_5

    .line 100
    .line 101
    invoke-virtual {p0, v2, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-le v0, v5, :cond_5

    .line 110
    .line 111
    const/4 v0, 0x2

    .line 112
    invoke-static {v2}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    aput v2, v1, v0

    .line 117
    .line 118
    goto :goto_4

    .line 119
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_6
    :goto_4
    move v0, v3

    .line 123
    :goto_5
    if-lez v0, :cond_8

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-ge v0, v2, :cond_7

    .line 130
    .line 131
    invoke-virtual {p0, v0, v0}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-le v2, v5, :cond_7

    .line 140
    .line 141
    sub-int/2addr v3, v0

    .line 142
    invoke-static {v3}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    const/4 v0, 0x3

    .line 147
    aput p0, v1, v0

    .line 148
    .line 149
    return-object v1

    .line 150
    :cond_7
    add-int/lit8 v0, v0, -0x1

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_8
    return-object v1

    .line 154
    :cond_9
    :goto_6
    new-array p0, v0, [I

    .line 155
    .line 156
    return-object p0
.end method

.method private static j(I)I
    .locals 2

    .line 1
    mul-int/lit8 v0, p0, 0x2

    .line 2
    .line 3
    mul-int/2addr v0, p0

    .line 4
    int-to-double v0, v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    double-to-int p0, v0

    .line 10
    return p0
.end method

.method static k(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "LauncherIconProcess"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p1, "defaultProcessIcon--resState is null "

    .line 10
    .line 11
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/resource/o0;->p()Lcom/android/launcher3/resource/z;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/android/launcher3/resource/z;->h()Lcom/android/launcher3/resource/w;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const-string p1, "defaultProcessIcon--iconResource is null "

    .line 30
    .line 31
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    invoke-static {}, Lcom/android/launcher3/resource/o0;->r()Lcom/android/launcher3/resource/o0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0;->i()Lcom/android/launcher3/resource/o0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/android/launcher3/resource/o0$a;->a()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    sput v1, Lcom/android/launcher3/resource/t;->a:I

    .line 50
    .line 51
    :cond_2
    if-nez p2, :cond_3

    .line 52
    .line 53
    const p2, 0x3f266666    # 0.65f

    .line 54
    .line 55
    .line 56
    sput p2, Lcom/android/launcher3/resource/t;->b:F

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const p2, 0x3f147ae1    # 0.58f

    .line 60
    .line 61
    .line 62
    sput p2, Lcom/android/launcher3/resource/t;->b:F

    .line 63
    .line 64
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/resource/w;->t()Landroid/graphics/Bitmap;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-static {p0}, Lcom/android/launcher3/resource/t;->b(Landroid/graphics/Bitmap;)F

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_4

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/resource/t;->r(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0

    .line 86
    :cond_5
    :goto_1
    float-to-int p1, v1

    .line 87
    invoke-virtual {v0, p1}, Lcom/android/launcher3/resource/w;->e(I)Landroid/graphics/Bitmap;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v0}, Lcom/android/launcher3/resource/w;->i()Lcom/android/launcher3/resource/w$a;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/android/launcher3/resource/w$a;->a()Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_6

    .line 102
    .line 103
    const/4 v0, 0x1

    .line 104
    goto :goto_2

    .line 105
    :cond_6
    const/4 v0, 0x0

    .line 106
    :goto_2
    invoke-static {p0, p2, p1, v0}, Lcom/android/launcher3/resource/t;->f(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0
.end method

.method private static l(Landroid/graphics/Bitmap;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x32

    .line 24
    .line 25
    if-le v2, v3, :cond_0

    .line 26
    .line 27
    invoke-static {v1}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return v0
.end method

.method private static m(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v2}, Lcom/android/launcher3/resource/t;->j(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-double v3, v3

    .line 22
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 23
    .line 24
    mul-double/2addr v3, v5

    .line 25
    int-to-double v5, v0

    .line 26
    div-double/2addr v3, v5

    .line 27
    int-to-double v7, p0

    .line 28
    mul-double/2addr v3, v7

    .line 29
    double-to-int p0, v3

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v3, "maskBitmap "

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "/"

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v3, "LauncherIconProcess"

    .line 64
    .line 65
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    invoke-static {p2}, Lcom/android/launcher3/resource/t;->l(Landroid/graphics/Bitmap;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static/range {p1 .. p2}, Lcom/android/launcher3/resource/t;->d(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const/4 v4, 0x0

    .line 77
    if-eqz v3, :cond_0

    .line 78
    .line 79
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 80
    .line 81
    .line 82
    move-result v9

    .line 83
    mul-int/lit8 v3, v3, 0x2

    .line 84
    .line 85
    add-int/2addr v9, v3

    .line 86
    add-int/lit8 v9, v9, 0x2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    move v9, v4

    .line 90
    :goto_0
    if-le p0, v0, :cond_1

    .line 91
    .line 92
    int-to-double v2, v2

    .line 93
    int-to-double v0, v1

    .line 94
    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    .line 95
    .line 96
    mul-double/2addr v7, v10

    .line 97
    sub-double/2addr v0, v7

    .line 98
    div-double/2addr v2, v0

    .line 99
    mul-double/2addr v5, v2

    .line 100
    double-to-int p0, v5

    .line 101
    goto :goto_1

    .line 102
    :cond_1
    move p0, v4

    .line 103
    :goto_1
    invoke-static {v9, p0}, Ljava/lang/Math;->max(II)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    invoke-static {p1, v0, v4}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    :cond_2
    if-le p0, v9, :cond_3

    .line 114
    .line 115
    sget-object p0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 116
    .line 117
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/resource/t;->p(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/Bitmap;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    goto :goto_2

    .line 122
    :cond_3
    invoke-static {p1, p2}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    :goto_2
    if-eqz p4, :cond_4

    .line 127
    .line 128
    move-object p1, p3

    .line 129
    invoke-static {p0, p3}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    :cond_4
    return-object p0
.end method

.method static n(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    const-string v0, "LauncherIconProcess"

    .line 2
    .line 3
    const-string v1, "maskProcessedIcon--launcher"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/launcher3/resource/t;->i(Landroid/graphics/Bitmap;)[I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    aget v0, v0, v1

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, p0, p1, v2, v1}, Lcom/android/launcher3/resource/t;->m(ILandroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/resource/t;->p(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method static p(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/Bitmap;
    .locals 9

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    new-instance v4, Landroid/graphics/Canvas;

    .line 21
    .line 22
    invoke-direct {v4}, Landroid/graphics/Canvas;-><init>()V

    .line 23
    .line 24
    .line 25
    new-instance v5, Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 28
    .line 29
    .line 30
    new-instance v6, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v7, Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, p1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 41
    .line 42
    .line 43
    new-instance v8, Landroid/graphics/PorterDuffXfermode;

    .line 44
    .line 45
    invoke-direct {v8, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 49
    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    iput p2, v6, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    iput p2, v6, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iput v2, v6, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iput v3, v6, Landroid/graphics/Rect;->bottom:I

    .line 59
    .line 60
    sub-int/2addr v0, v2

    .line 61
    div-int/lit8 v0, v0, 0x2

    .line 62
    .line 63
    iput v0, v7, Landroid/graphics/Rect;->left:I

    .line 64
    .line 65
    sub-int/2addr v1, v3

    .line 66
    div-int/lit8 v1, v1, 0x2

    .line 67
    .line 68
    iput v1, v7, Landroid/graphics/Rect;->top:I

    .line 69
    .line 70
    add-int/2addr v0, v2

    .line 71
    iput v0, v7, Landroid/graphics/Rect;->right:I

    .line 72
    .line 73
    add-int/2addr v1, v3

    .line 74
    iput v1, v7, Landroid/graphics/Rect;->bottom:I

    .line 75
    .line 76
    invoke-virtual {v4, p0, v6, v7, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p0}, Lx1/O;->w4(Landroid/graphics/Bitmap;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    invoke-virtual {v4, p0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 84
    .line 85
    .line 86
    return-object p1
.end method

.method private static q(II[B)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const-string v0, "LauncherIconProcess"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    array-length v2, p2

    .line 5
    const/4 v3, 0x1

    .line 6
    const/4 v4, 0x0

    .line 7
    invoke-static {p2, v4, v2, v3}, Landroid/graphics/BitmapRegionDecoder;->newInstance([BIIZ)Landroid/graphics/BitmapRegionDecoder;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 16
    .line 17
    .line 18
    mul-int v3, p0, p0

    .line 19
    .line 20
    int-to-double v3, v3

    .line 21
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 22
    .line 23
    div-double/2addr v3, v5

    .line 24
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    mul-double/2addr v3, v5

    .line 29
    double-to-int v3, v3

    .line 30
    sub-int v3, p1, v3

    .line 31
    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v5, "preProcessIcon--iconWidth "

    .line 38
    .line 39
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v5, " width "

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    new-instance p1, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-direct {p1, p0, p0, v3, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, p1, v2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {p2}, Lx1/O;->y4(Landroid/graphics/BitmapRegionDecoder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return-object v1

    .line 73
    :catch_0
    move-exception p0

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    return-object v1

    .line 76
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string p2, "preProcessIcon--exception "

    .line 82
    .line 83
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method private static r(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    sget v0, Lcom/android/launcher3/resource/t;->a:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sget v1, Lcom/android/launcher3/resource/t;->b:F

    .line 5
    .line 6
    mul-float/2addr v0, v1

    .line 7
    float-to-int v0, v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {p0, v0, v1}, Lx1/O;->G4(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0, p1}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0, p2}, Lcom/android/launcher3/resource/t;->o(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
