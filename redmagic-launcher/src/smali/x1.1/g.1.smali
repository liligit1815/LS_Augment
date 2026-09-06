.class public Lx1/g;
.super Ljava/lang/Object;
.source "AlphabeticalUtils.java"


# static fields
.field public static a:Ljava/lang/String; = "zh"

.field public static b:Ljava/lang/String; = "ja"

.field public static c:Ljava/lang/String; = "en"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Landroid/os/LocaleList;->getDefault()Landroid/os/LocaleList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, v1}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    return-object v0

    .line 31
    :cond_0
    sget-object v0, Lx1/g;->c:Ljava/lang/String;

    .line 32
    .line 33
    return-object v0
.end method

.method public static b(Ljava/lang/String;)LI/d;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "LI/d<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Lx1/D;->c()Lx1/D;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Lx1/D;->b(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Lx1/D;->c()Lx1/D;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2, v0}, Lx1/D;->f(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x30

    .line 24
    .line 25
    if-le v2, v3, :cond_0

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v4, "getNameLookupKeys, longer than MAX_NAME_TOKENS_NEED_CUT, cut to tokenCount = "

    .line 33
    .line 34
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v4, "AlphabeticalUtils"

    .line 45
    .line 46
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move v2, v3

    .line 50
    :cond_0
    const/4 v3, 0x2

    .line 51
    const/16 v4, 0x20

    .line 52
    .line 53
    const/4 v5, 0x1

    .line 54
    const/4 v6, 0x0

    .line 55
    if-eqz v0, :cond_10

    .line 56
    .line 57
    const/4 v0, 0x6

    .line 58
    if-le v2, v0, :cond_1

    .line 59
    .line 60
    goto/16 :goto_b

    .line 61
    .line 62
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    new-instance v7, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v8, LI/d;

    .line 73
    .line 74
    invoke-direct {v8, v0, v7}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    sub-int/2addr v2, v5

    .line 78
    move v9, v5

    .line 79
    :goto_0
    if-ltz v2, :cond_f

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    check-cast v10, Lx1/D$a;

    .line 86
    .line 87
    iget v11, v10, Lx1/D$a;->a:I

    .line 88
    .line 89
    if-ne v3, v11, :cond_9

    .line 90
    .line 91
    iget v11, v10, Lx1/D$a;->e:I

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result v12

    .line 97
    if-nez v12, :cond_3

    .line 98
    .line 99
    move v12, v6

    .line 100
    :goto_1
    if-ge v12, v11, :cond_8

    .line 101
    .line 102
    if-nez v12, :cond_2

    .line 103
    .line 104
    new-instance v13, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    iget-object v14, v10, Lx1/D$a;->c:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    move-result-object v13

    .line 115
    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance v13, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    .line 122
    .line 123
    iget-object v14, v10, Lx1/D$a;->c:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v14, v6}, Ljava/lang/String;->charAt(I)C

    .line 126
    .line 127
    .line 128
    move-result v14

    .line 129
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_2
    new-instance v13, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    iget-object v14, v10, Lx1/D$a;->f:[Ljava/lang/String;

    .line 143
    .line 144
    aget-object v14, v14, v12

    .line 145
    .line 146
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    move-result-object v13

    .line 150
    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    new-instance v13, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    iget-object v14, v10, Lx1/D$a;->f:[Ljava/lang/String;

    .line 159
    .line 160
    aget-object v14, v14, v12

    .line 161
    .line 162
    invoke-virtual {v14, v6}, Ljava/lang/String;->charAt(I)C

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    move-result-object v13

    .line 170
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    :goto_2
    add-int/lit8 v12, v12, 0x1

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_3
    if-ne v11, v5, :cond_4

    .line 177
    .line 178
    move v12, v6

    .line 179
    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 180
    .line 181
    .line 182
    move-result v13

    .line 183
    if-ge v12, v13, :cond_8

    .line 184
    .line 185
    if-ge v12, v9, :cond_8

    .line 186
    .line 187
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v13

    .line 191
    check-cast v13, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    iget-object v14, v10, Lx1/D$a;->c:Ljava/lang/String;

    .line 194
    .line 195
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v13

    .line 202
    check-cast v13, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    iget-object v14, v10, Lx1/D$a;->c:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {v14, v6}, Ljava/lang/String;->charAt(I)C

    .line 207
    .line 208
    .line 209
    move-result v14

    .line 210
    invoke-virtual {v13, v6, v14}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    add-int/lit8 v12, v12, 0x1

    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_4
    move v12, v5

    .line 217
    :goto_4
    if-ge v12, v11, :cond_6

    .line 218
    .line 219
    move v13, v6

    .line 220
    :goto_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 221
    .line 222
    .line 223
    move-result v14

    .line 224
    if-ge v13, v14, :cond_5

    .line 225
    .line 226
    if-ge v13, v9, :cond_5

    .line 227
    .line 228
    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v14

    .line 232
    check-cast v14, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v14

    .line 238
    new-instance v15, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v15, v6, v14}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    move-result-object v14

    .line 247
    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v14

    .line 254
    check-cast v14, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v14

    .line 260
    new-instance v15, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v15, v6, v14}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    move-result-object v14

    .line 269
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    add-int/lit8 v13, v13, 0x1

    .line 273
    .line 274
    goto :goto_5

    .line 275
    :cond_5
    add-int/lit8 v12, v12, 0x1

    .line 276
    .line 277
    goto :goto_4

    .line 278
    :cond_6
    move v12, v6

    .line 279
    :goto_6
    if-ge v12, v11, :cond_8

    .line 280
    .line 281
    move v13, v6

    .line 282
    :goto_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 283
    .line 284
    .line 285
    move-result v14

    .line 286
    if-ge v13, v14, :cond_7

    .line 287
    .line 288
    if-ge v13, v9, :cond_7

    .line 289
    .line 290
    mul-int v14, v9, v12

    .line 291
    .line 292
    add-int/2addr v14, v13

    .line 293
    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v15

    .line 297
    check-cast v15, Ljava/lang/StringBuilder;

    .line 298
    .line 299
    iget-object v3, v10, Lx1/D$a;->f:[Ljava/lang/String;

    .line 300
    .line 301
    aget-object v3, v3, v12

    .line 302
    .line 303
    invoke-virtual {v15, v6, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    check-cast v3, Ljava/lang/StringBuilder;

    .line 311
    .line 312
    iget-object v14, v10, Lx1/D$a;->f:[Ljava/lang/String;

    .line 313
    .line 314
    aget-object v14, v14, v12

    .line 315
    .line 316
    invoke-virtual {v14, v6}, Ljava/lang/String;->charAt(I)C

    .line 317
    .line 318
    .line 319
    move-result v14

    .line 320
    invoke-virtual {v3, v6, v14}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    add-int/lit8 v13, v13, 0x1

    .line 324
    .line 325
    const/4 v3, 0x2

    .line 326
    goto :goto_7

    .line 327
    :cond_7
    add-int/lit8 v12, v12, 0x1

    .line 328
    .line 329
    const/4 v3, 0x2

    .line 330
    goto :goto_6

    .line 331
    :cond_8
    if-lez v11, :cond_e

    .line 332
    .line 333
    mul-int/2addr v9, v11

    .line 334
    goto/16 :goto_a

    .line 335
    .line 336
    :cond_9
    if-ne v5, v11, :cond_e

    .line 337
    .line 338
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    if-nez v3, :cond_a

    .line 343
    .line 344
    new-instance v3, Ljava/lang/StringBuilder;

    .line 345
    .line 346
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 347
    .line 348
    .line 349
    iget-object v11, v10, Lx1/D$a;->b:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {v3, v6, v11}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    new-instance v3, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 361
    .line 362
    .line 363
    iget-object v10, v10, Lx1/D$a;->b:Ljava/lang/String;

    .line 364
    .line 365
    invoke-virtual {v10, v6}, Ljava/lang/String;->charAt(I)C

    .line 366
    .line 367
    .line 368
    move-result v10

    .line 369
    invoke-virtual {v3, v6, v10}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    goto :goto_a

    .line 377
    :cond_a
    move v3, v6

    .line 378
    :goto_8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 379
    .line 380
    .line 381
    move-result v11

    .line 382
    if-ge v3, v11, :cond_c

    .line 383
    .line 384
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v11

    .line 388
    check-cast v11, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    .line 391
    .line 392
    .line 393
    move-result v11

    .line 394
    if-lez v11, :cond_b

    .line 395
    .line 396
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object v11

    .line 400
    check-cast v11, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    invoke-virtual {v11, v6, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    :cond_b
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v11

    .line 409
    check-cast v11, Ljava/lang/StringBuilder;

    .line 410
    .line 411
    iget-object v12, v10, Lx1/D$a;->b:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v11, v6, v12}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    add-int/lit8 v3, v3, 0x1

    .line 417
    .line 418
    goto :goto_8

    .line 419
    :cond_c
    move v3, v6

    .line 420
    :goto_9
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 421
    .line 422
    .line 423
    move-result v11

    .line 424
    if-ge v3, v11, :cond_e

    .line 425
    .line 426
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v11

    .line 430
    check-cast v11, Ljava/lang/StringBuilder;

    .line 431
    .line 432
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    .line 433
    .line 434
    .line 435
    move-result v11

    .line 436
    if-lez v11, :cond_d

    .line 437
    .line 438
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v11

    .line 442
    check-cast v11, Ljava/lang/StringBuilder;

    .line 443
    .line 444
    invoke-virtual {v11, v6, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    :cond_d
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object v11

    .line 451
    check-cast v11, Ljava/lang/StringBuilder;

    .line 452
    .line 453
    iget-object v12, v10, Lx1/D$a;->b:Ljava/lang/String;

    .line 454
    .line 455
    invoke-virtual {v12, v6}, Ljava/lang/String;->charAt(I)C

    .line 456
    .line 457
    .line 458
    move-result v12

    .line 459
    invoke-virtual {v11, v6, v12}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    add-int/lit8 v3, v3, 0x1

    .line 463
    .line 464
    goto :goto_9

    .line 465
    :cond_e
    :goto_a
    add-int/lit8 v2, v2, -0x1

    .line 466
    .line 467
    const/4 v3, 0x2

    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :cond_f
    iget-object v0, v8, LI/d;->a:Ljava/lang/Object;

    .line 471
    .line 472
    check-cast v0, Ljava/util/ArrayList;

    .line 473
    .line 474
    invoke-virtual {v0}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 487
    .line 488
    .line 489
    move-result v1

    .line 490
    sub-int/2addr v1, v5

    .line 491
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    iget-object v1, v8, LI/d;->b:Ljava/lang/Object;

    .line 496
    .line 497
    check-cast v1, Ljava/util/ArrayList;

    .line 498
    .line 499
    invoke-virtual {v1}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 504
    .line 505
    .line 506
    move-result-object v2

    .line 507
    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 512
    .line 513
    .line 514
    move-result v2

    .line 515
    sub-int/2addr v2, v5

    .line 516
    invoke-virtual {v1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    new-instance v2, LI/d;

    .line 521
    .line 522
    invoke-direct {v2, v0, v1}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 523
    .line 524
    .line 525
    return-object v2

    .line 526
    :cond_10
    :goto_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 527
    .line 528
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 529
    .line 530
    .line 531
    new-instance v3, Ljava/lang/StringBuilder;

    .line 532
    .line 533
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 534
    .line 535
    .line 536
    new-instance v7, Ljava/lang/StringBuilder;

    .line 537
    .line 538
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 539
    .line 540
    .line 541
    new-instance v8, LI/d;

    .line 542
    .line 543
    invoke-direct {v8, v0, v3}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 544
    .line 545
    .line 546
    sub-int/2addr v2, v5

    .line 547
    :goto_c
    if-ltz v2, :cond_15

    .line 548
    .line 549
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object v9

    .line 553
    check-cast v9, Lx1/D$a;

    .line 554
    .line 555
    iget v10, v9, Lx1/D$a;->a:I

    .line 556
    .line 557
    const/4 v11, 0x2

    .line 558
    if-ne v11, v10, :cond_11

    .line 559
    .line 560
    iget-object v10, v9, Lx1/D$a;->c:Ljava/lang/String;

    .line 561
    .line 562
    invoke-virtual {v0, v6, v10}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    iget-object v10, v9, Lx1/D$a;->c:Ljava/lang/String;

    .line 566
    .line 567
    invoke-virtual {v10, v6}, Ljava/lang/String;->charAt(I)C

    .line 568
    .line 569
    .line 570
    move-result v10

    .line 571
    invoke-virtual {v3, v6, v10}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 572
    .line 573
    .line 574
    goto :goto_d

    .line 575
    :cond_11
    if-ne v5, v10, :cond_14

    .line 576
    .line 577
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 578
    .line 579
    .line 580
    move-result v10

    .line 581
    if-lez v10, :cond_12

    .line 582
    .line 583
    invoke-virtual {v0, v6, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    :cond_12
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    .line 587
    .line 588
    .line 589
    move-result v10

    .line 590
    if-lez v10, :cond_13

    .line 591
    .line 592
    invoke-virtual {v7, v6, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    :cond_13
    iget-object v10, v9, Lx1/D$a;->b:Ljava/lang/String;

    .line 596
    .line 597
    invoke-virtual {v0, v6, v10}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    iget-object v10, v9, Lx1/D$a;->b:Ljava/lang/String;

    .line 601
    .line 602
    invoke-virtual {v10, v6}, Ljava/lang/String;->charAt(I)C

    .line 603
    .line 604
    .line 605
    move-result v10

    .line 606
    invoke-virtual {v3, v6, v10}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 607
    .line 608
    .line 609
    :cond_14
    :goto_d
    iget-object v9, v9, Lx1/D$a;->b:Ljava/lang/String;

    .line 610
    .line 611
    invoke-virtual {v7, v6, v9}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    .line 613
    .line 614
    add-int/lit8 v2, v2, -0x1

    .line 615
    .line 616
    goto :goto_c

    .line 617
    :cond_15
    new-instance v0, LI/d;

    .line 618
    .line 619
    iget-object v1, v8, LI/d;->a:Ljava/lang/Object;

    .line 620
    .line 621
    check-cast v1, Ljava/lang/StringBuilder;

    .line 622
    .line 623
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 624
    .line 625
    .line 626
    move-result-object v1

    .line 627
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 628
    .line 629
    .line 630
    move-result-object v2

    .line 631
    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    iget-object v2, v8, LI/d;->b:Ljava/lang/Object;

    .line 636
    .line 637
    check-cast v2, Ljava/lang/StringBuilder;

    .line 638
    .line 639
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 640
    .line 641
    .line 642
    move-result-object v2

    .line 643
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 644
    .line 645
    .line 646
    move-result-object v3

    .line 647
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 648
    .line 649
    .line 650
    move-result-object v2

    .line 651
    invoke-direct {v0, v1, v2}, LI/d;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 652
    .line 653
    .line 654
    return-object v0
.end method

.method public static c(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "^[\u4e00-\u9fa5]+$"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public static d(Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v2, 0x30

    .line 14
    .line 15
    if-lt v0, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/16 v0, 0x39

    .line 22
    .line 23
    if-gt p0, v0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method
