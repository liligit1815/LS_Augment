.class public Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;
.super Ljava/lang/Object;
.source "TaskThumbnailViewDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreviewPositionHelper"
.end annotation


# static fields
.field public static final MAX_PCT_BEFORE_ASPECT_RATIOS_CONSIDERED_DIFFERENT:F = 0.15f

.field public static final STAGE_POSITION_BOTTOM_OR_RIGHT:I = 0x1

.field public static final STAGE_POSITION_TOP_OR_LEFT:I


# instance fields
.field private mIsOrientationChanged:Z

.field private final mMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 10
    .line 11
    return-void
.end method

.method private getRotationDelta(II)I
    .locals 0

    .line 1
    sub-int/2addr p2, p1

    .line 2
    if-gez p2, :cond_0

    .line 3
    .line 4
    add-int/lit8 p2, p2, 0x4

    .line 5
    .line 6
    :cond_0
    return p2
.end method

.method private isOrientationChange(I)Z
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :cond_1
    :goto_0
    return p0
.end method

.method private setThumbnailRotation(ILandroid/graphics/Rect;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    mul-int/lit8 v1, p1, 0x5a

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    move p1, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    :goto_0
    int-to-float p1, p1

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    int-to-float v1, p1

    .line 32
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-float p1, p1

    .line 42
    move v2, v1

    .line 43
    move v1, p1

    .line 44
    move p1, v2

    .line 45
    :goto_1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public getMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOrientationChanged()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 2
    .line 3
    return p0
.end method

.method public setOrientationChanged(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 2
    .line 3
    return-void
.end method

.method public updateThumbnailMatrix(Landroid/graphics/Rect;Lcom/android/systemui/shared/recents/model/ThumbnailData;IIZIZ)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    iget v4, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->rotation:I

    .line 10
    .line 11
    move/from16 v5, p6

    .line 12
    .line 13
    invoke-direct {v0, v5, v4}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->getRotationDelta(II)I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    new-instance v5, Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    .line 20
    .line 21
    .line 22
    iget v6, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->scale:F

    .line 23
    .line 24
    iget v7, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->windowingMode:I

    .line 25
    .line 26
    const/4 v9, 0x1

    .line 27
    if-ne v7, v9, :cond_0

    .line 28
    .line 29
    move v7, v9

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v7, 0x0

    .line 32
    :goto_0
    invoke-direct {v0, v4}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->isOrientationChange(I)Z

    .line 33
    .line 34
    .line 35
    move-result v10

    .line 36
    if-eqz v10, :cond_1

    .line 37
    .line 38
    if-eqz v7, :cond_1

    .line 39
    .line 40
    move v10, v9

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 v10, 0x0

    .line 43
    :goto_1
    const/4 v11, 0x0

    .line 44
    if-eqz v2, :cond_14

    .line 45
    .line 46
    if-eqz v3, :cond_14

    .line 47
    .line 48
    cmpl-float v12, v6, v11

    .line 49
    .line 50
    if-eqz v12, :cond_14

    .line 51
    .line 52
    if-lez v4, :cond_2

    .line 53
    .line 54
    if-eqz v7, :cond_2

    .line 55
    .line 56
    move v7, v9

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    const/4 v7, 0x0

    .line 59
    :goto_2
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->width()I

    .line 60
    .line 61
    .line 62
    move-result v12

    .line 63
    int-to-float v12, v12

    .line 64
    div-float/2addr v12, v6

    .line 65
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->height()I

    .line 66
    .line 67
    .line 68
    move-result v13

    .line 69
    int-to-float v13, v13

    .line 70
    div-float/2addr v13, v6

    .line 71
    int-to-float v2, v2

    .line 72
    int-to-float v3, v3

    .line 73
    div-float v14, v2, v3

    .line 74
    .line 75
    if-eqz v7, :cond_3

    .line 76
    .line 77
    div-float v15, v13, v12

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_3
    div-float v15, v12, v13

    .line 81
    .line 82
    :goto_3
    const v8, 0x3e19999a    # 0.15f

    .line 83
    .line 84
    .line 85
    invoke-static {v14, v15, v8}, Lcom/android/systemui/shared/recents/utilities/Utilities;->isRelativePercentDifferenceGreaterThan(FFF)Z

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    if-eqz v7, :cond_4

    .line 90
    .line 91
    if-eqz v8, :cond_4

    .line 92
    .line 93
    const/4 v7, 0x0

    .line 94
    const/4 v10, 0x0

    .line 95
    :cond_4
    if-eqz v8, :cond_5

    .line 96
    .line 97
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/ThumbnailData;->letterboxInsets:Landroid/graphics/Rect;

    .line 98
    .line 99
    iget v8, v1, Landroid/graphics/Rect;->left:I

    .line 100
    .line 101
    int-to-float v8, v8

    .line 102
    iput v8, v5, Landroid/graphics/RectF;->left:F

    .line 103
    .line 104
    iget v14, v1, Landroid/graphics/Rect;->right:I

    .line 105
    .line 106
    int-to-float v14, v14

    .line 107
    iput v14, v5, Landroid/graphics/RectF;->right:F

    .line 108
    .line 109
    iget v15, v1, Landroid/graphics/Rect;->top:I

    .line 110
    .line 111
    int-to-float v15, v15

    .line 112
    iput v15, v5, Landroid/graphics/RectF;->top:F

    .line 113
    .line 114
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    iput v1, v5, Landroid/graphics/RectF;->bottom:F

    .line 118
    .line 119
    add-float/2addr v8, v14

    .line 120
    sub-float v8, v12, v8

    .line 121
    .line 122
    add-float/2addr v15, v1

    .line 123
    sub-float v1, v13, v15

    .line 124
    .line 125
    goto :goto_4

    .line 126
    :cond_5
    move v8, v12

    .line 127
    move v1, v13

    .line 128
    :goto_4
    if-eqz v10, :cond_6

    .line 129
    .line 130
    move/from16 v18, v3

    .line 131
    .line 132
    move v3, v2

    .line 133
    move/from16 v2, v18

    .line 134
    .line 135
    :cond_6
    div-float v14, v2, v3

    .line 136
    .line 137
    div-float v15, v8, v1

    .line 138
    .line 139
    invoke-static {v15, v14}, Ljava/lang/Math;->max(FF)F

    .line 140
    .line 141
    .line 142
    move-result v16

    .line 143
    invoke-static {v15, v14}, Ljava/lang/Math;->min(FF)F

    .line 144
    .line 145
    .line 146
    move-result v17

    .line 147
    div-float v16, v16, v17

    .line 148
    .line 149
    const/high16 v17, 0x3fa00000    # 1.25f

    .line 150
    .line 151
    cmpl-float v16, v16, v17

    .line 152
    .line 153
    if-lez v16, :cond_7

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_7
    const/4 v9, 0x0

    .line 157
    :goto_5
    if-eqz v9, :cond_a

    .line 158
    .line 159
    cmpg-float v14, v1, v3

    .line 160
    .line 161
    if-gez v14, :cond_8

    .line 162
    .line 163
    invoke-static {v3, v13}, Ljava/lang/Math;->min(FF)F

    .line 164
    .line 165
    .line 166
    move-result v13

    .line 167
    mul-float v14, v13, v15

    .line 168
    .line 169
    goto :goto_6

    .line 170
    :cond_8
    move v13, v1

    .line 171
    move v14, v8

    .line 172
    :goto_6
    cmpl-float v16, v14, v12

    .line 173
    .line 174
    if-lez v16, :cond_9

    .line 175
    .line 176
    div-float v13, v12, v15

    .line 177
    .line 178
    goto :goto_8

    .line 179
    :cond_9
    move v12, v14

    .line 180
    goto :goto_8

    .line 181
    :cond_a
    div-float v15, v8, v14

    .line 182
    .line 183
    cmpl-float v16, v15, v1

    .line 184
    .line 185
    if-lez v16, :cond_d

    .line 186
    .line 187
    cmpg-float v15, v1, v3

    .line 188
    .line 189
    if-gez v15, :cond_b

    .line 190
    .line 191
    invoke-static {v3, v13}, Ljava/lang/Math;->min(FF)F

    .line 192
    .line 193
    .line 194
    move-result v13

    .line 195
    goto :goto_7

    .line 196
    :cond_b
    move v13, v1

    .line 197
    :goto_7
    mul-float v15, v13, v14

    .line 198
    .line 199
    cmpl-float v16, v15, v12

    .line 200
    .line 201
    if-lez v16, :cond_c

    .line 202
    .line 203
    div-float v13, v12, v14

    .line 204
    .line 205
    goto :goto_8

    .line 206
    :cond_c
    move v12, v15

    .line 207
    goto :goto_8

    .line 208
    :cond_d
    move v12, v8

    .line 209
    move v13, v15

    .line 210
    :goto_8
    if-eqz p7, :cond_e

    .line 211
    .line 212
    iget v14, v5, Landroid/graphics/RectF;->left:F

    .line 213
    .line 214
    sub-float/2addr v8, v12

    .line 215
    add-float/2addr v14, v8

    .line 216
    iput v14, v5, Landroid/graphics/RectF;->left:F

    .line 217
    .line 218
    iget v8, v5, Landroid/graphics/RectF;->right:F

    .line 219
    .line 220
    cmpg-float v15, v8, v11

    .line 221
    .line 222
    if-gez v15, :cond_f

    .line 223
    .line 224
    add-float/2addr v14, v8

    .line 225
    iput v14, v5, Landroid/graphics/RectF;->left:F

    .line 226
    .line 227
    iput v11, v5, Landroid/graphics/RectF;->right:F

    .line 228
    .line 229
    goto :goto_9

    .line 230
    :cond_e
    iget v14, v5, Landroid/graphics/RectF;->right:F

    .line 231
    .line 232
    sub-float/2addr v8, v12

    .line 233
    add-float/2addr v14, v8

    .line 234
    iput v14, v5, Landroid/graphics/RectF;->right:F

    .line 235
    .line 236
    iget v8, v5, Landroid/graphics/RectF;->left:F

    .line 237
    .line 238
    cmpg-float v15, v8, v11

    .line 239
    .line 240
    if-gez v15, :cond_f

    .line 241
    .line 242
    add-float/2addr v14, v8

    .line 243
    iput v14, v5, Landroid/graphics/RectF;->right:F

    .line 244
    .line 245
    iput v11, v5, Landroid/graphics/RectF;->left:F

    .line 246
    .line 247
    :cond_f
    :goto_9
    iget v8, v5, Landroid/graphics/RectF;->bottom:F

    .line 248
    .line 249
    sub-float/2addr v1, v13

    .line 250
    add-float/2addr v8, v1

    .line 251
    iput v8, v5, Landroid/graphics/RectF;->bottom:F

    .line 252
    .line 253
    iget v1, v5, Landroid/graphics/RectF;->top:F

    .line 254
    .line 255
    cmpg-float v14, v1, v11

    .line 256
    .line 257
    if-gez v14, :cond_10

    .line 258
    .line 259
    add-float/2addr v8, v1

    .line 260
    iput v8, v5, Landroid/graphics/RectF;->bottom:F

    .line 261
    .line 262
    iput v11, v5, Landroid/graphics/RectF;->top:F

    .line 263
    .line 264
    goto :goto_a

    .line 265
    :cond_10
    cmpg-float v14, v8, v11

    .line 266
    .line 267
    if-gez v14, :cond_11

    .line 268
    .line 269
    add-float/2addr v1, v8

    .line 270
    iput v1, v5, Landroid/graphics/RectF;->top:F

    .line 271
    .line 272
    iput v11, v5, Landroid/graphics/RectF;->bottom:F

    .line 273
    .line 274
    :cond_11
    :goto_a
    if-eqz v9, :cond_12

    .line 275
    .line 276
    mul-float v1, v12, v6

    .line 277
    .line 278
    div-float v1, v2, v1

    .line 279
    .line 280
    mul-float v8, v13, v6

    .line 281
    .line 282
    div-float v8, v3, v8

    .line 283
    .line 284
    invoke-static {v1, v8}, Ljava/lang/Math;->min(FF)F

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    goto :goto_b

    .line 289
    :cond_12
    mul-float v1, v12, v6

    .line 290
    .line 291
    div-float v1, v2, v1

    .line 292
    .line 293
    :goto_b
    if-eqz v9, :cond_13

    .line 294
    .line 295
    mul-float/2addr v12, v6

    .line 296
    mul-float/2addr v12, v1

    .line 297
    sub-float/2addr v2, v12

    .line 298
    const/high16 v8, 0x40000000    # 2.0f

    .line 299
    .line 300
    div-float v11, v2, v8

    .line 301
    .line 302
    mul-float/2addr v13, v6

    .line 303
    mul-float/2addr v13, v1

    .line 304
    sub-float/2addr v3, v13

    .line 305
    div-float v2, v3, v8

    .line 306
    .line 307
    goto :goto_c

    .line 308
    :cond_13
    move v2, v11

    .line 309
    :goto_c
    move v8, v11

    .line 310
    move v11, v1

    .line 311
    move v1, v8

    .line 312
    move v8, v7

    .line 313
    goto :goto_d

    .line 314
    :cond_14
    move v1, v11

    .line 315
    move v2, v1

    .line 316
    const/4 v8, 0x0

    .line 317
    const/4 v9, 0x0

    .line 318
    :goto_d
    if-nez v8, :cond_15

    .line 319
    .line 320
    iget-object v3, v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 321
    .line 322
    iget v4, v5, Landroid/graphics/RectF;->left:F

    .line 323
    .line 324
    neg-float v4, v4

    .line 325
    mul-float/2addr v4, v6

    .line 326
    iget v5, v5, Landroid/graphics/RectF;->top:F

    .line 327
    .line 328
    neg-float v5, v5

    .line 329
    mul-float/2addr v5, v6

    .line 330
    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 331
    .line 332
    .line 333
    goto :goto_e

    .line 334
    :cond_15
    move-object/from16 v3, p1

    .line 335
    .line 336
    invoke-direct {v0, v4, v3}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->setThumbnailRotation(ILandroid/graphics/Rect;)V

    .line 337
    .line 338
    .line 339
    :goto_e
    iget-object v3, v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 340
    .line 341
    invoke-virtual {v3, v11, v11}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 342
    .line 343
    .line 344
    if-eqz v9, :cond_16

    .line 345
    .line 346
    iget-object v3, v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mMatrix:Landroid/graphics/Matrix;

    .line 347
    .line 348
    invoke-virtual {v3, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 349
    .line 350
    .line 351
    :cond_16
    iput-boolean v10, v0, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$PreviewPositionHelper;->mIsOrientationChanged:Z

    .line 352
    .line 353
    return-void
.end method
