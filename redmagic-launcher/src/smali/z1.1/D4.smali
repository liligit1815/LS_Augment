.class public final Lz1/D4;
.super Ljava/lang/Object;
.source "ShortcutsChangedTask.kt"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Landroid/os/UserHandle;

.field private final d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Landroid/os/UserHandle;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;",
            "Landroid/os/UserHandle;",
            "Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "packageName"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "shortcuts"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "user"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p2, p0, Lz1/D4;->b:Ljava/util/List;

    .line 22
    .line 23
    iput-object p3, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 24
    .line 25
    iput-boolean p4, p0, Lz1/D4;->d:Z

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic b(Lz1/D4;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lz1/D4;->c(Lz1/D4;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c(Lz1/D4;Ljava/util/ArrayList;Lcom/android/launcher3/model/data/I;)V
    .locals 2

    .line 1
    const-string v0, "wai"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 7
    .line 8
    const/4 v1, 0x6

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 12

    .line 1
    const-string v0, "taskController"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dataModel"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "apps"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lz1/o3;->V()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    monitor-enter p2

    .line 26
    :try_start_0
    iget-object v1, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 27
    .line 28
    new-instance v2, Lz1/C4;

    .line 29
    .line 30
    invoke-direct {v2, p0, v0}, Lz1/C4;-><init>(Lz1/D4;Ljava/util/ArrayList;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, v1, v2}, Lz1/y0;->p(Landroid/os/UserHandle;Ljava/util/function/Consumer;)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Lh4/t;->a:Lh4/t;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    monitor-exit p2

    .line 39
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object v1, p0, Lz1/D4;->b:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {p3, v1}, Lcom/android/launcher3/widget/group/h;->f(Landroid/content/Context;Ljava/util/List;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    new-instance v1, LN1/f;

    .line 54
    .line 55
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-direct {v1, p3, v2}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v2}, LN1/f;->a(Ljava/lang/String;)LN1/f;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/16 v2, 0x9

    .line 69
    .line 70
    invoke-virtual {v1, v2}, LN1/f;->d(I)LN1/f$a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "query(...)"

    .line 75
    .line 76
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-nez v2, :cond_0

    .line 84
    .line 85
    iput-object v1, p0, Lz1/D4;->b:Ljava/util/List;

    .line 86
    .line 87
    :cond_0
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_b

    .line 92
    .line 93
    new-instance v1, Lcom/android/launcher3/util/k;

    .line 94
    .line 95
    iget-object v2, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 98
    .line 99
    invoke-direct {v1, p3, v2, v3}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Lz1/D4;->b:Ljava/util/List;

    .line 103
    .line 104
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-eqz v2, :cond_2

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->k()Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_1

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->j()Z

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    if-eqz v2, :cond_c

    .line 121
    .line 122
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/android/launcher3/util/k;->j()Z

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    if-eqz v2, :cond_2

    .line 133
    .line 134
    goto/16 :goto_5

    .line 135
    .line 136
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 137
    .line 138
    const/16 v3, 0xa

    .line 139
    .line 140
    invoke-static {v0, v3}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 145
    .line 146
    .line 147
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-eqz v5, :cond_3

    .line 156
    .line 157
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 162
    .line 163
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_3
    invoke-static {v2}, Li4/m;->R(Ljava/lang/Iterable;)Ljava/util/List;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    new-instance v4, LN1/f;

    .line 176
    .line 177
    iget-object v5, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 178
    .line 179
    invoke-direct {v4, p3, v5}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 180
    .line 181
    .line 182
    iget-object v5, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v4, v5, v2}, LN1/f;->b(Ljava/lang/String;Ljava/util/List;)LN1/f;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    const/16 v5, 0xb

    .line 189
    .line 190
    invoke-virtual {v4, v5}, LN1/f;->d(I)LN1/f$a;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    const-string v5, "query(...)"

    .line 195
    .line 196
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    new-instance v5, Ljava/util/HashSet;

    .line 200
    .line 201
    invoke-direct {v5, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 202
    .line 203
    .line 204
    new-instance v2, Ljava/util/ArrayList;

    .line 205
    .line 206
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 207
    .line 208
    .line 209
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    :cond_4
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 214
    .line 215
    .line 216
    move-result v6

    .line 217
    if-eqz v6, :cond_9

    .line 218
    .line 219
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    check-cast v6, Landroid/content/pm/ShortcutInfo;

    .line 224
    .line 225
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->isPinned()Z

    .line 226
    .line 227
    .line 228
    move-result v7

    .line 229
    if-nez v7, :cond_5

    .line 230
    .line 231
    invoke-static {}, Lcom/android/launcher3/y0;->D0()Z

    .line 232
    .line 233
    .line 234
    move-result v7

    .line 235
    if-nez v7, :cond_5

    .line 236
    .line 237
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    const-string v8, "com.zte.halo.app"

    .line 242
    .line 243
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v7

    .line 247
    if-nez v7, :cond_5

    .line 248
    .line 249
    goto :goto_1

    .line 250
    :cond_5
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v7

    .line 254
    const-string v8, "com.zte.halo.app"

    .line 255
    .line 256
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v7

    .line 260
    if-eqz v7, :cond_6

    .line 261
    .line 262
    sget-object v7, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 263
    .line 264
    invoke-virtual {v7, p3}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 265
    .line 266
    .line 267
    move-result-object v7

    .line 268
    invoke-virtual {v7}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 269
    .line 270
    .line 271
    move-result-object v7

    .line 272
    invoke-virtual {v7}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 273
    .line 274
    .line 275
    move-result-object v7

    .line 276
    const/4 v8, 0x1

    .line 277
    invoke-virtual {v7, v8}, Lz1/k2;->g0(Z)V

    .line 278
    .line 279
    .line 280
    :cond_6
    invoke-virtual {v6}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v7

    .line 284
    const-string v8, "getId(...)"

    .line 285
    .line 286
    invoke-static {v7, v8}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-interface {v5, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    new-instance v8, Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 295
    .line 296
    .line 297
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 298
    .line 299
    .line 300
    move-result-object v9

    .line 301
    :cond_7
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 302
    .line 303
    .line 304
    move-result v10

    .line 305
    if-eqz v10, :cond_8

    .line 306
    .line 307
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v10

    .line 311
    move-object v11, v10

    .line 312
    check-cast v11, Lcom/android/launcher3/model/data/I;

    .line 313
    .line 314
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/I;->Q()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v11

    .line 318
    invoke-static {v7, v11}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result v11

    .line 322
    if-eqz v11, :cond_7

    .line 323
    .line 324
    invoke-interface {v8, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    goto :goto_2

    .line 328
    :cond_8
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 329
    .line 330
    .line 331
    move-result-object v7

    .line 332
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 333
    .line 334
    .line 335
    move-result v8

    .line 336
    if-eqz v8, :cond_4

    .line 337
    .line 338
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v8

    .line 342
    check-cast v8, Lcom/android/launcher3/model/data/I;

    .line 343
    .line 344
    invoke-virtual {v8, v6, p3}, Lcom/android/launcher3/model/data/I;->i0(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p1}, Lz1/o3;->W()Ls1/P;

    .line 348
    .line 349
    .line 350
    move-result-object v9

    .line 351
    new-instance v10, Ls1/h;

    .line 352
    .line 353
    invoke-direct {v10, v6, v1}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/util/k;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v9, v8, v10}, Ls1/P;->B0(Lcom/android/launcher3/model/data/z;Ls1/h;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    goto :goto_3

    .line 363
    :cond_9
    invoke-virtual {p1, v2}, Lz1/o3;->G(Ljava/util/Collection;)V

    .line 364
    .line 365
    .line 366
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    .line 367
    .line 368
    .line 369
    move-result p3

    .line 370
    if-nez p3, :cond_b

    .line 371
    .line 372
    new-instance p3, Ljava/util/ArrayList;

    .line 373
    .line 374
    invoke-static {v5, v3}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 379
    .line 380
    .line 381
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_a

    .line 390
    .line 391
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    check-cast v1, Ljava/lang/String;

    .line 396
    .line 397
    new-instance v2, LN1/e;

    .line 398
    .line 399
    iget-object v3, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 400
    .line 401
    iget-object v4, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 402
    .line 403
    invoke-direct {v2, v3, v4, v1}, LN1/e;-><init>(Ljava/lang/String;Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-interface {p3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    goto :goto_4

    .line 410
    :cond_a
    invoke-static {p3}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 411
    .line 412
    .line 413
    move-result-object p3

    .line 414
    invoke-static {p3}, Lcom/android/launcher3/util/P0;->v(Ljava/util/Set;)Ljava/util/function/Predicate;

    .line 415
    .line 416
    .line 417
    move-result-object p3

    .line 418
    const-string v0, "ofShortcutKeys(...)"

    .line 419
    .line 420
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    const-string v0, "removed because the shortcut is no longer available in shortcut service"

    .line 424
    .line 425
    invoke-virtual {p1, p3, v0}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    :cond_b
    iget-boolean p3, p0, Lz1/D4;->d:Z

    .line 429
    .line 430
    if-eqz p3, :cond_c

    .line 431
    .line 432
    iget-object p3, p0, Lz1/D4;->a:Ljava/lang/String;

    .line 433
    .line 434
    iget-object v0, p0, Lz1/D4;->c:Landroid/os/UserHandle;

    .line 435
    .line 436
    iget-object p0, p0, Lz1/D4;->b:Ljava/util/List;

    .line 437
    .line 438
    invoke-virtual {p2, p3, v0, p0}, Lz1/y0;->v(Ljava/lang/String;Landroid/os/UserHandle;Ljava/util/List;)V

    .line 439
    .line 440
    .line 441
    invoke-virtual {p1, p2}, Lz1/o3;->A(Lz1/y0;)V

    .line 442
    .line 443
    .line 444
    :cond_c
    :goto_5
    return-void

    .line 445
    :catchall_0
    move-exception p0

    .line 446
    monitor-exit p2

    .line 447
    throw p0
.end method
