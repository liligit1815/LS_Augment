.class public Lcom/android/launcher3/s$a;
.super Ljava/lang/Object;
.source "AutoInstallsLayout.java"

# interfaces
.implements Lcom/android/launcher3/s$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/s;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private c(Landroid/content/ComponentName;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v0, "android.intent.action.MAIN"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "android.intent.category.LAUNCHER"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/high16 p1, 0x10200000

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method


# virtual methods
.method public a(Landroid/content/res/XmlResourceParser;)I
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "/"

    .line 6
    .line 7
    const-string v3, "com.zte.aiassistant"

    .line 8
    .line 9
    const-string v4, "AutoInstalls"

    .line 10
    .line 11
    const-string v5, "packageName"

    .line 12
    .line 13
    invoke-static {v1, v5}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const-string v6, "className"

    .line 18
    .line 19
    invoke-static {v1, v6}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    iget-object v7, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 24
    .line 25
    invoke-static {v7, v1}, Lcom/android/launcher3/s;->b(Lcom/android/launcher3/s;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    if-nez v7, :cond_a

    .line 33
    .line 34
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    if-nez v7, :cond_a

    .line 39
    .line 40
    const/4 v7, -0x1

    .line 41
    :try_start_0
    iget-object v8, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 42
    .line 43
    invoke-virtual {v8, v5}, Lcom/android/launcher3/s;->j(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v8

    .line 47
    if-eqz v8, :cond_0

    .line 48
    .line 49
    return v7

    .line 50
    :cond_0
    const-string v8, ""

    .line 51
    .line 52
    new-instance v9, Landroid/content/ComponentName;

    .line 53
    .line 54
    invoke-direct {v9, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v9}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    .line 58
    .line 59
    .line 60
    move-result v10

    .line 61
    if-eqz v10, :cond_2

    .line 62
    .line 63
    iget-object v10, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 64
    .line 65
    iget-object v10, v10, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 66
    .line 67
    invoke-static {v10, v9}, Lcom/android/launcher3/N5;->B(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 68
    .line 69
    .line 70
    move-result v10

    .line 71
    if-nez v10, :cond_2

    .line 72
    .line 73
    iget-object v10, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 74
    .line 75
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 76
    .line 77
    const-string v11, "container"

    .line 78
    .line 79
    invoke-virtual {v10, v11}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v10

    .line 83
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    if-lez v10, :cond_1

    .line 88
    .line 89
    move-object/from16 v19, v9

    .line 90
    .line 91
    new-instance v9, Lcom/android/launcher3/H5$a;

    .line 92
    .line 93
    int-to-long v13, v10

    .line 94
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 95
    .line 96
    .line 97
    move-result-object v18

    .line 98
    iget-object v10, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 99
    .line 100
    iget-object v10, v10, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 101
    .line 102
    invoke-virtual {v10}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object v20

    .line 106
    const/4 v10, 0x0

    .line 107
    const/4 v11, 0x0

    .line 108
    const/4 v12, 0x0

    .line 109
    const/4 v15, 0x1

    .line 110
    const/16 v16, 0x1

    .line 111
    .line 112
    const/16 v17, 0x0

    .line 113
    .line 114
    invoke-direct/range {v9 .. v20}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    move-object/from16 v19, v9

    .line 119
    .line 120
    new-instance v9, Lcom/android/launcher3/H5$a;

    .line 121
    .line 122
    iget-object v11, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 123
    .line 124
    iget-object v11, v11, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 125
    .line 126
    const-string v12, "cellX"

    .line 127
    .line 128
    invoke-virtual {v11, v12}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v11

    .line 132
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    .line 133
    .line 134
    .line 135
    move-result v11

    .line 136
    iget-object v12, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 137
    .line 138
    iget-object v12, v12, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 139
    .line 140
    const-string v13, "cellY"

    .line 141
    .line 142
    invoke-virtual {v12, v13}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v12

    .line 146
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    .line 147
    .line 148
    .line 149
    move-result v12

    .line 150
    iget-object v13, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 151
    .line 152
    iget-object v13, v13, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 153
    .line 154
    const-string v14, "screen"

    .line 155
    .line 156
    invoke-virtual {v13, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v13

    .line 160
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    .line 161
    .line 162
    .line 163
    move-result v13

    .line 164
    int-to-long v14, v10

    .line 165
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 166
    .line 167
    .line 168
    move-result-object v18

    .line 169
    iget-object v10, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 170
    .line 171
    iget-object v10, v10, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 172
    .line 173
    invoke-virtual {v10}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object v20

    .line 177
    move v10, v11

    .line 178
    move v11, v12

    .line 179
    move v12, v13

    .line 180
    move-wide v13, v14

    .line 181
    const/4 v15, 0x1

    .line 182
    const/16 v16, 0x1

    .line 183
    .line 184
    const/16 v17, 0x0

    .line 185
    .line 186
    invoke-direct/range {v9 .. v20}, Lcom/android/launcher3/H5$a;-><init>(IIIJIIILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/content/Context;)V

    .line 187
    .line 188
    .line 189
    :goto_0
    iget-object v10, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 190
    .line 191
    iget-object v10, v10, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 192
    .line 193
    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 194
    .line 195
    .line 196
    move-result-object v10

    .line 197
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 198
    .line 199
    .line 200
    move-result-object v10

    .line 201
    invoke-virtual {v10, v9}, Lcom/android/launcher3/H5;->k1(Lcom/android/launcher3/H5$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 202
    .line 203
    .line 204
    :cond_2
    const/4 v9, 0x0

    .line 205
    const/4 v10, 0x0

    .line 206
    :try_start_1
    new-instance v11, Landroid/content/ComponentName;

    .line 207
    .line 208
    invoke-direct {v11, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-static {}, Lx1/O;->D0()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v12

    .line 215
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result v13

    .line 219
    if-nez v13, :cond_6

    .line 220
    .line 221
    invoke-static {v12}, Lx1/O;->l4(Ljava/lang/String;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object v12

    .line 225
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 226
    .line 227
    .line 228
    move-result-object v12

    .line 229
    :cond_3
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 230
    .line 231
    .line 232
    move-result v13

    .line 233
    if-eqz v13, :cond_6

    .line 234
    .line 235
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v13

    .line 239
    check-cast v13, Landroid/util/Pair;

    .line 240
    .line 241
    if-nez v13, :cond_4

    .line 242
    .line 243
    goto :goto_1

    .line 244
    :cond_4
    iget-object v14, v13, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 245
    .line 246
    check-cast v14, Landroid/content/ComponentName;

    .line 247
    .line 248
    iget-object v13, v13, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 249
    .line 250
    check-cast v13, Landroid/content/ComponentName;

    .line 251
    .line 252
    if-eqz v14, :cond_3

    .line 253
    .line 254
    if-nez v13, :cond_5

    .line 255
    .line 256
    goto :goto_1

    .line 257
    :cond_5
    invoke-virtual {v11}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v15

    .line 261
    invoke-virtual {v14}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v14

    .line 265
    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v14

    .line 269
    if-eqz v14, :cond_3

    .line 270
    .line 271
    iget-object v14, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 272
    .line 273
    iget-object v14, v14, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 274
    .line 275
    invoke-virtual {v13}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v15

    .line 279
    invoke-static {v14, v15}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 280
    .line 281
    .line 282
    move-result v14

    .line 283
    if-eqz v14, :cond_3

    .line 284
    .line 285
    new-instance v11, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 288
    .line 289
    .line 290
    const-string v14, "parseAndAdd: replaced by \uff1a"

    .line 291
    .line 292
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v11

    .line 302
    invoke-static {v4, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    .line 304
    .line 305
    move-object v11, v13

    .line 306
    goto :goto_1

    .line 307
    :cond_6
    invoke-static {}, Lx1/O;->l5()Z

    .line 308
    .line 309
    .line 310
    move-result v12

    .line 311
    if-eqz v12, :cond_7

    .line 312
    .line 313
    new-instance v12, Landroid/content/ComponentName;

    .line 314
    .line 315
    const-string v13, "com.zte.aiassistant.ui.activity.AIChatActivity"

    .line 316
    .line 317
    invoke-direct {v12, v3, v13}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    new-instance v13, Landroid/content/ComponentName;

    .line 321
    .line 322
    const-string v14, "com.zte.aiassistant.ui.activity.MainActivity"

    .line 323
    .line 324
    invoke-direct {v13, v3, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v11}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    invoke-virtual {v12}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v14

    .line 335
    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v3

    .line 339
    if-eqz v3, :cond_7

    .line 340
    .line 341
    new-instance v3, Ljava/lang/StringBuilder;

    .line 342
    .line 343
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 344
    .line 345
    .line 346
    const-string v11, "parseAndAdd: cm: "

    .line 347
    .line 348
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string v11, ", replaced by\uff1a"

    .line 355
    .line 356
    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v3

    .line 366
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    .line 368
    .line 369
    move-object v11, v13

    .line 370
    :cond_7
    iget-object v3, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 371
    .line 372
    iget-object v3, v3, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 373
    .line 374
    invoke-virtual {v3, v11, v10}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 375
    .line 376
    .line 377
    move-result-object v3
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 378
    goto :goto_2

    .line 379
    :catch_0
    :try_start_2
    iget-object v3, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 380
    .line 381
    iget-object v3, v3, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 382
    .line 383
    filled-new-array {v5}, [Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v11

    .line 387
    invoke-virtual {v3, v11}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v3

    .line 391
    new-instance v11, Landroid/content/ComponentName;

    .line 392
    .line 393
    aget-object v3, v3, v10

    .line 394
    .line 395
    invoke-direct {v11, v3, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    iget-object v3, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 399
    .line 400
    iget-object v3, v3, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 401
    .line 402
    invoke-virtual {v3, v11, v10}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 403
    .line 404
    .line 405
    move-result-object v3
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 406
    goto :goto_2

    .line 407
    :catch_1
    :try_start_3
    new-instance v11, Landroid/content/ComponentName;

    .line 408
    .line 409
    invoke-direct {v11, v5, v6}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    new-instance v3, Ljava/lang/StringBuilder;

    .line 413
    .line 414
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 415
    .line 416
    .line 417
    const-string v12, "parseAndAdd: getActivityInfo wrong"

    .line 418
    .line 419
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    .line 437
    .line 438
    move-object v3, v9

    .line 439
    :goto_2
    new-instance v12, Landroid/content/Intent;

    .line 440
    .line 441
    const-string v13, "android.intent.action.MAIN"

    .line 442
    .line 443
    invoke-direct {v12, v13, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 444
    .line 445
    .line 446
    const-string v9, "android.intent.category.LAUNCHER"

    .line 447
    .line 448
    invoke-virtual {v12, v9}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 449
    .line 450
    .line 451
    move-result-object v9

    .line 452
    invoke-virtual {v9, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 453
    .line 454
    .line 455
    move-result-object v9

    .line 456
    const/high16 v12, 0x10200000

    .line 457
    .line 458
    invoke-virtual {v9, v12}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 459
    .line 460
    .line 461
    move-result-object v15

    .line 462
    const-string v17, "1"

    .line 463
    .line 464
    const-string v18, "1"

    .line 465
    .line 466
    if-eqz v3, :cond_8

    .line 467
    .line 468
    iget-object v8, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 469
    .line 470
    iget-object v8, v8, Lcom/android/launcher3/s;->d:Landroid/content/pm/PackageManager;

    .line 471
    .line 472
    invoke-virtual {v3, v8}, Landroid/content/pm/ActivityInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 473
    .line 474
    .line 475
    move-result-object v8

    .line 476
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v8

    .line 480
    :cond_8
    iget-object v9, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 481
    .line 482
    iget-object v9, v9, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 483
    .line 484
    invoke-static {v9}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 485
    .line 486
    .line 487
    move-result-object v9

    .line 488
    invoke-virtual {v9, v11}, Lcom/android/launcher3/r4;->z(Landroid/content/ComponentName;)Z

    .line 489
    .line 490
    .line 491
    move-result v9

    .line 492
    if-eqz v9, :cond_9

    .line 493
    .line 494
    if-nez v3, :cond_9

    .line 495
    .line 496
    const-string v3, "title"

    .line 497
    .line 498
    invoke-static {v1, v3, v10}, Lcom/android/launcher3/s;->l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 499
    .line 500
    .line 501
    move-result v1

    .line 502
    if-eqz v1, :cond_9

    .line 503
    .line 504
    iget-object v3, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 505
    .line 506
    iget-object v3, v3, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 507
    .line 508
    invoke-interface {v3, v1}, Lcom/android/launcher3/s$h;->getString(I)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v8

    .line 512
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 513
    .line 514
    .line 515
    move-result-object v1

    .line 516
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 517
    .line 518
    .line 519
    move-result-object v3

    .line 520
    invoke-virtual {v1, v3, v8}, Lcom/android/launcher3/H5;->b1(Ljava/lang/String;Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    iget-object v1, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 524
    .line 525
    iget-object v1, v1, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 526
    .line 527
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    invoke-static {v1}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 532
    .line 533
    .line 534
    move-result-object v1

    .line 535
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v3

    .line 543
    invoke-interface {v1, v3, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 544
    .line 545
    .line 546
    move-result-object v1

    .line 547
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 548
    .line 549
    .line 550
    :cond_9
    move-object v14, v8

    .line 551
    iget-object v13, v0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 552
    .line 553
    const/16 v16, 0x0

    .line 554
    .line 555
    invoke-virtual/range {v13 .. v18}, Lcom/android/launcher3/s;->f(Ljava/lang/String;Landroid/content/Intent;ILjava/lang/String;Ljava/lang/String;)I

    .line 556
    .line 557
    .line 558
    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 559
    return v0

    .line 560
    :catch_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 561
    .line 562
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 563
    .line 564
    .line 565
    const-string v1, "Favorite not found: "

    .line 566
    .line 567
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    .line 569
    .line 570
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    .line 585
    .line 586
    return v7

    .line 587
    :cond_a
    invoke-virtual/range {p0 .. p1}, Lcom/android/launcher3/s$a;->d(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 588
    .line 589
    .line 590
    move-result v0

    .line 591
    return v0
.end method

.method public b(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 4

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "className"

    .line 8
    .line 9
    invoke-static {p1, v1}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "title"

    .line 14
    .line 15
    invoke-static {p1, v2}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-nez v3, :cond_0

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    new-instance p1, Landroid/content/ComponentName;

    .line 32
    .line 33
    invoke-direct {p1, v0, v1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, p1}, Lcom/android/launcher3/s$a;->c(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Lcom/android/launcher3/s$a;->a:Lcom/android/launcher3/s;

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p0, v2, p1, v0}, Lcom/android/launcher3/s;->e(Ljava/lang/String;Landroid/content/Intent;I)I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/s$a;->d(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    return p0
.end method

.method protected d(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 0

    .line 1
    const-string p0, "AutoInstalls"

    .line 2
    .line 3
    const-string p1, "Skipping invalid <favorite> with no component"

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    return p0
.end method
