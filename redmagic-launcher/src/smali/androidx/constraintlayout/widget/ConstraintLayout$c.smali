.class Landroidx/constraintlayout/widget/ConstraintLayout$c;
.super Ljava/lang/Object;
.source "ConstraintLayout.java"

# interfaces
.implements Lu/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/widget/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "c"
.end annotation


# instance fields
.field a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field b:I

.field c:I

.field d:I

.field e:I

.field f:I

.field g:I

.field final synthetic h:Landroidx/constraintlayout/widget/ConstraintLayout;


# direct methods
.method constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    return-void
.end method

.method private d(III)Z
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    if-ne p1, p2, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/high16 v1, 0x40000000    # 2.0f

    .line 18
    .line 19
    if-ne v0, v1, :cond_2

    .line 20
    .line 21
    const/high16 v0, -0x80000000

    .line 22
    .line 23
    if-eq p1, v0, :cond_1

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    :cond_1
    if-ne p3, p2, :cond_2

    .line 28
    .line 29
    return p0

    .line 30
    :cond_2
    const/4 p0, 0x0

    .line 31
    return p0
.end method


# virtual methods
.method public final a(Lt/e;Lu/b$a;)V
    .locals 18
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_e

    .line 10
    .line 11
    :cond_0
    invoke-virtual {v1}, Lt/e;->V()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    if-ne v3, v4, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lt/e;->j0()Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    iput v5, v2, Lu/b$a;->e:I

    .line 27
    .line 28
    iput v5, v2, Lu/b$a;->f:I

    .line 29
    .line 30
    iput v5, v2, Lu/b$a;->g:I

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {v1}, Lt/e;->K()Lt/e;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-nez v3, :cond_2

    .line 38
    .line 39
    goto/16 :goto_e

    .line 40
    .line 41
    :cond_2
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 42
    .line 43
    invoke-static {v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$000(Landroidx/constraintlayout/widget/ConstraintLayout;)Lq/e;

    .line 44
    .line 45
    .line 46
    iget-object v3, v2, Lu/b$a;->a:Lt/e$b;

    .line 47
    .line 48
    iget-object v4, v2, Lu/b$a;->b:Lt/e$b;

    .line 49
    .line 50
    iget v6, v2, Lu/b$a;->c:I

    .line 51
    .line 52
    iget v7, v2, Lu/b$a;->d:I

    .line 53
    .line 54
    iget v8, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->b:I

    .line 55
    .line 56
    iget v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->c:I

    .line 57
    .line 58
    add-int/2addr v8, v9

    .line 59
    iget v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->d:I

    .line 60
    .line 61
    invoke-virtual {v1}, Lt/e;->s()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    check-cast v10, Landroid/view/View;

    .line 66
    .line 67
    sget-object v11, Landroidx/constraintlayout/widget/ConstraintLayout$a;->a:[I

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    aget v12, v11, v12

    .line 74
    .line 75
    const/4 v13, 0x4

    .line 76
    const/4 v14, 0x3

    .line 77
    const/4 v15, 0x2

    .line 78
    const/4 v5, 0x1

    .line 79
    if-eq v12, v5, :cond_b

    .line 80
    .line 81
    if-eq v12, v15, :cond_a

    .line 82
    .line 83
    if-eq v12, v14, :cond_9

    .line 84
    .line 85
    if-eq v12, v13, :cond_3

    .line 86
    .line 87
    const/4 v6, 0x0

    .line 88
    goto/16 :goto_2

    .line 89
    .line 90
    :cond_3
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->f:I

    .line 91
    .line 92
    const/4 v12, -0x2

    .line 93
    invoke-static {v6, v9, v12}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    iget v9, v1, Lt/e;->w:I

    .line 98
    .line 99
    if-ne v9, v5, :cond_4

    .line 100
    .line 101
    move v9, v5

    .line 102
    goto :goto_0

    .line 103
    :cond_4
    const/4 v9, 0x0

    .line 104
    :goto_0
    iget v12, v2, Lu/b$a;->j:I

    .line 105
    .line 106
    sget v13, Lu/b$a;->l:I

    .line 107
    .line 108
    if-eq v12, v13, :cond_5

    .line 109
    .line 110
    sget v13, Lu/b$a;->m:I

    .line 111
    .line 112
    if-ne v12, v13, :cond_c

    .line 113
    .line 114
    :cond_5
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    .line 115
    .line 116
    .line 117
    move-result v12

    .line 118
    invoke-virtual {v1}, Lt/e;->x()I

    .line 119
    .line 120
    .line 121
    move-result v13

    .line 122
    if-ne v12, v13, :cond_6

    .line 123
    .line 124
    move v12, v5

    .line 125
    goto :goto_1

    .line 126
    :cond_6
    const/4 v12, 0x0

    .line 127
    :goto_1
    iget v13, v2, Lu/b$a;->j:I

    .line 128
    .line 129
    sget v14, Lu/b$a;->m:I

    .line 130
    .line 131
    if-eq v13, v14, :cond_8

    .line 132
    .line 133
    if-eqz v9, :cond_8

    .line 134
    .line 135
    if-eqz v9, :cond_7

    .line 136
    .line 137
    if-nez v12, :cond_8

    .line 138
    .line 139
    :cond_7
    instance-of v9, v10, Landroidx/constraintlayout/widget/g;

    .line 140
    .line 141
    if-nez v9, :cond_8

    .line 142
    .line 143
    invoke-virtual {v1}, Lt/e;->n0()Z

    .line 144
    .line 145
    .line 146
    move-result v9

    .line 147
    if-eqz v9, :cond_c

    .line 148
    .line 149
    :cond_8
    invoke-virtual {v1}, Lt/e;->W()I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    const/high16 v12, 0x40000000    # 2.0f

    .line 154
    .line 155
    invoke-static {v6, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    goto :goto_2

    .line 160
    :cond_9
    const/high16 v12, 0x40000000    # 2.0f

    .line 161
    .line 162
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->f:I

    .line 163
    .line 164
    invoke-virtual {v1}, Lt/e;->B()I

    .line 165
    .line 166
    .line 167
    move-result v13

    .line 168
    add-int/2addr v9, v13

    .line 169
    const/4 v13, -0x1

    .line 170
    invoke-static {v6, v9, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 171
    .line 172
    .line 173
    move-result v6

    .line 174
    goto :goto_2

    .line 175
    :cond_a
    const/high16 v12, 0x40000000    # 2.0f

    .line 176
    .line 177
    iget v6, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->f:I

    .line 178
    .line 179
    const/4 v13, -0x2

    .line 180
    invoke-static {v6, v9, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 181
    .line 182
    .line 183
    move-result v6

    .line 184
    goto :goto_2

    .line 185
    :cond_b
    const/high16 v12, 0x40000000    # 2.0f

    .line 186
    .line 187
    invoke-static {v6, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    :cond_c
    :goto_2
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 192
    .line 193
    .line 194
    move-result v9

    .line 195
    aget v9, v11, v9

    .line 196
    .line 197
    if-eq v9, v5, :cond_15

    .line 198
    .line 199
    if-eq v9, v15, :cond_14

    .line 200
    .line 201
    const/4 v7, 0x3

    .line 202
    if-eq v9, v7, :cond_13

    .line 203
    .line 204
    const/4 v7, 0x4

    .line 205
    if-eq v9, v7, :cond_d

    .line 206
    .line 207
    const/4 v7, 0x0

    .line 208
    goto/16 :goto_5

    .line 209
    .line 210
    :cond_d
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->g:I

    .line 211
    .line 212
    const/4 v13, -0x2

    .line 213
    invoke-static {v7, v8, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    iget v8, v1, Lt/e;->x:I

    .line 218
    .line 219
    if-ne v8, v5, :cond_e

    .line 220
    .line 221
    move v8, v5

    .line 222
    goto :goto_3

    .line 223
    :cond_e
    const/4 v8, 0x0

    .line 224
    :goto_3
    iget v9, v2, Lu/b$a;->j:I

    .line 225
    .line 226
    sget v11, Lu/b$a;->l:I

    .line 227
    .line 228
    if-eq v9, v11, :cond_f

    .line 229
    .line 230
    sget v11, Lu/b$a;->m:I

    .line 231
    .line 232
    if-ne v9, v11, :cond_16

    .line 233
    .line 234
    :cond_f
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    .line 235
    .line 236
    .line 237
    move-result v9

    .line 238
    invoke-virtual {v1}, Lt/e;->W()I

    .line 239
    .line 240
    .line 241
    move-result v11

    .line 242
    if-ne v9, v11, :cond_10

    .line 243
    .line 244
    move v9, v5

    .line 245
    goto :goto_4

    .line 246
    :cond_10
    const/4 v9, 0x0

    .line 247
    :goto_4
    iget v11, v2, Lu/b$a;->j:I

    .line 248
    .line 249
    sget v12, Lu/b$a;->m:I

    .line 250
    .line 251
    if-eq v11, v12, :cond_12

    .line 252
    .line 253
    if-eqz v8, :cond_12

    .line 254
    .line 255
    if-eqz v8, :cond_11

    .line 256
    .line 257
    if-nez v9, :cond_12

    .line 258
    .line 259
    :cond_11
    instance-of v8, v10, Landroidx/constraintlayout/widget/g;

    .line 260
    .line 261
    if-nez v8, :cond_12

    .line 262
    .line 263
    invoke-virtual {v1}, Lt/e;->o0()Z

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    if-eqz v8, :cond_16

    .line 268
    .line 269
    :cond_12
    invoke-virtual {v1}, Lt/e;->x()I

    .line 270
    .line 271
    .line 272
    move-result v7

    .line 273
    const/high16 v12, 0x40000000    # 2.0f

    .line 274
    .line 275
    invoke-static {v7, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 276
    .line 277
    .line 278
    move-result v7

    .line 279
    goto :goto_5

    .line 280
    :cond_13
    const/high16 v12, 0x40000000    # 2.0f

    .line 281
    .line 282
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->g:I

    .line 283
    .line 284
    invoke-virtual {v1}, Lt/e;->U()I

    .line 285
    .line 286
    .line 287
    move-result v9

    .line 288
    add-int/2addr v8, v9

    .line 289
    const/4 v13, -0x1

    .line 290
    invoke-static {v7, v8, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 291
    .line 292
    .line 293
    move-result v7

    .line 294
    goto :goto_5

    .line 295
    :cond_14
    const/high16 v12, 0x40000000    # 2.0f

    .line 296
    .line 297
    iget v7, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->g:I

    .line 298
    .line 299
    const/4 v13, -0x2

    .line 300
    invoke-static {v7, v8, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 301
    .line 302
    .line 303
    move-result v7

    .line 304
    goto :goto_5

    .line 305
    :cond_15
    const/high16 v12, 0x40000000    # 2.0f

    .line 306
    .line 307
    invoke-static {v7, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 308
    .line 309
    .line 310
    move-result v7

    .line 311
    :cond_16
    :goto_5
    invoke-virtual {v1}, Lt/e;->K()Lt/e;

    .line 312
    .line 313
    .line 314
    move-result-object v8

    .line 315
    check-cast v8, Lt/f;

    .line 316
    .line 317
    if-eqz v8, :cond_17

    .line 318
    .line 319
    iget-object v9, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 320
    .line 321
    invoke-static {v9}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$100(Landroidx/constraintlayout/widget/ConstraintLayout;)I

    .line 322
    .line 323
    .line 324
    move-result v9

    .line 325
    const/16 v11, 0x100

    .line 326
    .line 327
    invoke-static {v9, v11}, Lt/k;->b(II)Z

    .line 328
    .line 329
    .line 330
    move-result v9

    .line 331
    if-eqz v9, :cond_17

    .line 332
    .line 333
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    .line 334
    .line 335
    .line 336
    move-result v9

    .line 337
    invoke-virtual {v1}, Lt/e;->W()I

    .line 338
    .line 339
    .line 340
    move-result v11

    .line 341
    if-ne v9, v11, :cond_17

    .line 342
    .line 343
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    .line 344
    .line 345
    .line 346
    move-result v9

    .line 347
    invoke-virtual {v8}, Lt/e;->W()I

    .line 348
    .line 349
    .line 350
    move-result v11

    .line 351
    if-ge v9, v11, :cond_17

    .line 352
    .line 353
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    .line 354
    .line 355
    .line 356
    move-result v9

    .line 357
    invoke-virtual {v1}, Lt/e;->x()I

    .line 358
    .line 359
    .line 360
    move-result v11

    .line 361
    if-ne v9, v11, :cond_17

    .line 362
    .line 363
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    .line 364
    .line 365
    .line 366
    move-result v9

    .line 367
    invoke-virtual {v8}, Lt/e;->x()I

    .line 368
    .line 369
    .line 370
    move-result v8

    .line 371
    if-ge v9, v8, :cond_17

    .line 372
    .line 373
    invoke-virtual {v10}, Landroid/view/View;->getBaseline()I

    .line 374
    .line 375
    .line 376
    move-result v8

    .line 377
    invoke-virtual {v1}, Lt/e;->p()I

    .line 378
    .line 379
    .line 380
    move-result v9

    .line 381
    if-ne v8, v9, :cond_17

    .line 382
    .line 383
    invoke-virtual {v1}, Lt/e;->m0()Z

    .line 384
    .line 385
    .line 386
    move-result v8

    .line 387
    if-nez v8, :cond_17

    .line 388
    .line 389
    invoke-virtual {v1}, Lt/e;->C()I

    .line 390
    .line 391
    .line 392
    move-result v8

    .line 393
    invoke-virtual {v1}, Lt/e;->W()I

    .line 394
    .line 395
    .line 396
    move-result v9

    .line 397
    invoke-direct {v0, v8, v6, v9}, Landroidx/constraintlayout/widget/ConstraintLayout$c;->d(III)Z

    .line 398
    .line 399
    .line 400
    move-result v8

    .line 401
    if-eqz v8, :cond_17

    .line 402
    .line 403
    invoke-virtual {v1}, Lt/e;->D()I

    .line 404
    .line 405
    .line 406
    move-result v8

    .line 407
    invoke-virtual {v1}, Lt/e;->x()I

    .line 408
    .line 409
    .line 410
    move-result v9

    .line 411
    invoke-direct {v0, v8, v7, v9}, Landroidx/constraintlayout/widget/ConstraintLayout$c;->d(III)Z

    .line 412
    .line 413
    .line 414
    move-result v8

    .line 415
    if-eqz v8, :cond_17

    .line 416
    .line 417
    invoke-virtual {v1}, Lt/e;->W()I

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    iput v0, v2, Lu/b$a;->e:I

    .line 422
    .line 423
    invoke-virtual {v1}, Lt/e;->x()I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    iput v0, v2, Lu/b$a;->f:I

    .line 428
    .line 429
    invoke-virtual {v1}, Lt/e;->p()I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    iput v0, v2, Lu/b$a;->g:I

    .line 434
    .line 435
    return-void

    .line 436
    :cond_17
    sget-object v8, Lt/e$b;->i:Lt/e$b;

    .line 437
    .line 438
    if-ne v3, v8, :cond_18

    .line 439
    .line 440
    move v9, v5

    .line 441
    goto :goto_6

    .line 442
    :cond_18
    const/4 v9, 0x0

    .line 443
    :goto_6
    if-ne v4, v8, :cond_19

    .line 444
    .line 445
    move v8, v5

    .line 446
    goto :goto_7

    .line 447
    :cond_19
    const/4 v8, 0x0

    .line 448
    :goto_7
    sget-object v11, Lt/e$b;->j:Lt/e$b;

    .line 449
    .line 450
    if-eq v4, v11, :cond_1b

    .line 451
    .line 452
    sget-object v12, Lt/e$b;->g:Lt/e$b;

    .line 453
    .line 454
    if-ne v4, v12, :cond_1a

    .line 455
    .line 456
    goto :goto_8

    .line 457
    :cond_1a
    const/4 v4, 0x0

    .line 458
    goto :goto_9

    .line 459
    :cond_1b
    :goto_8
    move v4, v5

    .line 460
    :goto_9
    if-eq v3, v11, :cond_1d

    .line 461
    .line 462
    sget-object v11, Lt/e$b;->g:Lt/e$b;

    .line 463
    .line 464
    if-ne v3, v11, :cond_1c

    .line 465
    .line 466
    goto :goto_a

    .line 467
    :cond_1c
    const/4 v3, 0x0

    .line 468
    goto :goto_b

    .line 469
    :cond_1d
    :goto_a
    move v3, v5

    .line 470
    :goto_b
    const/4 v11, 0x0

    .line 471
    if-eqz v9, :cond_1e

    .line 472
    .line 473
    iget v12, v1, Lt/e;->d0:F

    .line 474
    .line 475
    cmpl-float v12, v12, v11

    .line 476
    .line 477
    if-lez v12, :cond_1e

    .line 478
    .line 479
    move v12, v5

    .line 480
    goto :goto_c

    .line 481
    :cond_1e
    const/4 v12, 0x0

    .line 482
    :goto_c
    if-eqz v8, :cond_1f

    .line 483
    .line 484
    iget v13, v1, Lt/e;->d0:F

    .line 485
    .line 486
    cmpl-float v11, v13, v11

    .line 487
    .line 488
    if-lez v11, :cond_1f

    .line 489
    .line 490
    move v11, v5

    .line 491
    goto :goto_d

    .line 492
    :cond_1f
    const/4 v11, 0x0

    .line 493
    :goto_d
    if-nez v10, :cond_20

    .line 494
    .line 495
    :goto_e
    return-void

    .line 496
    :cond_20
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 497
    .line 498
    .line 499
    move-result-object v13

    .line 500
    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout$b;

    .line 501
    .line 502
    iget v14, v2, Lu/b$a;->j:I

    .line 503
    .line 504
    sget v15, Lu/b$a;->l:I

    .line 505
    .line 506
    if-eq v14, v15, :cond_22

    .line 507
    .line 508
    sget v15, Lu/b$a;->m:I

    .line 509
    .line 510
    if-eq v14, v15, :cond_22

    .line 511
    .line 512
    if-eqz v9, :cond_22

    .line 513
    .line 514
    iget v9, v1, Lt/e;->w:I

    .line 515
    .line 516
    if-nez v9, :cond_22

    .line 517
    .line 518
    if-eqz v8, :cond_22

    .line 519
    .line 520
    iget v8, v1, Lt/e;->x:I

    .line 521
    .line 522
    if-eqz v8, :cond_21

    .line 523
    .line 524
    goto :goto_f

    .line 525
    :cond_21
    const/4 v3, -0x1

    .line 526
    const/4 v5, 0x0

    .line 527
    const/4 v14, 0x0

    .line 528
    const/4 v15, 0x0

    .line 529
    goto/16 :goto_17

    .line 530
    .line 531
    :cond_22
    :goto_f
    instance-of v8, v10, Landroidx/constraintlayout/widget/l;

    .line 532
    .line 533
    if-eqz v8, :cond_23

    .line 534
    .line 535
    instance-of v8, v1, Lt/l;

    .line 536
    .line 537
    if-eqz v8, :cond_23

    .line 538
    .line 539
    move-object v8, v1

    .line 540
    check-cast v8, Lt/l;

    .line 541
    .line 542
    move-object v9, v10

    .line 543
    check-cast v9, Landroidx/constraintlayout/widget/l;

    .line 544
    .line 545
    invoke-virtual {v9, v8, v6, v7}, Landroidx/constraintlayout/widget/l;->u(Lt/l;II)V

    .line 546
    .line 547
    .line 548
    goto :goto_10

    .line 549
    :cond_23
    invoke-virtual {v10, v6, v7}, Landroid/view/View;->measure(II)V

    .line 550
    .line 551
    .line 552
    :goto_10
    invoke-virtual {v1, v6, v7}, Lt/e;->W0(II)V

    .line 553
    .line 554
    .line 555
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    .line 556
    .line 557
    .line 558
    move-result v8

    .line 559
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    .line 560
    .line 561
    .line 562
    move-result v9

    .line 563
    invoke-virtual {v10}, Landroid/view/View;->getBaseline()I

    .line 564
    .line 565
    .line 566
    move-result v14

    .line 567
    iget v15, v1, Lt/e;->z:I

    .line 568
    .line 569
    if-lez v15, :cond_24

    .line 570
    .line 571
    invoke-static {v15, v8}, Ljava/lang/Math;->max(II)I

    .line 572
    .line 573
    .line 574
    move-result v15

    .line 575
    goto :goto_11

    .line 576
    :cond_24
    move v15, v8

    .line 577
    :goto_11
    iget v5, v1, Lt/e;->A:I

    .line 578
    .line 579
    if-lez v5, :cond_25

    .line 580
    .line 581
    invoke-static {v5, v15}, Ljava/lang/Math;->min(II)I

    .line 582
    .line 583
    .line 584
    move-result v15

    .line 585
    :cond_25
    iget v5, v1, Lt/e;->C:I

    .line 586
    .line 587
    if-lez v5, :cond_26

    .line 588
    .line 589
    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    .line 590
    .line 591
    .line 592
    move-result v5

    .line 593
    :goto_12
    move/from16 v16, v3

    .line 594
    .line 595
    goto :goto_13

    .line 596
    :cond_26
    move v5, v9

    .line 597
    goto :goto_12

    .line 598
    :goto_13
    iget v3, v1, Lt/e;->D:I

    .line 599
    .line 600
    if-lez v3, :cond_27

    .line 601
    .line 602
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 603
    .line 604
    .line 605
    move-result v5

    .line 606
    :cond_27
    iget-object v3, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 607
    .line 608
    invoke-static {v3}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$100(Landroidx/constraintlayout/widget/ConstraintLayout;)I

    .line 609
    .line 610
    .line 611
    move-result v3

    .line 612
    move/from16 v17, v4

    .line 613
    .line 614
    const/4 v4, 0x1

    .line 615
    invoke-static {v3, v4}, Lt/k;->b(II)Z

    .line 616
    .line 617
    .line 618
    move-result v3

    .line 619
    if-nez v3, :cond_29

    .line 620
    .line 621
    const/high16 v3, 0x3f000000    # 0.5f

    .line 622
    .line 623
    if-eqz v12, :cond_28

    .line 624
    .line 625
    if-eqz v17, :cond_28

    .line 626
    .line 627
    iget v4, v1, Lt/e;->d0:F

    .line 628
    .line 629
    int-to-float v11, v5

    .line 630
    mul-float/2addr v11, v4

    .line 631
    add-float/2addr v11, v3

    .line 632
    float-to-int v15, v11

    .line 633
    goto :goto_14

    .line 634
    :cond_28
    if-eqz v11, :cond_29

    .line 635
    .line 636
    if-eqz v16, :cond_29

    .line 637
    .line 638
    iget v4, v1, Lt/e;->d0:F

    .line 639
    .line 640
    int-to-float v5, v15

    .line 641
    div-float/2addr v5, v4

    .line 642
    add-float/2addr v5, v3

    .line 643
    float-to-int v5, v5

    .line 644
    :cond_29
    :goto_14
    if-ne v8, v15, :cond_2b

    .line 645
    .line 646
    if-eq v9, v5, :cond_2a

    .line 647
    .line 648
    goto :goto_16

    .line 649
    :cond_2a
    :goto_15
    const/4 v3, -0x1

    .line 650
    goto :goto_17

    .line 651
    :cond_2b
    :goto_16
    const/high16 v12, 0x40000000    # 2.0f

    .line 652
    .line 653
    if-eq v8, v15, :cond_2c

    .line 654
    .line 655
    invoke-static {v15, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 656
    .line 657
    .line 658
    move-result v6

    .line 659
    :cond_2c
    if-eq v9, v5, :cond_2d

    .line 660
    .line 661
    invoke-static {v5, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 662
    .line 663
    .line 664
    move-result v7

    .line 665
    :cond_2d
    invoke-virtual {v10, v6, v7}, Landroid/view/View;->measure(II)V

    .line 666
    .line 667
    .line 668
    invoke-virtual {v1, v6, v7}, Lt/e;->W0(II)V

    .line 669
    .line 670
    .line 671
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    .line 672
    .line 673
    .line 674
    move-result v15

    .line 675
    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    .line 676
    .line 677
    .line 678
    move-result v5

    .line 679
    invoke-virtual {v10}, Landroid/view/View;->getBaseline()I

    .line 680
    .line 681
    .line 682
    move-result v14

    .line 683
    goto :goto_15

    .line 684
    :goto_17
    if-eq v14, v3, :cond_2e

    .line 685
    .line 686
    const/4 v4, 0x1

    .line 687
    goto :goto_18

    .line 688
    :cond_2e
    const/4 v4, 0x0

    .line 689
    :goto_18
    iget v3, v2, Lu/b$a;->c:I

    .line 690
    .line 691
    if-ne v15, v3, :cond_30

    .line 692
    .line 693
    iget v3, v2, Lu/b$a;->d:I

    .line 694
    .line 695
    if-eq v5, v3, :cond_2f

    .line 696
    .line 697
    goto :goto_19

    .line 698
    :cond_2f
    const/4 v3, 0x0

    .line 699
    goto :goto_1a

    .line 700
    :cond_30
    :goto_19
    const/4 v3, 0x1

    .line 701
    :goto_1a
    iput-boolean v3, v2, Lu/b$a;->i:Z

    .line 702
    .line 703
    iget-boolean v3, v13, Landroidx/constraintlayout/widget/ConstraintLayout$b;->g0:Z

    .line 704
    .line 705
    if-eqz v3, :cond_31

    .line 706
    .line 707
    const/4 v4, 0x1

    .line 708
    :cond_31
    if-eqz v4, :cond_32

    .line 709
    .line 710
    const/4 v13, -0x1

    .line 711
    if-eq v14, v13, :cond_32

    .line 712
    .line 713
    invoke-virtual {v1}, Lt/e;->p()I

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    if-eq v1, v14, :cond_32

    .line 718
    .line 719
    const/4 v1, 0x1

    .line 720
    iput-boolean v1, v2, Lu/b$a;->i:Z

    .line 721
    .line 722
    :cond_32
    iput v15, v2, Lu/b$a;->e:I

    .line 723
    .line 724
    iput v5, v2, Lu/b$a;->f:I

    .line 725
    .line 726
    iput-boolean v4, v2, Lu/b$a;->h:Z

    .line 727
    .line 728
    iput v14, v2, Lu/b$a;->g:I

    .line 729
    .line 730
    iget-object v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 731
    .line 732
    invoke-static {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$000(Landroidx/constraintlayout/widget/ConstraintLayout;)Lq/e;

    .line 733
    .line 734
    .line 735
    return-void
.end method

.method public final b()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    instance-of v4, v3, Landroidx/constraintlayout/widget/g;

    .line 18
    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    check-cast v3, Landroidx/constraintlayout/widget/g;

    .line 22
    .line 23
    iget-object v4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/g;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 32
    .line 33
    invoke-static {v0}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$200(Landroidx/constraintlayout/widget/ConstraintLayout;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    :goto_1
    if-ge v1, v0, :cond_2

    .line 44
    .line 45
    iget-object v2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 46
    .line 47
    invoke-static {v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->access$200(Landroidx/constraintlayout/widget/ConstraintLayout;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Landroidx/constraintlayout/widget/b;

    .line 56
    .line 57
    iget-object v3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroidx/constraintlayout/widget/b;->q(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    return-void
.end method

.method public c(IIIIII)V
    .locals 0

    .line 1
    iput p3, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->b:I

    .line 2
    .line 3
    iput p4, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->c:I

    .line 4
    .line 5
    iput p5, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->d:I

    .line 6
    .line 7
    iput p6, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->e:I

    .line 8
    .line 9
    iput p1, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->f:I

    .line 10
    .line 11
    iput p2, p0, Landroidx/constraintlayout/widget/ConstraintLayout$c;->g:I

    .line 12
    .line 13
    return-void
.end method
