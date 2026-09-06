.class Lr1/l$b;
.super Landroid/database/ContentObserver;
.source "ZteMarketDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lr1/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lr1/l;


# direct methods
.method constructor <init>(Lr1/l;Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lr1/l$b;->a:Lr1/l;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lr1/l$b;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p8}, Lr1/l$b;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V
    .locals 21

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
    move-object/from16 v5, p3

    .line 8
    .line 9
    move/from16 v9, p4

    .line 10
    .line 11
    move-object/from16 v10, p7

    .line 12
    .line 13
    const/4 v11, 0x1

    .line 14
    const/4 v12, 0x0

    .line 15
    const-string v13, "-1"

    .line 16
    .line 17
    const-string v3, "INSERT"

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const-string v14, "ZteMarketServiceManager"

    .line 24
    .line 25
    if-eqz v3, :cond_d

    .line 26
    .line 27
    const-string v3, "WAITING"

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-nez v3, :cond_0

    .line 34
    .line 35
    const-string v3, "STATUS_IDL"

    .line 36
    .line 37
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    const-string v3, "STATUS_CONNECT"

    .line 44
    .line 45
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    const-string v3, "STATUS_WAITING"

    .line 52
    .line 53
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-nez v3, :cond_0

    .line 58
    .line 59
    const-string v3, "STATUS_APPOINT"

    .line 60
    .line 61
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_d

    .line 66
    .line 67
    :cond_0
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 68
    .line 69
    invoke-static {v1}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 74
    .line 75
    .line 76
    move-result-object v15

    .line 77
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v3, "content://"

    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v3, "/"

    .line 91
    .line 92
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Lr1/l;->i()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 107
    .line 108
    .line 109
    move-result-object v16

    .line 110
    sget-object v17, Lr1/l;->r:[Ljava/lang/String;

    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    sget-object v3, Lr1/l;->m:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v3, "=?"

    .line 123
    .line 124
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v18

    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v3, ""

    .line 137
    .line 138
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    filled-new-array {v1}, [Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v19

    .line 152
    const/16 v20, 0x0

    .line 153
    .line 154
    invoke-virtual/range {v15 .. v20}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 155
    .line 156
    .line 157
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v4, "cursor="

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-static {v14, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    if-eqz v1, :cond_a

    .line 179
    .line 180
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-eqz v3, :cond_a

    .line 185
    .line 186
    new-instance v3, Ld1/d;

    .line 187
    .line 188
    iget-object v4, v0, Lr1/l$b;->a:Lr1/l;

    .line 189
    .line 190
    invoke-static {v4}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 191
    .line 192
    .line 193
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 194
    move-object/from16 v6, p5

    .line 195
    .line 196
    move-object/from16 v7, p6

    .line 197
    .line 198
    move-object v8, v5

    .line 199
    move-object v5, v1

    .line 200
    :try_start_2
    invoke-direct/range {v3 .. v8}, Ld1/d;-><init>(Landroid/content/Context;Landroid/database/Cursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 201
    .line 202
    .line 203
    move-object v6, v5

    .line 204
    :try_start_3
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 205
    .line 206
    invoke-static {v1}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    iget-object v5, v3, Ld1/d;->c:Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 213
    .line 214
    .line 215
    move-result-object v7

    .line 216
    invoke-static {v1, v4, v5, v7}, Lr1/l;->h(Lr1/l;Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    if-nez v1, :cond_2

    .line 221
    .line 222
    iget-object v1, v3, Ld1/d;->c:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    if-eqz v1, :cond_1

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_1
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 232
    .line 233
    invoke-static {v1}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    iget-object v4, v3, Ld1/d;->c:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {v1, v4}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_3

    .line 244
    .line 245
    const-string v0, "onChange: package is enabled, do not need start download anim."

    .line 246
    .line 247
    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 248
    .line 249
    .line 250
    :cond_2
    :goto_0
    :try_start_4
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :catch_0
    move-exception v0

    .line 255
    goto/16 :goto_6

    .line 256
    .line 257
    :catchall_0
    move-exception v0

    .line 258
    :goto_1
    move-object v1, v0

    .line 259
    goto/16 :goto_4

    .line 260
    .line 261
    :cond_3
    :try_start_5
    invoke-static {}, Lr1/l;->j()Ljava/util/HashMap;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v4

    .line 269
    iget-object v5, v3, Ld1/d;->c:Ljava/lang/String;

    .line 270
    .line 271
    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 275
    .line 276
    invoke-static {v1}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    const-string v4, "IconAnimation"

    .line 281
    .line 282
    invoke-virtual {v1, v4, v12}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    iget-object v4, v3, Ld1/d;->c:Ljava/lang/String;

    .line 287
    .line 288
    invoke-interface {v1, v4, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    if-eqz v1, :cond_9

    .line 297
    .line 298
    invoke-static {}, Lx1/O;->D0()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    const/4 v4, 0x0

    .line 307
    if-eqz v2, :cond_4

    .line 308
    .line 309
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 310
    .line 311
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {v10, v0, v3, v4}, Lcom/android/launcher3/X0;->O(Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V

    .line 316
    .line 317
    .line 318
    goto/16 :goto_3

    .line 319
    .line 320
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 323
    .line 324
    .line 325
    const-string v5, "onChange: replaceAppFeatureString="

    .line 326
    .line 327
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    .line 332
    .line 333
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    invoke-static {v14, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    .line 339
    .line 340
    invoke-static {v1}, Lx1/O;->l4(Ljava/lang/String;)Ljava/util/List;

    .line 341
    .line 342
    .line 343
    move-result-object v1

    .line 344
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    move v2, v12

    .line 349
    :cond_5
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    if-eqz v5, :cond_8

    .line 354
    .line 355
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v5

    .line 359
    check-cast v5, Landroid/util/Pair;

    .line 360
    .line 361
    if-nez v5, :cond_6

    .line 362
    .line 363
    goto :goto_2

    .line 364
    :cond_6
    iget-object v7, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 365
    .line 366
    check-cast v7, Landroid/content/ComponentName;

    .line 367
    .line 368
    iget-object v5, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 369
    .line 370
    check-cast v5, Landroid/content/ComponentName;

    .line 371
    .line 372
    if-eqz v7, :cond_5

    .line 373
    .line 374
    if-nez v5, :cond_7

    .line 375
    .line 376
    goto :goto_2

    .line 377
    :cond_7
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v8

    .line 381
    iget-object v9, v3, Ld1/d;->c:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v8

    .line 387
    if-eqz v8, :cond_5

    .line 388
    .line 389
    new-instance v2, Lcom/android/launcher3/resource/P;

    .line 390
    .line 391
    invoke-direct {v2, v7, v5, v11, v12}, Lcom/android/launcher3/resource/P;-><init>(Landroid/content/ComponentName;Landroid/content/ComponentName;ZZ)V

    .line 392
    .line 393
    .line 394
    iget-object v5, v0, Lr1/l$b;->a:Lr1/l;

    .line 395
    .line 396
    invoke-static {v5}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 397
    .line 398
    .line 399
    move-result-object v5

    .line 400
    invoke-virtual {v2, v5}, Lcom/android/launcher3/resource/P;->h(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 401
    .line 402
    .line 403
    move-result-object v5

    .line 404
    iget-object v7, v0, Lr1/l$b;->a:Lr1/l;

    .line 405
    .line 406
    invoke-static {v7}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 407
    .line 408
    .line 409
    move-result-object v7

    .line 410
    invoke-virtual {v10, v7, v3, v5}, Lcom/android/launcher3/X0;->O(Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V

    .line 411
    .line 412
    .line 413
    iget-object v7, v0, Lr1/l$b;->a:Lr1/l;

    .line 414
    .line 415
    invoke-static {v7}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 416
    .line 417
    .line 418
    move-result-object v7

    .line 419
    invoke-virtual {v2, v7, v5}, Lcom/android/launcher3/resource/P;->g(Landroid/content/Context;Lcom/android/launcher3/model/data/I;)V

    .line 420
    .line 421
    .line 422
    move v2, v11

    .line 423
    goto :goto_2

    .line 424
    :cond_8
    if-nez v2, :cond_b

    .line 425
    .line 426
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 427
    .line 428
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-virtual {v10, v0, v3, v4}, Lcom/android/launcher3/X0;->O(Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V

    .line 433
    .line 434
    .line 435
    goto :goto_3

    .line 436
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 437
    .line 438
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 439
    .line 440
    .line 441
    const-string v1, "continue download icon anim,packageName:"

    .line 442
    .line 443
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    iget-object v1, v3, Ld1/d;->c:Ljava/lang/String;

    .line 447
    .line 448
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 456
    .line 457
    .line 458
    iget-object v1, v3, Ld1/d;->c:Ljava/lang/String;

    .line 459
    .line 460
    sget-object v0, Lr1/l;->o:Ljava/lang/String;

    .line 461
    .line 462
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 463
    .line 464
    .line 465
    move-result v3

    .line 466
    const/4 v2, 0x1

    .line 467
    move-object/from16 v5, p3

    .line 468
    .line 469
    move-object/from16 v4, p8

    .line 470
    .line 471
    move-object v0, v10

    .line 472
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/X0;->S(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 473
    .line 474
    .line 475
    goto :goto_3

    .line 476
    :catchall_1
    move-exception v0

    .line 477
    move-object v6, v5

    .line 478
    goto/16 :goto_1

    .line 479
    .line 480
    :catchall_2
    move-exception v0

    .line 481
    move-object v6, v1

    .line 482
    goto/16 :goto_1

    .line 483
    .line 484
    :cond_a
    move-object v6, v1

    .line 485
    :cond_b
    :goto_3
    if-eqz v6, :cond_1c

    .line 486
    .line 487
    :try_start_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 488
    .line 489
    .line 490
    goto/16 :goto_9

    .line 491
    .line 492
    :goto_4
    if-eqz v6, :cond_c

    .line 493
    .line 494
    :try_start_7
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 495
    .line 496
    .line 497
    goto :goto_5

    .line 498
    :catchall_3
    move-exception v0

    .line 499
    :try_start_8
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 500
    .line 501
    .line 502
    :cond_c
    :goto_5
    throw v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 503
    :goto_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 504
    .line 505
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 506
    .line 507
    .line 508
    const-string v2, "mDownloadObserver onChange e:"

    .line 509
    .line 510
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    invoke-static {v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    .line 522
    .line 523
    goto/16 :goto_9

    .line 524
    .line 525
    :cond_d
    const-string v3, "UPDATE"

    .line 526
    .line 527
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    move-result v3

    .line 531
    if-eqz v3, :cond_1b

    .line 532
    .line 533
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 534
    .line 535
    invoke-static {v1}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 536
    .line 537
    .line 538
    move-result-object v3

    .line 539
    invoke-static {v1, v3, v9, v5}, Lr1/l;->g(Lr1/l;Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    iget-object v3, v0, Lr1/l$b;->a:Lr1/l;

    .line 544
    .line 545
    invoke-static {v3}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 546
    .line 547
    .line 548
    move-result-object v4

    .line 549
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 550
    .line 551
    .line 552
    move-result-object v6

    .line 553
    invoke-static {v3, v4, v1, v6}, Lr1/l;->h(Lr1/l;Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 554
    .line 555
    .line 556
    move-result v3

    .line 557
    if-eqz v3, :cond_e

    .line 558
    .line 559
    goto/16 :goto_9

    .line 560
    .line 561
    :cond_e
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 562
    .line 563
    .line 564
    move-result v3

    .line 565
    if-eqz v3, :cond_f

    .line 566
    .line 567
    const-string v0, "download status is empty error"

    .line 568
    .line 569
    invoke-static {v14, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    .line 571
    .line 572
    return-void

    .line 573
    :cond_f
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 574
    .line 575
    .line 576
    const/4 v3, -0x1

    .line 577
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 578
    .line 579
    .line 580
    move-result v4

    .line 581
    sparse-switch v4, :sswitch_data_0

    .line 582
    .line 583
    .line 584
    :goto_7
    move v11, v3

    .line 585
    goto :goto_8

    .line 586
    :sswitch_0
    const-string v4, "STATUS_INSTALL_FINISH"

    .line 587
    .line 588
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 589
    .line 590
    .line 591
    move-result v4

    .line 592
    if-nez v4, :cond_10

    .line 593
    .line 594
    goto :goto_7

    .line 595
    :cond_10
    const/4 v11, 0x7

    .line 596
    goto :goto_8

    .line 597
    :sswitch_1
    const-string v4, "STATUS_DOWNLOADING"

    .line 598
    .line 599
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 600
    .line 601
    .line 602
    move-result v4

    .line 603
    if-nez v4, :cond_11

    .line 604
    .line 605
    goto :goto_7

    .line 606
    :cond_11
    const/4 v11, 0x6

    .line 607
    goto :goto_8

    .line 608
    :sswitch_2
    const-string v4, "INSTALLING"

    .line 609
    .line 610
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 611
    .line 612
    .line 613
    move-result v4

    .line 614
    if-nez v4, :cond_12

    .line 615
    .line 616
    goto :goto_7

    .line 617
    :cond_12
    const/4 v11, 0x5

    .line 618
    goto :goto_8

    .line 619
    :sswitch_3
    const-string v4, "STATUS_PAUSE"

    .line 620
    .line 621
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 622
    .line 623
    .line 624
    move-result v4

    .line 625
    if-nez v4, :cond_13

    .line 626
    .line 627
    goto :goto_7

    .line 628
    :cond_13
    const/4 v11, 0x4

    .line 629
    goto :goto_8

    .line 630
    :sswitch_4
    const-string v4, "STATUS_INSTALL_FAIL"

    .line 631
    .line 632
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 633
    .line 634
    .line 635
    move-result v4

    .line 636
    if-nez v4, :cond_14

    .line 637
    .line 638
    goto :goto_7

    .line 639
    :cond_14
    const/4 v11, 0x3

    .line 640
    goto :goto_8

    .line 641
    :sswitch_5
    const-string v4, "DOWNLOADING"

    .line 642
    .line 643
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 644
    .line 645
    .line 646
    move-result v4

    .line 647
    if-nez v4, :cond_15

    .line 648
    .line 649
    goto :goto_7

    .line 650
    :cond_15
    const/4 v11, 0x2

    .line 651
    goto :goto_8

    .line 652
    :sswitch_6
    const-string v4, "PAUSE"

    .line 653
    .line 654
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result v4

    .line 658
    if-nez v4, :cond_17

    .line 659
    .line 660
    goto :goto_7

    .line 661
    :sswitch_7
    const-string v4, "STATUS_IN_INSTALLTION"

    .line 662
    .line 663
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 664
    .line 665
    .line 666
    move-result v4

    .line 667
    if-nez v4, :cond_16

    .line 668
    .line 669
    goto :goto_7

    .line 670
    :cond_16
    move v11, v12

    .line 671
    :cond_17
    :goto_8
    packed-switch v11, :pswitch_data_0

    .line 672
    .line 673
    .line 674
    goto/16 :goto_9

    .line 675
    .line 676
    :pswitch_0
    iget-object v2, v0, Lr1/l$b;->a:Lr1/l;

    .line 677
    .line 678
    invoke-static {v2}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 679
    .line 680
    .line 681
    move-result-object v2

    .line 682
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 683
    .line 684
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 685
    .line 686
    .line 687
    move-result-object v2

    .line 688
    check-cast v2, Landroid/content/pm/LauncherApps;

    .line 689
    .line 690
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 691
    .line 692
    .line 693
    move-result-object v3

    .line 694
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/LauncherApps;->isPackageEnabled(Ljava/lang/String;Landroid/os/UserHandle;)Z

    .line 695
    .line 696
    .line 697
    move-result v2

    .line 698
    if-eqz v2, :cond_18

    .line 699
    .line 700
    const/4 v2, 0x3

    .line 701
    const/4 v3, 0x0

    .line 702
    move-object/from16 v0, p7

    .line 703
    .line 704
    move-object/from16 v4, p8

    .line 705
    .line 706
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/X0;->S(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)V

    .line 707
    .line 708
    .line 709
    return-void

    .line 710
    :cond_18
    iget-object v1, v0, Lr1/l$b;->a:Lr1/l;

    .line 711
    .line 712
    move-object v2, v1

    .line 713
    invoke-static {v2}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 714
    .line 715
    .line 716
    move-result-object v1

    .line 717
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 718
    .line 719
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 720
    .line 721
    .line 722
    move-result-object v0

    .line 723
    const v3, 0x7f14033d

    .line 724
    .line 725
    .line 726
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v5

    .line 730
    move-object/from16 v3, p3

    .line 731
    .line 732
    move-object/from16 v4, p7

    .line 733
    .line 734
    move-object v0, v2

    .line 735
    move v2, v9

    .line 736
    invoke-static/range {v0 .. v5}, Lr1/l;->f(Lr1/l;Landroid/content/Context;ILjava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V

    .line 737
    .line 738
    .line 739
    return-void

    .line 740
    :pswitch_1
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 741
    .line 742
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 743
    .line 744
    .line 745
    move-result-object v1

    .line 746
    const-string v5, ""

    .line 747
    .line 748
    move-object/from16 v3, p3

    .line 749
    .line 750
    move/from16 v2, p4

    .line 751
    .line 752
    move-object/from16 v4, p7

    .line 753
    .line 754
    invoke-static/range {v0 .. v5}, Lr1/l;->f(Lr1/l;Landroid/content/Context;ILjava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V

    .line 755
    .line 756
    .line 757
    return-void

    .line 758
    :pswitch_2
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 759
    .line 760
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 761
    .line 762
    .line 763
    move-result-object v0

    .line 764
    invoke-static {v0, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 765
    .line 766
    .line 767
    move-result v0

    .line 768
    if-eqz v0, :cond_19

    .line 769
    .line 770
    const-string v0, "onChange: package is enabled, do not need STATE_DOWNLOAD anim."

    .line 771
    .line 772
    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    .line 774
    .line 775
    return-void

    .line 776
    :cond_19
    sget-object v0, Lr1/l;->o:Ljava/lang/String;

    .line 777
    .line 778
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 779
    .line 780
    .line 781
    move-result v3

    .line 782
    const/4 v2, 0x1

    .line 783
    move-object/from16 v5, p3

    .line 784
    .line 785
    move-object/from16 v0, p7

    .line 786
    .line 787
    move-object/from16 v4, p8

    .line 788
    .line 789
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/X0;->S(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)V

    .line 790
    .line 791
    .line 792
    return-void

    .line 793
    :pswitch_3
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 794
    .line 795
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 796
    .line 797
    .line 798
    move-result-object v0

    .line 799
    invoke-static {v0, v1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 800
    .line 801
    .line 802
    move-result v0

    .line 803
    if-eqz v0, :cond_1a

    .line 804
    .line 805
    const-string v0, "onChange: package is enabled, do not need STATE_INSTALL anim."

    .line 806
    .line 807
    invoke-static {v14, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 808
    .line 809
    .line 810
    return-void

    .line 811
    :cond_1a
    const/4 v2, 0x2

    .line 812
    const/4 v3, 0x0

    .line 813
    move-object/from16 v5, p3

    .line 814
    .line 815
    move-object/from16 v0, p7

    .line 816
    .line 817
    move-object/from16 v4, p8

    .line 818
    .line 819
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/X0;->S(Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)V

    .line 820
    .line 821
    .line 822
    return-void

    .line 823
    :cond_1b
    const-string v2, "DELETE"

    .line 824
    .line 825
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 826
    .line 827
    .line 828
    move-result v1

    .line 829
    if-eqz v1, :cond_1c

    .line 830
    .line 831
    iget-object v0, v0, Lr1/l$b;->a:Lr1/l;

    .line 832
    .line 833
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 834
    .line 835
    .line 836
    move-result-object v1

    .line 837
    const-string v5, ""

    .line 838
    .line 839
    move-object/from16 v3, p3

    .line 840
    .line 841
    move/from16 v2, p4

    .line 842
    .line 843
    move-object/from16 v4, p7

    .line 844
    .line 845
    invoke-static/range {v0 .. v5}, Lr1/l;->f(Lr1/l;Landroid/content/Context;ILjava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V

    .line 846
    .line 847
    .line 848
    :cond_1c
    :goto_9
    return-void

    .line 849
    :sswitch_data_0
    .sparse-switch
        0x12da6e2 -> :sswitch_7
        0x4862dd6 -> :sswitch_6
        0x3823363a -> :sswitch_5
        0x45a8aa8f -> :sswitch_4
        0x51c91749 -> :sswitch_3
        0x5295b467 -> :sswitch_2
        0x5b3ffd6d -> :sswitch_1
        0x7e9b43c4 -> :sswitch_0
    .end sparse-switch

    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    .line 864
    .line 865
    .line 866
    .line 867
    .line 868
    .line 869
    .line 870
    .line 871
    .line 872
    .line 873
    .line 874
    .line 875
    .line 876
    .line 877
    .line 878
    .line 879
    .line 880
    .line 881
    .line 882
    .line 883
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 10

    .line 1
    iget-object p1, p0, Lr1/l$b;->a:Lr1/l;

    .line 2
    .line 3
    invoke-static {p1}, Lr1/l;->c(Lr1/l;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    :try_start_0
    const-string p0, "ZteMarketServiceManager"

    .line 11
    .line 12
    const-string p2, "download , onChange, uri or LauncherState null error"

    .line 13
    .line 14
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    monitor-exit p1

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    move-object p0, v0

    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    const-string v0, "ZteMarketServiceManager"

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v2, "onChange, uri = "

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lr1/l$b;->a:Lr1/l;

    .line 50
    .line 51
    invoke-static {v0}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    const-string p0, "ZteMarketServiceManager"

    .line 58
    .line 59
    const-string p2, "download , onChange, context null error"

    .line 60
    .line 61
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    monitor-exit p1

    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {p2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    const-string p0, "ZteMarketServiceManager"

    .line 77
    .line 78
    const-string p2, "uri invalid error"

    .line 79
    .line 80
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    monitor-exit p1

    .line 84
    return-void

    .line 85
    :cond_2
    sget-object v0, Lr1/l;->m:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    const-string p0, "ZteMarketServiceManager"

    .line 98
    .line 99
    const-string p2, "app_id is null"

    .line 100
    .line 101
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    monitor-exit p1

    .line 105
    return-void

    .line 106
    :cond_3
    sget-object v0, Lr1/l;->m:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    const-string v0, "status"

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    const-string v0, "progress"

    .line 127
    .line 128
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v9

    .line 132
    const/4 v0, 0x1

    .line 133
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v1, "download_type"

    .line 138
    .line 139
    invoke-virtual {p2, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-nez v1, :cond_4

    .line 148
    .line 149
    const-string v0, "download_type"

    .line 150
    .line 151
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    :cond_4
    move-object v6, v0

    .line 156
    const/4 v0, 0x2

    .line 157
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const-string v1, "spread_type"

    .line 162
    .line 163
    invoke-virtual {p2, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-nez v1, :cond_5

    .line 172
    .line 173
    const-string v0, "spread_type"

    .line 174
    .line 175
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    :cond_5
    move-object v7, v0

    .line 180
    const-string v0, "ACTION"

    .line 181
    .line 182
    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 187
    .line 188
    .line 189
    move-result p2

    .line 190
    if-eqz p2, :cond_6

    .line 191
    .line 192
    const-string p0, "ZteMarketServiceManager"

    .line 193
    .line 194
    const-string p2, "download onchange, provider action is empty error"

    .line 195
    .line 196
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    monitor-exit p1

    .line 200
    return-void

    .line 201
    :cond_6
    new-instance v8, Lcom/android/launcher3/X0;

    .line 202
    .line 203
    iget-object p2, p0, Lr1/l$b;->a:Lr1/l;

    .line 204
    .line 205
    invoke-static {p2}, Lr1/l;->a(Lr1/l;)Landroid/content/Context;

    .line 206
    .line 207
    .line 208
    move-result-object p2

    .line 209
    invoke-direct {v8, p2}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 210
    .line 211
    .line 212
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 213
    .line 214
    new-instance v0, Lr1/m;

    .line 215
    .line 216
    move-object v1, p0

    .line 217
    invoke-direct/range {v0 .. v9}, Lr1/m;-><init>(Lr1/l$b;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/X0;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 221
    .line 222
    .line 223
    monitor-exit p1

    .line 224
    return-void

    .line 225
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    throw p0
.end method
