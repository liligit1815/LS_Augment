.class public Lcom/android/launcher3/s$c;
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
    name = "c"
.end annotation


# instance fields
.field private final a:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic b:Lcom/android/launcher3/s;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/s;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/s;->n()Landroid/util/ArrayMap;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/s$c;-><init>(Lcom/android/launcher3/s;Landroid/util/ArrayMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/s;Landroid/util/ArrayMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/launcher3/s$i;",
            ">;)V"
        }
    .end annotation

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p2, p0, Lcom/android/launcher3/s$c;->a:Landroid/util/ArrayMap;

    return-void
.end method


# virtual methods
.method public a(Landroid/content/res/XmlResourceParser;)I
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "title"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/s;->l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    const-string v5, "AutoInstalls"

    .line 13
    .line 14
    if-eqz v4, :cond_1

    .line 15
    .line 16
    iget-object v7, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 17
    .line 18
    iget-object v7, v7, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 19
    .line 20
    invoke-interface {v7, v4}, Lcom/android/launcher3/s$h;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    iget-object v8, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 25
    .line 26
    iget-object v8, v8, Lcom/android/launcher3/s;->p:Landroid/content/res/Resources;

    .line 27
    .line 28
    if-eqz v8, :cond_0

    .line 29
    .line 30
    invoke-virtual {v8, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v4, "parseAndAdd mRes is null"

    .line 36
    .line 37
    invoke-static {v5, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 43
    .line 44
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 45
    .line 46
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const v7, 0x7f140176

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    const-string v4, "default_folder_name"

    .line 58
    .line 59
    :goto_0
    iget-object v8, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 60
    .line 61
    iget-object v8, v8, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 62
    .line 63
    invoke-virtual {v8, v2, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 69
    .line 70
    const/4 v8, 0x2

    .line 71
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    const-string v10, "itemType"

    .line 76
    .line 77
    invoke-virtual {v2, v10, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "spanX"

    .line 81
    .line 82
    invoke-static {v1, v2}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v10

    .line 90
    const-string v11, "1"

    .line 91
    .line 92
    if-eqz v10, :cond_2

    .line 93
    .line 94
    move-object v9, v11

    .line 95
    :cond_2
    const-string v10, "spanY"

    .line 96
    .line 97
    invoke-static {v1, v10}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v12

    .line 101
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    if-eqz v13, :cond_3

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    move-object v11, v12

    .line 109
    :goto_1
    new-instance v12, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v13, "innerGridX"

    .line 115
    .line 116
    invoke-static {v1, v13}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v14

    .line 120
    const-string v15, "innerGridY"

    .line 121
    .line 122
    invoke-static {v1, v15}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v16

    .line 130
    const-string v6, ";"

    .line 131
    .line 132
    const-string v8, ":"

    .line 133
    .line 134
    if-nez v16, :cond_4

    .line 135
    .line 136
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v16

    .line 140
    if-nez v16, :cond_4

    .line 141
    .line 142
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    :cond_4
    const-string v3, "backgroundColor"

    .line 167
    .line 168
    invoke-static {v1, v3}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v13

    .line 172
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    if-nez v14, :cond_5

    .line 177
    .line 178
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    const-string v6, "parseAndAdd XmlResourceParser: folder extra info: "

    .line 196
    .line 197
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v6, ", folder: "

    .line 204
    .line 205
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    iget-object v3, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 219
    .line 220
    iget-object v3, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 221
    .line 222
    const-string v6, "appWidgetProvider"

    .line 223
    .line 224
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v8

    .line 228
    invoke-virtual {v3, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v3, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 232
    .line 233
    iget-object v3, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 234
    .line 235
    invoke-virtual {v3, v2, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    iget-object v2, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 239
    .line 240
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 241
    .line 242
    invoke-virtual {v2, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    iget-object v2, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 246
    .line 247
    iget-object v3, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 248
    .line 249
    iget-object v2, v2, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 250
    .line 251
    invoke-interface {v2}, Lcom/android/launcher3/s$d;->c()I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    const-string v6, "_id"

    .line 260
    .line 261
    invoke-virtual {v3, v6, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 262
    .line 263
    .line 264
    iget-object v2, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 265
    .line 266
    iget-object v3, v2, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 267
    .line 268
    iget-object v8, v2, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 269
    .line 270
    iget-object v2, v2, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 271
    .line 272
    invoke-interface {v3, v8, v2}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    const/4 v3, -0x1

    .line 277
    if-gez v2, :cond_6

    .line 278
    .line 279
    const-string v0, "Unable to add folder"

    .line 280
    .line 281
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    .line 283
    .line 284
    return v3

    .line 285
    :cond_6
    iget-object v5, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 286
    .line 287
    iget-object v5, v5, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 288
    .line 289
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 290
    .line 291
    .line 292
    move-result-object v5

    .line 293
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 294
    .line 295
    .line 296
    move-result-object v5

    .line 297
    const/4 v8, 0x1

    .line 298
    invoke-virtual {v5, v2, v8, v4}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 299
    .line 300
    .line 301
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 302
    .line 303
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 304
    .line 305
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    const v5, 0x7f1403e6

    .line 310
    .line 311
    .line 312
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    const/4 v5, 0x3

    .line 321
    if-eqz v4, :cond_7

    .line 322
    .line 323
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 324
    .line 325
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 326
    .line 327
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v6

    .line 331
    invoke-static {v4, v6, v8}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 332
    .line 333
    .line 334
    goto/16 :goto_3

    .line 335
    .line 336
    :cond_7
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 337
    .line 338
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 339
    .line 340
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    const v9, 0x7f1403e4

    .line 345
    .line 346
    .line 347
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v4

    .line 351
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v4

    .line 355
    if-eqz v4, :cond_8

    .line 356
    .line 357
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 358
    .line 359
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 360
    .line 361
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v6

    .line 365
    const/4 v7, 0x2

    .line 366
    invoke-static {v4, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 367
    .line 368
    .line 369
    goto/16 :goto_3

    .line 370
    .line 371
    :cond_8
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 372
    .line 373
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 374
    .line 375
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    const v9, 0x7f1403ea

    .line 380
    .line 381
    .line 382
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    move-result v4

    .line 390
    if-eqz v4, :cond_a

    .line 391
    .line 392
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 393
    .line 394
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 395
    .line 396
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 397
    .line 398
    .line 399
    move-result-object v4

    .line 400
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 401
    .line 402
    .line 403
    move-result-object v4

    .line 404
    iget-boolean v4, v4, Lcom/android/launcher3/r4;->I:Z

    .line 405
    .line 406
    iget-object v7, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 407
    .line 408
    iget-object v9, v7, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 409
    .line 410
    invoke-virtual {v9, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 411
    .line 412
    .line 413
    move-result-object v6

    .line 414
    if-eqz v4, :cond_9

    .line 415
    .line 416
    const/4 v4, 0x7

    .line 417
    goto :goto_2

    .line 418
    :cond_9
    move v4, v5

    .line 419
    :goto_2
    invoke-static {v7, v6, v4}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 420
    .line 421
    .line 422
    goto/16 :goto_3

    .line 423
    .line 424
    :cond_a
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 425
    .line 426
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 427
    .line 428
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 429
    .line 430
    .line 431
    move-result-object v4

    .line 432
    const v9, 0x7f1403f8

    .line 433
    .line 434
    .line 435
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v4

    .line 439
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 440
    .line 441
    .line 442
    move-result v4

    .line 443
    if-eqz v4, :cond_b

    .line 444
    .line 445
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 446
    .line 447
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 448
    .line 449
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v6

    .line 453
    const/4 v7, 0x4

    .line 454
    invoke-static {v4, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 455
    .line 456
    .line 457
    goto :goto_3

    .line 458
    :cond_b
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 459
    .line 460
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 461
    .line 462
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    const v9, 0x7f1403e2

    .line 467
    .line 468
    .line 469
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 470
    .line 471
    .line 472
    move-result-object v4

    .line 473
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 474
    .line 475
    .line 476
    move-result v4

    .line 477
    if-eqz v4, :cond_c

    .line 478
    .line 479
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 480
    .line 481
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 482
    .line 483
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v6

    .line 487
    const/4 v7, 0x6

    .line 488
    invoke-static {v4, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 489
    .line 490
    .line 491
    goto :goto_3

    .line 492
    :cond_c
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 493
    .line 494
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 495
    .line 496
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 497
    .line 498
    .line 499
    move-result-object v4

    .line 500
    const v9, 0x7f1403e7

    .line 501
    .line 502
    .line 503
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 504
    .line 505
    .line 506
    move-result-object v4

    .line 507
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    if-eqz v4, :cond_d

    .line 512
    .line 513
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 514
    .line 515
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 516
    .line 517
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 518
    .line 519
    .line 520
    move-result-object v6

    .line 521
    const/16 v7, 0x8

    .line 522
    .line 523
    invoke-static {v4, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 524
    .line 525
    .line 526
    goto :goto_3

    .line 527
    :cond_d
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 528
    .line 529
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 530
    .line 531
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 532
    .line 533
    .line 534
    move-result-object v4

    .line 535
    const v9, 0x7f1403f5

    .line 536
    .line 537
    .line 538
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 539
    .line 540
    .line 541
    move-result-object v4

    .line 542
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 543
    .line 544
    .line 545
    move-result v4

    .line 546
    if-eqz v4, :cond_e

    .line 547
    .line 548
    iget-object v4, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 549
    .line 550
    iget-object v7, v4, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 551
    .line 552
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    move-result-object v6

    .line 556
    const/16 v7, 0x9

    .line 557
    .line 558
    invoke-static {v4, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 559
    .line 560
    .line 561
    :cond_e
    :goto_3
    new-instance v4, Landroid/content/ContentValues;

    .line 562
    .line 563
    iget-object v6, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 564
    .line 565
    iget-object v6, v6, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 566
    .line 567
    invoke-direct {v4, v6}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 568
    .line 569
    .line 570
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 571
    .line 572
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 573
    .line 574
    .line 575
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 576
    .line 577
    .line 578
    move-result v7

    .line 579
    const/4 v9, 0x0

    .line 580
    :cond_f
    :goto_4
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->next()I

    .line 581
    .line 582
    .line 583
    move-result v10

    .line 584
    const-string v11, "container"

    .line 585
    .line 586
    if-ne v10, v5, :cond_10

    .line 587
    .line 588
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getDepth()I

    .line 589
    .line 590
    .line 591
    move-result v12

    .line 592
    if-le v12, v7, :cond_11

    .line 593
    .line 594
    :cond_10
    const/4 v12, 0x0

    .line 595
    const/4 v13, 0x0

    .line 596
    const/4 v14, 0x2

    .line 597
    goto :goto_5

    .line 598
    :cond_11
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 599
    .line 600
    .line 601
    move-result v1

    .line 602
    const/4 v7, 0x2

    .line 603
    if-ge v1, v7, :cond_13

    .line 604
    .line 605
    iget-object v1, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 606
    .line 607
    iget-object v1, v1, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 608
    .line 609
    sget-object v5, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 610
    .line 611
    invoke-static {v2}, LE1/a;->c(I)Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v2

    .line 615
    const/4 v7, 0x0

    .line 616
    invoke-virtual {v1, v5, v2, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 617
    .line 618
    .line 619
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 620
    .line 621
    .line 622
    move-result v1

    .line 623
    if-ne v1, v8, :cond_12

    .line 624
    .line 625
    new-instance v1, Landroid/content/ContentValues;

    .line 626
    .line 627
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 628
    .line 629
    .line 630
    invoke-static {v4, v1, v11}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    const-string v2, "screen"

    .line 634
    .line 635
    invoke-static {v4, v1, v2}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 636
    .line 637
    .line 638
    const-string v2, "cellX"

    .line 639
    .line 640
    invoke-static {v4, v1, v2}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 641
    .line 642
    .line 643
    const-string v2, "cellY"

    .line 644
    .line 645
    invoke-static {v4, v1, v2}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 646
    .line 647
    .line 648
    const/4 v12, 0x0

    .line 649
    invoke-virtual {v6, v12}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 650
    .line 651
    .line 652
    move-result v2

    .line 653
    iget-object v0, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 654
    .line 655
    iget-object v0, v0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 656
    .line 657
    sget-object v3, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 658
    .line 659
    new-instance v4, Ljava/lang/StringBuilder;

    .line 660
    .line 661
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 662
    .line 663
    .line 664
    const-string v5, "_id="

    .line 665
    .line 666
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    .line 668
    .line 669
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v4

    .line 676
    const/4 v13, 0x0

    .line 677
    invoke-virtual {v0, v3, v1, v4, v13}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 678
    .line 679
    .line 680
    return v2

    .line 681
    :cond_12
    return v3

    .line 682
    :cond_13
    return v2

    .line 683
    :goto_5
    if-eq v10, v14, :cond_14

    .line 684
    .line 685
    goto :goto_4

    .line 686
    :cond_14
    iget-object v10, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 687
    .line 688
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 689
    .line 690
    invoke-virtual {v10}, Landroid/content/ContentValues;->clear()V

    .line 691
    .line 692
    .line 693
    iget-object v10, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 694
    .line 695
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 696
    .line 697
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 698
    .line 699
    .line 700
    move-result-object v15

    .line 701
    invoke-virtual {v10, v11, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 702
    .line 703
    .line 704
    iget-object v10, v0, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 705
    .line 706
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 707
    .line 708
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 709
    .line 710
    .line 711
    move-result-object v11

    .line 712
    const-string v15, "rank"

    .line 713
    .line 714
    invoke-virtual {v10, v15, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 715
    .line 716
    .line 717
    iget-object v10, v0, Lcom/android/launcher3/s$c;->a:Landroid/util/ArrayMap;

    .line 718
    .line 719
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object v11

    .line 723
    invoke-virtual {v10, v11}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object v10

    .line 727
    check-cast v10, Lcom/android/launcher3/s$i;

    .line 728
    .line 729
    if-eqz v10, :cond_15

    .line 730
    .line 731
    invoke-interface {v10, v1}, Lcom/android/launcher3/s$i;->a(Landroid/content/res/XmlResourceParser;)I

    .line 732
    .line 733
    .line 734
    move-result v10

    .line 735
    if-ltz v10, :cond_f

    .line 736
    .line 737
    invoke-virtual {v6, v10}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 738
    .line 739
    .line 740
    add-int/lit8 v9, v9, 0x1

    .line 741
    .line 742
    goto/16 :goto_4

    .line 743
    .line 744
    :cond_15
    new-instance v0, Ljava/lang/RuntimeException;

    .line 745
    .line 746
    new-instance v2, Ljava/lang/StringBuilder;

    .line 747
    .line 748
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 749
    .line 750
    .line 751
    const-string v3, "Invalid folder item "

    .line 752
    .line 753
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 754
    .line 755
    .line 756
    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->getName()Ljava/lang/String;

    .line 757
    .line 758
    .line 759
    move-result-object v1

    .line 760
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 761
    .line 762
    .line 763
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 764
    .line 765
    .line 766
    move-result-object v1

    .line 767
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 768
    .line 769
    .line 770
    throw v0
.end method

.method public b(Lorg/xmlpull/v1/XmlPullParser;)I
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v3, "title"

    .line 6
    .line 7
    const-string v4, "AutoInstalls"

    .line 8
    .line 9
    const/4 v5, 0x0

    .line 10
    :try_start_0
    invoke-static {v2, v3, v5}, Lcom/android/launcher3/s;->l(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v7, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 17
    .line 18
    iget-object v7, v7, Lcom/android/launcher3/s;->e:Lcom/android/launcher3/s$h;

    .line 19
    .line 20
    invoke-interface {v7, v0}, Lcom/android/launcher3/s$h;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    iget-object v8, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 25
    .line 26
    iget-object v8, v8, Lcom/android/launcher3/s;->p:Landroid/content/res/Resources;

    .line 27
    .line 28
    if-eqz v8, :cond_0

    .line 29
    .line 30
    invoke-virtual {v8, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_1

    .line 35
    :catch_0
    move-exception v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string v0, "parseAndAdd mRes is null"

    .line 38
    .line 39
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const v7, 0x7f140176

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    const-string v0, "default_folder_name"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :goto_0
    invoke-static {v2, v3}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    new-instance v8, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v9, "FolderParser parseAndAdd  XmlPullParser error, titleResName: "

    .line 72
    .line 73
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v9, " e:"

    .line 80
    .line 81
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-object v0, v7

    .line 99
    :goto_1
    iget-object v8, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 100
    .line 101
    iget-object v8, v8, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 102
    .line 103
    invoke-virtual {v8, v3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v3, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 107
    .line 108
    iget-object v3, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 109
    .line 110
    const/4 v8, 0x2

    .line 111
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    const-string v10, "itemType"

    .line 116
    .line 117
    invoke-virtual {v3, v10, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 118
    .line 119
    .line 120
    const-string v3, "spanX"

    .line 121
    .line 122
    invoke-static {v2, v3}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v9

    .line 126
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v10

    .line 130
    const-string v11, "1"

    .line 131
    .line 132
    if-eqz v10, :cond_2

    .line 133
    .line 134
    move-object v9, v11

    .line 135
    :cond_2
    const-string v10, "spanY"

    .line 136
    .line 137
    invoke-static {v2, v10}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v12

    .line 141
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v13

    .line 145
    if-eqz v13, :cond_3

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_3
    move-object v11, v12

    .line 149
    :goto_2
    new-instance v12, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v13, "innerGridX"

    .line 155
    .line 156
    invoke-static {v2, v13}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    const-string v15, "innerGridY"

    .line 161
    .line 162
    invoke-static {v2, v15}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 167
    .line 168
    .line 169
    move-result v16

    .line 170
    const-string v6, ";"

    .line 171
    .line 172
    const-string v8, ":"

    .line 173
    .line 174
    if-nez v16, :cond_4

    .line 175
    .line 176
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result v16

    .line 180
    if-nez v16, :cond_4

    .line 181
    .line 182
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    :cond_4
    const-string v5, "backgroundColor"

    .line 207
    .line 208
    invoke-static {v2, v5}, Lcom/android/launcher3/s;->m(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v13

    .line 212
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result v14

    .line 216
    if-nez v14, :cond_5

    .line 217
    .line 218
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .line 234
    .line 235
    const-string v6, "parseAndAdd XmlPullParser: folder extra info: "

    .line 236
    .line 237
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v6, ", folder: "

    .line 244
    .line 245
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v5

    .line 255
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    .line 257
    .line 258
    iget-object v5, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 259
    .line 260
    iget-object v5, v5, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 261
    .line 262
    const-string v6, "appWidgetProvider"

    .line 263
    .line 264
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v8

    .line 268
    invoke-virtual {v5, v6, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object v5, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 272
    .line 273
    iget-object v5, v5, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 274
    .line 275
    invoke-virtual {v5, v3, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v3, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 279
    .line 280
    iget-object v3, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 281
    .line 282
    invoke-virtual {v3, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    iget-object v3, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 286
    .line 287
    iget-object v5, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 288
    .line 289
    iget-object v3, v3, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 290
    .line 291
    invoke-interface {v3}, Lcom/android/launcher3/s$d;->c()I

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    const-string v6, "_id"

    .line 300
    .line 301
    invoke-virtual {v5, v6, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 302
    .line 303
    .line 304
    iget-object v3, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 305
    .line 306
    iget-object v5, v3, Lcom/android/launcher3/s;->c:Lcom/android/launcher3/s$d;

    .line 307
    .line 308
    iget-object v8, v3, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 309
    .line 310
    iget-object v3, v3, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 311
    .line 312
    invoke-interface {v5, v8, v3}, Lcom/android/launcher3/s$d;->b(Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)I

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    const/4 v5, -0x1

    .line 317
    if-gez v3, :cond_6

    .line 318
    .line 319
    const-string v0, "Unable to add folder"

    .line 320
    .line 321
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    .line 323
    .line 324
    return v5

    .line 325
    :cond_6
    iget-object v4, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 326
    .line 327
    iget-object v4, v4, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 328
    .line 329
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 330
    .line 331
    .line 332
    move-result-object v4

    .line 333
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    const/4 v8, 0x1

    .line 338
    invoke-virtual {v4, v3, v8, v0}, Lcom/android/launcher3/H5;->p1(IILjava/lang/String;)V

    .line 339
    .line 340
    .line 341
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 342
    .line 343
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 344
    .line 345
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    const v4, 0x7f1403e6

    .line 350
    .line 351
    .line 352
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    const/4 v4, 0x3

    .line 361
    if-eqz v0, :cond_7

    .line 362
    .line 363
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 364
    .line 365
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 366
    .line 367
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object v6

    .line 371
    invoke-static {v0, v6, v8}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 372
    .line 373
    .line 374
    goto/16 :goto_4

    .line 375
    .line 376
    :cond_7
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 377
    .line 378
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 379
    .line 380
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    const v9, 0x7f1403e4

    .line 385
    .line 386
    .line 387
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    if-eqz v0, :cond_8

    .line 396
    .line 397
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 398
    .line 399
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 400
    .line 401
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v6

    .line 405
    const/4 v7, 0x2

    .line 406
    invoke-static {v0, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 407
    .line 408
    .line 409
    goto/16 :goto_4

    .line 410
    .line 411
    :cond_8
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 412
    .line 413
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 414
    .line 415
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    const v9, 0x7f1403ea

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    if-eqz v0, :cond_a

    .line 431
    .line 432
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 433
    .line 434
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 435
    .line 436
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->I:Z

    .line 441
    .line 442
    iget-object v7, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 443
    .line 444
    iget-object v9, v7, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 445
    .line 446
    invoke-virtual {v9, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v6

    .line 450
    if-eqz v0, :cond_9

    .line 451
    .line 452
    const/4 v0, 0x7

    .line 453
    goto :goto_3

    .line 454
    :cond_9
    move v0, v4

    .line 455
    :goto_3
    invoke-static {v7, v6, v0}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 456
    .line 457
    .line 458
    goto/16 :goto_4

    .line 459
    .line 460
    :cond_a
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 461
    .line 462
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 463
    .line 464
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    const v9, 0x7f1403f8

    .line 469
    .line 470
    .line 471
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    move-result v0

    .line 479
    if-eqz v0, :cond_b

    .line 480
    .line 481
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 482
    .line 483
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 484
    .line 485
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v6

    .line 489
    const/4 v7, 0x4

    .line 490
    invoke-static {v0, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 491
    .line 492
    .line 493
    goto :goto_4

    .line 494
    :cond_b
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 495
    .line 496
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 497
    .line 498
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    const v9, 0x7f1403e2

    .line 503
    .line 504
    .line 505
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    if-eqz v0, :cond_c

    .line 514
    .line 515
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 516
    .line 517
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 518
    .line 519
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v6

    .line 523
    const/4 v7, 0x6

    .line 524
    invoke-static {v0, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 525
    .line 526
    .line 527
    goto :goto_4

    .line 528
    :cond_c
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 529
    .line 530
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 531
    .line 532
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    const v9, 0x7f1403e7

    .line 537
    .line 538
    .line 539
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 544
    .line 545
    .line 546
    move-result v0

    .line 547
    if-eqz v0, :cond_d

    .line 548
    .line 549
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 550
    .line 551
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 552
    .line 553
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 554
    .line 555
    .line 556
    move-result-object v6

    .line 557
    const/16 v7, 0x8

    .line 558
    .line 559
    invoke-static {v0, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 560
    .line 561
    .line 562
    goto :goto_4

    .line 563
    :cond_d
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 564
    .line 565
    iget-object v0, v0, Lcom/android/launcher3/s;->a:Landroid/content/Context;

    .line 566
    .line 567
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    const v9, 0x7f1403f5

    .line 572
    .line 573
    .line 574
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 575
    .line 576
    .line 577
    move-result-object v0

    .line 578
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 579
    .line 580
    .line 581
    move-result v0

    .line 582
    if-eqz v0, :cond_e

    .line 583
    .line 584
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 585
    .line 586
    iget-object v7, v0, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 587
    .line 588
    invoke-virtual {v7, v6}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 589
    .line 590
    .line 591
    move-result-object v6

    .line 592
    const/16 v7, 0x9

    .line 593
    .line 594
    invoke-static {v0, v6, v7}, Lcom/android/launcher3/s;->c(Lcom/android/launcher3/s;Ljava/lang/Object;I)V

    .line 595
    .line 596
    .line 597
    :cond_e
    :goto_4
    new-instance v0, Landroid/content/ContentValues;

    .line 598
    .line 599
    iget-object v6, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 600
    .line 601
    iget-object v6, v6, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 602
    .line 603
    invoke-direct {v0, v6}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 604
    .line 605
    .line 606
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 607
    .line 608
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 609
    .line 610
    .line 611
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 612
    .line 613
    .line 614
    move-result v7

    .line 615
    const/4 v9, 0x0

    .line 616
    :cond_f
    :goto_5
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 617
    .line 618
    .line 619
    move-result v10

    .line 620
    const-string v11, "container"

    .line 621
    .line 622
    if-ne v10, v4, :cond_10

    .line 623
    .line 624
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 625
    .line 626
    .line 627
    move-result v12

    .line 628
    if-le v12, v7, :cond_11

    .line 629
    .line 630
    :cond_10
    const/4 v12, 0x0

    .line 631
    const/4 v13, 0x0

    .line 632
    const/4 v14, 0x2

    .line 633
    goto :goto_7

    .line 634
    :cond_11
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 635
    .line 636
    .line 637
    move-result v2

    .line 638
    const/4 v7, 0x2

    .line 639
    if-ge v2, v7, :cond_13

    .line 640
    .line 641
    iget-object v2, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 642
    .line 643
    iget-object v2, v2, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 644
    .line 645
    sget-object v4, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 646
    .line 647
    invoke-static {v3}, LE1/a;->c(I)Ljava/lang/String;

    .line 648
    .line 649
    .line 650
    move-result-object v3

    .line 651
    const/4 v7, 0x0

    .line 652
    invoke-virtual {v2, v4, v3, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 653
    .line 654
    .line 655
    invoke-virtual {v6}, Lcom/android/launcher3/util/x0;->size()I

    .line 656
    .line 657
    .line 658
    move-result v2

    .line 659
    if-ne v2, v8, :cond_12

    .line 660
    .line 661
    new-instance v2, Landroid/content/ContentValues;

    .line 662
    .line 663
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 664
    .line 665
    .line 666
    invoke-static {v0, v2, v11}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 667
    .line 668
    .line 669
    const-string v3, "screen"

    .line 670
    .line 671
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 672
    .line 673
    .line 674
    const-string v3, "cellX"

    .line 675
    .line 676
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    const-string v3, "cellY"

    .line 680
    .line 681
    invoke-static {v0, v2, v3}, Lcom/android/launcher3/s;->i(Landroid/content/ContentValues;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    const/4 v12, 0x0

    .line 685
    invoke-virtual {v6, v12}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 686
    .line 687
    .line 688
    move-result v3

    .line 689
    iget-object v0, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 690
    .line 691
    iget-object v0, v0, Lcom/android/launcher3/s;->o:Landroid/database/sqlite/SQLiteDatabase;

    .line 692
    .line 693
    sget-object v1, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 694
    .line 695
    new-instance v4, Ljava/lang/StringBuilder;

    .line 696
    .line 697
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 698
    .line 699
    .line 700
    const-string v5, "_id="

    .line 701
    .line 702
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    .line 704
    .line 705
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 709
    .line 710
    .line 711
    move-result-object v4

    .line 712
    const/4 v13, 0x0

    .line 713
    invoke-virtual {v0, v1, v2, v4, v13}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 714
    .line 715
    .line 716
    goto :goto_6

    .line 717
    :cond_12
    move v3, v5

    .line 718
    :cond_13
    :goto_6
    return v3

    .line 719
    :goto_7
    if-eq v10, v14, :cond_14

    .line 720
    .line 721
    goto :goto_5

    .line 722
    :cond_14
    iget-object v10, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 723
    .line 724
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 725
    .line 726
    invoke-virtual {v10}, Landroid/content/ContentValues;->clear()V

    .line 727
    .line 728
    .line 729
    iget-object v10, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 730
    .line 731
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 732
    .line 733
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 734
    .line 735
    .line 736
    move-result-object v15

    .line 737
    invoke-virtual {v10, v11, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 738
    .line 739
    .line 740
    iget-object v10, v1, Lcom/android/launcher3/s$c;->b:Lcom/android/launcher3/s;

    .line 741
    .line 742
    iget-object v10, v10, Lcom/android/launcher3/s;->m:Landroid/content/ContentValues;

    .line 743
    .line 744
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 745
    .line 746
    .line 747
    move-result-object v11

    .line 748
    const-string v15, "rank"

    .line 749
    .line 750
    invoke-virtual {v10, v15, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 751
    .line 752
    .line 753
    iget-object v10, v1, Lcom/android/launcher3/s$c;->a:Landroid/util/ArrayMap;

    .line 754
    .line 755
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 756
    .line 757
    .line 758
    move-result-object v11

    .line 759
    invoke-virtual {v10, v11}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v10

    .line 763
    check-cast v10, Lcom/android/launcher3/s$i;

    .line 764
    .line 765
    if-eqz v10, :cond_15

    .line 766
    .line 767
    invoke-interface {v10, v2}, Lcom/android/launcher3/s$i;->b(Lorg/xmlpull/v1/XmlPullParser;)I

    .line 768
    .line 769
    .line 770
    move-result v10

    .line 771
    if-ltz v10, :cond_f

    .line 772
    .line 773
    invoke-virtual {v6, v10}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 774
    .line 775
    .line 776
    add-int/lit8 v9, v9, 0x1

    .line 777
    .line 778
    goto/16 :goto_5

    .line 779
    .line 780
    :cond_15
    new-instance v0, Ljava/lang/RuntimeException;

    .line 781
    .line 782
    new-instance v1, Ljava/lang/StringBuilder;

    .line 783
    .line 784
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 785
    .line 786
    .line 787
    const-string v3, "Invalid folder item "

    .line 788
    .line 789
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    .line 791
    .line 792
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object v2

    .line 796
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 797
    .line 798
    .line 799
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 800
    .line 801
    .line 802
    move-result-object v1

    .line 803
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    throw v0
.end method
