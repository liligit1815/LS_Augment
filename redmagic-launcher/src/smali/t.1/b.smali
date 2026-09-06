.class public Lt/b;
.super Ljava/lang/Object;
.source "Chain.java"


# direct methods
.method static a(Lt/f;Lq/d;IILt/c;)V
    .locals 37

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v9, p2

    .line 6
    .line 7
    move-object/from16 v2, p4

    .line 8
    .line 9
    iget-object v10, v2, Lt/c;->a:Lt/e;

    .line 10
    .line 11
    iget-object v11, v2, Lt/c;->c:Lt/e;

    .line 12
    .line 13
    iget-object v12, v2, Lt/c;->b:Lt/e;

    .line 14
    .line 15
    iget-object v13, v2, Lt/c;->d:Lt/e;

    .line 16
    .line 17
    iget-object v3, v2, Lt/c;->e:Lt/e;

    .line 18
    .line 19
    iget v4, v2, Lt/c;->k:F

    .line 20
    .line 21
    iget-object v5, v0, Lt/e;->Z:[Lt/e$b;

    .line 22
    .line 23
    aget-object v5, v5, v9

    .line 24
    .line 25
    sget-object v6, Lt/e$b;->h:Lt/e$b;

    .line 26
    .line 27
    const/4 v14, 0x1

    .line 28
    if-ne v5, v6, :cond_0

    .line 29
    .line 30
    move v5, v14

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v5, 0x0

    .line 33
    :goto_0
    const/4 v6, 0x2

    .line 34
    if-nez v9, :cond_4

    .line 35
    .line 36
    iget v8, v3, Lt/e;->z0:I

    .line 37
    .line 38
    if-nez v8, :cond_1

    .line 39
    .line 40
    move v15, v14

    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 v15, 0x0

    .line 43
    :goto_1
    if-ne v8, v14, :cond_2

    .line 44
    .line 45
    move/from16 v16, v14

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    const/16 v16, 0x0

    .line 49
    .line 50
    :goto_2
    if-ne v8, v6, :cond_3

    .line 51
    .line 52
    :goto_3
    move v6, v14

    .line 53
    goto :goto_4

    .line 54
    :cond_3
    const/4 v6, 0x0

    .line 55
    :goto_4
    move-object v14, v10

    .line 56
    const/4 v8, 0x0

    .line 57
    goto :goto_7

    .line 58
    :cond_4
    iget v8, v3, Lt/e;->A0:I

    .line 59
    .line 60
    if-nez v8, :cond_5

    .line 61
    .line 62
    move v15, v14

    .line 63
    goto :goto_5

    .line 64
    :cond_5
    const/4 v15, 0x0

    .line 65
    :goto_5
    if-ne v8, v14, :cond_6

    .line 66
    .line 67
    move/from16 v16, v14

    .line 68
    .line 69
    goto :goto_6

    .line 70
    :cond_6
    const/16 v16, 0x0

    .line 71
    .line 72
    :goto_6
    if-ne v8, v6, :cond_3

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :goto_7
    move/from16 v19, v4

    .line 76
    .line 77
    const/16 v22, 0x0

    .line 78
    .line 79
    if-nez v8, :cond_14

    .line 80
    .line 81
    iget-object v4, v14, Lt/e;->W:[Lt/d;

    .line 82
    .line 83
    aget-object v4, v4, p3

    .line 84
    .line 85
    if-eqz v6, :cond_7

    .line 86
    .line 87
    const/16 v20, 0x1

    .line 88
    .line 89
    goto :goto_8

    .line 90
    :cond_7
    const/16 v20, 0x4

    .line 91
    .line 92
    :goto_8
    invoke-virtual {v4}, Lt/d;->f()I

    .line 93
    .line 94
    .line 95
    move-result v23

    .line 96
    iget-object v7, v14, Lt/e;->Z:[Lt/e$b;

    .line 97
    .line 98
    aget-object v7, v7, v9

    .line 99
    .line 100
    move/from16 v24, v5

    .line 101
    .line 102
    sget-object v5, Lt/e$b;->i:Lt/e$b;

    .line 103
    .line 104
    if-ne v7, v5, :cond_8

    .line 105
    .line 106
    iget-object v7, v14, Lt/e;->y:[I

    .line 107
    .line 108
    aget v7, v7, v9

    .line 109
    .line 110
    if-nez v7, :cond_8

    .line 111
    .line 112
    const/4 v7, 0x1

    .line 113
    :goto_9
    move/from16 v25, v6

    .line 114
    .line 115
    goto :goto_a

    .line 116
    :cond_8
    const/4 v7, 0x0

    .line 117
    goto :goto_9

    .line 118
    :goto_a
    iget-object v6, v4, Lt/d;->f:Lt/d;

    .line 119
    .line 120
    if-eqz v6, :cond_9

    .line 121
    .line 122
    if-eq v14, v10, :cond_9

    .line 123
    .line 124
    invoke-virtual {v6}, Lt/d;->f()I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    add-int v23, v23, v6

    .line 129
    .line 130
    :cond_9
    move/from16 v6, v23

    .line 131
    .line 132
    if-eqz v25, :cond_a

    .line 133
    .line 134
    if-eq v14, v10, :cond_a

    .line 135
    .line 136
    if-eq v14, v12, :cond_a

    .line 137
    .line 138
    const/16 v20, 0x8

    .line 139
    .line 140
    :cond_a
    move/from16 v23, v7

    .line 141
    .line 142
    iget-object v7, v4, Lt/d;->f:Lt/d;

    .line 143
    .line 144
    if-eqz v7, :cond_e

    .line 145
    .line 146
    if-ne v14, v12, :cond_b

    .line 147
    .line 148
    move/from16 v26, v8

    .line 149
    .line 150
    iget-object v8, v4, Lt/d;->i:Lq/i;

    .line 151
    .line 152
    iget-object v7, v7, Lt/d;->i:Lq/i;

    .line 153
    .line 154
    move/from16 v27, v15

    .line 155
    .line 156
    const/4 v15, 0x6

    .line 157
    invoke-virtual {v1, v8, v7, v6, v15}, Lq/d;->h(Lq/i;Lq/i;II)V

    .line 158
    .line 159
    .line 160
    goto :goto_b

    .line 161
    :cond_b
    move/from16 v26, v8

    .line 162
    .line 163
    move/from16 v27, v15

    .line 164
    .line 165
    iget-object v8, v4, Lt/d;->i:Lq/i;

    .line 166
    .line 167
    iget-object v7, v7, Lt/d;->i:Lq/i;

    .line 168
    .line 169
    const/16 v15, 0x8

    .line 170
    .line 171
    invoke-virtual {v1, v8, v7, v6, v15}, Lq/d;->h(Lq/i;Lq/i;II)V

    .line 172
    .line 173
    .line 174
    :goto_b
    if-eqz v23, :cond_c

    .line 175
    .line 176
    if-nez v25, :cond_c

    .line 177
    .line 178
    const/16 v20, 0x5

    .line 179
    .line 180
    :cond_c
    if-ne v14, v12, :cond_d

    .line 181
    .line 182
    if-eqz v25, :cond_d

    .line 183
    .line 184
    invoke-virtual {v14, v9}, Lt/e;->h0(I)Z

    .line 185
    .line 186
    .line 187
    move-result v7

    .line 188
    if-eqz v7, :cond_d

    .line 189
    .line 190
    const/4 v7, 0x5

    .line 191
    goto :goto_c

    .line 192
    :cond_d
    move/from16 v7, v20

    .line 193
    .line 194
    :goto_c
    iget-object v8, v4, Lt/d;->i:Lq/i;

    .line 195
    .line 196
    iget-object v4, v4, Lt/d;->f:Lt/d;

    .line 197
    .line 198
    iget-object v4, v4, Lt/d;->i:Lq/i;

    .line 199
    .line 200
    invoke-virtual {v1, v8, v4, v6, v7}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 201
    .line 202
    .line 203
    goto :goto_d

    .line 204
    :cond_e
    move/from16 v26, v8

    .line 205
    .line 206
    move/from16 v27, v15

    .line 207
    .line 208
    :goto_d
    if-eqz v24, :cond_10

    .line 209
    .line 210
    invoke-virtual {v14}, Lt/e;->V()I

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    const/16 v15, 0x8

    .line 215
    .line 216
    if-eq v4, v15, :cond_f

    .line 217
    .line 218
    iget-object v4, v14, Lt/e;->Z:[Lt/e$b;

    .line 219
    .line 220
    aget-object v4, v4, v9

    .line 221
    .line 222
    if-ne v4, v5, :cond_f

    .line 223
    .line 224
    iget-object v4, v14, Lt/e;->W:[Lt/d;

    .line 225
    .line 226
    add-int/lit8 v5, p3, 0x1

    .line 227
    .line 228
    aget-object v5, v4, v5

    .line 229
    .line 230
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 231
    .line 232
    aget-object v4, v4, p3

    .line 233
    .line 234
    iget-object v4, v4, Lt/d;->i:Lq/i;

    .line 235
    .line 236
    const/4 v6, 0x0

    .line 237
    const/4 v7, 0x5

    .line 238
    invoke-virtual {v1, v5, v4, v6, v7}, Lq/d;->h(Lq/i;Lq/i;II)V

    .line 239
    .line 240
    .line 241
    goto :goto_e

    .line 242
    :cond_f
    const/4 v6, 0x0

    .line 243
    :goto_e
    iget-object v4, v14, Lt/e;->W:[Lt/d;

    .line 244
    .line 245
    aget-object v4, v4, p3

    .line 246
    .line 247
    iget-object v4, v4, Lt/d;->i:Lq/i;

    .line 248
    .line 249
    iget-object v5, v0, Lt/e;->W:[Lt/d;

    .line 250
    .line 251
    aget-object v5, v5, p3

    .line 252
    .line 253
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 254
    .line 255
    const/16 v15, 0x8

    .line 256
    .line 257
    invoke-virtual {v1, v4, v5, v6, v15}, Lq/d;->h(Lq/i;Lq/i;II)V

    .line 258
    .line 259
    .line 260
    :cond_10
    iget-object v4, v14, Lt/e;->W:[Lt/d;

    .line 261
    .line 262
    add-int/lit8 v5, p3, 0x1

    .line 263
    .line 264
    aget-object v4, v4, v5

    .line 265
    .line 266
    iget-object v4, v4, Lt/d;->f:Lt/d;

    .line 267
    .line 268
    if-eqz v4, :cond_12

    .line 269
    .line 270
    iget-object v4, v4, Lt/d;->d:Lt/e;

    .line 271
    .line 272
    iget-object v5, v4, Lt/e;->W:[Lt/d;

    .line 273
    .line 274
    aget-object v5, v5, p3

    .line 275
    .line 276
    iget-object v5, v5, Lt/d;->f:Lt/d;

    .line 277
    .line 278
    if-eqz v5, :cond_12

    .line 279
    .line 280
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 281
    .line 282
    if-eq v5, v14, :cond_11

    .line 283
    .line 284
    goto :goto_f

    .line 285
    :cond_11
    move-object/from16 v22, v4

    .line 286
    .line 287
    :cond_12
    :goto_f
    if-eqz v22, :cond_13

    .line 288
    .line 289
    move-object/from16 v14, v22

    .line 290
    .line 291
    move/from16 v8, v26

    .line 292
    .line 293
    goto :goto_10

    .line 294
    :cond_13
    const/4 v8, 0x1

    .line 295
    :goto_10
    move/from16 v4, v19

    .line 296
    .line 297
    move/from16 v5, v24

    .line 298
    .line 299
    move/from16 v6, v25

    .line 300
    .line 301
    move/from16 v15, v27

    .line 302
    .line 303
    goto/16 :goto_7

    .line 304
    .line 305
    :cond_14
    move/from16 v24, v5

    .line 306
    .line 307
    move/from16 v25, v6

    .line 308
    .line 309
    move/from16 v27, v15

    .line 310
    .line 311
    if-eqz v13, :cond_17

    .line 312
    .line 313
    iget-object v4, v11, Lt/e;->W:[Lt/d;

    .line 314
    .line 315
    add-int/lit8 v5, p3, 0x1

    .line 316
    .line 317
    aget-object v4, v4, v5

    .line 318
    .line 319
    iget-object v4, v4, Lt/d;->f:Lt/d;

    .line 320
    .line 321
    if-eqz v4, :cond_17

    .line 322
    .line 323
    iget-object v4, v13, Lt/e;->W:[Lt/d;

    .line 324
    .line 325
    aget-object v4, v4, v5

    .line 326
    .line 327
    iget-object v6, v13, Lt/e;->Z:[Lt/e$b;

    .line 328
    .line 329
    aget-object v6, v6, v9

    .line 330
    .line 331
    sget-object v7, Lt/e$b;->i:Lt/e$b;

    .line 332
    .line 333
    if-ne v6, v7, :cond_15

    .line 334
    .line 335
    iget-object v6, v13, Lt/e;->y:[I

    .line 336
    .line 337
    aget v6, v6, v9

    .line 338
    .line 339
    if-nez v6, :cond_15

    .line 340
    .line 341
    if-nez v25, :cond_15

    .line 342
    .line 343
    iget-object v6, v4, Lt/d;->f:Lt/d;

    .line 344
    .line 345
    iget-object v7, v6, Lt/d;->d:Lt/e;

    .line 346
    .line 347
    if-ne v7, v0, :cond_15

    .line 348
    .line 349
    iget-object v7, v4, Lt/d;->i:Lq/i;

    .line 350
    .line 351
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 352
    .line 353
    invoke-virtual {v4}, Lt/d;->f()I

    .line 354
    .line 355
    .line 356
    move-result v8

    .line 357
    neg-int v8, v8

    .line 358
    const/4 v15, 0x5

    .line 359
    invoke-virtual {v1, v7, v6, v8, v15}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 360
    .line 361
    .line 362
    goto :goto_11

    .line 363
    :cond_15
    const/4 v15, 0x5

    .line 364
    if-eqz v25, :cond_16

    .line 365
    .line 366
    iget-object v6, v4, Lt/d;->f:Lt/d;

    .line 367
    .line 368
    iget-object v7, v6, Lt/d;->d:Lt/e;

    .line 369
    .line 370
    if-ne v7, v0, :cond_16

    .line 371
    .line 372
    iget-object v7, v4, Lt/d;->i:Lq/i;

    .line 373
    .line 374
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 375
    .line 376
    invoke-virtual {v4}, Lt/d;->f()I

    .line 377
    .line 378
    .line 379
    move-result v8

    .line 380
    neg-int v8, v8

    .line 381
    const/4 v14, 0x4

    .line 382
    invoke-virtual {v1, v7, v6, v8, v14}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 383
    .line 384
    .line 385
    :cond_16
    :goto_11
    iget-object v6, v4, Lt/d;->i:Lq/i;

    .line 386
    .line 387
    iget-object v7, v11, Lt/e;->W:[Lt/d;

    .line 388
    .line 389
    aget-object v5, v7, v5

    .line 390
    .line 391
    iget-object v5, v5, Lt/d;->f:Lt/d;

    .line 392
    .line 393
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 394
    .line 395
    invoke-virtual {v4}, Lt/d;->f()I

    .line 396
    .line 397
    .line 398
    move-result v4

    .line 399
    neg-int v4, v4

    .line 400
    const/4 v7, 0x6

    .line 401
    invoke-virtual {v1, v6, v5, v4, v7}, Lq/d;->j(Lq/i;Lq/i;II)V

    .line 402
    .line 403
    .line 404
    goto :goto_12

    .line 405
    :cond_17
    const/4 v15, 0x5

    .line 406
    :goto_12
    if-eqz v24, :cond_18

    .line 407
    .line 408
    iget-object v0, v0, Lt/e;->W:[Lt/d;

    .line 409
    .line 410
    add-int/lit8 v4, p3, 0x1

    .line 411
    .line 412
    aget-object v0, v0, v4

    .line 413
    .line 414
    iget-object v0, v0, Lt/d;->i:Lq/i;

    .line 415
    .line 416
    iget-object v5, v11, Lt/e;->W:[Lt/d;

    .line 417
    .line 418
    aget-object v4, v5, v4

    .line 419
    .line 420
    iget-object v5, v4, Lt/d;->i:Lq/i;

    .line 421
    .line 422
    invoke-virtual {v4}, Lt/d;->f()I

    .line 423
    .line 424
    .line 425
    move-result v4

    .line 426
    const/16 v6, 0x8

    .line 427
    .line 428
    invoke-virtual {v1, v0, v5, v4, v6}, Lq/d;->h(Lq/i;Lq/i;II)V

    .line 429
    .line 430
    .line 431
    :cond_18
    iget-object v0, v2, Lt/c;->h:Ljava/util/ArrayList;

    .line 432
    .line 433
    if-eqz v0, :cond_1e

    .line 434
    .line 435
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 436
    .line 437
    .line 438
    move-result v4

    .line 439
    const/4 v5, 0x1

    .line 440
    if-le v4, v5, :cond_1e

    .line 441
    .line 442
    iget-boolean v5, v2, Lt/c;->r:Z

    .line 443
    .line 444
    if-eqz v5, :cond_19

    .line 445
    .line 446
    iget-boolean v5, v2, Lt/c;->t:Z

    .line 447
    .line 448
    if-nez v5, :cond_19

    .line 449
    .line 450
    iget v5, v2, Lt/c;->j:I

    .line 451
    .line 452
    int-to-float v5, v5

    .line 453
    move/from16 v30, v5

    .line 454
    .line 455
    goto :goto_13

    .line 456
    :cond_19
    move/from16 v30, v19

    .line 457
    .line 458
    :goto_13
    const/4 v5, 0x0

    .line 459
    move/from16 v29, v5

    .line 460
    .line 461
    move-object/from16 v7, v22

    .line 462
    .line 463
    const/4 v6, 0x0

    .line 464
    :goto_14
    if-ge v6, v4, :cond_1e

    .line 465
    .line 466
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    move-result-object v8

    .line 470
    check-cast v8, Lt/e;

    .line 471
    .line 472
    iget-object v14, v8, Lt/e;->D0:[F

    .line 473
    .line 474
    aget v14, v14, v9

    .line 475
    .line 476
    cmpg-float v19, v14, v5

    .line 477
    .line 478
    if-gez v19, :cond_1b

    .line 479
    .line 480
    iget-boolean v14, v2, Lt/c;->t:Z

    .line 481
    .line 482
    if-eqz v14, :cond_1a

    .line 483
    .line 484
    iget-object v8, v8, Lt/e;->W:[Lt/d;

    .line 485
    .line 486
    add-int/lit8 v14, p3, 0x1

    .line 487
    .line 488
    aget-object v14, v8, v14

    .line 489
    .line 490
    iget-object v14, v14, Lt/d;->i:Lq/i;

    .line 491
    .line 492
    aget-object v8, v8, p3

    .line 493
    .line 494
    iget-object v8, v8, Lt/d;->i:Lq/i;

    .line 495
    .line 496
    move/from16 p0, v5

    .line 497
    .line 498
    const/4 v5, 0x0

    .line 499
    const/4 v15, 0x4

    .line 500
    invoke-virtual {v1, v14, v8, v5, v15}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 501
    .line 502
    .line 503
    move v14, v5

    .line 504
    goto :goto_17

    .line 505
    :cond_1a
    move/from16 p0, v5

    .line 506
    .line 507
    const/4 v15, 0x4

    .line 508
    const/high16 v14, 0x3f800000    # 1.0f

    .line 509
    .line 510
    :goto_15
    move/from16 v31, v14

    .line 511
    .line 512
    goto :goto_16

    .line 513
    :cond_1b
    move/from16 p0, v5

    .line 514
    .line 515
    const/4 v15, 0x4

    .line 516
    goto :goto_15

    .line 517
    :goto_16
    cmpl-float v5, v31, p0

    .line 518
    .line 519
    if-nez v5, :cond_1c

    .line 520
    .line 521
    iget-object v5, v8, Lt/e;->W:[Lt/d;

    .line 522
    .line 523
    add-int/lit8 v8, p3, 0x1

    .line 524
    .line 525
    aget-object v8, v5, v8

    .line 526
    .line 527
    iget-object v8, v8, Lt/d;->i:Lq/i;

    .line 528
    .line 529
    aget-object v5, v5, p3

    .line 530
    .line 531
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 532
    .line 533
    const/4 v14, 0x0

    .line 534
    const/16 v15, 0x8

    .line 535
    .line 536
    invoke-virtual {v1, v8, v5, v14, v15}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 537
    .line 538
    .line 539
    :goto_17
    move-object/from16 v19, v0

    .line 540
    .line 541
    goto :goto_19

    .line 542
    :cond_1c
    const/4 v14, 0x0

    .line 543
    if-eqz v7, :cond_1d

    .line 544
    .line 545
    iget-object v5, v7, Lt/e;->W:[Lt/d;

    .line 546
    .line 547
    aget-object v7, v5, p3

    .line 548
    .line 549
    iget-object v7, v7, Lt/d;->i:Lq/i;

    .line 550
    .line 551
    add-int/lit8 v15, p3, 0x1

    .line 552
    .line 553
    aget-object v5, v5, v15

    .line 554
    .line 555
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 556
    .line 557
    iget-object v14, v8, Lt/e;->W:[Lt/d;

    .line 558
    .line 559
    move-object/from16 v19, v0

    .line 560
    .line 561
    aget-object v0, v14, p3

    .line 562
    .line 563
    iget-object v0, v0, Lt/d;->i:Lq/i;

    .line 564
    .line 565
    aget-object v14, v14, v15

    .line 566
    .line 567
    iget-object v14, v14, Lt/d;->i:Lq/i;

    .line 568
    .line 569
    invoke-virtual {v1}, Lq/d;->r()Lq/b;

    .line 570
    .line 571
    .line 572
    move-result-object v28

    .line 573
    move-object/from16 v34, v0

    .line 574
    .line 575
    move-object/from16 v33, v5

    .line 576
    .line 577
    move-object/from16 v32, v7

    .line 578
    .line 579
    move-object/from16 v35, v14

    .line 580
    .line 581
    invoke-virtual/range {v28 .. v35}, Lq/b;->l(FFFLq/i;Lq/i;Lq/i;Lq/i;)Lq/b;

    .line 582
    .line 583
    .line 584
    move-object/from16 v0, v28

    .line 585
    .line 586
    invoke-virtual {v1, v0}, Lq/d;->d(Lq/b;)V

    .line 587
    .line 588
    .line 589
    goto :goto_18

    .line 590
    :cond_1d
    move-object/from16 v19, v0

    .line 591
    .line 592
    :goto_18
    move-object v7, v8

    .line 593
    move/from16 v29, v31

    .line 594
    .line 595
    :goto_19
    add-int/lit8 v6, v6, 0x1

    .line 596
    .line 597
    move/from16 v5, p0

    .line 598
    .line 599
    move-object/from16 v0, v19

    .line 600
    .line 601
    const/4 v15, 0x5

    .line 602
    goto/16 :goto_14

    .line 603
    .line 604
    :cond_1e
    if-eqz v12, :cond_25

    .line 605
    .line 606
    if-eq v12, v13, :cond_1f

    .line 607
    .line 608
    if-eqz v25, :cond_25

    .line 609
    .line 610
    :cond_1f
    iget-object v0, v10, Lt/e;->W:[Lt/d;

    .line 611
    .line 612
    aget-object v0, v0, p3

    .line 613
    .line 614
    iget-object v2, v11, Lt/e;->W:[Lt/d;

    .line 615
    .line 616
    add-int/lit8 v4, p3, 0x1

    .line 617
    .line 618
    aget-object v2, v2, v4

    .line 619
    .line 620
    iget-object v0, v0, Lt/d;->f:Lt/d;

    .line 621
    .line 622
    if-eqz v0, :cond_20

    .line 623
    .line 624
    iget-object v0, v0, Lt/d;->i:Lq/i;

    .line 625
    .line 626
    goto :goto_1a

    .line 627
    :cond_20
    move-object/from16 v0, v22

    .line 628
    .line 629
    :goto_1a
    iget-object v5, v2, Lt/d;->f:Lt/d;

    .line 630
    .line 631
    if-eqz v5, :cond_21

    .line 632
    .line 633
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 634
    .line 635
    goto :goto_1b

    .line 636
    :cond_21
    move-object/from16 v5, v22

    .line 637
    .line 638
    :goto_1b
    iget-object v6, v12, Lt/e;->W:[Lt/d;

    .line 639
    .line 640
    aget-object v6, v6, p3

    .line 641
    .line 642
    if-eqz v13, :cond_22

    .line 643
    .line 644
    iget-object v2, v13, Lt/e;->W:[Lt/d;

    .line 645
    .line 646
    aget-object v2, v2, v4

    .line 647
    .line 648
    :cond_22
    if-eqz v0, :cond_24

    .line 649
    .line 650
    if-eqz v5, :cond_24

    .line 651
    .line 652
    if-nez v9, :cond_23

    .line 653
    .line 654
    iget v3, v3, Lt/e;->o0:F

    .line 655
    .line 656
    :goto_1c
    move v4, v3

    .line 657
    goto :goto_1d

    .line 658
    :cond_23
    iget v3, v3, Lt/e;->p0:F

    .line 659
    .line 660
    goto :goto_1c

    .line 661
    :goto_1d
    invoke-virtual {v6}, Lt/d;->f()I

    .line 662
    .line 663
    .line 664
    move-result v3

    .line 665
    invoke-virtual {v2}, Lt/d;->f()I

    .line 666
    .line 667
    .line 668
    move-result v7

    .line 669
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 670
    .line 671
    iget-object v2, v2, Lt/d;->i:Lq/i;

    .line 672
    .line 673
    const/4 v8, 0x7

    .line 674
    move-object/from16 v36, v2

    .line 675
    .line 676
    move-object v2, v0

    .line 677
    move-object v0, v1

    .line 678
    move-object v1, v6

    .line 679
    move-object/from16 v6, v36

    .line 680
    .line 681
    invoke-virtual/range {v0 .. v8}, Lq/d;->c(Lq/i;Lq/i;IFLq/i;Lq/i;II)V

    .line 682
    .line 683
    .line 684
    :cond_24
    move-object/from16 v0, p1

    .line 685
    .line 686
    goto/16 :goto_31

    .line 687
    .line 688
    :cond_25
    if-eqz v27, :cond_37

    .line 689
    .line 690
    if-eqz v12, :cond_37

    .line 691
    .line 692
    iget v0, v2, Lt/c;->j:I

    .line 693
    .line 694
    if-lez v0, :cond_26

    .line 695
    .line 696
    iget v1, v2, Lt/c;->i:I

    .line 697
    .line 698
    if-ne v1, v0, :cond_26

    .line 699
    .line 700
    const/16 v18, 0x1

    .line 701
    .line 702
    goto :goto_1e

    .line 703
    :cond_26
    const/16 v18, 0x0

    .line 704
    .line 705
    :goto_1e
    move-object v14, v12

    .line 706
    move-object v15, v14

    .line 707
    :goto_1f
    if-eqz v14, :cond_24

    .line 708
    .line 709
    iget-object v0, v14, Lt/e;->F0:[Lt/e;

    .line 710
    .line 711
    aget-object v0, v0, v9

    .line 712
    .line 713
    :goto_20
    if-eqz v0, :cond_27

    .line 714
    .line 715
    invoke-virtual {v0}, Lt/e;->V()I

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    const/16 v6, 0x8

    .line 720
    .line 721
    if-ne v1, v6, :cond_28

    .line 722
    .line 723
    iget-object v0, v0, Lt/e;->F0:[Lt/e;

    .line 724
    .line 725
    aget-object v0, v0, v9

    .line 726
    .line 727
    goto :goto_20

    .line 728
    :cond_27
    const/16 v6, 0x8

    .line 729
    .line 730
    :cond_28
    if-nez v0, :cond_2a

    .line 731
    .line 732
    if-ne v14, v13, :cond_29

    .line 733
    .line 734
    goto :goto_22

    .line 735
    :cond_29
    move-object/from16 v19, v0

    .line 736
    .line 737
    move v9, v6

    .line 738
    :goto_21
    const/16 v21, 0x5

    .line 739
    .line 740
    goto/16 :goto_27

    .line 741
    .line 742
    :cond_2a
    :goto_22
    iget-object v1, v14, Lt/e;->W:[Lt/d;

    .line 743
    .line 744
    aget-object v1, v1, p3

    .line 745
    .line 746
    iget-object v2, v1, Lt/d;->i:Lq/i;

    .line 747
    .line 748
    iget-object v3, v1, Lt/d;->f:Lt/d;

    .line 749
    .line 750
    if-eqz v3, :cond_2b

    .line 751
    .line 752
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 753
    .line 754
    goto :goto_23

    .line 755
    :cond_2b
    move-object/from16 v3, v22

    .line 756
    .line 757
    :goto_23
    if-eq v15, v14, :cond_2c

    .line 758
    .line 759
    iget-object v3, v15, Lt/e;->W:[Lt/d;

    .line 760
    .line 761
    add-int/lit8 v4, p3, 0x1

    .line 762
    .line 763
    aget-object v3, v3, v4

    .line 764
    .line 765
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 766
    .line 767
    goto :goto_24

    .line 768
    :cond_2c
    if-ne v14, v12, :cond_2e

    .line 769
    .line 770
    iget-object v3, v10, Lt/e;->W:[Lt/d;

    .line 771
    .line 772
    aget-object v3, v3, p3

    .line 773
    .line 774
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 775
    .line 776
    if-eqz v3, :cond_2d

    .line 777
    .line 778
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 779
    .line 780
    goto :goto_24

    .line 781
    :cond_2d
    move-object/from16 v3, v22

    .line 782
    .line 783
    :cond_2e
    :goto_24
    invoke-virtual {v1}, Lt/d;->f()I

    .line 784
    .line 785
    .line 786
    move-result v1

    .line 787
    iget-object v4, v14, Lt/e;->W:[Lt/d;

    .line 788
    .line 789
    add-int/lit8 v5, p3, 0x1

    .line 790
    .line 791
    aget-object v4, v4, v5

    .line 792
    .line 793
    invoke-virtual {v4}, Lt/d;->f()I

    .line 794
    .line 795
    .line 796
    move-result v4

    .line 797
    if-eqz v0, :cond_2f

    .line 798
    .line 799
    iget-object v7, v0, Lt/e;->W:[Lt/d;

    .line 800
    .line 801
    aget-object v7, v7, p3

    .line 802
    .line 803
    iget-object v8, v7, Lt/d;->i:Lq/i;

    .line 804
    .line 805
    goto :goto_25

    .line 806
    :cond_2f
    iget-object v7, v11, Lt/e;->W:[Lt/d;

    .line 807
    .line 808
    aget-object v7, v7, v5

    .line 809
    .line 810
    iget-object v7, v7, Lt/d;->f:Lt/d;

    .line 811
    .line 812
    if-eqz v7, :cond_30

    .line 813
    .line 814
    iget-object v8, v7, Lt/d;->i:Lq/i;

    .line 815
    .line 816
    goto :goto_25

    .line 817
    :cond_30
    move-object/from16 v8, v22

    .line 818
    .line 819
    :goto_25
    iget-object v6, v14, Lt/e;->W:[Lt/d;

    .line 820
    .line 821
    aget-object v6, v6, v5

    .line 822
    .line 823
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 824
    .line 825
    if-eqz v7, :cond_31

    .line 826
    .line 827
    invoke-virtual {v7}, Lt/d;->f()I

    .line 828
    .line 829
    .line 830
    move-result v7

    .line 831
    add-int/2addr v4, v7

    .line 832
    :cond_31
    iget-object v7, v15, Lt/e;->W:[Lt/d;

    .line 833
    .line 834
    aget-object v7, v7, v5

    .line 835
    .line 836
    invoke-virtual {v7}, Lt/d;->f()I

    .line 837
    .line 838
    .line 839
    move-result v7

    .line 840
    add-int/2addr v1, v7

    .line 841
    if-eqz v2, :cond_35

    .line 842
    .line 843
    if-eqz v3, :cond_35

    .line 844
    .line 845
    if-eqz v8, :cond_35

    .line 846
    .line 847
    if-eqz v6, :cond_35

    .line 848
    .line 849
    if-ne v14, v12, :cond_32

    .line 850
    .line 851
    iget-object v1, v12, Lt/e;->W:[Lt/d;

    .line 852
    .line 853
    aget-object v1, v1, p3

    .line 854
    .line 855
    invoke-virtual {v1}, Lt/d;->f()I

    .line 856
    .line 857
    .line 858
    move-result v1

    .line 859
    :cond_32
    if-ne v14, v13, :cond_33

    .line 860
    .line 861
    iget-object v4, v13, Lt/e;->W:[Lt/d;

    .line 862
    .line 863
    aget-object v4, v4, v5

    .line 864
    .line 865
    invoke-virtual {v4}, Lt/d;->f()I

    .line 866
    .line 867
    .line 868
    move-result v4

    .line 869
    :cond_33
    move v7, v4

    .line 870
    move-object v5, v8

    .line 871
    if-eqz v18, :cond_34

    .line 872
    .line 873
    const/16 v8, 0x8

    .line 874
    .line 875
    goto :goto_26

    .line 876
    :cond_34
    const/4 v8, 0x5

    .line 877
    :goto_26
    const/high16 v4, 0x3f000000    # 0.5f

    .line 878
    .line 879
    move-object v9, v3

    .line 880
    move v3, v1

    .line 881
    move-object v1, v2

    .line 882
    move-object v2, v9

    .line 883
    move-object/from16 v19, v0

    .line 884
    .line 885
    const/16 v9, 0x8

    .line 886
    .line 887
    const/16 v21, 0x5

    .line 888
    .line 889
    move-object/from16 v0, p1

    .line 890
    .line 891
    invoke-virtual/range {v0 .. v8}, Lq/d;->c(Lq/i;Lq/i;IFLq/i;Lq/i;II)V

    .line 892
    .line 893
    .line 894
    goto :goto_27

    .line 895
    :cond_35
    move-object/from16 v19, v0

    .line 896
    .line 897
    const/16 v9, 0x8

    .line 898
    .line 899
    goto/16 :goto_21

    .line 900
    .line 901
    :goto_27
    invoke-virtual {v14}, Lt/e;->V()I

    .line 902
    .line 903
    .line 904
    move-result v0

    .line 905
    if-eq v0, v9, :cond_36

    .line 906
    .line 907
    move-object v15, v14

    .line 908
    :cond_36
    move/from16 v9, p2

    .line 909
    .line 910
    move-object/from16 v14, v19

    .line 911
    .line 912
    goto/16 :goto_1f

    .line 913
    .line 914
    :cond_37
    const/16 v9, 0x8

    .line 915
    .line 916
    if-eqz v16, :cond_24

    .line 917
    .line 918
    if-eqz v12, :cond_24

    .line 919
    .line 920
    iget v0, v2, Lt/c;->j:I

    .line 921
    .line 922
    if-lez v0, :cond_38

    .line 923
    .line 924
    iget v1, v2, Lt/c;->i:I

    .line 925
    .line 926
    if-ne v1, v0, :cond_38

    .line 927
    .line 928
    const/16 v18, 0x1

    .line 929
    .line 930
    goto :goto_28

    .line 931
    :cond_38
    const/16 v18, 0x0

    .line 932
    .line 933
    :goto_28
    move-object v14, v12

    .line 934
    move-object v15, v14

    .line 935
    :goto_29
    if-eqz v14, :cond_44

    .line 936
    .line 937
    iget-object v0, v14, Lt/e;->F0:[Lt/e;

    .line 938
    .line 939
    aget-object v0, v0, p2

    .line 940
    .line 941
    :goto_2a
    if-eqz v0, :cond_39

    .line 942
    .line 943
    invoke-virtual {v0}, Lt/e;->V()I

    .line 944
    .line 945
    .line 946
    move-result v1

    .line 947
    if-ne v1, v9, :cond_39

    .line 948
    .line 949
    iget-object v0, v0, Lt/e;->F0:[Lt/e;

    .line 950
    .line 951
    aget-object v0, v0, p2

    .line 952
    .line 953
    goto :goto_2a

    .line 954
    :cond_39
    if-eq v14, v12, :cond_42

    .line 955
    .line 956
    if-eq v14, v13, :cond_42

    .line 957
    .line 958
    if-eqz v0, :cond_42

    .line 959
    .line 960
    if-ne v0, v13, :cond_3a

    .line 961
    .line 962
    move-object/from16 v0, v22

    .line 963
    .line 964
    :cond_3a
    iget-object v1, v14, Lt/e;->W:[Lt/d;

    .line 965
    .line 966
    aget-object v1, v1, p3

    .line 967
    .line 968
    iget-object v2, v1, Lt/d;->i:Lq/i;

    .line 969
    .line 970
    iget-object v3, v1, Lt/d;->f:Lt/d;

    .line 971
    .line 972
    if-eqz v3, :cond_3b

    .line 973
    .line 974
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 975
    .line 976
    :cond_3b
    iget-object v3, v15, Lt/e;->W:[Lt/d;

    .line 977
    .line 978
    add-int/lit8 v4, p3, 0x1

    .line 979
    .line 980
    aget-object v3, v3, v4

    .line 981
    .line 982
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 983
    .line 984
    invoke-virtual {v1}, Lt/d;->f()I

    .line 985
    .line 986
    .line 987
    move-result v1

    .line 988
    iget-object v5, v14, Lt/e;->W:[Lt/d;

    .line 989
    .line 990
    aget-object v5, v5, v4

    .line 991
    .line 992
    invoke-virtual {v5}, Lt/d;->f()I

    .line 993
    .line 994
    .line 995
    move-result v5

    .line 996
    if-eqz v0, :cond_3d

    .line 997
    .line 998
    iget-object v6, v0, Lt/e;->W:[Lt/d;

    .line 999
    .line 1000
    aget-object v6, v6, p3

    .line 1001
    .line 1002
    iget-object v7, v6, Lt/d;->i:Lq/i;

    .line 1003
    .line 1004
    iget-object v8, v6, Lt/d;->f:Lt/d;

    .line 1005
    .line 1006
    if-eqz v8, :cond_3c

    .line 1007
    .line 1008
    iget-object v8, v8, Lt/d;->i:Lq/i;

    .line 1009
    .line 1010
    goto :goto_2c

    .line 1011
    :cond_3c
    move-object/from16 v8, v22

    .line 1012
    .line 1013
    goto :goto_2c

    .line 1014
    :cond_3d
    iget-object v6, v13, Lt/e;->W:[Lt/d;

    .line 1015
    .line 1016
    aget-object v6, v6, p3

    .line 1017
    .line 1018
    if-eqz v6, :cond_3e

    .line 1019
    .line 1020
    iget-object v7, v6, Lt/d;->i:Lq/i;

    .line 1021
    .line 1022
    goto :goto_2b

    .line 1023
    :cond_3e
    move-object/from16 v7, v22

    .line 1024
    .line 1025
    :goto_2b
    iget-object v8, v14, Lt/e;->W:[Lt/d;

    .line 1026
    .line 1027
    aget-object v8, v8, v4

    .line 1028
    .line 1029
    iget-object v8, v8, Lt/d;->i:Lq/i;

    .line 1030
    .line 1031
    :goto_2c
    if-eqz v6, :cond_3f

    .line 1032
    .line 1033
    invoke-virtual {v6}, Lt/d;->f()I

    .line 1034
    .line 1035
    .line 1036
    move-result v6

    .line 1037
    add-int/2addr v5, v6

    .line 1038
    :cond_3f
    iget-object v6, v15, Lt/e;->W:[Lt/d;

    .line 1039
    .line 1040
    aget-object v4, v6, v4

    .line 1041
    .line 1042
    invoke-virtual {v4}, Lt/d;->f()I

    .line 1043
    .line 1044
    .line 1045
    move-result v4

    .line 1046
    add-int/2addr v1, v4

    .line 1047
    if-eqz v18, :cond_40

    .line 1048
    .line 1049
    move v4, v9

    .line 1050
    goto :goto_2d

    .line 1051
    :cond_40
    const/4 v4, 0x4

    .line 1052
    :goto_2d
    if-eqz v2, :cond_41

    .line 1053
    .line 1054
    if-eqz v3, :cond_41

    .line 1055
    .line 1056
    if-eqz v7, :cond_41

    .line 1057
    .line 1058
    if-eqz v8, :cond_41

    .line 1059
    .line 1060
    move-object v6, v8

    .line 1061
    move v8, v4

    .line 1062
    const/high16 v4, 0x3f000000    # 0.5f

    .line 1063
    .line 1064
    move-object/from16 v19, v3

    .line 1065
    .line 1066
    move v3, v1

    .line 1067
    move-object v1, v2

    .line 1068
    move-object/from16 v2, v19

    .line 1069
    .line 1070
    move-object/from16 v19, v7

    .line 1071
    .line 1072
    move v7, v5

    .line 1073
    move-object/from16 v5, v19

    .line 1074
    .line 1075
    move-object/from16 v19, v0

    .line 1076
    .line 1077
    const/16 v20, 0x4

    .line 1078
    .line 1079
    move-object/from16 v0, p1

    .line 1080
    .line 1081
    invoke-virtual/range {v0 .. v8}, Lq/d;->c(Lq/i;Lq/i;IFLq/i;Lq/i;II)V

    .line 1082
    .line 1083
    .line 1084
    move-object v1, v0

    .line 1085
    goto :goto_2e

    .line 1086
    :cond_41
    move-object/from16 v1, p1

    .line 1087
    .line 1088
    move-object/from16 v19, v0

    .line 1089
    .line 1090
    const/16 v20, 0x4

    .line 1091
    .line 1092
    :goto_2e
    move-object/from16 v0, v19

    .line 1093
    .line 1094
    goto :goto_2f

    .line 1095
    :cond_42
    move-object/from16 v1, p1

    .line 1096
    .line 1097
    const/16 v20, 0x4

    .line 1098
    .line 1099
    :goto_2f
    invoke-virtual {v14}, Lt/e;->V()I

    .line 1100
    .line 1101
    .line 1102
    move-result v2

    .line 1103
    if-eq v2, v9, :cond_43

    .line 1104
    .line 1105
    move-object v15, v14

    .line 1106
    :cond_43
    move-object v14, v0

    .line 1107
    goto/16 :goto_29

    .line 1108
    .line 1109
    :cond_44
    move-object/from16 v1, p1

    .line 1110
    .line 1111
    iget-object v0, v12, Lt/e;->W:[Lt/d;

    .line 1112
    .line 1113
    aget-object v0, v0, p3

    .line 1114
    .line 1115
    iget-object v2, v10, Lt/e;->W:[Lt/d;

    .line 1116
    .line 1117
    aget-object v2, v2, p3

    .line 1118
    .line 1119
    iget-object v2, v2, Lt/d;->f:Lt/d;

    .line 1120
    .line 1121
    iget-object v3, v13, Lt/e;->W:[Lt/d;

    .line 1122
    .line 1123
    add-int/lit8 v4, p3, 0x1

    .line 1124
    .line 1125
    aget-object v9, v3, v4

    .line 1126
    .line 1127
    iget-object v3, v11, Lt/e;->W:[Lt/d;

    .line 1128
    .line 1129
    aget-object v3, v3, v4

    .line 1130
    .line 1131
    iget-object v10, v3, Lt/d;->f:Lt/d;

    .line 1132
    .line 1133
    const/4 v8, 0x5

    .line 1134
    if-eqz v2, :cond_45

    .line 1135
    .line 1136
    if-eq v12, v13, :cond_46

    .line 1137
    .line 1138
    iget-object v3, v0, Lt/d;->i:Lq/i;

    .line 1139
    .line 1140
    iget-object v2, v2, Lt/d;->i:Lq/i;

    .line 1141
    .line 1142
    invoke-virtual {v0}, Lt/d;->f()I

    .line 1143
    .line 1144
    .line 1145
    move-result v0

    .line 1146
    invoke-virtual {v1, v3, v2, v0, v8}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 1147
    .line 1148
    .line 1149
    :cond_45
    move-object v0, v1

    .line 1150
    goto :goto_30

    .line 1151
    :cond_46
    if-eqz v10, :cond_45

    .line 1152
    .line 1153
    iget-object v1, v0, Lt/d;->i:Lq/i;

    .line 1154
    .line 1155
    iget-object v2, v2, Lt/d;->i:Lq/i;

    .line 1156
    .line 1157
    invoke-virtual {v0}, Lt/d;->f()I

    .line 1158
    .line 1159
    .line 1160
    move-result v3

    .line 1161
    iget-object v5, v9, Lt/d;->i:Lq/i;

    .line 1162
    .line 1163
    iget-object v6, v10, Lt/d;->i:Lq/i;

    .line 1164
    .line 1165
    invoke-virtual {v9}, Lt/d;->f()I

    .line 1166
    .line 1167
    .line 1168
    move-result v7

    .line 1169
    const/high16 v4, 0x3f000000    # 0.5f

    .line 1170
    .line 1171
    move-object/from16 v0, p1

    .line 1172
    .line 1173
    invoke-virtual/range {v0 .. v8}, Lq/d;->c(Lq/i;Lq/i;IFLq/i;Lq/i;II)V

    .line 1174
    .line 1175
    .line 1176
    :goto_30
    if-eqz v10, :cond_47

    .line 1177
    .line 1178
    if-eq v12, v13, :cond_47

    .line 1179
    .line 1180
    iget-object v1, v9, Lt/d;->i:Lq/i;

    .line 1181
    .line 1182
    iget-object v2, v10, Lt/d;->i:Lq/i;

    .line 1183
    .line 1184
    invoke-virtual {v9}, Lt/d;->f()I

    .line 1185
    .line 1186
    .line 1187
    move-result v3

    .line 1188
    neg-int v3, v3

    .line 1189
    invoke-virtual {v0, v1, v2, v3, v8}, Lq/d;->e(Lq/i;Lq/i;II)Lq/b;

    .line 1190
    .line 1191
    .line 1192
    :cond_47
    :goto_31
    if-nez v27, :cond_48

    .line 1193
    .line 1194
    if-eqz v16, :cond_4f

    .line 1195
    .line 1196
    :cond_48
    if-eqz v12, :cond_4f

    .line 1197
    .line 1198
    if-eq v12, v13, :cond_4f

    .line 1199
    .line 1200
    iget-object v1, v12, Lt/e;->W:[Lt/d;

    .line 1201
    .line 1202
    aget-object v2, v1, p3

    .line 1203
    .line 1204
    if-nez v13, :cond_49

    .line 1205
    .line 1206
    move-object v13, v12

    .line 1207
    :cond_49
    iget-object v3, v13, Lt/e;->W:[Lt/d;

    .line 1208
    .line 1209
    const/16 v17, 0x1

    .line 1210
    .line 1211
    add-int/lit8 v4, p3, 0x1

    .line 1212
    .line 1213
    aget-object v3, v3, v4

    .line 1214
    .line 1215
    iget-object v5, v2, Lt/d;->f:Lt/d;

    .line 1216
    .line 1217
    if-eqz v5, :cond_4a

    .line 1218
    .line 1219
    iget-object v5, v5, Lt/d;->i:Lq/i;

    .line 1220
    .line 1221
    goto :goto_32

    .line 1222
    :cond_4a
    move-object/from16 v5, v22

    .line 1223
    .line 1224
    :goto_32
    iget-object v6, v3, Lt/d;->f:Lt/d;

    .line 1225
    .line 1226
    if-eqz v6, :cond_4b

    .line 1227
    .line 1228
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 1229
    .line 1230
    goto :goto_33

    .line 1231
    :cond_4b
    move-object/from16 v6, v22

    .line 1232
    .line 1233
    :goto_33
    if-eq v11, v13, :cond_4d

    .line 1234
    .line 1235
    iget-object v6, v11, Lt/e;->W:[Lt/d;

    .line 1236
    .line 1237
    aget-object v6, v6, v4

    .line 1238
    .line 1239
    iget-object v6, v6, Lt/d;->f:Lt/d;

    .line 1240
    .line 1241
    if-eqz v6, :cond_4c

    .line 1242
    .line 1243
    iget-object v6, v6, Lt/d;->i:Lq/i;

    .line 1244
    .line 1245
    move-object/from16 v22, v6

    .line 1246
    .line 1247
    :cond_4c
    move-object/from16 v6, v22

    .line 1248
    .line 1249
    :cond_4d
    if-ne v12, v13, :cond_4e

    .line 1250
    .line 1251
    aget-object v3, v1, v4

    .line 1252
    .line 1253
    :cond_4e
    if-eqz v5, :cond_4f

    .line 1254
    .line 1255
    if-eqz v6, :cond_4f

    .line 1256
    .line 1257
    invoke-virtual {v2}, Lt/d;->f()I

    .line 1258
    .line 1259
    .line 1260
    move-result v1

    .line 1261
    iget-object v7, v13, Lt/e;->W:[Lt/d;

    .line 1262
    .line 1263
    aget-object v4, v7, v4

    .line 1264
    .line 1265
    invoke-virtual {v4}, Lt/d;->f()I

    .line 1266
    .line 1267
    .line 1268
    move-result v7

    .line 1269
    iget-object v2, v2, Lt/d;->i:Lq/i;

    .line 1270
    .line 1271
    iget-object v3, v3, Lt/d;->i:Lq/i;

    .line 1272
    .line 1273
    const/4 v8, 0x5

    .line 1274
    const/high16 v4, 0x3f000000    # 0.5f

    .line 1275
    .line 1276
    move-object/from16 v36, v3

    .line 1277
    .line 1278
    move v3, v1

    .line 1279
    move-object v1, v2

    .line 1280
    move-object v2, v5

    .line 1281
    move-object v5, v6

    .line 1282
    move-object/from16 v6, v36

    .line 1283
    .line 1284
    invoke-virtual/range {v0 .. v8}, Lq/d;->c(Lq/i;Lq/i;IFLq/i;Lq/i;II)V

    .line 1285
    .line 1286
    .line 1287
    :cond_4f
    return-void
.end method

.method public static b(Lt/f;Lq/d;Ljava/util/ArrayList;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lt/f;",
            "Lq/d;",
            "Ljava/util/ArrayList<",
            "Lt/e;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    iget v1, p0, Lt/f;->W0:I

    .line 5
    .line 6
    iget-object v2, p0, Lt/f;->Z0:[Lt/c;

    .line 7
    .line 8
    move v3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v1, p0, Lt/f;->X0:I

    .line 11
    .line 12
    iget-object v2, p0, Lt/f;->Y0:[Lt/c;

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    :goto_0
    if-ge v0, v1, :cond_3

    .line 16
    .line 17
    aget-object v4, v2, v0

    .line 18
    .line 19
    invoke-virtual {v4}, Lt/c;->a()V

    .line 20
    .line 21
    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    iget-object v5, v4, Lt/c;->a:Lt/e;

    .line 25
    .line 26
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-eqz v5, :cond_2

    .line 31
    .line 32
    :cond_1
    invoke-static {p0, p1, p3, v3, v4}, Lt/b;->a(Lt/f;Lq/d;IILt/c;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_3
    return-void
.end method
