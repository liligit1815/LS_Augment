.class public LF0/v;
.super Ljava/lang/Object;
.source "LayerParser.java"


# static fields
.field private static final a:LG0/c$a;

.field private static final b:LG0/c$a;

.field private static final c:LG0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 1
    const-string v22, "cl"

    .line 2
    .line 3
    const-string v23, "hd"

    .line 4
    .line 5
    const-string v1, "nm"

    .line 6
    .line 7
    const-string v2, "ind"

    .line 8
    .line 9
    const-string v3, "refId"

    .line 10
    .line 11
    const-string v4, "ty"

    .line 12
    .line 13
    const-string v5, "parent"

    .line 14
    .line 15
    const-string v6, "sw"

    .line 16
    .line 17
    const-string v7, "sh"

    .line 18
    .line 19
    const-string v8, "sc"

    .line 20
    .line 21
    const-string v9, "ks"

    .line 22
    .line 23
    const-string v10, "tt"

    .line 24
    .line 25
    const-string v11, "masksProperties"

    .line 26
    .line 27
    const-string v12, "shapes"

    .line 28
    .line 29
    const-string v13, "t"

    .line 30
    .line 31
    const-string v14, "ef"

    .line 32
    .line 33
    const-string v15, "sr"

    .line 34
    .line 35
    const-string v16, "st"

    .line 36
    .line 37
    const-string v17, "w"

    .line 38
    .line 39
    const-string v18, "h"

    .line 40
    .line 41
    const-string v19, "ip"

    .line 42
    .line 43
    const-string v20, "op"

    .line 44
    .line 45
    const-string v21, "tm"

    .line 46
    .line 47
    filled-new-array/range {v1 .. v23}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, LF0/v;->a:LG0/c$a;

    .line 56
    .line 57
    const-string v0, "d"

    .line 58
    .line 59
    const-string v1, "a"

    .line 60
    .line 61
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sput-object v0, LF0/v;->b:LG0/c$a;

    .line 70
    .line 71
    const-string v0, "ty"

    .line 72
    .line 73
    const-string v1, "nm"

    .line 74
    .line 75
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v0}, LG0/c$a;->a([Ljava/lang/String;)LG0/c$a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sput-object v0, LF0/v;->c:LG0/c$a;

    .line 84
    .line 85
    return-void
.end method

.method public static a(LG0/c;Lv0/h;)LD0/e;
    .locals 38
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    sget-object v2, LD0/e$b;->g:LD0/e$b;

    .line 6
    .line 7
    new-instance v10, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v7, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, LG0/c;->d()V

    .line 18
    .line 19
    .line 20
    const-string v3, "UNSET"

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    const-wide/16 v5, 0x0

    .line 24
    .line 25
    const/4 v8, 0x0

    .line 26
    const/4 v9, 0x0

    .line 27
    move-object v11, v2

    .line 28
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const-wide/16 v12, -0x1

    .line 33
    .line 34
    const/high16 v14, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v15

    .line 40
    move-object/from16 v19, v4

    .line 41
    .line 42
    move-object/from16 v20, v19

    .line 43
    .line 44
    move-object/from16 v23, v20

    .line 45
    .line 46
    move-object/from16 v25, v23

    .line 47
    .line 48
    move-object/from16 v26, v25

    .line 49
    .line 50
    move-wide/from16 v16, v5

    .line 51
    .line 52
    move/from16 v30, v8

    .line 53
    .line 54
    move/from16 v31, v30

    .line 55
    .line 56
    move/from16 v32, v31

    .line 57
    .line 58
    move/from16 v36, v32

    .line 59
    .line 60
    move/from16 v18, v9

    .line 61
    .line 62
    move/from16 v24, v18

    .line 63
    .line 64
    move/from16 v29, v24

    .line 65
    .line 66
    move/from16 v33, v29

    .line 67
    .line 68
    move/from16 v34, v33

    .line 69
    .line 70
    move/from16 v35, v34

    .line 71
    .line 72
    move-object/from16 v22, v11

    .line 73
    .line 74
    move-wide/from16 v27, v12

    .line 75
    .line 76
    move-object/from16 v21, v15

    .line 77
    .line 78
    move-object v11, v3

    .line 79
    move-object/from16 v9, v26

    .line 80
    .line 81
    move-object v12, v9

    .line 82
    move-object v13, v12

    .line 83
    move v15, v14

    .line 84
    move-object v14, v13

    .line 85
    :cond_0
    :goto_0
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-eqz v3, :cond_12

    .line 90
    .line 91
    sget-object v3, LF0/v;->a:LG0/c$a;

    .line 92
    .line 93
    invoke-virtual {v0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x1

    .line 98
    packed-switch v3, :pswitch_data_0

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, LG0/c;->I()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, LG0/c;->J()V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :pswitch_0
    invoke-virtual {v0}, LG0/c;->t()Z

    .line 109
    .line 110
    .line 111
    move-result v36

    .line 112
    goto :goto_0

    .line 113
    :pswitch_1
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v12

    .line 117
    goto :goto_0

    .line 118
    :pswitch_2
    invoke-static {v0, v1, v8}, LF0/d;->f(LG0/c;Lv0/h;Z)LB0/b;

    .line 119
    .line 120
    .line 121
    move-result-object v23

    .line 122
    goto :goto_0

    .line 123
    :pswitch_3
    invoke-virtual {v0}, LG0/c;->v()D

    .line 124
    .line 125
    .line 126
    move-result-wide v3

    .line 127
    double-to-float v3, v3

    .line 128
    move/from16 v29, v3

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :pswitch_4
    invoke-virtual {v0}, LG0/c;->v()D

    .line 132
    .line 133
    .line 134
    move-result-wide v3

    .line 135
    double-to-float v3, v3

    .line 136
    move/from16 v24, v3

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :pswitch_5
    invoke-virtual {v0}, LG0/c;->v()D

    .line 140
    .line 141
    .line 142
    move-result-wide v3

    .line 143
    invoke-static {}, LH0/h;->e()F

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    float-to-double v5, v5

    .line 148
    mul-double/2addr v3, v5

    .line 149
    double-to-float v3, v3

    .line 150
    move/from16 v34, v3

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :pswitch_6
    invoke-virtual {v0}, LG0/c;->v()D

    .line 154
    .line 155
    .line 156
    move-result-wide v3

    .line 157
    invoke-static {}, LH0/h;->e()F

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    float-to-double v5, v5

    .line 162
    mul-double/2addr v3, v5

    .line 163
    double-to-float v3, v3

    .line 164
    move/from16 v33, v3

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :pswitch_7
    invoke-virtual {v0}, LG0/c;->v()D

    .line 168
    .line 169
    .line 170
    move-result-wide v3

    .line 171
    double-to-float v3, v3

    .line 172
    move/from16 v35, v3

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :pswitch_8
    invoke-virtual {v0}, LG0/c;->v()D

    .line 176
    .line 177
    .line 178
    move-result-wide v3

    .line 179
    double-to-float v15, v3

    .line 180
    goto :goto_0

    .line 181
    :pswitch_9
    invoke-virtual {v0}, LG0/c;->c()V

    .line 182
    .line 183
    .line 184
    new-instance v3, Ljava/util/ArrayList;

    .line 185
    .line 186
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 187
    .line 188
    .line 189
    :goto_1
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 190
    .line 191
    .line 192
    move-result v5

    .line 193
    if-eqz v5, :cond_6

    .line 194
    .line 195
    invoke-virtual {v0}, LG0/c;->d()V

    .line 196
    .line 197
    .line 198
    :cond_1
    :goto_2
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 199
    .line 200
    .line 201
    move-result v5

    .line 202
    if-eqz v5, :cond_5

    .line 203
    .line 204
    sget-object v5, LF0/v;->c:LG0/c$a;

    .line 205
    .line 206
    invoke-virtual {v0, v5}, LG0/c;->F(LG0/c$a;)I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    if-eqz v5, :cond_3

    .line 211
    .line 212
    if-eq v5, v4, :cond_2

    .line 213
    .line 214
    invoke-virtual {v0}, LG0/c;->I()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, LG0/c;->J()V

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_2
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v5

    .line 225
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_3
    invoke-virtual {v0}, LG0/c;->w()I

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    const/16 v6, 0x1d

    .line 234
    .line 235
    if-ne v5, v6, :cond_4

    .line 236
    .line 237
    invoke-static/range {p0 .. p1}, LF0/e;->b(LG0/c;Lv0/h;)LC0/a;

    .line 238
    .line 239
    .line 240
    move-result-object v25

    .line 241
    goto :goto_2

    .line 242
    :cond_4
    const/16 v6, 0x19

    .line 243
    .line 244
    if-ne v5, v6, :cond_1

    .line 245
    .line 246
    new-instance v5, LF0/k;

    .line 247
    .line 248
    invoke-direct {v5}, LF0/k;-><init>()V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v5, v0, v1}, LF0/k;->b(LG0/c;Lv0/h;)LF0/j;

    .line 252
    .line 253
    .line 254
    move-result-object v26

    .line 255
    goto :goto_2

    .line 256
    :cond_5
    invoke-virtual {v0}, LG0/c;->g()V

    .line 257
    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_6
    invoke-virtual {v0}, LG0/c;->e()V

    .line 261
    .line 262
    .line 263
    new-instance v4, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .line 267
    .line 268
    const-string v5, "Lottie doesn\'t support layer effects. If you are using them for  fills, strokes, trim paths etc. then try adding them directly as contents  in your shape. Found: "

    .line 269
    .line 270
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v3

    .line 280
    invoke-virtual {v1, v3}, Lv0/h;->a(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :pswitch_a
    invoke-virtual {v0}, LG0/c;->d()V

    .line 286
    .line 287
    .line 288
    :goto_3
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    if-eqz v3, :cond_b

    .line 293
    .line 294
    sget-object v3, LF0/v;->b:LG0/c$a;

    .line 295
    .line 296
    invoke-virtual {v0, v3}, LG0/c;->F(LG0/c$a;)I

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    if-eqz v3, :cond_a

    .line 301
    .line 302
    if-eq v3, v4, :cond_7

    .line 303
    .line 304
    invoke-virtual {v0}, LG0/c;->I()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v0}, LG0/c;->J()V

    .line 308
    .line 309
    .line 310
    goto :goto_3

    .line 311
    :cond_7
    invoke-virtual {v0}, LG0/c;->c()V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    if-eqz v3, :cond_8

    .line 319
    .line 320
    invoke-static/range {p0 .. p1}, LF0/b;->a(LG0/c;Lv0/h;)LB0/k;

    .line 321
    .line 322
    .line 323
    move-result-object v20

    .line 324
    :cond_8
    :goto_4
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    if-eqz v3, :cond_9

    .line 329
    .line 330
    invoke-virtual {v0}, LG0/c;->J()V

    .line 331
    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_9
    invoke-virtual {v0}, LG0/c;->e()V

    .line 335
    .line 336
    .line 337
    goto :goto_3

    .line 338
    :cond_a
    invoke-static/range {p0 .. p1}, LF0/d;->d(LG0/c;Lv0/h;)LB0/j;

    .line 339
    .line 340
    .line 341
    move-result-object v19

    .line 342
    goto :goto_3

    .line 343
    :cond_b
    invoke-virtual {v0}, LG0/c;->g()V

    .line 344
    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :pswitch_b
    invoke-virtual {v0}, LG0/c;->c()V

    .line 349
    .line 350
    .line 351
    :cond_c
    :goto_5
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 352
    .line 353
    .line 354
    move-result v3

    .line 355
    if-eqz v3, :cond_d

    .line 356
    .line 357
    invoke-static/range {p0 .. p1}, LF0/h;->a(LG0/c;Lv0/h;)LC0/c;

    .line 358
    .line 359
    .line 360
    move-result-object v3

    .line 361
    if-eqz v3, :cond_c

    .line 362
    .line 363
    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    goto :goto_5

    .line 367
    :cond_d
    invoke-virtual {v0}, LG0/c;->e()V

    .line 368
    .line 369
    .line 370
    goto/16 :goto_0

    .line 371
    .line 372
    :pswitch_c
    invoke-virtual {v0}, LG0/c;->c()V

    .line 373
    .line 374
    .line 375
    :goto_6
    invoke-virtual {v0}, LG0/c;->n()Z

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    if-eqz v3, :cond_e

    .line 380
    .line 381
    invoke-static/range {p0 .. p1}, LF0/x;->a(LG0/c;Lv0/h;)LC0/h;

    .line 382
    .line 383
    .line 384
    move-result-object v3

    .line 385
    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    goto :goto_6

    .line 389
    :cond_e
    invoke-interface {v10}, Ljava/util/List;->size()I

    .line 390
    .line 391
    .line 392
    move-result v3

    .line 393
    invoke-virtual {v1, v3}, Lv0/h;->r(I)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {v0}, LG0/c;->e()V

    .line 397
    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :pswitch_d
    invoke-virtual {v0}, LG0/c;->w()I

    .line 402
    .line 403
    .line 404
    move-result v3

    .line 405
    invoke-static {}, LD0/e$b;->values()[LD0/e$b;

    .line 406
    .line 407
    .line 408
    move-result-object v5

    .line 409
    array-length v5, v5

    .line 410
    if-lt v3, v5, :cond_f

    .line 411
    .line 412
    new-instance v4, Ljava/lang/StringBuilder;

    .line 413
    .line 414
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 415
    .line 416
    .line 417
    const-string v5, "Unsupported matte type: "

    .line 418
    .line 419
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v3

    .line 429
    invoke-virtual {v1, v3}, Lv0/h;->a(Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    goto/16 :goto_0

    .line 433
    .line 434
    :cond_f
    invoke-static {}, LD0/e$b;->values()[LD0/e$b;

    .line 435
    .line 436
    .line 437
    move-result-object v5

    .line 438
    aget-object v22, v5, v3

    .line 439
    .line 440
    sget-object v3, LF0/v$a;->a:[I

    .line 441
    .line 442
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Enum;->ordinal()I

    .line 443
    .line 444
    .line 445
    move-result v5

    .line 446
    aget v3, v3, v5

    .line 447
    .line 448
    if-eq v3, v4, :cond_11

    .line 449
    .line 450
    const/4 v5, 0x2

    .line 451
    if-eq v3, v5, :cond_10

    .line 452
    .line 453
    goto :goto_7

    .line 454
    :cond_10
    const-string v3, "Unsupported matte type: Luma Inverted"

    .line 455
    .line 456
    invoke-virtual {v1, v3}, Lv0/h;->a(Ljava/lang/String;)V

    .line 457
    .line 458
    .line 459
    goto :goto_7

    .line 460
    :cond_11
    const-string v3, "Unsupported matte type: Luma"

    .line 461
    .line 462
    invoke-virtual {v1, v3}, Lv0/h;->a(Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    :goto_7
    invoke-virtual {v1, v4}, Lv0/h;->r(I)V

    .line 466
    .line 467
    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :pswitch_e
    invoke-static/range {p0 .. p1}, LF0/c;->g(LG0/c;Lv0/h;)LB0/l;

    .line 471
    .line 472
    .line 473
    move-result-object v14

    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :pswitch_f
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v3

    .line 480
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 481
    .line 482
    .line 483
    move-result v32

    .line 484
    goto/16 :goto_0

    .line 485
    .line 486
    :pswitch_10
    invoke-virtual {v0}, LG0/c;->w()I

    .line 487
    .line 488
    .line 489
    move-result v3

    .line 490
    int-to-float v3, v3

    .line 491
    invoke-static {}, LH0/h;->e()F

    .line 492
    .line 493
    .line 494
    move-result v4

    .line 495
    mul-float/2addr v3, v4

    .line 496
    float-to-int v3, v3

    .line 497
    move/from16 v31, v3

    .line 498
    .line 499
    goto/16 :goto_0

    .line 500
    .line 501
    :pswitch_11
    invoke-virtual {v0}, LG0/c;->w()I

    .line 502
    .line 503
    .line 504
    move-result v3

    .line 505
    int-to-float v3, v3

    .line 506
    invoke-static {}, LH0/h;->e()F

    .line 507
    .line 508
    .line 509
    move-result v4

    .line 510
    mul-float/2addr v3, v4

    .line 511
    float-to-int v3, v3

    .line 512
    move/from16 v30, v3

    .line 513
    .line 514
    goto/16 :goto_0

    .line 515
    .line 516
    :pswitch_12
    invoke-virtual {v0}, LG0/c;->w()I

    .line 517
    .line 518
    .line 519
    move-result v3

    .line 520
    int-to-long v3, v3

    .line 521
    move-wide/from16 v27, v3

    .line 522
    .line 523
    goto/16 :goto_0

    .line 524
    .line 525
    :pswitch_13
    invoke-virtual {v0}, LG0/c;->w()I

    .line 526
    .line 527
    .line 528
    move-result v3

    .line 529
    sget-object v13, LD0/e$a;->m:LD0/e$a;

    .line 530
    .line 531
    invoke-virtual {v13}, Ljava/lang/Enum;->ordinal()I

    .line 532
    .line 533
    .line 534
    move-result v4

    .line 535
    if-ge v3, v4, :cond_0

    .line 536
    .line 537
    invoke-static {}, LD0/e$a;->values()[LD0/e$a;

    .line 538
    .line 539
    .line 540
    move-result-object v4

    .line 541
    aget-object v13, v4, v3

    .line 542
    .line 543
    goto/16 :goto_0

    .line 544
    .line 545
    :pswitch_14
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object v9

    .line 549
    goto/16 :goto_0

    .line 550
    .line 551
    :pswitch_15
    invoke-virtual {v0}, LG0/c;->w()I

    .line 552
    .line 553
    .line 554
    move-result v3

    .line 555
    int-to-long v3, v3

    .line 556
    move-wide/from16 v16, v3

    .line 557
    .line 558
    goto/16 :goto_0

    .line 559
    .line 560
    :pswitch_16
    invoke-virtual {v0}, LG0/c;->B()Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object v11

    .line 564
    goto/16 :goto_0

    .line 565
    .line 566
    :cond_12
    invoke-virtual {v0}, LG0/c;->g()V

    .line 567
    .line 568
    .line 569
    new-instance v8, Ljava/util/ArrayList;

    .line 570
    .line 571
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 572
    .line 573
    .line 574
    cmpl-float v0, v24, v18

    .line 575
    .line 576
    if-lez v0, :cond_13

    .line 577
    .line 578
    new-instance v0, LI0/a;

    .line 579
    .line 580
    invoke-static/range {v24 .. v24}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 581
    .line 582
    .line 583
    move-result-object v6

    .line 584
    const/4 v4, 0x0

    .line 585
    const/4 v5, 0x0

    .line 586
    move-object v3, v2

    .line 587
    invoke-direct/range {v0 .. v6}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 588
    .line 589
    .line 590
    move-object/from16 v37, v2

    .line 591
    .line 592
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 593
    .line 594
    .line 595
    goto :goto_8

    .line 596
    :cond_13
    move-object/from16 v37, v2

    .line 597
    .line 598
    :goto_8
    cmpl-float v0, v29, v18

    .line 599
    .line 600
    if-lez v0, :cond_14

    .line 601
    .line 602
    goto :goto_9

    .line 603
    :cond_14
    invoke-virtual/range {p1 .. p1}, Lv0/h;->f()F

    .line 604
    .line 605
    .line 606
    move-result v29

    .line 607
    :goto_9
    new-instance v0, LI0/a;

    .line 608
    .line 609
    invoke-static/range {v29 .. v29}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 610
    .line 611
    .line 612
    move-result-object v6

    .line 613
    const/4 v4, 0x0

    .line 614
    move-object/from16 v3, v21

    .line 615
    .line 616
    move-object/from16 v1, p1

    .line 617
    .line 618
    move-object/from16 v2, v21

    .line 619
    .line 620
    move/from16 v5, v24

    .line 621
    .line 622
    invoke-direct/range {v0 .. v6}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 623
    .line 624
    .line 625
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    new-instance v0, LI0/a;

    .line 629
    .line 630
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 631
    .line 632
    .line 633
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 634
    .line 635
    .line 636
    move-result-object v6

    .line 637
    move-object/from16 v3, v37

    .line 638
    .line 639
    move-object/from16 v1, p1

    .line 640
    .line 641
    move/from16 v5, v29

    .line 642
    .line 643
    move-object/from16 v2, v37

    .line 644
    .line 645
    invoke-direct/range {v0 .. v6}, LI0/a;-><init>(Lv0/h;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 646
    .line 647
    .line 648
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    const-string v0, ".ai"

    .line 652
    .line 653
    invoke-virtual {v11, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 654
    .line 655
    .line 656
    move-result v0

    .line 657
    if-nez v0, :cond_15

    .line 658
    .line 659
    const-string v0, "ai"

    .line 660
    .line 661
    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 662
    .line 663
    .line 664
    move-result v0

    .line 665
    if-eqz v0, :cond_16

    .line 666
    .line 667
    :cond_15
    const-string v0, "Convert your Illustrator layers to shape layers."

    .line 668
    .line 669
    invoke-virtual {v1, v0}, Lv0/h;->a(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    :cond_16
    new-instance v0, LD0/e;

    .line 673
    .line 674
    move-object v2, v1

    .line 675
    move-object v1, v7

    .line 676
    move-object/from16 v21, v8

    .line 677
    .line 678
    move-object v3, v11

    .line 679
    move-object v6, v13

    .line 680
    move-object v11, v14

    .line 681
    move-wide/from16 v4, v16

    .line 682
    .line 683
    move-wide/from16 v7, v27

    .line 684
    .line 685
    move/from16 v12, v30

    .line 686
    .line 687
    move/from16 v13, v31

    .line 688
    .line 689
    move/from16 v14, v32

    .line 690
    .line 691
    move/from16 v17, v33

    .line 692
    .line 693
    move/from16 v18, v34

    .line 694
    .line 695
    move/from16 v16, v35

    .line 696
    .line 697
    move/from16 v24, v36

    .line 698
    .line 699
    invoke-direct/range {v0 .. v26}, LD0/e;-><init>(Ljava/util/List;Lv0/h;Ljava/lang/String;JLD0/e$a;JLjava/lang/String;Ljava/util/List;LB0/l;IIIFFFFLB0/j;LB0/k;Ljava/util/List;LD0/e$b;LB0/b;ZLC0/a;LF0/j;)V

    .line 700
    .line 701
    .line 702
    return-object v0

    .line 703
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(Lv0/h;)LD0/e;
    .locals 28

    .line 1
    invoke-virtual/range {p0 .. p0}, Lv0/h;->b()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, LD0/e;

    .line 6
    .line 7
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    sget-object v7, LD0/e$a;->g:LD0/e$a;

    .line 10
    .line 11
    new-instance v12, LB0/l;

    .line 12
    .line 13
    invoke-direct {v12}, LB0/l;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    int-to-float v0, v0

    .line 26
    sget-object v23, LD0/e$b;->g:LD0/e$b;

    .line 27
    .line 28
    const/16 v26, 0x0

    .line 29
    .line 30
    const/16 v27, 0x0

    .line 31
    .line 32
    const-string v4, "__container"

    .line 33
    .line 34
    const-wide/16 v5, -0x1

    .line 35
    .line 36
    const-wide/16 v8, -0x1

    .line 37
    .line 38
    const/4 v10, 0x0

    .line 39
    const/4 v13, 0x0

    .line 40
    const/4 v14, 0x0

    .line 41
    const/4 v15, 0x0

    .line 42
    const/16 v16, 0x0

    .line 43
    .line 44
    const/16 v17, 0x0

    .line 45
    .line 46
    const/16 v20, 0x0

    .line 47
    .line 48
    const/16 v21, 0x0

    .line 49
    .line 50
    const/16 v24, 0x0

    .line 51
    .line 52
    const/16 v25, 0x0

    .line 53
    .line 54
    move-object v11, v2

    .line 55
    move-object/from16 v22, v2

    .line 56
    .line 57
    move/from16 v19, v0

    .line 58
    .line 59
    move/from16 v18, v3

    .line 60
    .line 61
    move-object/from16 v3, p0

    .line 62
    .line 63
    invoke-direct/range {v1 .. v27}, LD0/e;-><init>(Ljava/util/List;Lv0/h;Ljava/lang/String;JLD0/e$a;JLjava/lang/String;Ljava/util/List;LB0/l;IIIFFFFLB0/j;LB0/k;Ljava/util/List;LD0/e$b;LB0/b;ZLC0/a;LF0/j;)V

    .line 64
    .line 65
    .line 66
    return-object v1
.end method
