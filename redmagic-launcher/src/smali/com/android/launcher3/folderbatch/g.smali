.class public Lcom/android/launcher3/folderbatch/g;
.super Ljava/lang/Object;
.source "FolderBatchProcess.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/folderbatch/g$b;
    }
.end annotation


# static fields
.field private static a:Lcom/android/launcher3/model/data/I;

.field private static b:Ljava/lang/Object;

.field private static c:Lcom/android/launcher3/model/data/p;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/folderbatch/g;->b:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 6
    .line 7
    const/16 v0, -0x65

    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const/16 v0, -0x64

    .line 12
    .line 13
    if-ne p0, v0, :cond_1

    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static c(I)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    monitor-enter v2

    .line 24
    :try_start_0
    iget-object v3, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 25
    .line 26
    invoke-virtual {v3, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    instance-of v3, p0, Lcom/android/launcher3/model/data/p;

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v5, 0x1

    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    move-object v3, p0

    .line 39
    check-cast v3, Lcom/android/launcher3/model/data/p;

    .line 40
    .line 41
    const/16 v6, 0x8

    .line 42
    .line 43
    invoke-virtual {v3, v6}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_3

    .line 48
    .line 49
    iget-object v3, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 50
    .line 51
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-eqz v6, :cond_7

    .line 60
    .line 61
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 66
    .line 67
    instance-of v7, v6, Lcom/android/launcher3/model/data/I;

    .line 68
    .line 69
    if-eqz v7, :cond_1

    .line 70
    .line 71
    move-object v7, v6

    .line 72
    check-cast v7, Lcom/android/launcher3/model/data/I;

    .line 73
    .line 74
    iput-boolean v5, v7, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 75
    .line 76
    iput-boolean v4, v7, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 77
    .line 78
    iget v7, v7, Lcom/android/launcher3/model/data/I;->m:I

    .line 79
    .line 80
    const/4 v8, 0x2

    .line 81
    if-ne v7, v8, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 85
    .line 86
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :catchall_0
    move-exception p0

    .line 91
    goto/16 :goto_5

    .line 92
    .line 93
    :cond_3
    iget-object v3, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 94
    .line 95
    invoke-virtual {v3}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    new-instance v6, Lcom/android/launcher3/folderbatch/e;

    .line 100
    .line 101
    invoke-direct {v6}, Lcom/android/launcher3/folderbatch/e;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-interface {v3, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    new-instance v6, Lcom/android/launcher3/q2;

    .line 109
    .line 110
    invoke-direct {v6}, Lcom/android/launcher3/q2;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {v6}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-interface {v3, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-virtual {v6}, Lcom/android/launcher3/resource/B;->x()Z

    .line 128
    .line 129
    .line 130
    move-result v6

    .line 131
    if-nez v6, :cond_5

    .line 132
    .line 133
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-virtual {v6}, Lcom/android/launcher3/resource/B;->s()Z

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    if-nez v6, :cond_5

    .line 142
    .line 143
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    if-eqz v6, :cond_5

    .line 148
    .line 149
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    if-eqz v7, :cond_5

    .line 154
    .line 155
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-virtual {v7}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    if-eqz v7, :cond_5

    .line 164
    .line 165
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    invoke-virtual {v7}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    invoke-virtual {v7}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    if-eqz v7, :cond_5

    .line 178
    .line 179
    array-length v8, v7

    .line 180
    if-lez v8, :cond_5

    .line 181
    .line 182
    new-instance v3, Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .line 186
    .line 187
    move v8, v4

    .line 188
    :goto_1
    array-length v9, v7

    .line 189
    if-ge v8, v9, :cond_4

    .line 190
    .line 191
    aget-object v9, v7, v8

    .line 192
    .line 193
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    add-int/lit8 v8, v8, 0x1

    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    new-instance v7, Lcom/android/launcher3/allapps/N;

    .line 204
    .line 205
    invoke-direct {v7, v6}, Lcom/android/launcher3/allapps/N;-><init>(Landroid/content/Context;)V

    .line 206
    .line 207
    .line 208
    invoke-interface {v3, v7}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    new-instance v7, Lcom/android/launcher3/folderbatch/f;

    .line 213
    .line 214
    invoke-direct {v7, v6}, Lcom/android/launcher3/folderbatch/f;-><init>(Lcom/android/launcher3/C2;)V

    .line 215
    .line 216
    .line 217
    invoke-interface {v3, v7}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    invoke-interface {v3, v6}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    check-cast v3, Ljava/util/ArrayList;

    .line 230
    .line 231
    :cond_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    :cond_6
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 236
    .line 237
    .line 238
    move-result v6

    .line 239
    if-eqz v6, :cond_7

    .line 240
    .line 241
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v6

    .line 245
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 246
    .line 247
    instance-of v7, v6, Lcom/android/launcher3/model/data/I;

    .line 248
    .line 249
    if-eqz v7, :cond_6

    .line 250
    .line 251
    move-object v7, v6

    .line 252
    check-cast v7, Lcom/android/launcher3/model/data/I;

    .line 253
    .line 254
    iput-boolean v5, v7, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 255
    .line 256
    iput-boolean v4, v7, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 257
    .line 258
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 259
    .line 260
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    goto :goto_2

    .line 264
    :cond_7
    instance-of v3, p0, Lcom/android/launcher3/model/data/p;

    .line 265
    .line 266
    if-eqz v3, :cond_a

    .line 267
    .line 268
    check-cast p0, Lcom/android/launcher3/model/data/p;

    .line 269
    .line 270
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    :cond_8
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 279
    .line 280
    .line 281
    move-result v3

    .line 282
    if-eqz v3, :cond_a

    .line 283
    .line 284
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 289
    .line 290
    instance-of v4, v3, Lcom/android/launcher3/model/data/I;

    .line 291
    .line 292
    if-eqz v4, :cond_9

    .line 293
    .line 294
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 295
    .line 296
    invoke-static {v3}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-nez v4, :cond_8

    .line 301
    .line 302
    iput-boolean v5, v3, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 303
    .line 304
    iput-boolean v5, v3, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 305
    .line 306
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    goto :goto_3

    .line 310
    :cond_9
    instance-of v4, v3, Lcom/android/launcher3/model/data/l;

    .line 311
    .line 312
    if-eqz v4, :cond_8

    .line 313
    .line 314
    const-string v4, "FolderBatchProcess"

    .line 315
    .line 316
    new-instance v6, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 319
    .line 320
    .line 321
    const-string v7, "getFolderBatchData itemInfo.title: "

    .line 322
    .line 323
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 327
    .line 328
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v3

    .line 335
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    .line 337
    .line 338
    goto :goto_3

    .line 339
    :cond_a
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    new-instance p0, Lcom/android/launcher3/folderbatch/g$b;

    .line 341
    .line 342
    invoke-direct {p0}, Lcom/android/launcher3/folderbatch/g$b;-><init>()V

    .line 343
    .line 344
    .line 345
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 346
    .line 347
    .line 348
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    if-eqz v0, :cond_c

    .line 357
    .line 358
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 363
    .line 364
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result v2

    .line 368
    if-nez v2, :cond_b

    .line 369
    .line 370
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    goto :goto_4

    .line 374
    :cond_b
    const-string v2, "FolderBatchProcess"

    .line 375
    .line 376
    new-instance v3, Ljava/lang/StringBuilder;

    .line 377
    .line 378
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .line 380
    .line 381
    const-string v4, "sBgWorkspaceItems folderInfo.contents repeat "

    .line 382
    .line 383
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 387
    .line 388
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    .line 397
    .line 398
    goto :goto_4

    .line 399
    :cond_c
    return-object v1

    .line 400
    :goto_5
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 401
    throw p0
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;Z)Lcom/android/launcher3/model/data/I;
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    const-string p0, "FolderBatchProcess"

    .line 5
    .line 6
    const-string p1, "getFolderBatchInfo context is null "

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return-object p2

    .line 12
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/android/launcher3/folderbatch/g;->b:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    sget-object v1, Lcom/android/launcher3/folderbatch/g;->a:Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M()Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object p2, Lcom/android/launcher3/folderbatch/g;->a:Lcom/android/launcher3/model/data/I;

    .line 32
    .line 33
    invoke-static {p0}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iput-object p0, p2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 38
    .line 39
    sget-object p0, Lcom/android/launcher3/folderbatch/g;->a:Lcom/android/launcher3/model/data/I;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 42
    .line 43
    monitor-exit v0

    .line 44
    return-object p0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    if-nez p0, :cond_2

    .line 49
    .line 50
    const-string p0, "FolderBatchProcess"

    .line 51
    .line 52
    const-string p1, "getFolderBatchInfo app is null "

    .line 53
    .line 54
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    return-object p2

    .line 58
    :cond_2
    new-instance p2, Landroid/content/Intent;

    .line 59
    .line 60
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v0, "theme.folder.add"

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    const-string v0, "theme.folder.add"

    .line 69
    .line 70
    const-string v1, "theme.folder.add."

    .line 71
    .line 72
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 76
    .line 77
    invoke-direct {v0}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 78
    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    iput v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 82
    .line 83
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->M()Landroid/graphics/Bitmap;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ls1/d;->e(Landroid/graphics/Bitmap;)Ls1/d;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iput-object p0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 102
    .line 103
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 104
    .line 105
    const p0, 0x7fffffff

    .line 106
    .line 107
    .line 108
    iput p0, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 109
    .line 110
    iput-object p2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 111
    .line 112
    sget-object p0, Lcom/android/launcher3/folderbatch/g;->b:Ljava/lang/Object;

    .line 113
    .line 114
    monitor-enter p0

    .line 115
    :try_start_1
    sput-object v0, Lcom/android/launcher3/folderbatch/g;->a:Lcom/android/launcher3/model/data/I;

    .line 116
    .line 117
    monitor-exit p0

    .line 118
    return-object v0

    .line 119
    :catchall_1
    move-exception p1

    .line 120
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 121
    throw p1

    .line 122
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 123
    throw p0
.end method

.method public static e(Landroid/view/View;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p0, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    instance-of v1, p0, Lcom/android/launcher3/model/data/I;

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    return v0
.end method

.method public static f(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v0, "theme.folder.add"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method public static g()V
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/folderbatch/g;->b:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    const-string v1, "FolderBatchProcess"

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v3, "removeFolderInfoIfNecessary folder title"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v3, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    sget-object v1, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget-object v2, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 54
    .line 55
    const-string v3, "FolderBatchProcess.removeFolderInfoIfNecessary"

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception v1

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    const-string v1, "FolderBatchProcess"

    .line 64
    .line 65
    const-string v2, "removeFolderInfoIfNecessary Launcher is null can not remove the folder"

    .line 66
    .line 67
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    :goto_0
    const/4 v1, 0x0

    .line 71
    sput-object v1, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 72
    .line 73
    :cond_1
    monitor-exit v0

    .line 74
    return-void

    .line 75
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    throw v1
.end method

.method public static h(Landroid/content/Context;ILjava/util/List;)Z
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "FolderBatchProcess"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    if-nez p0, :cond_1

    .line 9
    .line 10
    :cond_0
    move/from16 v16, v2

    .line 11
    .line 12
    goto/16 :goto_e

    .line 13
    .line 14
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    if-nez v5, :cond_2

    .line 23
    .line 24
    const-string v0, "setFolderBatchData--bgDataModel is null"

    .line 25
    .line 26
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    return v2

    .line 30
    :cond_2
    iget-object v5, v5, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 31
    .line 32
    invoke-virtual {v5, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Lcom/android/launcher3/model/data/p;

    .line 37
    .line 38
    if-nez v5, :cond_3

    .line 39
    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v4, "setFolderBatchData--folderId:"

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return v2

    .line 61
    :cond_3
    const/16 v6, 0x8

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    new-instance v7, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v8, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v9, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v10

    .line 86
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v11

    .line 90
    if-eqz v11, :cond_8

    .line 91
    .line 92
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v11

    .line 96
    check-cast v11, Lcom/android/launcher3/model/data/I;

    .line 97
    .line 98
    invoke-static {v11}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 99
    .line 100
    .line 101
    move-result v12

    .line 102
    if-eqz v12, :cond_4

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    iget-boolean v12, v11, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 106
    .line 107
    if-eqz v12, :cond_5

    .line 108
    .line 109
    new-instance v12, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v13, "setFolderBatchData--folderItems--itemInfo: "

    .line 115
    .line 116
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-object v13, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 120
    .line 121
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v12

    .line 128
    invoke-static {v1, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .line 130
    .line 131
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_5
    iget v12, v11, Lcom/android/launcher3/model/data/y;->container:I

    .line 136
    .line 137
    if-ne v12, v0, :cond_6

    .line 138
    .line 139
    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-instance v12, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    .line 146
    .line 147
    const-string v13, "setFolderBatchData--folderItems--workspaceInfos: "

    .line 148
    .line 149
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v13, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 153
    .line 154
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v12

    .line 161
    invoke-static {v1, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_6
    if-lez v12, :cond_7

    .line 166
    .line 167
    new-instance v12, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v13, "setFolderBatchData--folderItems--otherFolderInfos: "

    .line 173
    .line 174
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget-object v13, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 178
    .line 179
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v12

    .line 186
    invoke-static {v1, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    :cond_7
    :goto_1
    iput-boolean v2, v11, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 193
    .line 194
    iput-boolean v2, v11, Lcom/android/launcher3/model/data/y;->isShowCheckbox:Z

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_8
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 198
    .line 199
    .line 200
    move-result-object v9

    .line 201
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 202
    .line 203
    .line 204
    move-result-object v10

    .line 205
    invoke-virtual {v10, v5}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    check-cast v10, Lcom/android/launcher3/folder/FolderIcon;

    .line 210
    .line 211
    if-nez v10, :cond_9

    .line 212
    .line 213
    if-eqz v6, :cond_9

    .line 214
    .line 215
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 216
    .line 217
    .line 218
    move-result-object v11

    .line 219
    if-eqz v11, :cond_9

    .line 220
    .line 221
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 222
    .line 223
    .line 224
    move-result-object v10

    .line 225
    invoke-virtual {v10}, Lcom/android/launcher3/folder/Folder;->getFolderIcon()Lcom/android/launcher3/folder/FolderIcon;

    .line 226
    .line 227
    .line 228
    move-result-object v10

    .line 229
    :cond_9
    if-nez v10, :cond_a

    .line 230
    .line 231
    const-string v0, "setFolderBatchData, Folder icon is null."

    .line 232
    .line 233
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    return v2

    .line 237
    :cond_a
    new-instance v11, Ljava/util/ArrayList;

    .line 238
    .line 239
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 240
    .line 241
    .line 242
    move-result-object v12

    .line 243
    if-eqz v12, :cond_b

    .line 244
    .line 245
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 246
    .line 247
    .line 248
    move-result-object v12

    .line 249
    goto :goto_2

    .line 250
    :cond_b
    new-instance v12, Ljava/util/ArrayList;

    .line 251
    .line 252
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 253
    .line 254
    .line 255
    :goto_2
    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 256
    .line 257
    .line 258
    new-instance v12, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    new-instance v13, Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .line 267
    .line 268
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 269
    .line 270
    .line 271
    move-result v13

    .line 272
    const/4 v14, 0x1

    .line 273
    if-lt v13, v14, :cond_10

    .line 274
    .line 275
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 276
    .line 277
    .line 278
    move-result-object v13

    .line 279
    if-eqz v13, :cond_10

    .line 280
    .line 281
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 282
    .line 283
    .line 284
    move-result-object v13

    .line 285
    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 286
    .line 287
    .line 288
    move-result v15

    .line 289
    if-eqz v15, :cond_d

    .line 290
    .line 291
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v15

    .line 295
    check-cast v15, Lcom/android/launcher3/model/data/I;

    .line 296
    .line 297
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 298
    .line 299
    .line 300
    move-result-object v14

    .line 301
    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v14

    .line 305
    if-nez v14, :cond_c

    .line 306
    .line 307
    invoke-interface {v12, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    :cond_c
    const/4 v14, 0x1

    .line 311
    goto :goto_3

    .line 312
    :cond_d
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 313
    .line 314
    .line 315
    move-result-object v12

    .line 316
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 317
    .line 318
    .line 319
    move-result v13

    .line 320
    if-eqz v13, :cond_10

    .line 321
    .line 322
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v13

    .line 326
    check-cast v13, Lcom/android/launcher3/model/data/I;

    .line 327
    .line 328
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 329
    .line 330
    .line 331
    move-result-object v14

    .line 332
    invoke-virtual {v14, v13}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 333
    .line 334
    .line 335
    move-result-object v14

    .line 336
    iget v15, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 337
    .line 338
    if-lez v15, :cond_e

    .line 339
    .line 340
    if-eqz v6, :cond_e

    .line 341
    .line 342
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 343
    .line 344
    .line 345
    move-result-object v15

    .line 346
    iget-object v15, v15, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 347
    .line 348
    invoke-virtual {v15}, Lcom/android/launcher3/util/A0;->m()Lcom/android/launcher3/util/A0;

    .line 349
    .line 350
    .line 351
    move-result-object v15

    .line 352
    iget v2, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 353
    .line 354
    invoke-virtual {v15, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    check-cast v2, Lcom/android/launcher3/model/data/p;

    .line 359
    .line 360
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 361
    .line 362
    .line 363
    move-result-object v15

    .line 364
    invoke-virtual {v15, v2}, Lcom/android/launcher3/Workspace;->n1(Ljava/lang/Object;)Landroid/view/View;

    .line 365
    .line 366
    .line 367
    move-result-object v15

    .line 368
    check-cast v15, Lcom/android/launcher3/folder/FolderIcon;

    .line 369
    .line 370
    if-eqz v15, :cond_e

    .line 371
    .line 372
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    const/4 v15, 0x2

    .line 381
    if-ne v2, v15, :cond_e

    .line 382
    .line 383
    const/4 v2, 0x0

    .line 384
    invoke-virtual {v9, v14, v13, v2}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 385
    .line 386
    .line 387
    const/4 v2, -0x1

    .line 388
    iput v2, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 389
    .line 390
    iput v2, v13, Lcom/android/launcher3/model/data/y;->id:I

    .line 391
    .line 392
    const/4 v2, 0x0

    .line 393
    goto :goto_5

    .line 394
    :cond_e
    const/4 v2, 0x1

    .line 395
    :goto_5
    new-instance v15, Ljava/lang/StringBuilder;

    .line 396
    .line 397
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    .line 399
    .line 400
    move-wide/from16 v17, v3

    .line 401
    .line 402
    const-string v3, "setFolderBatchData "

    .line 403
    .line 404
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    iget-object v3, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 408
    .line 409
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    const-string v3, " should remove "

    .line 413
    .line 414
    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    .line 426
    .line 427
    if-eqz v2, :cond_f

    .line 428
    .line 429
    const/4 v2, 0x0

    .line 430
    invoke-virtual {v9, v14, v13, v2}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 431
    .line 432
    .line 433
    invoke-static {}, Lx1/O;->C3()Z

    .line 434
    .line 435
    .line 436
    move-result v2

    .line 437
    if-eqz v2, :cond_f

    .line 438
    .line 439
    invoke-static {v9}, Lx1/O;->H2(Lcom/android/launcher3/C2;)Z

    .line 440
    .line 441
    .line 442
    move-result v2

    .line 443
    if-eqz v2, :cond_f

    .line 444
    .line 445
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 446
    .line 447
    .line 448
    move-result-object v2

    .line 449
    if-eqz v2, :cond_f

    .line 450
    .line 451
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    invoke-virtual {v2}, Lcom/android/launcher3/q4;->T()Lcom/android/launcher3/MFVDockExpandSupport;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    invoke-virtual {v2}, Lcom/android/launcher3/MFVDockExpandSupport;->r()Ljava/util/ArrayList;

    .line 460
    .line 461
    .line 462
    move-result-object v2

    .line 463
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 464
    .line 465
    .line 466
    move-result-object v3

    .line 467
    iget-object v4, v13, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 468
    .line 469
    const/4 v14, 0x0

    .line 470
    const/4 v15, 0x1

    .line 471
    invoke-static {v2, v3, v15, v14, v4}, Lx1/O;->v1(Ljava/util/ArrayList;Landroid/content/ComponentName;ZZLandroid/os/UserHandle;)Z

    .line 472
    .line 473
    .line 474
    move-result v2

    .line 475
    if-eqz v2, :cond_f

    .line 476
    .line 477
    new-instance v2, Ljava/lang/StringBuilder;

    .line 478
    .line 479
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 480
    .line 481
    .line 482
    const-string v3, "recentApp: onHotseatRecentDelete "

    .line 483
    .line 484
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    .line 486
    .line 487
    iget-object v3, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 488
    .line 489
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v2

    .line 496
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    .line 498
    .line 499
    invoke-virtual {v9, v13, v14}, Lcom/android/launcher3/C2;->Q3(Lcom/android/launcher3/model/data/I;Z)V

    .line 500
    .line 501
    .line 502
    :cond_f
    invoke-virtual {v10}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 503
    .line 504
    .line 505
    move-result-object v2

    .line 506
    invoke-virtual {v2, v13}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 507
    .line 508
    .line 509
    move-wide/from16 v3, v17

    .line 510
    .line 511
    const/4 v2, 0x0

    .line 512
    goto/16 :goto_4

    .line 513
    .line 514
    :cond_10
    move-wide/from16 v17, v3

    .line 515
    .line 516
    if-nez v6, :cond_11

    .line 517
    .line 518
    invoke-virtual {v10}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 519
    .line 520
    .line 521
    move-result-object v2

    .line 522
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->V1()V

    .line 523
    .line 524
    .line 525
    :cond_11
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 526
    .line 527
    .line 528
    move-result-object v2

    .line 529
    if-eqz v2, :cond_1a

    .line 530
    .line 531
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 536
    .line 537
    .line 538
    move-result v2

    .line 539
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 540
    .line 541
    .line 542
    move-result v3

    .line 543
    sub-int/2addr v2, v3

    .line 544
    const/4 v15, 0x1

    .line 545
    if-ge v2, v15, :cond_1a

    .line 546
    .line 547
    if-eqz v6, :cond_13

    .line 548
    .line 549
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 550
    .line 551
    .line 552
    move-result-object v2

    .line 553
    :cond_12
    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 554
    .line 555
    .line 556
    move-result v3

    .line 557
    if-eqz v3, :cond_18

    .line 558
    .line 559
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    move-result-object v3

    .line 563
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 564
    .line 565
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 566
    .line 567
    if-ne v4, v0, :cond_12

    .line 568
    .line 569
    instance-of v4, v3, Lcom/android/launcher3/model/data/I;

    .line 570
    .line 571
    if-eqz v4, :cond_12

    .line 572
    .line 573
    invoke-virtual {v10}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 574
    .line 575
    .line 576
    move-result-object v4

    .line 577
    filled-new-array {v3}, [Lcom/android/launcher3/model/data/y;

    .line 578
    .line 579
    .line 580
    move-result-object v5

    .line 581
    const/4 v14, 0x0

    .line 582
    invoke-virtual {v4, v14, v5}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 583
    .line 584
    .line 585
    new-instance v4, Ljava/lang/StringBuilder;

    .line 586
    .line 587
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 588
    .line 589
    .line 590
    const-string v5, "we remove info from hide folder: "

    .line 591
    .line 592
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object v3

    .line 602
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    .line 604
    .line 605
    goto :goto_6

    .line 606
    :cond_13
    invoke-static {v9}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    if-eqz v0, :cond_14

    .line 611
    .line 612
    instance-of v2, v0, Lcom/android/launcher3/folder/Folder;

    .line 613
    .line 614
    if-eqz v2, :cond_14

    .line 615
    .line 616
    const/4 v14, 0x0

    .line 617
    invoke-virtual {v0, v14}, Lcom/android/launcher3/a;->close(Z)V

    .line 618
    .line 619
    .line 620
    goto :goto_7

    .line 621
    :cond_14
    const/4 v14, 0x0

    .line 622
    :goto_7
    invoke-virtual {v9, v10, v5, v14}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 623
    .line 624
    .line 625
    sput-object v5, Lcom/android/launcher3/folderbatch/g;->c:Lcom/android/launcher3/model/data/p;

    .line 626
    .line 627
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    :cond_15
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 632
    .line 633
    .line 634
    move-result v2

    .line 635
    if-eqz v2, :cond_16

    .line 636
    .line 637
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 638
    .line 639
    .line 640
    move-result-object v2

    .line 641
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 642
    .line 643
    iget v3, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 644
    .line 645
    if-lez v3, :cond_15

    .line 646
    .line 647
    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    new-instance v3, Ljava/lang/StringBuilder;

    .line 651
    .line 652
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 653
    .line 654
    .line 655
    const-string v4, "set only one app from folder to workspace: "

    .line 656
    .line 657
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 661
    .line 662
    .line 663
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 664
    .line 665
    .line 666
    move-result-object v2

    .line 667
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 668
    .line 669
    .line 670
    goto :goto_8

    .line 671
    :cond_16
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 672
    .line 673
    .line 674
    move-result-object v0

    .line 675
    :cond_17
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 676
    .line 677
    .line 678
    move-result v2

    .line 679
    if-eqz v2, :cond_18

    .line 680
    .line 681
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 682
    .line 683
    .line 684
    move-result-object v2

    .line 685
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 686
    .line 687
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 688
    .line 689
    .line 690
    move-result-object v3

    .line 691
    if-eqz v3, :cond_17

    .line 692
    .line 693
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 694
    .line 695
    .line 696
    move-result-object v3

    .line 697
    invoke-static {v3}, Lx1/O;->q3(Landroid/content/ComponentName;)Z

    .line 698
    .line 699
    .line 700
    move-result v3

    .line 701
    if-eqz v3, :cond_17

    .line 702
    .line 703
    const-string v3, "folder disband, so get and delete the saved STK AppLocation"

    .line 704
    .line 705
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    .line 707
    .line 708
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 709
    .line 710
    .line 711
    move-result-object v3

    .line 712
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 713
    .line 714
    .line 715
    move-result-object v3

    .line 716
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 717
    .line 718
    .line 719
    move-result-object v3

    .line 720
    new-instance v4, Lcom/android/launcher3/util/E;

    .line 721
    .line 722
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 723
    .line 724
    .line 725
    move-result-object v2

    .line 726
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 727
    .line 728
    .line 729
    move-result-object v5

    .line 730
    invoke-direct {v4, v2, v5}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 731
    .line 732
    .line 733
    const/4 v15, 0x1

    .line 734
    invoke-virtual {v3, v4, v15}, Lcom/android/launcher3/H5;->t(Lcom/android/launcher3/util/E;Z)Lcom/android/launcher3/H5$a;

    .line 735
    .line 736
    .line 737
    goto :goto_9

    .line 738
    :cond_18
    invoke-interface {v7}, Ljava/util/List;->clear()V

    .line 739
    .line 740
    .line 741
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 742
    .line 743
    .line 744
    move-result-object v0

    .line 745
    if-eqz v0, :cond_19

    .line 746
    .line 747
    new-instance v2, Lcom/android/launcher3/folderbatch/g$a;

    .line 748
    .line 749
    invoke-direct {v2, v0}, Lcom/android/launcher3/folderbatch/g$a;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 750
    .line 751
    .line 752
    const-wide/16 v3, 0x64

    .line 753
    .line 754
    invoke-virtual {v0, v2, v3, v4}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 755
    .line 756
    .line 757
    :cond_19
    const/4 v15, 0x1

    .line 758
    goto :goto_b

    .line 759
    :cond_1a
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 760
    .line 761
    .line 762
    move-result-object v0

    .line 763
    if-eqz v0, :cond_1b

    .line 764
    .line 765
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 766
    .line 767
    .line 768
    move-result-object v0

    .line 769
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 770
    .line 771
    .line 772
    move-result v2

    .line 773
    if-eqz v2, :cond_1b

    .line 774
    .line 775
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 776
    .line 777
    .line 778
    move-result-object v2

    .line 779
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 780
    .line 781
    invoke-virtual {v10}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 782
    .line 783
    .line 784
    move-result-object v3

    .line 785
    filled-new-array {v2}, [Lcom/android/launcher3/model/data/y;

    .line 786
    .line 787
    .line 788
    move-result-object v4

    .line 789
    const/4 v14, 0x0

    .line 790
    invoke-virtual {v3, v14, v4}, Lcom/android/launcher3/folder/Folder;->W1(Z[Lcom/android/launcher3/model/data/y;)V

    .line 791
    .line 792
    .line 793
    new-instance v3, Ljava/lang/StringBuilder;

    .line 794
    .line 795
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 796
    .line 797
    .line 798
    const-string v4, "remove app from folder to workspace: "

    .line 799
    .line 800
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 801
    .line 802
    .line 803
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 804
    .line 805
    .line 806
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 807
    .line 808
    .line 809
    move-result-object v2

    .line 810
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 811
    .line 812
    .line 813
    goto :goto_a

    .line 814
    :cond_1b
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 815
    .line 816
    .line 817
    move-result-object v0

    .line 818
    if-eqz v0, :cond_19

    .line 819
    .line 820
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 821
    .line 822
    .line 823
    move-result-object v0

    .line 824
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 825
    .line 826
    .line 827
    move-result v0

    .line 828
    const/4 v15, 0x1

    .line 829
    if-le v0, v15, :cond_1c

    .line 830
    .line 831
    move v0, v15

    .line 832
    goto :goto_c

    .line 833
    :cond_1c
    :goto_b
    const/4 v0, 0x0

    .line 834
    :goto_c
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 835
    .line 836
    .line 837
    move-result v2

    .line 838
    if-lt v2, v15, :cond_1d

    .line 839
    .line 840
    invoke-static/range {p0 .. p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 841
    .line 842
    .line 843
    move-result-object v2

    .line 844
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 845
    .line 846
    .line 847
    move-result-object v2

    .line 848
    new-instance v3, Lx1/O$b;

    .line 849
    .line 850
    invoke-direct {v3, v8}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 851
    .line 852
    .line 853
    invoke-virtual {v3}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 854
    .line 855
    .line 856
    move-result-object v3

    .line 857
    invoke-virtual {v2, v3, v15}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 858
    .line 859
    .line 860
    goto :goto_d

    .line 861
    :cond_1d
    invoke-virtual {v9}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 862
    .line 863
    .line 864
    move-result-object v2

    .line 865
    if-eqz v2, :cond_1e

    .line 866
    .line 867
    invoke-virtual {v2, v15}, Lcom/android/launcher3/Workspace;->F2(Z)V

    .line 868
    .line 869
    .line 870
    :cond_1e
    invoke-static {}, Lcom/android/launcher3/folderbatch/g;->g()V

    .line 871
    .line 872
    .line 873
    :goto_d
    if-eqz v0, :cond_20

    .line 874
    .line 875
    instance-of v0, v10, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 876
    .line 877
    if-eqz v0, :cond_1f

    .line 878
    .line 879
    move-object v0, v10

    .line 880
    check-cast v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 881
    .line 882
    invoke-virtual {v0, v11}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->p1(Ljava/util/ArrayList;)V

    .line 883
    .line 884
    .line 885
    :cond_1f
    invoke-virtual {v10}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 886
    .line 887
    .line 888
    move-result-object v0

    .line 889
    const/4 v14, 0x0

    .line 890
    invoke-virtual {v0, v14, v14}, Lcom/android/launcher3/folder/Folder;->C0(ZZ)V

    .line 891
    .line 892
    .line 893
    :cond_20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 894
    .line 895
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 896
    .line 897
    .line 898
    const-string v2, "setFolderBatchData process data time "

    .line 899
    .line 900
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 901
    .line 902
    .line 903
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 904
    .line 905
    .line 906
    move-result-wide v2

    .line 907
    sub-long v2, v2, v17

    .line 908
    .line 909
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 910
    .line 911
    .line 912
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 913
    .line 914
    .line 915
    move-result-object v0

    .line 916
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 917
    .line 918
    .line 919
    const/16 v16, 0x0

    .line 920
    .line 921
    return v16

    .line 922
    :goto_e
    const-string v0, "setFolderBatchData data is null or context is null! "

    .line 923
    .line 924
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    .line 926
    .line 927
    return v16
.end method
