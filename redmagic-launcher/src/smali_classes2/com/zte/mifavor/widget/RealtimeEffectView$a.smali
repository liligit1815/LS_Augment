.class Lcom/zte/mifavor/widget/RealtimeEffectView$a;
.super Ljava/lang/Object;
.source "RealtimeEffectView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/RealtimeEffectView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/RealtimeEffectView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/RealtimeEffectView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->d(Lcom/zte/mifavor/widget/RealtimeEffectView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "RealtimeEffectView"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v3, "onPreDraw mIsWorking = "

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->d(Lcom/zte/mifavor/widget/RealtimeEffectView;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_0
    return v2

    .line 45
    :cond_1
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->l()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_2

    .line 56
    .line 57
    const-string p0, "blur isSDK31below. return false in on Pre Draw."

    .line 58
    .line 59
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    :cond_2
    return v2

    .line 63
    :cond_3
    const/4 v0, 0x2

    .line 64
    new-array v0, v0, [I

    .line 65
    .line 66
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/zte/mifavor/widget/RealtimeEffectView;->c(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget-object v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/view/View;->isShown()Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 79
    .line 80
    .line 81
    move-result-wide v5

    .line 82
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 83
    .line 84
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->g(Lcom/zte/mifavor/widget/RealtimeEffectView;)J

    .line 85
    .line 86
    .line 87
    move-result-wide v7

    .line 88
    const-wide/16 v9, 0x0

    .line 89
    .line 90
    cmp-long v7, v7, v9

    .line 91
    .line 92
    const/4 v8, 0x1

    .line 93
    if-eqz v7, :cond_4

    .line 94
    .line 95
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 96
    .line 97
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->e(Lcom/zte/mifavor/widget/RealtimeEffectView;)J

    .line 98
    .line 99
    .line 100
    move-result-wide v9

    .line 101
    sub-long v9, v5, v9

    .line 102
    .line 103
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 104
    .line 105
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->g(Lcom/zte/mifavor/widget/RealtimeEffectView;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v11

    .line 109
    cmp-long v7, v9, v11

    .line 110
    .line 111
    if-lez v7, :cond_10

    .line 112
    .line 113
    :cond_4
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 114
    .line 115
    invoke-static {v7, v5, v6}, Lcom/zte/mifavor/widget/RealtimeEffectView;->i(Lcom/zte/mifavor/widget/RealtimeEffectView;J)V

    .line 116
    .line 117
    .line 118
    iget-object v5, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 119
    .line 120
    invoke-virtual {v5}, Lcom/zte/mifavor/widget/RealtimeEffectView;->s()Z

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    if-eqz v3, :cond_f

    .line 125
    .line 126
    if-eqz v4, :cond_f

    .line 127
    .line 128
    if-eqz v5, :cond_f

    .line 129
    .line 130
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 131
    .line 132
    .line 133
    aget v4, v0, v2

    .line 134
    .line 135
    neg-int v4, v4

    .line 136
    aget v5, v0, v8

    .line 137
    .line 138
    neg-int v5, v5

    .line 139
    iget-object v6, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 140
    .line 141
    invoke-virtual {v6, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-eqz v6, :cond_5

    .line 149
    .line 150
    new-instance v6, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    const-string v7, "onPreDraw. x = "

    .line 156
    .line 157
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v7, ", y = "

    .line 164
    .line 165
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v7, ", locations[0] = "

    .line 172
    .line 173
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    aget v7, v0, v2

    .line 177
    .line 178
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v7, ", locations[1] = "

    .line 182
    .line 183
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    aget v7, v0, v8

    .line 187
    .line 188
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v6

    .line 195
    invoke-static {v1, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    :cond_5
    aget v6, v0, v2

    .line 199
    .line 200
    add-int/2addr v4, v6

    .line 201
    aget v0, v0, v8

    .line 202
    .line 203
    add-int/2addr v5, v0

    .line 204
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 205
    .line 206
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    if-eqz v0, :cond_6

    .line 211
    .line 212
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 213
    .line 214
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    iget-object v6, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 219
    .line 220
    invoke-static {v6}, Lcom/zte/mifavor/widget/RealtimeEffectView;->f(Lcom/zte/mifavor/widget/RealtimeEffectView;)I

    .line 221
    .line 222
    .line 223
    move-result v6

    .line 224
    const v7, 0xffffff

    .line 225
    .line 226
    .line 227
    and-int/2addr v6, v7

    .line 228
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 229
    .line 230
    .line 231
    :cond_6
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 232
    .line 233
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    if-eqz v0, :cond_7

    .line 238
    .line 239
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 240
    .line 241
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    goto :goto_0

    .line 250
    :cond_7
    const/4 v0, -0x1

    .line 251
    :goto_0
    iget-object v6, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 252
    .line 253
    invoke-static {v6, v8}, Lcom/zte/mifavor/widget/RealtimeEffectView;->h(Lcom/zte/mifavor/widget/RealtimeEffectView;Z)V

    .line 254
    .line 255
    .line 256
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->k()I

    .line 257
    .line 258
    .line 259
    move-result v6

    .line 260
    add-int/2addr v6, v8

    .line 261
    invoke-static {v6}, Lcom/zte/mifavor/widget/RealtimeEffectView;->m(I)V

    .line 262
    .line 263
    .line 264
    :try_start_0
    iget-object v6, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 265
    .line 266
    invoke-static {v6}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 267
    .line 268
    .line 269
    move-result-object v6

    .line 270
    if-eqz v6, :cond_8

    .line 271
    .line 272
    iget-object v6, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 273
    .line 274
    invoke-static {v6}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 275
    .line 276
    .line 277
    move-result-object v6

    .line 278
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    int-to-float v6, v6

    .line 283
    const/high16 v7, 0x3f800000    # 1.0f

    .line 284
    .line 285
    mul-float/2addr v6, v7

    .line 286
    iget-object v9, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 287
    .line 288
    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    .line 289
    .line 290
    .line 291
    move-result v9

    .line 292
    int-to-float v9, v9

    .line 293
    div-float/2addr v6, v9

    .line 294
    iget-object v9, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 295
    .line 296
    invoke-static {v9}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 297
    .line 298
    .line 299
    move-result-object v9

    .line 300
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    .line 301
    .line 302
    .line 303
    move-result v9

    .line 304
    int-to-float v9, v9

    .line 305
    mul-float/2addr v9, v7

    .line 306
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 307
    .line 308
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 309
    .line 310
    .line 311
    move-result v7

    .line 312
    int-to-float v7, v7

    .line 313
    div-float/2addr v9, v7

    .line 314
    goto :goto_1

    .line 315
    :catchall_0
    move-exception v1

    .line 316
    goto/16 :goto_5

    .line 317
    .line 318
    :catch_0
    move-exception v3

    .line 319
    goto/16 :goto_3

    .line 320
    .line 321
    :cond_8
    const/4 v6, 0x0

    .line 322
    move v9, v6

    .line 323
    :goto_1
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 324
    .line 325
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 326
    .line 327
    .line 328
    move-result-object v7

    .line 329
    if-eqz v7, :cond_b

    .line 330
    .line 331
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 332
    .line 333
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    invoke-virtual {v7, v6, v9}, Landroid/graphics/Canvas;->scale(FF)V

    .line 338
    .line 339
    .line 340
    iget-object v7, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 341
    .line 342
    invoke-static {v7}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 343
    .line 344
    .line 345
    move-result-object v7

    .line 346
    neg-int v4, v4

    .line 347
    int-to-float v10, v4

    .line 348
    neg-int v5, v5

    .line 349
    int-to-float v11, v5

    .line 350
    invoke-virtual {v7, v10, v11}, Landroid/graphics/Canvas;->translate(FF)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 354
    .line 355
    .line 356
    move-result-object v7

    .line 357
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 358
    .line 359
    .line 360
    move-result v10

    .line 361
    if-eqz v10, :cond_9

    .line 362
    .line 363
    new-instance v10, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 366
    .line 367
    .line 368
    const-string v11, "onPreDraw sx = "

    .line 369
    .line 370
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    const-string v6, ", sy = "

    .line 377
    .line 378
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    const-string v6, ", -x = "

    .line 385
    .line 386
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    const-string v4, ", -y = "

    .line 393
    .line 394
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v4

    .line 404
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    .line 406
    .line 407
    :cond_9
    if-eqz v7, :cond_a

    .line 408
    .line 409
    iget-object v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 410
    .line 411
    invoke-static {v4}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    invoke-virtual {v7, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 416
    .line 417
    .line 418
    :cond_a
    iget-object v4, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 419
    .line 420
    invoke-static {v4}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 421
    .line 422
    .line 423
    move-result-object v4

    .line 424
    invoke-virtual {v3, v4}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 425
    .line 426
    .line 427
    :cond_b
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 428
    .line 429
    invoke-static {v3, v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->h(Lcom/zte/mifavor/widget/RealtimeEffectView;Z)V

    .line 430
    .line 431
    .line 432
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->k()I

    .line 433
    .line 434
    .line 435
    move-result v2

    .line 436
    sub-int/2addr v2, v8

    .line 437
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->m(I)V

    .line 438
    .line 439
    .line 440
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 441
    .line 442
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    if-eqz v2, :cond_c

    .line 447
    .line 448
    :goto_2
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 449
    .line 450
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 451
    .line 452
    .line 453
    move-result-object v2

    .line 454
    invoke-virtual {v2, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 455
    .line 456
    .line 457
    goto :goto_4

    .line 458
    :goto_3
    :try_start_1
    const-string v4, "onPreDraw error, e = "

    .line 459
    .line 460
    invoke-static {v1, v4, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 461
    .line 462
    .line 463
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 464
    .line 465
    invoke-static {v3, v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->h(Lcom/zte/mifavor/widget/RealtimeEffectView;Z)V

    .line 466
    .line 467
    .line 468
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->k()I

    .line 469
    .line 470
    .line 471
    move-result v2

    .line 472
    sub-int/2addr v2, v8

    .line 473
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->m(I)V

    .line 474
    .line 475
    .line 476
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 477
    .line 478
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 479
    .line 480
    .line 481
    move-result-object v2

    .line 482
    if-eqz v2, :cond_c

    .line 483
    .line 484
    goto :goto_2

    .line 485
    :cond_c
    :goto_4
    iget-object v0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 486
    .line 487
    invoke-static {v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    if-eqz v0, :cond_d

    .line 492
    .line 493
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 494
    .line 495
    invoke-static {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->a(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Bitmap;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->v(Landroid/graphics/Bitmap;)V

    .line 500
    .line 501
    .line 502
    goto :goto_6

    .line 503
    :cond_d
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 504
    .line 505
    .line 506
    move-result p0

    .line 507
    if-eqz p0, :cond_10

    .line 508
    .line 509
    const-string p0, "onPreDraw error, mBitmapToBlur is null"

    .line 510
    .line 511
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 512
    .line 513
    .line 514
    goto :goto_6

    .line 515
    :goto_5
    iget-object v3, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 516
    .line 517
    invoke-static {v3, v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->h(Lcom/zte/mifavor/widget/RealtimeEffectView;Z)V

    .line 518
    .line 519
    .line 520
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->k()I

    .line 521
    .line 522
    .line 523
    move-result v2

    .line 524
    sub-int/2addr v2, v8

    .line 525
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->m(I)V

    .line 526
    .line 527
    .line 528
    iget-object v2, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 529
    .line 530
    invoke-static {v2}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    if-eqz v2, :cond_e

    .line 535
    .line 536
    iget-object p0, p0, Lcom/zte/mifavor/widget/RealtimeEffectView$a;->g:Lcom/zte/mifavor/widget/RealtimeEffectView;

    .line 537
    .line 538
    invoke-static {p0}, Lcom/zte/mifavor/widget/RealtimeEffectView;->b(Lcom/zte/mifavor/widget/RealtimeEffectView;)Landroid/graphics/Canvas;

    .line 539
    .line 540
    .line 541
    move-result-object p0

    .line 542
    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 543
    .line 544
    .line 545
    :cond_e
    throw v1

    .line 546
    :cond_f
    invoke-static {}, Lcom/zte/mifavor/widget/RealtimeEffectView;->j()Z

    .line 547
    .line 548
    .line 549
    move-result p0

    .line 550
    if-eqz p0, :cond_10

    .line 551
    .line 552
    new-instance p0, Ljava/lang/StringBuilder;

    .line 553
    .line 554
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 555
    .line 556
    .line 557
    const-string v0, "on Pre Draw error. isShow = "

    .line 558
    .line 559
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    .line 561
    .line 562
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    const-string v0, ", isPrepare = "

    .line 566
    .line 567
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    const-string v0, ", decor = "

    .line 574
    .line 575
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 579
    .line 580
    .line 581
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 582
    .line 583
    .line 584
    move-result-object p0

    .line 585
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    .line 587
    .line 588
    :cond_10
    :goto_6
    return v8
.end method
