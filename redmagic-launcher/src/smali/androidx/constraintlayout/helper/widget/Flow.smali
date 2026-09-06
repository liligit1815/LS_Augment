.class public Landroidx/constraintlayout/helper/widget/Flow;
.super Landroidx/constraintlayout/widget/l;
.source "Flow.java"


# instance fields
.field private r:Lt/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/l;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected n(Landroid/util/AttributeSet;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/l;->n(Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lt/g;

    .line 5
    .line 6
    invoke-direct {v0}, Lt/g;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 10
    .line 11
    if-eqz p1, :cond_1b

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Landroidx/constraintlayout/widget/i;->V0:[I

    .line 18
    .line 19
    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x0

    .line 28
    move v2, v1

    .line 29
    :goto_0
    if-ge v2, v0, :cond_1a

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    sget v4, Landroidx/constraintlayout/widget/i;->W0:I

    .line 36
    .line 37
    if-ne v3, v4, :cond_0

    .line 38
    .line 39
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 40
    .line 41
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {v4, v3}, Lt/g;->E2(I)V

    .line 46
    .line 47
    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_0
    sget v4, Landroidx/constraintlayout/widget/i;->X0:I

    .line 51
    .line 52
    if-ne v3, v4, :cond_1

    .line 53
    .line 54
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 55
    .line 56
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v4, v3}, Lt/l;->J1(I)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_1

    .line 64
    .line 65
    :cond_1
    sget v4, Landroidx/constraintlayout/widget/i;->h1:I

    .line 66
    .line 67
    if-ne v3, v4, :cond_2

    .line 68
    .line 69
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 70
    .line 71
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    invoke-virtual {v4, v3}, Lt/l;->O1(I)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_1

    .line 79
    .line 80
    :cond_2
    sget v4, Landroidx/constraintlayout/widget/i;->i1:I

    .line 81
    .line 82
    if-ne v3, v4, :cond_3

    .line 83
    .line 84
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 85
    .line 86
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {v4, v3}, Lt/l;->L1(I)V

    .line 91
    .line 92
    .line 93
    goto/16 :goto_1

    .line 94
    .line 95
    :cond_3
    sget v4, Landroidx/constraintlayout/widget/i;->Y0:I

    .line 96
    .line 97
    if-ne v3, v4, :cond_4

    .line 98
    .line 99
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 100
    .line 101
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    invoke-virtual {v4, v3}, Lt/l;->M1(I)V

    .line 106
    .line 107
    .line 108
    goto/16 :goto_1

    .line 109
    .line 110
    :cond_4
    sget v4, Landroidx/constraintlayout/widget/i;->Z0:I

    .line 111
    .line 112
    if-ne v3, v4, :cond_5

    .line 113
    .line 114
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 115
    .line 116
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    invoke-virtual {v4, v3}, Lt/l;->P1(I)V

    .line 121
    .line 122
    .line 123
    goto/16 :goto_1

    .line 124
    .line 125
    :cond_5
    sget v4, Landroidx/constraintlayout/widget/i;->a1:I

    .line 126
    .line 127
    if-ne v3, v4, :cond_6

    .line 128
    .line 129
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 130
    .line 131
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {v4, v3}, Lt/l;->N1(I)V

    .line 136
    .line 137
    .line 138
    goto/16 :goto_1

    .line 139
    .line 140
    :cond_6
    sget v4, Landroidx/constraintlayout/widget/i;->b1:I

    .line 141
    .line 142
    if-ne v3, v4, :cond_7

    .line 143
    .line 144
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 145
    .line 146
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    invoke-virtual {v4, v3}, Lt/l;->K1(I)V

    .line 151
    .line 152
    .line 153
    goto/16 :goto_1

    .line 154
    .line 155
    :cond_7
    sget v4, Landroidx/constraintlayout/widget/i;->H1:I

    .line 156
    .line 157
    if-ne v3, v4, :cond_8

    .line 158
    .line 159
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 160
    .line 161
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    invoke-virtual {v4, v3}, Lt/g;->J2(I)V

    .line 166
    .line 167
    .line 168
    goto/16 :goto_1

    .line 169
    .line 170
    :cond_8
    sget v4, Landroidx/constraintlayout/widget/i;->x1:I

    .line 171
    .line 172
    if-ne v3, v4, :cond_9

    .line 173
    .line 174
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 175
    .line 176
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    invoke-virtual {v4, v3}, Lt/g;->y2(I)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_1

    .line 184
    .line 185
    :cond_9
    sget v4, Landroidx/constraintlayout/widget/i;->G1:I

    .line 186
    .line 187
    if-ne v3, v4, :cond_a

    .line 188
    .line 189
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 190
    .line 191
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    invoke-virtual {v4, v3}, Lt/g;->I2(I)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_a
    sget v4, Landroidx/constraintlayout/widget/i;->r1:I

    .line 201
    .line 202
    if-ne v3, v4, :cond_b

    .line 203
    .line 204
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 205
    .line 206
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    invoke-virtual {v4, v3}, Lt/g;->s2(I)V

    .line 211
    .line 212
    .line 213
    goto/16 :goto_1

    .line 214
    .line 215
    :cond_b
    sget v4, Landroidx/constraintlayout/widget/i;->z1:I

    .line 216
    .line 217
    if-ne v3, v4, :cond_c

    .line 218
    .line 219
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 220
    .line 221
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    invoke-virtual {v4, v3}, Lt/g;->A2(I)V

    .line 226
    .line 227
    .line 228
    goto/16 :goto_1

    .line 229
    .line 230
    :cond_c
    sget v4, Landroidx/constraintlayout/widget/i;->t1:I

    .line 231
    .line 232
    if-ne v3, v4, :cond_d

    .line 233
    .line 234
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 235
    .line 236
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    invoke-virtual {v4, v3}, Lt/g;->u2(I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :cond_d
    sget v4, Landroidx/constraintlayout/widget/i;->B1:I

    .line 246
    .line 247
    if-ne v3, v4, :cond_e

    .line 248
    .line 249
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 250
    .line 251
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    invoke-virtual {v4, v3}, Lt/g;->C2(I)V

    .line 256
    .line 257
    .line 258
    goto/16 :goto_1

    .line 259
    .line 260
    :cond_e
    sget v4, Landroidx/constraintlayout/widget/i;->v1:I

    .line 261
    .line 262
    const/high16 v5, 0x3f000000    # 0.5f

    .line 263
    .line 264
    if-ne v3, v4, :cond_f

    .line 265
    .line 266
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 267
    .line 268
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    invoke-virtual {v4, v3}, Lt/g;->w2(F)V

    .line 273
    .line 274
    .line 275
    goto/16 :goto_1

    .line 276
    .line 277
    :cond_f
    sget v4, Landroidx/constraintlayout/widget/i;->q1:I

    .line 278
    .line 279
    if-ne v3, v4, :cond_10

    .line 280
    .line 281
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 282
    .line 283
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    invoke-virtual {v4, v3}, Lt/g;->r2(F)V

    .line 288
    .line 289
    .line 290
    goto/16 :goto_1

    .line 291
    .line 292
    :cond_10
    sget v4, Landroidx/constraintlayout/widget/i;->y1:I

    .line 293
    .line 294
    if-ne v3, v4, :cond_11

    .line 295
    .line 296
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 297
    .line 298
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    invoke-virtual {v4, v3}, Lt/g;->z2(F)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_1

    .line 306
    .line 307
    :cond_11
    sget v4, Landroidx/constraintlayout/widget/i;->s1:I

    .line 308
    .line 309
    if-ne v3, v4, :cond_12

    .line 310
    .line 311
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 312
    .line 313
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    invoke-virtual {v4, v3}, Lt/g;->t2(F)V

    .line 318
    .line 319
    .line 320
    goto :goto_1

    .line 321
    :cond_12
    sget v4, Landroidx/constraintlayout/widget/i;->A1:I

    .line 322
    .line 323
    if-ne v3, v4, :cond_13

    .line 324
    .line 325
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 326
    .line 327
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 328
    .line 329
    .line 330
    move-result v3

    .line 331
    invoke-virtual {v4, v3}, Lt/g;->B2(F)V

    .line 332
    .line 333
    .line 334
    goto :goto_1

    .line 335
    :cond_13
    sget v4, Landroidx/constraintlayout/widget/i;->E1:I

    .line 336
    .line 337
    if-ne v3, v4, :cond_14

    .line 338
    .line 339
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 340
    .line 341
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 342
    .line 343
    .line 344
    move-result v3

    .line 345
    invoke-virtual {v4, v3}, Lt/g;->G2(F)V

    .line 346
    .line 347
    .line 348
    goto :goto_1

    .line 349
    :cond_14
    sget v4, Landroidx/constraintlayout/widget/i;->u1:I

    .line 350
    .line 351
    const/4 v5, 0x2

    .line 352
    if-ne v3, v4, :cond_15

    .line 353
    .line 354
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 355
    .line 356
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 357
    .line 358
    .line 359
    move-result v3

    .line 360
    invoke-virtual {v4, v3}, Lt/g;->v2(I)V

    .line 361
    .line 362
    .line 363
    goto :goto_1

    .line 364
    :cond_15
    sget v4, Landroidx/constraintlayout/widget/i;->D1:I

    .line 365
    .line 366
    if-ne v3, v4, :cond_16

    .line 367
    .line 368
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 369
    .line 370
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    invoke-virtual {v4, v3}, Lt/g;->F2(I)V

    .line 375
    .line 376
    .line 377
    goto :goto_1

    .line 378
    :cond_16
    sget v4, Landroidx/constraintlayout/widget/i;->w1:I

    .line 379
    .line 380
    if-ne v3, v4, :cond_17

    .line 381
    .line 382
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 383
    .line 384
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    invoke-virtual {v4, v3}, Lt/g;->x2(I)V

    .line 389
    .line 390
    .line 391
    goto :goto_1

    .line 392
    :cond_17
    sget v4, Landroidx/constraintlayout/widget/i;->F1:I

    .line 393
    .line 394
    if-ne v3, v4, :cond_18

    .line 395
    .line 396
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 397
    .line 398
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    invoke-virtual {v4, v3}, Lt/g;->H2(I)V

    .line 403
    .line 404
    .line 405
    goto :goto_1

    .line 406
    :cond_18
    sget v4, Landroidx/constraintlayout/widget/i;->C1:I

    .line 407
    .line 408
    if-ne v3, v4, :cond_19

    .line 409
    .line 410
    iget-object v4, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 411
    .line 412
    const/4 v5, -0x1

    .line 413
    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 414
    .line 415
    .line 416
    move-result v3

    .line 417
    invoke-virtual {v4, v3}, Lt/g;->D2(I)V

    .line 418
    .line 419
    .line 420
    :cond_19
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 421
    .line 422
    goto/16 :goto_0

    .line 423
    .line 424
    :cond_1a
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 425
    .line 426
    .line 427
    :cond_1b
    iget-object p1, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 428
    .line 429
    iput-object p1, p0, Landroidx/constraintlayout/widget/b;->j:Lt/i;

    .line 430
    .line 431
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/b;->t()V

    .line 432
    .line 433
    .line 434
    return-void
.end method

.method public o(Lt/e;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lt/l;->u1(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p2}, Landroidx/constraintlayout/helper/widget/Flow;->u(Lt/l;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFirstHorizontalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->r2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFirstHorizontalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->s2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFirstVerticalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->t2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFirstVerticalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->u2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHorizontalAlign(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->v2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHorizontalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->w2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHorizontalGap(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->x2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setHorizontalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->y2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLastHorizontalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->z2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLastHorizontalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->A2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLastVerticalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->B2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLastVerticalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->C2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setMaxElementsWrap(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->D2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOrientation(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->E2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPadding(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/l;->J1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPaddingBottom(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/l;->K1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPaddingLeft(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/l;->M1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPaddingRight(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/l;->N1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPaddingTop(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/l;->P1(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVerticalAlign(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->F2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVerticalBias(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->G2(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVerticalGap(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->H2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVerticalStyle(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->I2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setWrapMode(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/helper/widget/Flow;->r:Lt/g;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lt/g;->J2(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u(Lt/l;II)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1, v0, p2, v1, p3}, Lt/l;->D1(IIII)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lt/l;->y1()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    invoke-virtual {p1}, Lt/l;->x1()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
