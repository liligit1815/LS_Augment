.class public Lcom/android/launcher3/oneshot/OneShotLayout;
.super Landroid/widget/FrameLayout;
.source "OneShotLayout.java"


# instance fields
.field private g:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/oneshot/OneShotLayout;IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p16}, Lcom/android/launcher3/oneshot/OneShotLayout;->c(IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c(IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;Landroid/animation/ValueAnimator;)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p6

    move-object/from16 v5, p15

    .line 1
    invoke-virtual/range {p16 .. p16}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    int-to-float v7, v1

    sub-float v8, p2, v7

    mul-float/2addr v8, v6

    add-float v9, v7, v8

    float-to-int v12, v9

    int-to-float v9, v2

    sub-float v10, p2, v9

    mul-float/2addr v10, v6

    add-float/2addr v9, v10

    float-to-int v13, v9

    const v9, 0x3f8a3d71    # 1.08f

    mul-float/2addr v9, v7

    add-float/2addr v9, v8

    float-to-int v8, v9

    int-to-float v8, v8

    div-float/2addr v8, v7

    .line 2
    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 3
    invoke-virtual {v3, v8}, Landroid/widget/ImageView;->setScaleY(F)V

    if-eqz p5, :cond_0

    .line 4
    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 5
    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setScaleY(F)V

    :cond_0
    move/from16 v9, p7

    int-to-float v9, v9

    .line 6
    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const/high16 v10, 0x40000000    # 2.0f

    div-float v11, p2, v10

    sub-float/2addr v1, v11

    sub-float/2addr v9, v1

    const/4 v1, 0x0

    sub-float/2addr v9, v1

    mul-float/2addr v9, v6

    add-float v15, v9, v1

    .line 7
    invoke-virtual {v3, v15}, Landroid/widget/ImageView;->setTranslationX(F)V

    if-eqz p5, :cond_1

    .line 8
    invoke-virtual {v4, v15}, Landroid/widget/ImageView;->setTranslationX(F)V

    :cond_1
    div-float v7, p2, v7

    mul-int/lit8 v9, p8, 0x2

    sub-int v9, v2, v9

    int-to-float v9, v9

    mul-float/2addr v9, v7

    div-float/2addr v9, v10

    sub-float v9, v9, p9

    sub-float/2addr v9, v11

    mul-float/2addr v9, v6

    if-nez p5, :cond_2

    move v9, v1

    :cond_2
    move/from16 v7, p10

    int-to-float v7, v7

    .line 9
    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-float/2addr v2, v11

    sub-float/2addr v7, v2

    sub-float/2addr v7, v1

    mul-float/2addr v7, v6

    add-float v16, v1, v7

    add-float v9, v16, v9

    .line 10
    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setTranslationY(F)V

    if-eqz p5, :cond_3

    .line 11
    invoke-virtual {v4, v9}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 12
    :cond_3
    iget-object v1, v0, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070115

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    if-nez p11, :cond_5

    if-eqz p12, :cond_4

    goto :goto_0

    .line 13
    :cond_4
    iget-object v0, v0, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f070116

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v11, v0

    :cond_5
    :goto_0
    sub-float/2addr v11, v1

    mul-float/2addr v11, v6

    add-float/2addr v11, v1

    const/4 v14, 0x0

    move-object/from16 v10, p13

    .line 14
    invoke-virtual/range {v10 .. v16}, Lcom/android/launcher3/oneshot/TransparentBorderView;->c(FIIFFF)V

    if-eqz p5, :cond_6

    move/from16 v14, p9

    move-object/from16 v10, p14

    .line 15
    invoke-virtual/range {v10 .. v16}, Lcom/android/launcher3/oneshot/TransparentBorderView;->c(FIIFFF)V

    .line 16
    :cond_6
    invoke-virtual {v3}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    .line 17
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_7
    if-eqz p5, :cond_8

    if-eqz v4, :cond_8

    .line 18
    invoke-virtual {v4}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_8

    .line 19
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    move-object/from16 v10, p14

    .line 20
    invoke-virtual {v10, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    :cond_8
    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 22
    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 23
    invoke-virtual {v5, v15}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 24
    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setTranslationY(F)V

    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Point;I)Landroid/animation/ValueAnimator;
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    invoke-static {}, Lx1/O;->T0()Z

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v4, "launcherOneShot: getOneMirrorToEndFromAodAnimation oneShotCoordinatePoint="

    .line 17
    .line 18
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v4, ", oneShotAodType="

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, ", hasMainImage="

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "OneShotLayout"

    .line 45
    .line 46
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const v3, 0x7f0b0435

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    move-object v5, v3

    .line 57
    check-cast v5, Landroid/widget/ImageView;

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    if-eqz v5, :cond_0

    .line 61
    .line 62
    invoke-static {}, Lx1/O;->Y()Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    if-nez v7, :cond_1

    .line 67
    .line 68
    :cond_0
    move-object/from16 v16, v3

    .line 69
    .line 70
    goto/16 :goto_8

    .line 71
    .line 72
    :cond_1
    invoke-static {}, Lx1/O;->Y()Landroid/graphics/drawable/Drawable;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 77
    .line 78
    .line 79
    const v7, 0x7f0b0436

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v7}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    check-cast v7, Landroid/widget/ImageView;

    .line 87
    .line 88
    if-eqz v6, :cond_4

    .line 89
    .line 90
    invoke-static {}, Lx1/O;->u0()Landroid/graphics/Bitmap;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    if-eqz v7, :cond_3

    .line 95
    .line 96
    if-nez v8, :cond_2

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_3
    :goto_0
    const-string v0, "launcherOneShot: getOneMirrorToEndFromAodAnimation currentForeground is null, return!"

    .line 104
    .line 105
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    return-object v3

    .line 109
    :cond_4
    :goto_1
    const v8, 0x7f0b0433

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v8}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    move-object v14, v8

    .line 117
    check-cast v14, Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 118
    .line 119
    const v8, 0x7f0b0434

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1, v8}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    move-object v15, v8

    .line 127
    check-cast v15, Lcom/android/launcher3/oneshot/TransparentBorderView;

    .line 128
    .line 129
    if-nez v6, :cond_5

    .line 130
    .line 131
    const/16 v8, 0x8

    .line 132
    .line 133
    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v15, v8}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    :cond_5
    iget-object v8, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 140
    .line 141
    invoke-static {v8}, Lcom/android/launcher3/X3;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    iget v8, v8, Landroid/graphics/Point;->x:I

    .line 146
    .line 147
    iget-object v9, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 148
    .line 149
    invoke-static {v9}, Lcom/android/launcher3/X3;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    iget v9, v9, Landroid/graphics/Point;->y:I

    .line 154
    .line 155
    invoke-virtual {v14, v8, v9}, Lcom/android/launcher3/oneshot/TransparentBorderView;->d(II)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v15, v8, v9}, Lcom/android/launcher3/oneshot/TransparentBorderView;->d(II)V

    .line 159
    .line 160
    .line 161
    const v10, 0x7f0b0437

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v10}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v10

    .line 168
    check-cast v10, Landroid/widget/ImageView;

    .line 169
    .line 170
    if-eqz v10, :cond_6

    .line 171
    .line 172
    invoke-static {}, Lx1/O;->X()Landroid/graphics/drawable/Drawable;

    .line 173
    .line 174
    .line 175
    move-result-object v11

    .line 176
    if-nez v11, :cond_7

    .line 177
    .line 178
    :cond_6
    move-object/from16 v16, v3

    .line 179
    .line 180
    goto/16 :goto_7

    .line 181
    .line 182
    :cond_7
    invoke-static {}, Lx1/O;->X()Landroid/graphics/drawable/Drawable;

    .line 183
    .line 184
    .line 185
    move-result-object v11

    .line 186
    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 187
    .line 188
    .line 189
    iget-object v11, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 190
    .line 191
    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 192
    .line 193
    .line 194
    move-result-object v11

    .line 195
    const-string v12, "one_shot_main_top_y"

    .line 196
    .line 197
    const/4 v13, 0x0

    .line 198
    invoke-static {v11, v12, v13}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 199
    .line 200
    .line 201
    move-result v11

    .line 202
    new-instance v12, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 205
    .line 206
    .line 207
    move-object/from16 v16, v3

    .line 208
    .line 209
    const-string v3, "launcherOneShot: mainTopY "

    .line 210
    .line 211
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    .line 223
    .line 224
    const/4 v3, 0x1

    .line 225
    if-nez v2, :cond_8

    .line 226
    .line 227
    move v12, v3

    .line 228
    goto :goto_2

    .line 229
    :cond_8
    move v12, v13

    .line 230
    :goto_2
    if-ne v2, v3, :cond_9

    .line 231
    .line 232
    move v13, v3

    .line 233
    :cond_9
    if-eqz v12, :cond_a

    .line 234
    .line 235
    iget-object v2, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 236
    .line 237
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    const v3, 0x7f070118

    .line 242
    .line 243
    .line 244
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    :goto_3
    int-to-float v2, v2

    .line 249
    move v3, v2

    .line 250
    goto :goto_4

    .line 251
    :cond_a
    iget-object v2, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 252
    .line 253
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    const v3, 0x7f070117

    .line 258
    .line 259
    .line 260
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    goto :goto_3

    .line 265
    :goto_4
    iget-object v2, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 266
    .line 267
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    move/from16 p2, v3

    .line 272
    .line 273
    const v3, 0x7f070114

    .line 274
    .line 275
    .line 276
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    int-to-float v2, v2

    .line 281
    int-to-float v3, v8

    .line 282
    div-float v3, p2, v3

    .line 283
    .line 284
    move/from16 v17, v3

    .line 285
    .line 286
    sub-int v3, v9, v11

    .line 287
    .line 288
    int-to-float v3, v3

    .line 289
    mul-float v3, v3, v17

    .line 290
    .line 291
    add-float v18, v2, p2

    .line 292
    .line 293
    cmpg-float v3, v3, v18

    .line 294
    .line 295
    const/16 v19, 0x0

    .line 296
    .line 297
    if-gez v3, :cond_c

    .line 298
    .line 299
    cmpl-float v3, v17, v19

    .line 300
    .line 301
    if-nez v3, :cond_b

    .line 302
    .line 303
    const-string v0, "launcherOneShot: getOneMirrorToEndFromAodAnimation scaleXFinal is 0, return!"

    .line 304
    .line 305
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    return-object v16

    .line 309
    :cond_b
    int-to-float v3, v9

    .line 310
    div-float v18, v18, v17

    .line 311
    .line 312
    sub-float v3, v3, v18

    .line 313
    .line 314
    float-to-int v11, v3

    .line 315
    new-instance v3, Ljava/lang/StringBuilder;

    .line 316
    .line 317
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 318
    .line 319
    .line 320
    move-object/from16 v17, v5

    .line 321
    .line 322
    const-string v5, "launcherOneShot: startOneShotAnimation modify mainTopY is "

    .line 323
    .line 324
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    .line 336
    .line 337
    :goto_5
    move v3, v8

    .line 338
    goto :goto_6

    .line 339
    :cond_c
    move-object/from16 v17, v5

    .line 340
    .line 341
    goto :goto_5

    .line 342
    :goto_6
    iget v8, v0, Landroid/graphics/Point;->x:I

    .line 343
    .line 344
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 345
    .line 346
    float-to-int v4, v2

    .line 347
    add-int/2addr v0, v4

    .line 348
    const/4 v4, 0x2

    .line 349
    new-array v4, v4, [F

    .line 350
    .line 351
    fill-array-data v4, :array_0

    .line 352
    .line 353
    .line 354
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 355
    .line 356
    .line 357
    move-result-object v4

    .line 358
    iget-object v5, v1, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 359
    .line 360
    move/from16 p1, v0

    .line 361
    .line 362
    const v0, 0x7f0d0031

    .line 363
    .line 364
    .line 365
    invoke-static {v5, v0}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    invoke-virtual {v4, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 370
    .line 371
    .line 372
    const-wide/16 v0, 0x2a8

    .line 373
    .line 374
    invoke-virtual {v4, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 375
    .line 376
    .line 377
    new-instance v0, LB1/a;

    .line 378
    .line 379
    move-object/from16 v1, p0

    .line 380
    .line 381
    move-object/from16 v20, v4

    .line 382
    .line 383
    move v4, v9

    .line 384
    move-object/from16 v16, v10

    .line 385
    .line 386
    move v9, v11

    .line 387
    move-object/from16 v5, v17

    .line 388
    .line 389
    move/from16 v11, p1

    .line 390
    .line 391
    move v10, v2

    .line 392
    move v2, v3

    .line 393
    move/from16 v3, p2

    .line 394
    .line 395
    invoke-direct/range {v0 .. v16}, LB1/a;-><init>(Lcom/android/launcher3/oneshot/OneShotLayout;IFILandroid/widget/ImageView;ZLandroid/widget/ImageView;IIFIZZLcom/android/launcher3/oneshot/TransparentBorderView;Lcom/android/launcher3/oneshot/TransparentBorderView;Landroid/widget/ImageView;)V

    .line 396
    .line 397
    .line 398
    move-object v1, v0

    .line 399
    move-object/from16 v0, v20

    .line 400
    .line 401
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 402
    .line 403
    .line 404
    return-object v0

    .line 405
    :goto_7
    const-string v0, "launcherOneShot: getOneMirrorToEndFromAodAnimation imageViewKeyguard is null, return!"

    .line 406
    .line 407
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    .line 409
    .line 410
    return-object v16

    .line 411
    :goto_8
    const-string v0, "launcherOneShot: getOneMirrorToEndFromAodAnimation mCurrentWallpaper is null, return!"

    .line 412
    .line 413
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    .line 415
    .line 416
    return-object v16

    .line 417
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public getOneMirrorToEndFromAodBlurAlphaAnimation()Landroid/animation/ValueAnimator;
    .locals 6

    .line 1
    const v0, 0x7f0b0437

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    const-string v2, "OneShotLayout"

    .line 12
    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    invoke-static {}, Lx1/O;->X()Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_0
    invoke-static {}, Lx1/O;->X()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    const v3, 0x7f0b0436

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    check-cast v3, Landroid/widget/ImageView;

    .line 37
    .line 38
    invoke-static {}, Lx1/O;->T0()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-eqz v4, :cond_3

    .line 43
    .line 44
    invoke-static {}, Lx1/O;->u0()Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-eqz v3, :cond_2

    .line 49
    .line 50
    if-nez v4, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    :goto_0
    const-string p0, "launcherOneShot: getOneMirrorToEndFromAodBlurAlphaAnimation currentForeground is null, return!"

    .line 58
    .line 59
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    return-object v1

    .line 63
    :cond_3
    const/16 v1, 0x8

    .line 64
    .line 65
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    :goto_1
    const/4 v1, 0x2

    .line 69
    new-array v1, v1, [F

    .line 70
    .line 71
    fill-array-data v1, :array_0

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v2, p0, Lcom/android/launcher3/oneshot/OneShotLayout;->g:Landroid/content/Context;

    .line 79
    .line 80
    const v4, 0x7f0d0031

    .line 81
    .line 82
    .line 83
    invoke-static {v2, v4}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v4, 0xb4

    .line 91
    .line 92
    invoke-virtual {v1, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 93
    .line 94
    .line 95
    new-instance v2, Lcom/android/launcher3/oneshot/OneShotLayout$a;

    .line 96
    .line 97
    invoke-direct {v2, p0, v0, v3}, Lcom/android/launcher3/oneshot/OneShotLayout$a;-><init>(Lcom/android/launcher3/oneshot/OneShotLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 101
    .line 102
    .line 103
    return-object v1

    .line 104
    :cond_4
    :goto_2
    const-string p0, "launcherOneShot: getOneMirrorToEndFromAodBlurAlphaAnimation mCurrentKeyguardWallpaper is null, return!"

    .line 105
    .line 106
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    return-object v1

    .line 110
    nop

    .line 111
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
