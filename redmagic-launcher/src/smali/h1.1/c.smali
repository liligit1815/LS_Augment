.class public Lh1/c;
.super Ljava/lang/Object;
.source "StatusDataCollection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lh1/c$b;,
        Lh1/c$a;,
        Lh1/c$c;
    }
.end annotation


# static fields
.field private static a:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x6

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sput v0, Lh1/c;->a:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Lh1/c;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return-object p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    const-string p0, ""

    .line 26
    .line 27
    return-object p0
.end method

.method private static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    const-string v1, "_"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static e(Landroid/content/Context;)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x6

    .line 8
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    sget v3, Lh1/c;->a:I

    .line 13
    .line 14
    if-ne v3, v2, :cond_0

    .line 15
    .line 16
    goto/16 :goto_1a

    .line 17
    .line 18
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    if-eqz v3, :cond_27

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-eqz v3, :cond_27

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->s0()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_1

    .line 47
    .line 48
    goto/16 :goto_1a

    .line 49
    .line 50
    :cond_1
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    if-nez v3, :cond_2

    .line 55
    .line 56
    goto/16 :goto_1a

    .line 57
    .line 58
    :cond_2
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->p()Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_3

    .line 67
    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 69
    .line 70
    .line 71
    move-result-wide v4

    .line 72
    invoke-static {v0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    const-string v7, "launcher_enter_concise_mode"

    .line 77
    .line 78
    const-wide/16 v8, -0x1

    .line 79
    .line 80
    invoke-interface {v6, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 81
    .line 82
    .line 83
    move-result-wide v10

    .line 84
    cmp-long v6, v10, v8

    .line 85
    .line 86
    if-eqz v6, :cond_3

    .line 87
    .line 88
    cmp-long v6, v4, v10

    .line 89
    .line 90
    if-lez v6, :cond_3

    .line 91
    .line 92
    sub-long v8, v4, v10

    .line 93
    .line 94
    invoke-static {v8, v9}, Lh1/a;->k(J)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-interface {v6, v7, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 110
    .line 111
    .line 112
    :cond_3
    new-instance v4, Lh1/c$b;

    .line 113
    .line 114
    const/4 v5, 0x0

    .line 115
    invoke-direct {v4, v5}, Lh1/c$b;-><init>(Lh1/d;)V

    .line 116
    .line 117
    .line 118
    new-instance v6, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    new-instance v7, Ljava/util/ArrayList;

    .line 124
    .line 125
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .line 127
    .line 128
    new-instance v7, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    new-instance v8, Lcom/android/launcher3/util/z0;

    .line 134
    .line 135
    invoke-direct {v8}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 136
    .line 137
    .line 138
    new-instance v9, Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .line 142
    .line 143
    :try_start_0
    iget-object v10, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 144
    .line 145
    invoke-virtual {v10}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 146
    .line 147
    .line 148
    move-result-object v10

    .line 149
    const/4 v12, -0x1

    .line 150
    const/4 v13, 0x0

    .line 151
    const/4 v14, 0x0

    .line 152
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 153
    .line 154
    .line 155
    move-result v15
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    const-string v11, "*"

    .line 157
    .line 158
    const-string v5, "null"

    .line 159
    .line 160
    move/from16 v16, v2

    .line 161
    .line 162
    if-eqz v15, :cond_19

    .line 163
    .line 164
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v15

    .line 168
    check-cast v15, Lcom/android/launcher3/model/data/y;

    .line 169
    .line 170
    if-nez v15, :cond_4

    .line 171
    .line 172
    move/from16 v2, v16

    .line 173
    .line 174
    :goto_1
    const/4 v5, 0x0

    .line 175
    goto :goto_0

    .line 176
    :cond_4
    iget v2, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 177
    .line 178
    move-object/from16 v18, v10

    .line 179
    .line 180
    const/16 v10, -0x64

    .line 181
    .line 182
    if-ne v2, v10, :cond_6

    .line 183
    .line 184
    instance-of v2, v15, Lcom/android/launcher3/model/data/p;

    .line 185
    .line 186
    if-eqz v2, :cond_5

    .line 187
    .line 188
    move-object v2, v15

    .line 189
    check-cast v2, Lcom/android/launcher3/model/data/p;

    .line 190
    .line 191
    const/16 v10, 0x8

    .line 192
    .line 193
    invoke-virtual {v2, v10}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_5

    .line 198
    .line 199
    iget v2, v15, Lcom/android/launcher3/model/data/y;->id:I

    .line 200
    .line 201
    move v12, v2

    .line 202
    const/4 v14, 0x1

    .line 203
    goto :goto_2

    .line 204
    :cond_5
    iget v2, v15, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 205
    .line 206
    invoke-virtual {v8, v2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 207
    .line 208
    .line 209
    :cond_6
    :goto_2
    iget v2, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 210
    .line 211
    const/16 v10, -0x65

    .line 212
    .line 213
    if-ne v2, v10, :cond_9

    .line 214
    .line 215
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    if-eqz v2, :cond_7

    .line 220
    .line 221
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-static {v2}, Lh1/c;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    goto :goto_4

    .line 237
    :cond_7
    iget-object v2, v15, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 238
    .line 239
    if-nez v2, :cond_8

    .line 240
    .line 241
    move-object v2, v5

    .line 242
    goto :goto_3

    .line 243
    :cond_8
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    invoke-static {v2}, Lh1/c;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    :goto_3
    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    :cond_9
    :goto_4
    iget v2, v15, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 255
    .line 256
    if-eqz v2, :cond_d

    .line 257
    .line 258
    const/4 v10, 0x1

    .line 259
    if-eq v2, v10, :cond_d

    .line 260
    .line 261
    const/4 v5, 0x4

    .line 262
    if-eq v2, v5, :cond_a

    .line 263
    .line 264
    const/4 v5, 0x5

    .line 265
    if-eq v2, v5, :cond_a

    .line 266
    .line 267
    goto :goto_5

    .line 268
    :cond_a
    new-instance v2, Lh1/c$c;

    .line 269
    .line 270
    const/4 v5, 0x0

    .line 271
    invoke-direct {v2, v5}, Lh1/c$c;-><init>(Lh1/d;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    if-eqz v5, :cond_c

    .line 279
    .line 280
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 281
    .line 282
    .line 283
    move-result-object v5

    .line 284
    invoke-virtual {v5}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v5

    .line 288
    invoke-virtual {v2, v5}, Lh1/c$c;->d(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v0, v5}, Lh1/c;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v5

    .line 295
    invoke-virtual {v2, v5}, Lh1/c$c;->c(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    invoke-virtual {v5}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v5

    .line 306
    invoke-virtual {v2, v5}, Lh1/c$c;->f(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    if-eqz v5, :cond_b

    .line 314
    .line 315
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    iget v10, v15, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 320
    .line 321
    invoke-virtual {v5, v10}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 322
    .line 323
    .line 324
    move-result v5

    .line 325
    invoke-virtual {v2, v5}, Lh1/c$c;->e(I)V

    .line 326
    .line 327
    .line 328
    :cond_b
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    :cond_c
    :goto_5
    move-object/from16 v19, v6

    .line 332
    .line 333
    move/from16 v21, v12

    .line 334
    .line 335
    goto/16 :goto_10

    .line 336
    .line 337
    :cond_d
    iget v2, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 338
    .line 339
    const/16 v10, -0x64

    .line 340
    .line 341
    if-eq v2, v10, :cond_f

    .line 342
    .line 343
    const/16 v10, -0x65

    .line 344
    .line 345
    if-ne v2, v10, :cond_e

    .line 346
    .line 347
    goto :goto_7

    .line 348
    :cond_e
    :goto_6
    const/16 v10, -0x64

    .line 349
    .line 350
    goto :goto_8

    .line 351
    :cond_f
    :goto_7
    add-int/lit8 v13, v13, 0x1

    .line 352
    .line 353
    goto :goto_6

    .line 354
    :goto_8
    if-eq v2, v10, :cond_10

    .line 355
    .line 356
    if-lez v2, :cond_c

    .line 357
    .line 358
    :cond_10
    new-instance v2, Lh1/c$a;

    .line 359
    .line 360
    const/4 v10, 0x0

    .line 361
    invoke-direct {v2, v10}, Lh1/c$a;-><init>(Lh1/d;)V

    .line 362
    .line 363
    .line 364
    iget-object v10, v15, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 365
    .line 366
    if-nez v10, :cond_11

    .line 367
    .line 368
    move-object v10, v5

    .line 369
    goto :goto_9

    .line 370
    :cond_11
    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v10

    .line 374
    :goto_9
    invoke-virtual {v2, v10}, Lh1/c$a;->e(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 378
    .line 379
    .line 380
    move-result-object v10

    .line 381
    if-eqz v10, :cond_12

    .line 382
    .line 383
    invoke-virtual {v15}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 384
    .line 385
    .line 386
    move-result-object v10

    .line 387
    invoke-virtual {v10}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v10

    .line 391
    invoke-virtual {v2, v10}, Lh1/c$a;->n(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    :cond_12
    iget v10, v15, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 395
    .line 396
    invoke-virtual {v2, v10}, Lh1/c$a;->f(I)V

    .line 397
    .line 398
    .line 399
    iget v10, v15, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 400
    .line 401
    invoke-virtual {v2, v10}, Lh1/c$a;->g(I)V

    .line 402
    .line 403
    .line 404
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 405
    .line 406
    .line 407
    move-result-object v10

    .line 408
    if-eqz v10, :cond_16

    .line 409
    .line 410
    move-object/from16 v19, v6

    .line 411
    .line 412
    iget v6, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 413
    .line 414
    if-lez v6, :cond_15

    .line 415
    .line 416
    move-object/from16 v20, v10

    .line 417
    .line 418
    iget-object v10, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 419
    .line 420
    invoke-virtual {v10, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object v6

    .line 424
    check-cast v6, Lcom/android/launcher3/model/data/p;

    .line 425
    .line 426
    if-eqz v6, :cond_14

    .line 427
    .line 428
    invoke-virtual/range {v20 .. v20}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 429
    .line 430
    .line 431
    move-result-object v10

    .line 432
    move/from16 v21, v12

    .line 433
    .line 434
    iget v12, v6, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 435
    .line 436
    invoke-virtual {v10, v12}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 437
    .line 438
    .line 439
    move-result v10

    .line 440
    iget v12, v6, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 441
    .line 442
    invoke-virtual {v2, v12}, Lh1/c$a;->i(I)V

    .line 443
    .line 444
    .line 445
    iget v12, v6, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 446
    .line 447
    invoke-virtual {v2, v12}, Lh1/c$a;->j(I)V

    .line 448
    .line 449
    .line 450
    iget-object v6, v6, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 451
    .line 452
    if-nez v6, :cond_13

    .line 453
    .line 454
    goto :goto_a

    .line 455
    :cond_13
    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object v5

    .line 459
    :goto_a
    invoke-virtual {v2, v5}, Lh1/c$a;->k(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    goto :goto_e

    .line 463
    :cond_14
    move/from16 v21, v12

    .line 464
    .line 465
    goto :goto_d

    .line 466
    :cond_15
    :goto_b
    move-object/from16 v20, v10

    .line 467
    .line 468
    move/from16 v21, v12

    .line 469
    .line 470
    goto :goto_c

    .line 471
    :cond_16
    move-object/from16 v19, v6

    .line 472
    .line 473
    goto :goto_b

    .line 474
    :goto_c
    if-eqz v20, :cond_17

    .line 475
    .line 476
    iget v5, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 477
    .line 478
    const/16 v10, -0x64

    .line 479
    .line 480
    if-ne v5, v10, :cond_17

    .line 481
    .line 482
    invoke-virtual/range {v20 .. v20}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 483
    .line 484
    .line 485
    move-result-object v5

    .line 486
    iget v6, v15, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 487
    .line 488
    invoke-virtual {v5, v6}, Lcom/android/launcher3/Workspace;->h1(I)I

    .line 489
    .line 490
    .line 491
    move-result v10

    .line 492
    goto :goto_e

    .line 493
    :cond_17
    :goto_d
    const/4 v10, 0x0

    .line 494
    :goto_e
    invoke-virtual {v2, v10}, Lh1/c$a;->o(I)V

    .line 495
    .line 496
    .line 497
    iget v5, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 498
    .line 499
    if-lez v5, :cond_18

    .line 500
    .line 501
    const/4 v5, 0x1

    .line 502
    goto :goto_f

    .line 503
    :cond_18
    const/4 v5, 0x0

    .line 504
    :goto_f
    invoke-virtual {v2, v5}, Lh1/c$a;->l(Z)V

    .line 505
    .line 506
    .line 507
    iget v5, v15, Lcom/android/launcher3/model/data/y;->container:I

    .line 508
    .line 509
    invoke-virtual {v2, v5}, Lh1/c$a;->h(I)V

    .line 510
    .line 511
    .line 512
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 513
    .line 514
    .line 515
    move-result-object v5

    .line 516
    invoke-virtual {v5}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 517
    .line 518
    .line 519
    move-result-object v5

    .line 520
    invoke-virtual {v5, v0}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 521
    .line 522
    .line 523
    move-result-object v5

    .line 524
    new-instance v6, Ljava/lang/StringBuilder;

    .line 525
    .line 526
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 527
    .line 528
    .line 529
    iget v10, v5, Landroid/graphics/Point;->x:I

    .line 530
    .line 531
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 532
    .line 533
    .line 534
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    .line 536
    .line 537
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 538
    .line 539
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 543
    .line 544
    .line 545
    move-result-object v5

    .line 546
    invoke-virtual {v2, v5}, Lh1/c$a;->m(Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    :goto_10
    move/from16 v2, v16

    .line 553
    .line 554
    move-object/from16 v10, v18

    .line 555
    .line 556
    move-object/from16 v6, v19

    .line 557
    .line 558
    move/from16 v12, v21

    .line 559
    .line 560
    goto/16 :goto_1

    .line 561
    .line 562
    :cond_19
    move-object/from16 v19, v6

    .line 563
    .line 564
    invoke-virtual {v8}, Lcom/android/launcher3/util/z0;->isEmpty()Z

    .line 565
    .line 566
    .line 567
    move-result v2

    .line 568
    if-eqz v2, :cond_1a

    .line 569
    .line 570
    const/4 v2, 0x0

    .line 571
    invoke-virtual {v8, v2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 572
    .line 573
    .line 574
    goto :goto_11

    .line 575
    :cond_1a
    const/4 v2, 0x0

    .line 576
    :goto_11
    invoke-virtual {v4, v13}, Lh1/c$b;->c(I)V

    .line 577
    .line 578
    .line 579
    invoke-virtual {v8}, Lcom/android/launcher3/util/z0;->size()I

    .line 580
    .line 581
    .line 582
    move-result v6

    .line 583
    invoke-virtual {v4, v6}, Lh1/c$b;->p(I)V

    .line 584
    .line 585
    .line 586
    iget-object v6, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 587
    .line 588
    invoke-virtual {v6}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 589
    .line 590
    .line 591
    move-result-object v6

    .line 592
    new-instance v8, Lh1/b;

    .line 593
    .line 594
    invoke-direct {v8}, Lh1/b;-><init>()V

    .line 595
    .line 596
    .line 597
    invoke-interface {v6, v8}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 598
    .line 599
    .line 600
    move-result-object v6

    .line 601
    invoke-interface {v6}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 602
    .line 603
    .line 604
    move-result-object v6

    .line 605
    iget-object v3, v3, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 606
    .line 607
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 608
    .line 609
    .line 610
    move-result-object v3

    .line 611
    sget-object v8, Lz1/r3;->a:Ljava/util/function/Predicate;

    .line 612
    .line 613
    invoke-interface {v3, v8}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 614
    .line 615
    .line 616
    move-result-object v3

    .line 617
    invoke-interface {v3}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 618
    .line 619
    .line 620
    move-result-object v3

    .line 621
    if-eqz v14, :cond_1b

    .line 622
    .line 623
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 624
    .line 625
    .line 626
    move-result v6

    .line 627
    const/16 v17, 0x1

    .line 628
    .line 629
    add-int/lit8 v6, v6, -0x1

    .line 630
    .line 631
    goto :goto_12

    .line 632
    :cond_1b
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 633
    .line 634
    .line 635
    move-result v6

    .line 636
    :goto_12
    invoke-virtual {v4, v6}, Lh1/c$b;->l(I)V

    .line 637
    .line 638
    .line 639
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 640
    .line 641
    .line 642
    move-result v3

    .line 643
    invoke-virtual {v4, v3}, Lh1/c$b;->v(I)V

    .line 644
    .line 645
    .line 646
    invoke-virtual {v4, v9}, Lh1/c$b;->k(Ljava/util/ArrayList;)V

    .line 647
    .line 648
    .line 649
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 654
    .line 655
    .line 656
    move-result-object v3

    .line 657
    invoke-virtual {v3, v0}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 658
    .line 659
    .line 660
    move-result-object v3

    .line 661
    new-instance v6, Ljava/lang/StringBuilder;

    .line 662
    .line 663
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 664
    .line 665
    .line 666
    iget v8, v3, Landroid/graphics/Point;->x:I

    .line 667
    .line 668
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 669
    .line 670
    .line 671
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 672
    .line 673
    .line 674
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 675
    .line 676
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 677
    .line 678
    .line 679
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 680
    .line 681
    .line 682
    move-result-object v3

    .line 683
    invoke-virtual {v4, v3}, Lh1/c$b;->i(Ljava/lang/String;)V

    .line 684
    .line 685
    .line 686
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 687
    .line 688
    .line 689
    move-result-object v3

    .line 690
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 691
    .line 692
    .line 693
    move-result-object v3

    .line 694
    iget v3, v3, Lcom/android/launcher3/r4;->q:I

    .line 695
    .line 696
    invoke-virtual {v4, v3}, Lh1/c$b;->j(I)V

    .line 697
    .line 698
    .line 699
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 700
    .line 701
    .line 702
    move-result-object v3

    .line 703
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 704
    .line 705
    .line 706
    move-result-object v3

    .line 707
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->p:Z

    .line 708
    .line 709
    invoke-virtual {v4, v3}, Lh1/c$b;->d(Z)V

    .line 710
    .line 711
    .line 712
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 713
    .line 714
    .line 715
    move-result-object v3

    .line 716
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 717
    .line 718
    .line 719
    move-result-object v3

    .line 720
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->s:Z

    .line 721
    .line 722
    invoke-virtual {v4, v3}, Lh1/c$b;->w(Z)V

    .line 723
    .line 724
    .line 725
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 726
    .line 727
    .line 728
    move-result-object v3

    .line 729
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 730
    .line 731
    .line 732
    move-result v3

    .line 733
    if-eqz v3, :cond_1c

    .line 734
    .line 735
    const v3, 0x7f14015b

    .line 736
    .line 737
    .line 738
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 739
    .line 740
    .line 741
    move-result-object v3

    .line 742
    goto :goto_13

    .line 743
    :cond_1c
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 744
    .line 745
    .line 746
    move-result-object v3

    .line 747
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 748
    .line 749
    .line 750
    move-result v3

    .line 751
    if-eqz v3, :cond_1d

    .line 752
    .line 753
    const v3, 0x7f14015d

    .line 754
    .line 755
    .line 756
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 757
    .line 758
    .line 759
    move-result-object v3

    .line 760
    goto :goto_13

    .line 761
    :cond_1d
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 762
    .line 763
    .line 764
    move-result-object v3

    .line 765
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->u()Z

    .line 766
    .line 767
    .line 768
    move-result v3

    .line 769
    if-eqz v3, :cond_1e

    .line 770
    .line 771
    const v3, 0x7f14015e

    .line 772
    .line 773
    .line 774
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 775
    .line 776
    .line 777
    move-result-object v3

    .line 778
    goto :goto_13

    .line 779
    :cond_1e
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 780
    .line 781
    .line 782
    move-result-object v3

    .line 783
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->x()Z

    .line 784
    .line 785
    .line 786
    move-result v3

    .line 787
    if-eqz v3, :cond_1f

    .line 788
    .line 789
    const v3, 0x7f14015f

    .line 790
    .line 791
    .line 792
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object v3

    .line 796
    goto :goto_13

    .line 797
    :cond_1f
    const v3, 0x7f14015c

    .line 798
    .line 799
    .line 800
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 801
    .line 802
    .line 803
    move-result-object v3

    .line 804
    :goto_13
    invoke-virtual {v4, v3}, Lh1/c$b;->m(Ljava/lang/String;)V

    .line 805
    .line 806
    .line 807
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 808
    .line 809
    .line 810
    move-result-object v3

    .line 811
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 812
    .line 813
    .line 814
    move-result-object v3

    .line 815
    invoke-virtual {v3}, Lcom/android/launcher3/menu/c;->i()Ljava/lang/String;

    .line 816
    .line 817
    .line 818
    move-result-object v3

    .line 819
    invoke-virtual {v4, v3}, Lh1/c$b;->o(Ljava/lang/String;)V

    .line 820
    .line 821
    .line 822
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 823
    .line 824
    .line 825
    move-result-object v3

    .line 826
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 827
    .line 828
    .line 829
    move-result-object v3

    .line 830
    invoke-virtual {v3}, Lx1/Z;->d()Landroid/util/Pair;

    .line 831
    .line 832
    .line 833
    move-result-object v3

    .line 834
    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 835
    .line 836
    check-cast v3, Ljava/lang/Integer;

    .line 837
    .line 838
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 839
    .line 840
    .line 841
    move-result v3

    .line 842
    invoke-virtual {v4, v3}, Lh1/c$b;->h(I)V

    .line 843
    .line 844
    .line 845
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 846
    .line 847
    .line 848
    move-result-object v3

    .line 849
    const v6, 0x7f1403b1

    .line 850
    .line 851
    .line 852
    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 853
    .line 854
    .line 855
    move-result-object v6

    .line 856
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 857
    .line 858
    .line 859
    move-result-object v8

    .line 860
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 861
    .line 862
    .line 863
    move-result-object v8

    .line 864
    iget-boolean v8, v8, Lcom/android/launcher3/r4;->j:Z

    .line 865
    .line 866
    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 867
    .line 868
    .line 869
    move-result v3

    .line 870
    invoke-virtual {v4, v3}, Lh1/c$b;->t(Z)V

    .line 871
    .line 872
    .line 873
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 874
    .line 875
    .line 876
    move-result-object v3

    .line 877
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 878
    .line 879
    .line 880
    move-result-object v3

    .line 881
    sget-object v6, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 882
    .line 883
    invoke-virtual {v3, v6}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 884
    .line 885
    .line 886
    move-result v3

    .line 887
    if-eqz v3, :cond_20

    .line 888
    .line 889
    const v3, 0x7f140163

    .line 890
    .line 891
    .line 892
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 893
    .line 894
    .line 895
    move-result-object v3

    .line 896
    goto :goto_14

    .line 897
    :cond_20
    const v3, 0x7f140162

    .line 898
    .line 899
    .line 900
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 901
    .line 902
    .line 903
    move-result-object v3

    .line 904
    :goto_14
    invoke-virtual {v4, v3}, Lh1/c$b;->u(Ljava/lang/String;)V

    .line 905
    .line 906
    .line 907
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 908
    .line 909
    .line 910
    move-result-object v3

    .line 911
    const v6, 0x7f1403b7

    .line 912
    .line 913
    .line 914
    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object v6

    .line 918
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 919
    .line 920
    .line 921
    move-result-object v8

    .line 922
    invoke-virtual {v8}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 923
    .line 924
    .line 925
    move-result-object v8

    .line 926
    iget v8, v8, Lcom/android/launcher3/r4;->o0:I

    .line 927
    .line 928
    invoke-interface {v3, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 929
    .line 930
    .line 931
    move-result v3

    .line 932
    const/4 v10, 0x1

    .line 933
    if-ne v3, v10, :ls_stack_data_non_normal

    .line 934
    .line 935
    const v3, 0x7f140161

    .line 936
    .line 937
    .line 938
    goto :goto_15

    :ls_stack_data_non_normal
    const/4 v10, 0x3

    if-ne v3, v10, :cond_21

    const v3, 0x7f1404b6

    const/4 v10, 0x1

    goto :goto_15

    .line 939
    :cond_21
    const/4 v10, 0x1

    const v3, 0x7f140160

    .line 940
    .line 941
    .line 942
    :goto_15
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 943
    .line 944
    .line 945
    move-result-object v3

    .line 946
    invoke-virtual {v4, v3}, Lh1/c$b;->q(Ljava/lang/String;)V

    .line 947
    .line 948
    .line 949
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 950
    .line 951
    .line 952
    move-result-object v3

    .line 953
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 954
    .line 955
    .line 956
    move-result-object v3

    .line 957
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->h:Z

    .line 958
    .line 959
    invoke-virtual {v4, v3}, Lh1/c$b;->r(Z)V

    .line 960
    .line 961
    .line 962
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 963
    .line 964
    .line 965
    move-result-object v3

    .line 966
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 967
    .line 968
    .line 969
    move-result-object v3

    .line 970
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->t:Z

    .line 971
    .line 972
    invoke-virtual {v4, v3}, Lh1/c$b;->e(Z)V

    .line 973
    .line 974
    .line 975
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 976
    .line 977
    .line 978
    move-result-object v3

    .line 979
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 980
    .line 981
    .line 982
    move-result-object v3

    .line 983
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->k:Z

    .line 984
    .line 985
    invoke-virtual {v4, v3}, Lh1/c$b;->n(Z)V

    .line 986
    .line 987
    .line 988
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 989
    .line 990
    .line 991
    move-result-object v3

    .line 992
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 993
    .line 994
    .line 995
    move-result-object v3

    .line 996
    iget-boolean v3, v3, Lcom/android/launcher3/r4;->u:Z

    .line 997
    .line 998
    invoke-virtual {v4, v3}, Lh1/c$b;->s(Z)V

    .line 999
    .line 1000
    .line 1001
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1002
    .line 1003
    .line 1004
    move-result-object v3

    .line 1005
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v3

    .line 1009
    invoke-virtual {v3}, Lcom/android/launcher3/H5;->D()Ljava/lang/String;

    .line 1010
    .line 1011
    .line 1012
    move-result-object v3

    .line 1013
    invoke-virtual {v4, v3}, Lh1/c$b;->g(Ljava/lang/String;)V

    .line 1014
    .line 1015
    .line 1016
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v0

    .line 1020
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v0

    .line 1024
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->l:Z

    .line 1025
    .line 1026
    invoke-virtual {v4, v0}, Lh1/c$b;->f(Z)V

    .line 1027
    .line 1028
    .line 1029
    invoke-virtual {v4}, Lh1/c$b;->a()Ljava/lang/String;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    invoke-virtual {v4}, Lh1/c$b;->b()Ljava/lang/String;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v3

    .line 1037
    invoke-static {v0, v3}, Lh1/a;->z(Ljava/lang/String;Ljava/lang/String;)V

    .line 1038
    .line 1039
    .line 1040
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    .line 1041
    .line 1042
    .line 1043
    move-result v0

    .line 1044
    if-nez v0, :cond_22

    .line 1045
    .line 1046
    invoke-static {v5, v5}, Lh1/a;->A(Ljava/lang/String;Ljava/lang/String;)V

    .line 1047
    .line 1048
    .line 1049
    goto :goto_17

    .line 1050
    :cond_22
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1051
    .line 1052
    .line 1053
    move-result-object v0

    .line 1054
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1055
    .line 1056
    .line 1057
    move-result v3

    .line 1058
    if-eqz v3, :cond_23

    .line 1059
    .line 1060
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1061
    .line 1062
    .line 1063
    move-result-object v3

    .line 1064
    check-cast v3, Lh1/c$c;

    .line 1065
    .line 1066
    invoke-virtual {v3}, Lh1/c$c;->a()Ljava/lang/String;

    .line 1067
    .line 1068
    .line 1069
    move-result-object v4

    .line 1070
    invoke-virtual {v3}, Lh1/c$c;->b()Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v3

    .line 1074
    invoke-static {v4, v3}, Lh1/a;->A(Ljava/lang/String;Ljava/lang/String;)V

    .line 1075
    .line 1076
    .line 1077
    goto :goto_16

    .line 1078
    :cond_23
    :goto_17
    const/4 v0, 0x7

    .line 1079
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    .line 1080
    .line 1081
    .line 1082
    move-result v0

    .line 1083
    const/4 v1, 0x3

    .line 1084
    if-ne v1, v0, :cond_26

    .line 1085
    .line 1086
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v0

    .line 1090
    if-eqz v0, :cond_24

    .line 1091
    .line 1092
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 1093
    .line 1094
    .line 1095
    move-result-object v0

    .line 1096
    invoke-virtual {v0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v0

    .line 1100
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 1101
    .line 1102
    check-cast v0, Ljava/lang/Integer;

    .line 1103
    .line 1104
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 1105
    .line 1106
    .line 1107
    move-result v11

    .line 1108
    goto :goto_18

    .line 1109
    :cond_24
    move v11, v2

    .line 1110
    :goto_18
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1111
    .line 1112
    .line 1113
    move-result-object v0

    .line 1114
    :cond_25
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 1115
    .line 1116
    .line 1117
    move-result v1

    .line 1118
    if-eqz v1, :cond_26

    .line 1119
    .line 1120
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1121
    .line 1122
    .line 1123
    move-result-object v1

    .line 1124
    check-cast v1, Lh1/c$a;

    .line 1125
    .line 1126
    invoke-virtual {v1}, Lh1/c$a;->a()I

    .line 1127
    .line 1128
    .line 1129
    move-result v2

    .line 1130
    if-eq v2, v12, :cond_25

    .line 1131
    .line 1132
    invoke-virtual {v1}, Lh1/c$a;->b()I

    .line 1133
    .line 1134
    .line 1135
    move-result v2

    .line 1136
    if-ne v2, v11, :cond_25

    .line 1137
    .line 1138
    invoke-virtual {v1}, Lh1/c$a;->c()Ljava/lang/String;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v2

    .line 1142
    invoke-virtual {v1}, Lh1/c$a;->d()Ljava/lang/String;

    .line 1143
    .line 1144
    .line 1145
    move-result-object v1

    .line 1146
    invoke-static {v2, v1}, Lh1/a;->y(Ljava/lang/String;Ljava/lang/String;)V

    .line 1147
    .line 1148
    .line 1149
    goto :goto_19

    .line 1150
    :cond_26
    sput v16, Lh1/c;->a:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1151
    .line 1152
    return-void

    .line 1153
    :catch_0
    move-exception v0

    .line 1154
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1155
    .line 1156
    .line 1157
    :cond_27
    :goto_1a
    return-void
.end method
