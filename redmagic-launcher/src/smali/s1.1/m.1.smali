.class public Ls1/m;
.super Ljava/lang/Object;
.source "DotRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/m$a;,
        Ls1/m$b;
    }
.end annotation


# instance fields
.field private a:F

.field private b:Landroid/graphics/Paint;

.field private c:Landroid/graphics/Bitmap;

.field private d:F

.field private e:F

.field private f:I

.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ls1/m;->b:Landroid/graphics/Paint;

    .line 11
    .line 12
    return-void
.end method

.method public static b(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;ZZ)V
    .locals 13

    .line 1
    move-object v0, p2

    .line 2
    iget v1, v0, Ls1/m$a;->f:I

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    goto/16 :goto_8

    .line 7
    .line 8
    :cond_0
    iget v2, v0, Ls1/m$a;->i:I

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v0, Ls1/m$a;->k:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    goto/16 :goto_8

    .line 23
    .line 24
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, v0, Ls1/m$a;->o:Ls1/m$b;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const/4 v3, 0x1

    .line 35
    const/high16 v4, 0x3f800000    # 1.0f

    .line 36
    .line 37
    if-eq v2, v3, :cond_2

    .line 38
    .line 39
    move v2, v4

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const v2, 0x3f4ccccd    # 0.8f

    .line 42
    .line 43
    .line 44
    :goto_0
    if-eqz p3, :cond_3

    .line 45
    .line 46
    if-eqz p4, :cond_3

    .line 47
    .line 48
    sget v5, Ls1/h0;->l:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    sget v5, Ls1/h0;->j:I

    .line 52
    .line 53
    :goto_1
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    iget v6, v0, Ls1/m$a;->d:F

    .line 58
    .line 59
    mul-float/2addr v5, v6

    .line 60
    if-eqz p3, :cond_5

    .line 61
    .line 62
    if-eqz p4, :cond_4

    .line 63
    .line 64
    sget v5, Ls1/h0;->l:I

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_4
    sget v5, Ls1/h0;->k:I

    .line 68
    .line 69
    :goto_2
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    iget v6, v0, Ls1/m$a;->d:F

    .line 74
    .line 75
    mul-float/2addr v5, v6

    .line 76
    :cond_5
    mul-float/2addr v5, v2

    .line 77
    new-instance v6, Landroid/graphics/Paint;

    .line 78
    .line 79
    const/16 v7, 0x101

    .line 80
    .line 81
    invoke-direct {v6, v7}, Landroid/graphics/Paint;-><init>(I)V

    .line 82
    .line 83
    .line 84
    const/4 v7, -0x1

    .line 85
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 89
    .line 90
    .line 91
    sget-object v5, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 92
    .line 93
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 94
    .line 95
    .line 96
    iget v5, v0, Ls1/m$a;->f:I

    .line 97
    .line 98
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    iget v7, v0, Ls1/m$a;->f:I

    .line 103
    .line 104
    const/16 v8, 0x3e7

    .line 105
    .line 106
    if-le v7, v8, :cond_6

    .line 107
    .line 108
    const-string v5, "999+"

    .line 109
    .line 110
    :cond_6
    iget v7, v0, Ls1/m$a;->a:I

    .line 111
    .line 112
    if-eqz v7, :cond_7

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_7
    sget v7, Ls1/g0;->e:I

    .line 116
    .line 117
    invoke-static {p0, v7}, Lz/a;->c(Landroid/content/Context;I)I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    :goto_3
    iget p0, v0, Ls1/m$a;->i:I

    .line 122
    .line 123
    iget-object v8, v0, Ls1/m$a;->k:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    if-nez v8, :cond_9

    .line 130
    .line 131
    iget-object v5, v0, Ls1/m$a;->k:Ljava/lang/String;

    .line 132
    .line 133
    iget-boolean v8, v0, Ls1/m$a;->l:Z

    .line 134
    .line 135
    if-eqz v8, :cond_8

    .line 136
    .line 137
    const/4 p0, 0x0

    .line 138
    :cond_8
    iget v8, v0, Ls1/m$a;->m:I

    .line 139
    .line 140
    if-eqz v8, :cond_9

    .line 141
    .line 142
    move v7, v8

    .line 143
    :cond_9
    sget v8, Ls1/h0;->g:I

    .line 144
    .line 145
    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    iget v9, v0, Ls1/m$a;->d:F

    .line 150
    .line 151
    mul-float/2addr v8, v9

    .line 152
    if-eqz p3, :cond_a

    .line 153
    .line 154
    sget v8, Ls1/h0;->h:I

    .line 155
    .line 156
    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getDimension(I)F

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    :cond_a
    mul-float/2addr v8, v2

    .line 161
    sget v9, Ls1/h0;->i:I

    .line 162
    .line 163
    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getDimension(I)F

    .line 164
    .line 165
    .line 166
    move-result v9

    .line 167
    iget v10, v0, Ls1/m$a;->d:F

    .line 168
    .line 169
    mul-float/2addr v9, v10

    .line 170
    sget v10, Ls1/h0;->c:I

    .line 171
    .line 172
    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimension(I)F

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    iget v11, v0, Ls1/m$a;->d:F

    .line 177
    .line 178
    mul-float/2addr v10, v11

    .line 179
    if-eqz p3, :cond_c

    .line 180
    .line 181
    if-eqz p4, :cond_b

    .line 182
    .line 183
    sget v10, Ls1/h0;->e:I

    .line 184
    .line 185
    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimension(I)F

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    iget v10, v0, Ls1/m$a;->d:F

    .line 190
    .line 191
    :goto_4
    mul-float/2addr v1, v10

    .line 192
    move v10, v1

    .line 193
    goto :goto_5

    .line 194
    :cond_b
    sget v10, Ls1/h0;->d:I

    .line 195
    .line 196
    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getDimension(I)F

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    iget v10, v0, Ls1/m$a;->d:F

    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_c
    :goto_5
    mul-float/2addr v10, v2

    .line 204
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    add-float/2addr v1, v4

    .line 209
    float-to-int v1, v1

    .line 210
    int-to-float v1, v1

    .line 211
    const/high16 v2, 0x40000000    # 2.0f

    .line 212
    .line 213
    mul-float/2addr v9, v2

    .line 214
    add-float/2addr v1, v9

    .line 215
    invoke-static {v1, v8}, Ljava/lang/Math;->max(FF)F

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz p3, :cond_d

    .line 220
    .line 221
    if-eqz p4, :cond_d

    .line 222
    .line 223
    const/16 v9, 0x14

    .line 224
    .line 225
    goto :goto_6

    .line 226
    :cond_d
    move v9, v3

    .line 227
    :goto_6
    if-eqz p3, :cond_e

    .line 228
    .line 229
    if-eqz p4, :cond_e

    .line 230
    .line 231
    const v11, 0x3f9d70a4    # 1.23f

    .line 232
    .line 233
    .line 234
    goto :goto_7

    .line 235
    :cond_e
    move v11, v4

    .line 236
    :goto_7
    new-instance v12, Landroid/graphics/Paint;

    .line 237
    .line 238
    invoke-direct {v12}, Landroid/graphics/Paint;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v12, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v12, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 245
    .line 246
    .line 247
    iget v7, v0, Ls1/m$a;->g:I

    .line 248
    .line 249
    if-nez p0, :cond_11

    .line 250
    .line 251
    new-instance p0, Landroid/graphics/RectF;

    .line 252
    .line 253
    int-to-float v0, v7

    .line 254
    sub-float/2addr v0, v1

    .line 255
    int-to-float v1, v9

    .line 256
    sub-float/2addr v0, v1

    .line 257
    sub-int/2addr v7, v3

    .line 258
    int-to-float v3, v7

    .line 259
    add-float/2addr v8, v1

    .line 260
    invoke-direct {p0, v0, v4, v3, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 261
    .line 262
    .line 263
    if-eqz p3, :cond_10

    .line 264
    .line 265
    iget v0, p0, Landroid/graphics/RectF;->right:F

    .line 266
    .line 267
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 268
    .line 269
    sub-float/2addr v0, v1

    .line 270
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 271
    .line 272
    iget v7, p0, Landroid/graphics/RectF;->top:F

    .line 273
    .line 274
    sub-float/2addr v1, v7

    .line 275
    sub-float/2addr v0, v1

    .line 276
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    cmpl-float v0, v0, v4

    .line 281
    .line 282
    if-lez v0, :cond_10

    .line 283
    .line 284
    iget v0, p0, Landroid/graphics/RectF;->right:F

    .line 285
    .line 286
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 287
    .line 288
    sub-float/2addr v0, v1

    .line 289
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 290
    .line 291
    iget v7, p0, Landroid/graphics/RectF;->top:F

    .line 292
    .line 293
    sub-float/2addr v1, v7

    .line 294
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz p4, :cond_f

    .line 299
    .line 300
    float-to-double v0, v0

    .line 301
    const-wide v7, 0x3feccccccccccccdL    # 0.9

    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    mul-double/2addr v0, v7

    .line 307
    double-to-float v0, v0

    .line 308
    :cond_f
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 309
    .line 310
    sub-float/2addr v1, v0

    .line 311
    iget v7, p0, Landroid/graphics/RectF;->top:F

    .line 312
    .line 313
    add-float/2addr v7, v0

    .line 314
    invoke-virtual {p0, v1, v4, v3, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 315
    .line 316
    .line 317
    :cond_10
    invoke-virtual {p1, p0, v10, v10, v12}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v6}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerX()F

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerY()F

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    iget v3, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 333
    .line 334
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 335
    .line 336
    add-float/2addr v3, v0

    .line 337
    div-float/2addr v3, v2

    .line 338
    sub-float/2addr p0, v3

    .line 339
    invoke-virtual {p1, v5, v1, p0, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :cond_11
    if-ne p0, v3, :cond_12

    .line 344
    .line 345
    int-to-float p0, v7

    .line 346
    const v1, 0x3e6978d5    # 0.228f

    .line 347
    .line 348
    .line 349
    mul-float/2addr v1, p0

    .line 350
    mul-float/2addr v1, v11

    .line 351
    div-float/2addr v1, v2

    .line 352
    float-to-int v1, v1

    .line 353
    int-to-float v1, v1

    .line 354
    iget v0, v0, Ls1/m$a;->j:F

    .line 355
    .line 356
    mul-float v2, v0, v1

    .line 357
    .line 358
    sub-float/2addr p0, v2

    .line 359
    mul-float/2addr v0, v1

    .line 360
    invoke-virtual {p1, p0, v0, v1, v12}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 361
    .line 362
    .line 363
    :cond_12
    :goto_8
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;)V
    .locals 4

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const-string p0, "DotRenderer"

    .line 4
    .line 5
    const-string p1, "Invalid null argument(s) passed in call to draw."

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ls1/h0;->g:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p3, Ls1/m$a;->g:I

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    const/high16 v2, 0x40000000    # 2.0f

    .line 28
    .line 29
    div-float/2addr v0, v2

    .line 30
    sub-float/2addr v1, v0

    .line 31
    const/high16 v2, 0x3f800000    # 1.0f

    .line 32
    .line 33
    sub-float/2addr v1, v2

    .line 34
    add-float/2addr v0, v2

    .line 35
    iget-object v2, p3, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 36
    .line 37
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    int-to-float v3, v3

    .line 40
    iget v2, v2, Landroid/graphics/Rect;->top:I

    .line 41
    .line 42
    int-to-float v2, v2

    .line 43
    invoke-virtual {p2, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 44
    .line 45
    .line 46
    iget v2, p3, Ls1/m$a;->d:F

    .line 47
    .line 48
    invoke-virtual {p2, v2, v2, v1, v0}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    iget-boolean p0, p0, Ls1/m;->g:Z

    .line 53
    .line 54
    invoke-static {p1, p2, p3, v0, p0}, Ls1/m;->b(Landroid/content/Context;Landroid/graphics/Canvas;Ls1/m$a;ZZ)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public c(Landroid/graphics/Canvas;Landroid/content/Context;Ls1/m$a;F)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget v0, Ls1/i0;->k:I

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ls1/h0;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    mul-float/2addr v0, p4

    .line 29
    float-to-int v0, v0

    .line 30
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget v2, Ls1/h0;->a:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    mul-float/2addr v1, p4

    .line 42
    float-to-int v1, v1

    .line 43
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    sget v2, Ls1/h0;->f:I

    .line 48
    .line 49
    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    mul-float/2addr p2, p4

    .line 54
    float-to-int p2, p2

    .line 55
    iget p4, p3, Ls1/m$a;->g:I

    .line 56
    .line 57
    sub-int/2addr p4, v1

    .line 58
    div-int/lit8 v2, v0, 0x2

    .line 59
    .line 60
    sub-int/2addr p4, v2

    .line 61
    mul-int/lit8 p2, p2, 0x4

    .line 62
    .line 63
    sub-int/2addr p4, p2

    .line 64
    div-int/lit8 v1, v1, 0x4

    .line 65
    .line 66
    iget-object p2, p3, Ls1/m$a;->c:Landroid/graphics/Rect;

    .line 67
    .line 68
    iget p3, p2, Landroid/graphics/Rect;->left:I

    .line 69
    .line 70
    int-to-float p3, p3

    .line 71
    iget p2, p2, Landroid/graphics/Rect;->top:I

    .line 72
    .line 73
    int-to-float p2, p2

    .line 74
    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 75
    .line 76
    .line 77
    add-int p2, p4, v0

    .line 78
    .line 79
    add-int/2addr v0, v1

    .line 80
    invoke-virtual {p0, p4, v1, p2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 94
    .line 95
    if-le p3, v2, :cond_1

    .line 96
    .line 97
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    iget p3, p3, Landroid/graphics/Rect;->right:I

    .line 102
    .line 103
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget v2, v2, Landroid/graphics/Rect;->right:I

    .line 108
    .line 109
    sub-int/2addr p3, v2

    .line 110
    sub-int/2addr p4, p3

    .line 111
    sub-int/2addr p2, p3

    .line 112
    invoke-virtual {p0, p4, v1, p2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 113
    .line 114
    .line 115
    :cond_1
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ls1/m;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const v0, 0x3ec28f5c    # 0.38f

    .line 3
    .line 4
    .line 5
    mul-float/2addr v0, p1

    .line 6
    iput v0, p0, Ls1/m;->e:F

    .line 7
    .line 8
    const v1, 0x3ca3d70a    # 0.02f

    .line 9
    .line 10
    .line 11
    mul-float/2addr p1, v1

    .line 12
    float-to-int p1, p1

    .line 13
    iput p1, p0, Ls1/m;->f:I

    .line 14
    .line 15
    const p1, 0x3f19999a    # 0.6f

    .line 16
    .line 17
    .line 18
    mul-float/2addr v0, p1

    .line 19
    float-to-int p1, v0

    .line 20
    new-instance v0, Ls1/m0$a;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-direct {v0, v1}, Ls1/m0$a;-><init>(I)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0x58

    .line 27
    .line 28
    iput v1, v0, Ls1/m0$a;->c:I

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ls1/m0$a;->d(I)Ls1/m0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, p1, p1}, Ls1/m0$a;->a(II)Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ls1/m;->c:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    neg-int p1, p1

    .line 45
    int-to-float p1, p1

    .line 46
    const/high16 v1, 0x3f000000    # 0.5f

    .line 47
    .line 48
    mul-float/2addr p1, v1

    .line 49
    iput p1, p0, Ls1/m;->d:F

    .line 50
    .line 51
    iget p1, v0, Ls1/m0$a;->g:F

    .line 52
    .line 53
    iput p1, p0, Ls1/m;->a:F

    .line 54
    .line 55
    return-void
.end method
