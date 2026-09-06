.class public Lu/n;
.super Lu/p;
.source "VerticalWidgetRun.java"


# instance fields
.field public k:Lu/f;

.field l:Lu/g;


# direct methods
.method public constructor <init>(Lt/e;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lu/p;-><init>(Lt/e;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lu/f;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lu/f;-><init>(Lu/p;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lu/n;->k:Lu/f;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lu/n;->l:Lu/g;

    .line 13
    .line 14
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 15
    .line 16
    sget-object v1, Lu/f$a;->l:Lu/f$a;

    .line 17
    .line 18
    iput-object v1, v0, Lu/f;->e:Lu/f$a;

    .line 19
    .line 20
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 21
    .line 22
    sget-object v1, Lu/f$a;->m:Lu/f$a;

    .line 23
    .line 24
    iput-object v1, v0, Lu/f;->e:Lu/f$a;

    .line 25
    .line 26
    sget-object v0, Lu/f$a;->n:Lu/f$a;

    .line 27
    .line 28
    iput-object v0, p1, Lu/f;->e:Lu/f$a;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput p1, p0, Lu/p;->f:I

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(Lu/d;)V
    .locals 6

    .line 1
    sget-object v0, Lu/n$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Lu/p;->j:Lu/p$b;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq v0, v3, :cond_2

    .line 15
    .line 16
    if-eq v0, v2, :cond_1

    .line 17
    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 22
    .line 23
    iget-object v1, v0, Lt/e;->P:Lt/d;

    .line 24
    .line 25
    iget-object v0, v0, Lt/e;->R:Lt/d;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v1, v0, v3}, Lu/p;->n(Lu/d;Lt/d;Lt/d;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Lu/p;->o(Lu/d;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    invoke-virtual {p0, p1}, Lu/p;->p(Lu/d;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 39
    .line 40
    iget-boolean v0, p1, Lu/f;->c:Z

    .line 41
    .line 42
    const/high16 v4, 0x3f000000    # 0.5f

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    if-eqz v0, :cond_8

    .line 46
    .line 47
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 48
    .line 49
    if-nez p1, :cond_8

    .line 50
    .line 51
    iget-object p1, p0, Lu/p;->d:Lt/e$b;

    .line 52
    .line 53
    sget-object v0, Lt/e$b;->i:Lt/e$b;

    .line 54
    .line 55
    if-ne p1, v0, :cond_8

    .line 56
    .line 57
    iget-object p1, p0, Lu/p;->b:Lt/e;

    .line 58
    .line 59
    iget v0, p1, Lt/e;->x:I

    .line 60
    .line 61
    if-eq v0, v2, :cond_7

    .line 62
    .line 63
    if-eq v0, v1, :cond_3

    .line 64
    .line 65
    goto :goto_4

    .line 66
    :cond_3
    iget-object v0, p1, Lt/e;->e:Lu/l;

    .line 67
    .line 68
    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 69
    .line 70
    iget-boolean v0, v0, Lu/f;->j:Z

    .line 71
    .line 72
    if-eqz v0, :cond_8

    .line 73
    .line 74
    invoke-virtual {p1}, Lt/e;->w()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    const/4 v0, -0x1

    .line 79
    if-eq p1, v0, :cond_6

    .line 80
    .line 81
    if-eqz p1, :cond_5

    .line 82
    .line 83
    if-eq p1, v3, :cond_4

    .line 84
    .line 85
    move p1, v5

    .line 86
    goto :goto_3

    .line 87
    :cond_4
    iget-object p1, p0, Lu/p;->b:Lt/e;

    .line 88
    .line 89
    iget-object v0, p1, Lt/e;->e:Lu/l;

    .line 90
    .line 91
    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 92
    .line 93
    iget v0, v0, Lu/f;->g:I

    .line 94
    .line 95
    int-to-float v0, v0

    .line 96
    invoke-virtual {p1}, Lt/e;->v()F

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    :goto_1
    div-float/2addr v0, p1

    .line 101
    :goto_2
    add-float/2addr v0, v4

    .line 102
    float-to-int p1, v0

    .line 103
    goto :goto_3

    .line 104
    :cond_5
    iget-object p1, p0, Lu/p;->b:Lt/e;

    .line 105
    .line 106
    iget-object v0, p1, Lt/e;->e:Lu/l;

    .line 107
    .line 108
    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 109
    .line 110
    iget v0, v0, Lu/f;->g:I

    .line 111
    .line 112
    int-to-float v0, v0

    .line 113
    invoke-virtual {p1}, Lt/e;->v()F

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    mul-float/2addr v0, p1

    .line 118
    goto :goto_2

    .line 119
    :cond_6
    iget-object p1, p0, Lu/p;->b:Lt/e;

    .line 120
    .line 121
    iget-object v0, p1, Lt/e;->e:Lu/l;

    .line 122
    .line 123
    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 124
    .line 125
    iget v0, v0, Lu/f;->g:I

    .line 126
    .line 127
    int-to-float v0, v0

    .line 128
    invoke-virtual {p1}, Lt/e;->v()F

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    goto :goto_1

    .line 133
    :goto_3
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Lu/g;->d(I)V

    .line 136
    .line 137
    .line 138
    goto :goto_4

    .line 139
    :cond_7
    invoke-virtual {p1}, Lt/e;->K()Lt/e;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    if-eqz p1, :cond_8

    .line 144
    .line 145
    iget-object p1, p1, Lt/e;->f:Lu/n;

    .line 146
    .line 147
    iget-object p1, p1, Lu/p;->e:Lu/g;

    .line 148
    .line 149
    iget-boolean v0, p1, Lu/f;->j:Z

    .line 150
    .line 151
    if-eqz v0, :cond_8

    .line 152
    .line 153
    iget-object v0, p0, Lu/p;->b:Lt/e;

    .line 154
    .line 155
    iget v0, v0, Lt/e;->E:F

    .line 156
    .line 157
    iget p1, p1, Lu/f;->g:I

    .line 158
    .line 159
    int-to-float p1, p1

    .line 160
    mul-float/2addr p1, v0

    .line 161
    add-float/2addr p1, v4

    .line 162
    float-to-int p1, p1

    .line 163
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 164
    .line 165
    invoke-virtual {v0, p1}, Lu/g;->d(I)V

    .line 166
    .line 167
    .line 168
    :cond_8
    :goto_4
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 169
    .line 170
    iget-boolean v0, p1, Lu/f;->c:Z

    .line 171
    .line 172
    if-eqz v0, :cond_10

    .line 173
    .line 174
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 175
    .line 176
    iget-boolean v1, v0, Lu/f;->c:Z

    .line 177
    .line 178
    if-nez v1, :cond_9

    .line 179
    .line 180
    goto/16 :goto_6

    .line 181
    .line 182
    :cond_9
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 183
    .line 184
    if-eqz p1, :cond_a

    .line 185
    .line 186
    iget-boolean p1, v0, Lu/f;->j:Z

    .line 187
    .line 188
    if-eqz p1, :cond_a

    .line 189
    .line 190
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 191
    .line 192
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 193
    .line 194
    if-eqz p1, :cond_a

    .line 195
    .line 196
    goto/16 :goto_6

    .line 197
    .line 198
    :cond_a
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 199
    .line 200
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 201
    .line 202
    if-nez p1, :cond_b

    .line 203
    .line 204
    iget-object p1, p0, Lu/p;->d:Lt/e$b;

    .line 205
    .line 206
    sget-object v0, Lt/e$b;->i:Lt/e$b;

    .line 207
    .line 208
    if-ne p1, v0, :cond_b

    .line 209
    .line 210
    iget-object p1, p0, Lu/p;->b:Lt/e;

    .line 211
    .line 212
    iget v0, p1, Lt/e;->w:I

    .line 213
    .line 214
    if-nez v0, :cond_b

    .line 215
    .line 216
    invoke-virtual {p1}, Lt/e;->k0()Z

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    if-nez p1, :cond_b

    .line 221
    .line 222
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 223
    .line 224
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 225
    .line 226
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    check-cast p1, Lu/f;

    .line 231
    .line 232
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 233
    .line 234
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 235
    .line 236
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    check-cast v0, Lu/f;

    .line 241
    .line 242
    iget p1, p1, Lu/f;->g:I

    .line 243
    .line 244
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 245
    .line 246
    iget v2, v1, Lu/f;->f:I

    .line 247
    .line 248
    add-int/2addr p1, v2

    .line 249
    iget v0, v0, Lu/f;->g:I

    .line 250
    .line 251
    iget-object v2, p0, Lu/p;->i:Lu/f;

    .line 252
    .line 253
    iget v2, v2, Lu/f;->f:I

    .line 254
    .line 255
    add-int/2addr v0, v2

    .line 256
    sub-int v2, v0, p1

    .line 257
    .line 258
    invoke-virtual {v1, p1}, Lu/f;->d(I)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lu/p;->i:Lu/f;

    .line 262
    .line 263
    invoke-virtual {p1, v0}, Lu/f;->d(I)V

    .line 264
    .line 265
    .line 266
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 267
    .line 268
    invoke-virtual {p0, v2}, Lu/g;->d(I)V

    .line 269
    .line 270
    .line 271
    return-void

    .line 272
    :cond_b
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 273
    .line 274
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 275
    .line 276
    if-nez p1, :cond_d

    .line 277
    .line 278
    iget-object p1, p0, Lu/p;->d:Lt/e$b;

    .line 279
    .line 280
    sget-object v0, Lt/e$b;->i:Lt/e$b;

    .line 281
    .line 282
    if-ne p1, v0, :cond_d

    .line 283
    .line 284
    iget p1, p0, Lu/p;->a:I

    .line 285
    .line 286
    if-ne p1, v3, :cond_d

    .line 287
    .line 288
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 289
    .line 290
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-lez p1, :cond_d

    .line 297
    .line 298
    iget-object p1, p0, Lu/p;->i:Lu/f;

    .line 299
    .line 300
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 301
    .line 302
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    if-lez p1, :cond_d

    .line 307
    .line 308
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 309
    .line 310
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    check-cast p1, Lu/f;

    .line 317
    .line 318
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 319
    .line 320
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 321
    .line 322
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    check-cast v0, Lu/f;

    .line 327
    .line 328
    iget p1, p1, Lu/f;->g:I

    .line 329
    .line 330
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 331
    .line 332
    iget v1, v1, Lu/f;->f:I

    .line 333
    .line 334
    add-int/2addr p1, v1

    .line 335
    iget v0, v0, Lu/f;->g:I

    .line 336
    .line 337
    iget-object v1, p0, Lu/p;->i:Lu/f;

    .line 338
    .line 339
    iget v1, v1, Lu/f;->f:I

    .line 340
    .line 341
    add-int/2addr v0, v1

    .line 342
    sub-int/2addr v0, p1

    .line 343
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 344
    .line 345
    iget v1, p1, Lu/g;->m:I

    .line 346
    .line 347
    if-ge v0, v1, :cond_c

    .line 348
    .line 349
    invoke-virtual {p1, v0}, Lu/g;->d(I)V

    .line 350
    .line 351
    .line 352
    goto :goto_5

    .line 353
    :cond_c
    invoke-virtual {p1, v1}, Lu/g;->d(I)V

    .line 354
    .line 355
    .line 356
    :cond_d
    :goto_5
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 357
    .line 358
    iget-boolean p1, p1, Lu/f;->j:Z

    .line 359
    .line 360
    if-nez p1, :cond_e

    .line 361
    .line 362
    goto :goto_6

    .line 363
    :cond_e
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 364
    .line 365
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 366
    .line 367
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 368
    .line 369
    .line 370
    move-result p1

    .line 371
    if-lez p1, :cond_10

    .line 372
    .line 373
    iget-object p1, p0, Lu/p;->i:Lu/f;

    .line 374
    .line 375
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 376
    .line 377
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    if-lez p1, :cond_10

    .line 382
    .line 383
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 384
    .line 385
    iget-object p1, p1, Lu/f;->l:Ljava/util/List;

    .line 386
    .line 387
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object p1

    .line 391
    check-cast p1, Lu/f;

    .line 392
    .line 393
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 394
    .line 395
    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    .line 396
    .line 397
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    check-cast v0, Lu/f;

    .line 402
    .line 403
    iget v1, p1, Lu/f;->g:I

    .line 404
    .line 405
    iget-object v2, p0, Lu/p;->h:Lu/f;

    .line 406
    .line 407
    iget v2, v2, Lu/f;->f:I

    .line 408
    .line 409
    add-int/2addr v1, v2

    .line 410
    iget v2, v0, Lu/f;->g:I

    .line 411
    .line 412
    iget-object v3, p0, Lu/p;->i:Lu/f;

    .line 413
    .line 414
    iget v3, v3, Lu/f;->f:I

    .line 415
    .line 416
    add-int/2addr v2, v3

    .line 417
    iget-object v3, p0, Lu/p;->b:Lt/e;

    .line 418
    .line 419
    invoke-virtual {v3}, Lt/e;->R()F

    .line 420
    .line 421
    .line 422
    move-result v3

    .line 423
    if-ne p1, v0, :cond_f

    .line 424
    .line 425
    iget v1, p1, Lu/f;->g:I

    .line 426
    .line 427
    iget v2, v0, Lu/f;->g:I

    .line 428
    .line 429
    move v3, v4

    .line 430
    :cond_f
    sub-int/2addr v2, v1

    .line 431
    iget-object p1, p0, Lu/p;->e:Lu/g;

    .line 432
    .line 433
    iget p1, p1, Lu/f;->g:I

    .line 434
    .line 435
    sub-int/2addr v2, p1

    .line 436
    iget-object p1, p0, Lu/p;->h:Lu/f;

    .line 437
    .line 438
    int-to-float v0, v1

    .line 439
    add-float/2addr v0, v4

    .line 440
    int-to-float v1, v2

    .line 441
    mul-float/2addr v1, v3

    .line 442
    add-float/2addr v0, v1

    .line 443
    float-to-int v0, v0

    .line 444
    invoke-virtual {p1, v0}, Lu/f;->d(I)V

    .line 445
    .line 446
    .line 447
    iget-object p1, p0, Lu/p;->i:Lu/f;

    .line 448
    .line 449
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 450
    .line 451
    iget v0, v0, Lu/f;->g:I

    .line 452
    .line 453
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 454
    .line 455
    iget p0, p0, Lu/f;->g:I

    .line 456
    .line 457
    add-int/2addr v0, p0

    .line 458
    invoke-virtual {p1, v0}, Lu/f;->d(I)V

    .line 459
    .line 460
    .line 461
    :cond_10
    :goto_6
    return-void
.end method

.method d()V
    .locals 10

    .line 1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-boolean v1, v0, Lt/e;->a:Z

    if-eqz v1, :cond_0

    .line 2
    iget-object v1, p0, Lu/p;->e:Lu/g;

    invoke-virtual {v0}, Lt/e;->x()I

    move-result v0

    invoke-virtual {v1, v0}, Lu/g;->d(I)V

    .line 3
    :cond_0
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-boolean v0, v0, Lu/f;->j:Z

    if-nez v0, :cond_3

    .line 4
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    move-result-object v0

    iput-object v0, p0, Lu/p;->d:Lt/e$b;

    .line 5
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6
    new-instance v0, Lu/a;

    invoke-direct {v0, p0}, Lu/a;-><init>(Lu/p;)V

    iput-object v0, p0, Lu/n;->l:Lu/g;

    .line 7
    :cond_1
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    sget-object v1, Lt/e$b;->i:Lt/e$b;

    if-eq v0, v1, :cond_4

    .line 8
    sget-object v1, Lt/e$b;->j:Lt/e$b;

    if-ne v0, v1, :cond_2

    .line 9
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 10
    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    move-result-object v1

    sget-object v2, Lt/e$b;->g:Lt/e$b;

    if-ne v1, v2, :cond_2

    .line 11
    invoke-virtual {v0}, Lt/e;->x()I

    move-result v1

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->P:Lt/d;

    .line 12
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->R:Lt/d;

    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    sub-int/2addr v1, v2

    .line 13
    iget-object v2, p0, Lu/p;->h:Lu/f;

    iget-object v3, v0, Lt/e;->f:Lu/n;

    iget-object v3, v3, Lu/p;->h:Lu/f;

    iget-object v4, p0, Lu/p;->b:Lt/e;

    iget-object v4, v4, Lt/e;->P:Lt/d;

    invoke-virtual {v4}, Lt/d;->f()I

    move-result v4

    invoke-virtual {p0, v2, v3, v4}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 14
    iget-object v2, p0, Lu/p;->i:Lu/f;

    iget-object v0, v0, Lt/e;->f:Lu/n;

    iget-object v0, v0, Lu/p;->i:Lu/f;

    iget-object v3, p0, Lu/p;->b:Lt/e;

    iget-object v3, v3, Lt/e;->R:Lt/d;

    invoke-virtual {v3}, Lt/d;->f()I

    move-result v3

    neg-int v3, v3

    invoke-virtual {p0, v2, v0, v3}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 15
    iget-object p0, p0, Lu/p;->e:Lu/g;

    invoke-virtual {p0, v1}, Lu/g;->d(I)V

    return-void

    .line 16
    :cond_2
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    sget-object v1, Lt/e$b;->g:Lt/e$b;

    if-ne v0, v1, :cond_4

    .line 17
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v1}, Lt/e;->x()I

    move-result v1

    invoke-virtual {v0, v1}, Lu/g;->d(I)V

    goto :goto_0

    .line 18
    :cond_3
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    sget-object v1, Lt/e$b;->j:Lt/e$b;

    if-ne v0, v1, :cond_4

    .line 19
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 20
    invoke-virtual {v0}, Lt/e;->T()Lt/e$b;

    move-result-object v1

    sget-object v2, Lt/e$b;->g:Lt/e$b;

    if-ne v1, v2, :cond_4

    .line 21
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, v0, Lt/e;->f:Lu/n;

    iget-object v2, v2, Lu/p;->h:Lu/f;

    iget-object v3, p0, Lu/p;->b:Lt/e;

    iget-object v3, v3, Lt/e;->P:Lt/d;

    invoke-virtual {v3}, Lt/d;->f()I

    move-result v3

    invoke-virtual {p0, v1, v2, v3}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 22
    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v0, v0, Lt/e;->f:Lu/n;

    iget-object v0, v0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->R:Lt/d;

    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    .line 23
    :cond_4
    :goto_0
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-boolean v1, v0, Lu/f;->j:Z

    const/4 v2, 0x0

    const/4 v3, 0x4

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x3

    if-eqz v1, :cond_d

    iget-object v7, p0, Lu/p;->b:Lt/e;

    iget-boolean v8, v7, Lt/e;->a:Z

    if-eqz v8, :cond_d

    .line 24
    iget-object v0, v7, Lt/e;->W:[Lt/d;

    aget-object v1, v0, v4

    iget-object v8, v1, Lt/d;->f:Lt/d;

    if-eqz v8, :cond_8

    aget-object v9, v0, v6

    iget-object v9, v9, Lt/d;->f:Lt/d;

    if-eqz v9, :cond_8

    .line 25
    invoke-virtual {v7}, Lt/e;->k0()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 26
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->W:[Lt/d;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lt/d;->f()I

    move-result v1

    iput v1, v0, Lu/f;->f:I

    .line 27
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->W:[Lt/d;

    aget-object v1, v1, v6

    invoke-virtual {v1}, Lt/d;->f()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lu/f;->f:I

    goto :goto_1

    .line 28
    :cond_5
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v0, v0, Lt/e;->W:[Lt/d;

    aget-object v0, v0, v4

    .line 29
    invoke-virtual {p0, v0}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 30
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v4

    .line 31
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    .line 32
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 33
    :cond_6
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v0, v0, Lt/e;->W:[Lt/d;

    aget-object v0, v0, v6

    .line 34
    invoke-virtual {p0, v0}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 35
    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v6

    .line 36
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    neg-int v2, v2

    .line 37
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 38
    :cond_7
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iput-boolean v5, v0, Lu/f;->b:Z

    .line 39
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iput-boolean v5, v0, Lu/f;->b:Z

    .line 40
    :goto_1
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 41
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->p()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    :cond_8
    if-eqz v8, :cond_9

    .line 42
    invoke-virtual {p0, v1}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 43
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v4

    .line 44
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    .line 45
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 46
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    iget v2, v2, Lu/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 47
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 48
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->p()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    .line 49
    :cond_9
    aget-object v1, v0, v6

    iget-object v4, v1, Lt/d;->f:Lt/d;

    if-eqz v4, :cond_b

    .line 50
    invoke-virtual {p0, v1}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 51
    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v6

    .line 52
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    neg-int v2, v2

    .line 53
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 54
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    iget v2, v2, Lu/f;->g:I

    neg-int v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 55
    :cond_a
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 56
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->p()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    .line 57
    :cond_b
    aget-object v0, v0, v3

    iget-object v1, v0, Lt/d;->f:Lt/d;

    if-eqz v1, :cond_c

    .line 58
    invoke-virtual {p0, v0}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 59
    iget-object v1, p0, Lu/n;->k:Lu/f;

    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 60
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/n;->k:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->p()I

    move-result v2

    neg-int v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 61
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    iget v2, v2, Lu/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    .line 62
    :cond_c
    instance-of v0, v7, Lt/i;

    if-nez v0, :cond_1e

    invoke-virtual {v7}, Lt/e;->K()Lt/e;

    move-result-object v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lu/p;->b:Lt/e;

    sget-object v1, Lt/d$a;->m:Lt/d$a;

    .line 63
    invoke-virtual {v0, v1}, Lt/e;->o(Lt/d$a;)Lt/d;

    move-result-object v0

    iget-object v0, v0, Lt/d;->f:Lt/d;

    if-nez v0, :cond_1e

    .line 64
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    iget-object v0, v0, Lt/e;->f:Lu/n;

    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 65
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->Y()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 66
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    iget v2, v2, Lu/f;->g:I

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 67
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 68
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->p()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    return-void

    :cond_d
    if-nez v1, :cond_12

    .line 69
    iget-object v1, p0, Lu/p;->d:Lt/e$b;

    sget-object v7, Lt/e$b;->i:Lt/e$b;

    if-ne v1, v7, :cond_12

    .line 70
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget v1, v0, Lt/e;->x:I

    if-eq v1, v4, :cond_10

    if-eq v1, v6, :cond_e

    goto :goto_2

    .line 71
    :cond_e
    invoke-virtual {v0}, Lt/e;->k0()Z

    move-result v0

    if-nez v0, :cond_13

    .line 72
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget v1, v0, Lt/e;->w:I

    if-ne v1, v6, :cond_f

    goto :goto_2

    .line 73
    :cond_f
    iget-object v0, v0, Lt/e;->e:Lu/l;

    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 74
    iget-object v1, p0, Lu/p;->e:Lu/g;

    iget-object v1, v1, Lu/f;->l:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iput-boolean v5, v0, Lu/f;->b:Z

    .line 77
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->i:Lu/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 79
    :cond_10
    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    if-nez v0, :cond_11

    goto :goto_2

    .line 80
    :cond_11
    iget-object v0, v0, Lt/e;->f:Lu/n;

    iget-object v0, v0, Lu/p;->e:Lu/g;

    .line 81
    iget-object v1, p0, Lu/p;->e:Lu/g;

    iget-object v1, v1, Lu/f;->l:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iput-boolean v5, v0, Lu/f;->b:Z

    .line 84
    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->i:Lu/f;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 86
    :cond_12
    invoke-virtual {v0, p0}, Lu/f;->b(Lu/d;)V

    .line 87
    :cond_13
    :goto_2
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v1, v0, Lt/e;->W:[Lt/d;

    aget-object v7, v1, v4

    iget-object v8, v7, Lt/d;->f:Lt/d;

    if-eqz v8, :cond_17

    aget-object v9, v1, v6

    iget-object v9, v9, Lt/d;->f:Lt/d;

    if-eqz v9, :cond_17

    .line 88
    invoke-virtual {v0}, Lt/e;->k0()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 89
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->W:[Lt/d;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lt/d;->f()I

    move-result v1

    iput v1, v0, Lu/f;->f:I

    .line 90
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->W:[Lt/d;

    aget-object v1, v1, v6

    invoke-virtual {v1}, Lt/d;->f()I

    move-result v1

    neg-int v1, v1

    iput v1, v0, Lu/f;->f:I

    goto :goto_3

    .line 91
    :cond_14
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v0, v0, Lt/e;->W:[Lt/d;

    aget-object v0, v0, v4

    .line 92
    invoke-virtual {p0, v0}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    .line 93
    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->W:[Lt/d;

    aget-object v1, v1, v6

    .line 94
    invoke-virtual {p0, v1}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v1

    if-eqz v0, :cond_15

    .line 95
    invoke-virtual {v0, p0}, Lu/f;->b(Lu/d;)V

    :cond_15
    if-eqz v1, :cond_16

    .line 96
    invoke-virtual {v1, p0}, Lu/f;->b(Lu/d;)V

    .line 97
    :cond_16
    sget-object v0, Lu/p$b;->j:Lu/p$b;

    iput-object v0, p0, Lu/p;->j:Lu/p$b;

    .line 98
    :goto_3
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 99
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/n;->l:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    goto/16 :goto_4

    :cond_17
    const/4 v9, 0x0

    if-eqz v8, :cond_19

    .line 100
    invoke-virtual {p0, v7}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 101
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v4

    .line 102
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    .line 103
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 104
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 105
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 106
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/n;->l:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 107
    :cond_18
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    sget-object v1, Lt/e$b;->i:Lt/e$b;

    if-ne v0, v1, :cond_1d

    .line 108
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->v()F

    move-result v0

    cmpl-float v0, v0, v9

    if-lez v0, :cond_1d

    .line 109
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v0, v0, Lt/e;->e:Lu/l;

    iget-object v2, v0, Lu/p;->d:Lt/e$b;

    if-ne v2, v1, :cond_1d

    .line 110
    iget-object v0, v0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->e:Lu/l;

    iget-object v1, v1, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iput-object p0, v0, Lu/f;->a:Lu/d;

    goto/16 :goto_4

    .line 113
    :cond_19
    aget-object v4, v1, v6

    iget-object v7, v4, Lt/d;->f:Lt/d;

    const/4 v8, -0x1

    if-eqz v7, :cond_1a

    .line 114
    invoke-virtual {p0, v4}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 115
    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    iget-object v2, v2, Lt/e;->W:[Lt/d;

    aget-object v2, v2, v6

    .line 116
    invoke-virtual {v2}, Lt/d;->f()I

    move-result v2

    neg-int v2, v2

    .line 117
    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 118
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/p;->i:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    invoke-virtual {p0, v0, v1, v8, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 119
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 120
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/n;->l:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    goto/16 :goto_4

    .line 121
    :cond_1a
    aget-object v1, v1, v3

    iget-object v3, v1, Lt/d;->f:Lt/d;

    if-eqz v3, :cond_1b

    .line 122
    invoke-virtual {p0, v1}, Lu/p;->h(Lt/d;)Lu/f;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 123
    iget-object v1, p0, Lu/n;->k:Lu/f;

    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 124
    iget-object v0, p0, Lu/p;->h:Lu/f;

    iget-object v1, p0, Lu/n;->k:Lu/f;

    iget-object v2, p0, Lu/n;->l:Lu/g;

    invoke-virtual {p0, v0, v1, v8, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 125
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    goto :goto_4

    .line 126
    :cond_1b
    instance-of v1, v0, Lt/i;

    if-nez v1, :cond_1d

    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 127
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->K()Lt/e;

    move-result-object v0

    iget-object v0, v0, Lt/e;->f:Lu/n;

    iget-object v0, v0, Lu/p;->h:Lu/f;

    .line 128
    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v2}, Lt/e;->Y()I

    move-result v2

    invoke-virtual {p0, v1, v0, v2}, Lu/p;->b(Lu/f;Lu/f;I)V

    .line 129
    iget-object v0, p0, Lu/p;->i:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/p;->e:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 130
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->Z()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 131
    iget-object v0, p0, Lu/n;->k:Lu/f;

    iget-object v1, p0, Lu/p;->h:Lu/f;

    iget-object v2, p0, Lu/n;->l:Lu/g;

    invoke-virtual {p0, v0, v1, v5, v2}, Lu/p;->c(Lu/f;Lu/f;ILu/g;)V

    .line 132
    :cond_1c
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    sget-object v1, Lt/e$b;->i:Lt/e$b;

    if-ne v0, v1, :cond_1d

    .line 133
    iget-object v0, p0, Lu/p;->b:Lt/e;

    invoke-virtual {v0}, Lt/e;->v()F

    move-result v0

    cmpl-float v0, v0, v9

    if-lez v0, :cond_1d

    .line 134
    iget-object v0, p0, Lu/p;->b:Lt/e;

    iget-object v0, v0, Lt/e;->e:Lu/l;

    iget-object v2, v0, Lu/p;->d:Lt/e$b;

    if-ne v2, v1, :cond_1d

    .line 135
    iget-object v0, v0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->k:Ljava/util/List;

    iget-object v1, p0, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    iget-object v1, p0, Lu/p;->b:Lt/e;

    iget-object v1, v1, Lt/e;->e:Lu/l;

    iget-object v1, v1, Lu/p;->e:Lu/g;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iput-object p0, v0, Lu/f;->a:Lu/d;

    .line 138
    :cond_1d
    :goto_4
    iget-object v0, p0, Lu/p;->e:Lu/g;

    iget-object v0, v0, Lu/f;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1e

    .line 139
    iget-object p0, p0, Lu/p;->e:Lu/g;

    iput-boolean v5, p0, Lu/f;->c:Z

    :cond_1e
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 2
    .line 3
    iget-boolean v1, v0, Lu/f;->j:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lu/p;->b:Lt/e;

    .line 8
    .line 9
    iget v0, v0, Lu/f;->g:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lt/e;->o1(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method f()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lu/p;->c:Lu/m;

    .line 3
    .line 4
    iget-object v0, p0, Lu/p;->h:Lu/f;

    .line 5
    .line 6
    invoke-virtual {v0}, Lu/f;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lu/p;->i:Lu/f;

    .line 10
    .line 11
    invoke-virtual {v0}, Lu/f;->c()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lu/n;->k:Lu/f;

    .line 15
    .line 16
    invoke-virtual {v0}, Lu/f;->c()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lu/p;->e:Lu/g;

    .line 20
    .line 21
    invoke-virtual {v0}, Lu/f;->c()V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lu/p;->g:Z

    .line 26
    .line 27
    return-void
.end method

.method m()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lu/p;->d:Lt/e$b;

    .line 2
    .line 3
    sget-object v1, Lt/e$b;->i:Lt/e$b;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lu/p;->b:Lt/e;

    .line 9
    .line 10
    iget p0, p0, Lt/e;->x:I

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    return v2
.end method

.method q()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lu/p;->g:Z

    .line 3
    .line 4
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 5
    .line 6
    invoke-virtual {v1}, Lu/f;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lu/p;->h:Lu/f;

    .line 10
    .line 11
    iput-boolean v0, v1, Lu/f;->j:Z

    .line 12
    .line 13
    iget-object v1, p0, Lu/p;->i:Lu/f;

    .line 14
    .line 15
    invoke-virtual {v1}, Lu/f;->c()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lu/p;->i:Lu/f;

    .line 19
    .line 20
    iput-boolean v0, v1, Lu/f;->j:Z

    .line 21
    .line 22
    iget-object v1, p0, Lu/n;->k:Lu/f;

    .line 23
    .line 24
    invoke-virtual {v1}, Lu/f;->c()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lu/n;->k:Lu/f;

    .line 28
    .line 29
    iput-boolean v0, v1, Lu/f;->j:Z

    .line 30
    .line 31
    iget-object p0, p0, Lu/p;->e:Lu/g;

    .line 32
    .line 33
    iput-boolean v0, p0, Lu/f;->j:Z

    .line 34
    .line 35
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "VerticalRun "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lu/p;->b:Lt/e;

    .line 12
    .line 13
    invoke-virtual {p0}, Lt/e;->t()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method
