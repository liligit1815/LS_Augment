.class public final Lcom/android/launcher3/F1$b;
.super Ljava/lang/Object;
.source "InvariantDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/F1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field private final A:I

.field private final B:I

.field private final C:I

.field private final D:I

.field private final E:I

.field private final F:I

.field private final G:I

.field private final H:I

.field private final I:I

.field private final J:I

.field private final K:I

.field private final L:I

.field private final M:I

.field private final N:Z

.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field private final i:[I

.field private final j:[I

.field private final k:I

.field private final l:I

.field private final m:I

.field private final n:I

.field private final o:I

.field private final p:I

.field private final q:I

.field private final r:I

.field private final s:[Z

.field private t:I

.field private final u:Ljava/lang/String;

.field private final v:I

.field private final w:I

.field private final x:Z

.field private final y:Z

.field private final z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/launcher3/util/Z$c;)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v1, v0, [I

    .line 6
    .line 7
    iput-object v1, p0, Lcom/android/launcher3/F1$b;->i:[I

    .line 8
    .line 9
    new-array v2, v0, [I

    .line 10
    .line 11
    iput-object v2, p0, Lcom/android/launcher3/F1$b;->j:[I

    .line 12
    .line 13
    new-array v3, v0, [Z

    .line 14
    .line 15
    iput-object v3, p0, Lcom/android/launcher3/F1$b;->s:[Z

    .line 16
    .line 17
    sget-object v4, Lcom/android/launcher3/x5;->Q0:[I

    .line 18
    .line 19
    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/16 v4, 0x19

    .line 24
    .line 25
    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    iput-object v4, p0, Lcom/android/launcher3/F1$b;->a:Ljava/lang/String;

    .line 30
    .line 31
    const/16 v4, 0x10

    .line 32
    .line 33
    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    iput-object v4, p0, Lcom/android/launcher3/F1$b;->b:Ljava/lang/String;

    .line 38
    .line 39
    const/16 v4, 0xe

    .line 40
    .line 41
    const/4 v5, -0x1

    .line 42
    invoke-virtual {p2, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    iput v4, p0, Lcom/android/launcher3/F1$b;->c:I

    .line 47
    .line 48
    const/16 v4, 0x9

    .line 49
    .line 50
    const/4 v6, 0x7

    .line 51
    invoke-virtual {p2, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    iput v4, p0, Lcom/android/launcher3/F1$b;->g:I

    .line 56
    .line 57
    const/16 v4, 0xf

    .line 58
    .line 59
    invoke-virtual {p2, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    iput v4, p0, Lcom/android/launcher3/F1$b;->M:I

    .line 64
    .line 65
    const/16 v7, 0x16

    .line 66
    .line 67
    const/4 v8, 0x0

    .line 68
    invoke-virtual {p2, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 69
    .line 70
    .line 71
    move-result v7

    .line 72
    iput-boolean v7, p0, Lcom/android/launcher3/F1$b;->y:Z

    .line 73
    .line 74
    const/16 v7, 0x8

    .line 75
    .line 76
    if-eq v4, v5, :cond_0

    .line 77
    .line 78
    new-instance v6, Lcom/android/launcher3/util/W1;

    .line 79
    .line 80
    invoke-direct {v6, p1, v4}, Lcom/android/launcher3/util/W1;-><init>(Landroid/content/Context;I)V

    .line 81
    .line 82
    .line 83
    invoke-static {v6, p1, p3}, Lcom/android/launcher3/F1;->i0(Lcom/android/launcher3/util/W1;Landroid/content/Context;Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/F1$c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget p3, p1, Lcom/android/launcher3/F1$c;->b:I

    .line 88
    .line 89
    iput p3, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 90
    .line 91
    iget p3, p1, Lcom/android/launcher3/F1$c;->a:I

    .line 92
    .line 93
    iput p3, p0, Lcom/android/launcher3/F1$b;->d:I

    .line 94
    .line 95
    iget-object p3, p1, Lcom/android/launcher3/F1$c;->e:Ljava/lang/String;

    .line 96
    .line 97
    iput-object p3, p0, Lcom/android/launcher3/F1$b;->u:Ljava/lang/String;

    .line 98
    .line 99
    iget p3, p1, Lcom/android/launcher3/F1$c;->f:I

    .line 100
    .line 101
    iput p3, p0, Lcom/android/launcher3/F1$b;->v:I

    .line 102
    .line 103
    iget p1, p1, Lcom/android/launcher3/F1$c;->g:I

    .line 104
    .line 105
    iput p1, p0, Lcom/android/launcher3/F1$b;->w:I

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    const/16 p1, 0x28

    .line 109
    .line 110
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    iput p1, p0, Lcom/android/launcher3/F1$b;->d:I

    .line 115
    .line 116
    const/16 p1, 0x1c

    .line 117
    .line 118
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput p1, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 123
    .line 124
    const/4 p1, 0x6

    .line 125
    invoke-virtual {p2, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iput-object p1, p0, Lcom/android/launcher3/F1$b;->u:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p2, v6, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    iput p1, p0, Lcom/android/launcher3/F1$b;->v:I

    .line 136
    .line 137
    invoke-virtual {p2, v7, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    iput p1, p0, Lcom/android/launcher3/F1$b;->w:I

    .line 142
    .line 143
    :goto_0
    const/16 p1, 0x29

    .line 144
    .line 145
    iget p3, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 146
    .line 147
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iput p1, p0, Lcom/android/launcher3/F1$b;->f:I

    .line 152
    .line 153
    const p1, 0x7f15000d

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    iput p1, p0, Lcom/android/launcher3/F1$b;->m:I

    .line 161
    .line 162
    const/16 p1, 0x1a

    .line 163
    .line 164
    iget p3, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 165
    .line 166
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/android/launcher3/F1$b;->n:I

    .line 171
    .line 172
    const/16 p3, 0x1d

    .line 173
    .line 174
    const/4 v4, 0x2

    .line 175
    mul-int/2addr p1, v4

    .line 176
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    iput p1, p0, Lcom/android/launcher3/F1$b;->p:I

    .line 181
    .line 182
    const/16 p1, 0x27

    .line 183
    .line 184
    iget p3, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 185
    .line 186
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    iput p1, p0, Lcom/android/launcher3/F1$b;->q:I

    .line 191
    .line 192
    const/16 p3, 0x1e

    .line 193
    .line 194
    mul-int/2addr p1, v4

    .line 195
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    iput p1, p0, Lcom/android/launcher3/F1$b;->r:I

    .line 200
    .line 201
    const/16 p1, 0x14

    .line 202
    .line 203
    const p3, 0x7f070b72

    .line 204
    .line 205
    .line 206
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    iput p1, p0, Lcom/android/launcher3/F1$b;->t:I

    .line 211
    .line 212
    const/16 p1, 0x23

    .line 213
    .line 214
    iget p3, p0, Lcom/android/launcher3/F1$b;->d:I

    .line 215
    .line 216
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    aput p1, v1, v8

    .line 221
    .line 222
    const/16 p1, 0x1f

    .line 223
    .line 224
    iget p3, p0, Lcom/android/launcher3/F1$b;->e:I

    .line 225
    .line 226
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 227
    .line 228
    .line 229
    move-result p1

    .line 230
    aput p1, v2, v8

    .line 231
    .line 232
    invoke-static {}, Lf1/a;->c()Z

    .line 233
    .line 234
    .line 235
    move-result p1

    .line 236
    const/4 p3, 0x3

    .line 237
    const/4 v6, 0x1

    .line 238
    if-eqz p1, :cond_1

    .line 239
    .line 240
    const/16 p1, 0x24

    .line 241
    .line 242
    aget v9, v1, v8

    .line 243
    .line 244
    invoke-virtual {p2, p1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    aput p1, v1, v6

    .line 249
    .line 250
    const/16 p1, 0x20

    .line 251
    .line 252
    aget v9, v2, v8

    .line 253
    .line 254
    invoke-virtual {p2, p1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    aput p1, v2, v6

    .line 259
    .line 260
    const/16 p1, 0x26

    .line 261
    .line 262
    aget v9, v1, v8

    .line 263
    .line 264
    invoke-virtual {p2, p1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    aput p1, v1, v4

    .line 269
    .line 270
    const/16 p1, 0x22

    .line 271
    .line 272
    aget v9, v2, v8

    .line 273
    .line 274
    invoke-virtual {p2, p1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    aput p1, v2, v4

    .line 279
    .line 280
    const/16 p1, 0x25

    .line 281
    .line 282
    aget v9, v1, v8

    .line 283
    .line 284
    invoke-virtual {p2, p1, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    aput p1, v1, p3

    .line 289
    .line 290
    const/16 p1, 0x21

    .line 291
    .line 292
    aget v1, v2, v8

    .line 293
    .line 294
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    aput p1, v2, p3

    .line 299
    .line 300
    goto :goto_1

    .line 301
    :cond_1
    aget p1, v1, v8

    .line 302
    .line 303
    aput p1, v1, v6

    .line 304
    .line 305
    aget v9, v2, v8

    .line 306
    .line 307
    aput v9, v2, v6

    .line 308
    .line 309
    aput p1, v1, v4

    .line 310
    .line 311
    aput v9, v2, v4

    .line 312
    .line 313
    aput p1, v1, p3

    .line 314
    .line 315
    aput v9, v2, p3

    .line 316
    .line 317
    :goto_1
    const/16 p1, 0xd

    .line 318
    .line 319
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    iput p1, p0, Lcom/android/launcher3/F1$b;->k:I

    .line 324
    .line 325
    const/4 p1, 0x5

    .line 326
    const v1, 0x7f150160

    .line 327
    .line 328
    .line 329
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    iput p1, p0, Lcom/android/launcher3/F1$b;->l:I

    .line 334
    .line 335
    const/16 p1, 0x18

    .line 336
    .line 337
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    iput-boolean p1, p0, Lcom/android/launcher3/F1$b;->x:Z

    .line 342
    .line 343
    const/16 p1, 0xa

    .line 344
    .line 345
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 346
    .line 347
    .line 348
    move-result p1

    .line 349
    iput p1, p0, Lcom/android/launcher3/F1$b;->z:I

    .line 350
    .line 351
    invoke-static {}, Lf1/a;->c()Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-eqz p1, :cond_2

    .line 356
    .line 357
    const/16 p1, 0x2c

    .line 358
    .line 359
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 360
    .line 361
    .line 362
    move-result p1

    .line 363
    iput p1, p0, Lcom/android/launcher3/F1$b;->A:I

    .line 364
    .line 365
    const/16 v1, 0x2d

    .line 366
    .line 367
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 368
    .line 369
    .line 370
    move-result p1

    .line 371
    iput p1, p0, Lcom/android/launcher3/F1$b;->B:I

    .line 372
    .line 373
    invoke-virtual {p2, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 374
    .line 375
    .line 376
    move-result p1

    .line 377
    iput p1, p0, Lcom/android/launcher3/F1$b;->C:I

    .line 378
    .line 379
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    iput p1, p0, Lcom/android/launcher3/F1$b;->D:I

    .line 384
    .line 385
    const/16 p1, 0xb

    .line 386
    .line 387
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    iput p1, p0, Lcom/android/launcher3/F1$b;->E:I

    .line 392
    .line 393
    const/16 v1, 0xc

    .line 394
    .line 395
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    iput p1, p0, Lcom/android/launcher3/F1$b;->F:I

    .line 400
    .line 401
    const/16 p1, 0x12

    .line 402
    .line 403
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 404
    .line 405
    .line 406
    move-result p1

    .line 407
    iput p1, p0, Lcom/android/launcher3/F1$b;->G:I

    .line 408
    .line 409
    const/16 v1, 0x13

    .line 410
    .line 411
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 412
    .line 413
    .line 414
    move-result p1

    .line 415
    iput p1, p0, Lcom/android/launcher3/F1$b;->H:I

    .line 416
    .line 417
    const/16 p1, 0x2a

    .line 418
    .line 419
    invoke-virtual {p2, p1, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 420
    .line 421
    .line 422
    move-result p1

    .line 423
    iput p1, p0, Lcom/android/launcher3/F1$b;->I:I

    .line 424
    .line 425
    const/16 v1, 0x2b

    .line 426
    .line 427
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 428
    .line 429
    .line 430
    move-result p1

    .line 431
    iput p1, p0, Lcom/android/launcher3/F1$b;->J:I

    .line 432
    .line 433
    invoke-virtual {p2, v8, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 434
    .line 435
    .line 436
    move-result p1

    .line 437
    iput p1, p0, Lcom/android/launcher3/F1$b;->K:I

    .line 438
    .line 439
    invoke-virtual {p2, v6, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 440
    .line 441
    .line 442
    move-result p1

    .line 443
    iput p1, p0, Lcom/android/launcher3/F1$b;->L:I

    .line 444
    .line 445
    const/16 p1, 0x1b

    .line 446
    .line 447
    iget v1, p0, Lcom/android/launcher3/F1$b;->d:I

    .line 448
    .line 449
    invoke-virtual {p2, p1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 450
    .line 451
    .line 452
    move-result p1

    .line 453
    iput p1, p0, Lcom/android/launcher3/F1$b;->o:I

    .line 454
    .line 455
    goto :goto_2

    .line 456
    :cond_2
    iput v5, p0, Lcom/android/launcher3/F1$b;->A:I

    .line 457
    .line 458
    iput v5, p0, Lcom/android/launcher3/F1$b;->B:I

    .line 459
    .line 460
    iput v5, p0, Lcom/android/launcher3/F1$b;->C:I

    .line 461
    .line 462
    iput v5, p0, Lcom/android/launcher3/F1$b;->D:I

    .line 463
    .line 464
    iput v5, p0, Lcom/android/launcher3/F1$b;->E:I

    .line 465
    .line 466
    iput v5, p0, Lcom/android/launcher3/F1$b;->F:I

    .line 467
    .line 468
    iput v5, p0, Lcom/android/launcher3/F1$b;->G:I

    .line 469
    .line 470
    iput v5, p0, Lcom/android/launcher3/F1$b;->H:I

    .line 471
    .line 472
    iput v5, p0, Lcom/android/launcher3/F1$b;->I:I

    .line 473
    .line 474
    iput v5, p0, Lcom/android/launcher3/F1$b;->J:I

    .line 475
    .line 476
    iput v5, p0, Lcom/android/launcher3/F1$b;->K:I

    .line 477
    .line 478
    iput v5, p0, Lcom/android/launcher3/F1$b;->L:I

    .line 479
    .line 480
    iget p1, p0, Lcom/android/launcher3/F1$b;->d:I

    .line 481
    .line 482
    iput p1, p0, Lcom/android/launcher3/F1$b;->o:I

    .line 483
    .line 484
    :goto_2
    const/16 p1, 0x17

    .line 485
    .line 486
    invoke-virtual {p2, p1, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 487
    .line 488
    .line 489
    move-result p1

    .line 490
    iput-boolean p1, p0, Lcom/android/launcher3/F1$b;->N:Z

    .line 491
    .line 492
    const/16 p1, 0x11

    .line 493
    .line 494
    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 495
    .line 496
    .line 497
    move-result p1

    .line 498
    iput p1, p0, Lcom/android/launcher3/F1$b;->h:I

    .line 499
    .line 500
    const/16 p0, 0x15

    .line 501
    .line 502
    invoke-virtual {p2, p0, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 503
    .line 504
    .line 505
    move-result p0

    .line 506
    and-int/lit8 p1, p0, 0x1

    .line 507
    .line 508
    if-ne p1, v6, :cond_3

    .line 509
    .line 510
    move p1, v6

    .line 511
    goto :goto_3

    .line 512
    :cond_3
    move p1, v8

    .line 513
    :goto_3
    aput-boolean p1, v3, v8

    .line 514
    .line 515
    and-int/lit8 p1, p0, 0x2

    .line 516
    .line 517
    if-ne p1, v4, :cond_4

    .line 518
    .line 519
    move p1, v6

    .line 520
    goto :goto_4

    .line 521
    :cond_4
    move p1, v8

    .line 522
    :goto_4
    aput-boolean p1, v3, v6

    .line 523
    .line 524
    and-int/lit8 p1, p0, 0x4

    .line 525
    .line 526
    if-ne p1, v0, :cond_5

    .line 527
    .line 528
    move p1, v6

    .line 529
    goto :goto_5

    .line 530
    :cond_5
    move p1, v8

    .line 531
    :goto_5
    aput-boolean p1, v3, v4

    .line 532
    .line 533
    and-int/2addr p0, v7

    .line 534
    if-ne p0, v7, :cond_6

    .line 535
    .line 536
    move v8, v6

    .line 537
    :cond_6
    aput-boolean v8, v3, p3

    .line 538
    .line 539
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 540
    .line 541
    .line 542
    return-void
.end method

.method static bridge synthetic A(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->p:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic B(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->r:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic C(Lcom/android/launcher3/F1$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$b;->j:[I

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic D(Lcom/android/launcher3/F1$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$b;->i:[I

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic E(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->q:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic a(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->m:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->l:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/F1$b;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$b;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->v:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->w:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->z:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->k:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->t:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/F1$b;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/F1$b;->s:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/F1$b;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->K:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->L:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->C:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->D:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->E:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->F:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->M:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic r(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->G:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic s(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->H:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic t(Lcom/android/launcher3/F1$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/F1$b;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic u(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->o:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic v(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->I:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic w(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->J:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic x(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->A:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic y(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->B:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic z(Lcom/android/launcher3/F1$b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/F1$b;->n:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public F(IZ)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x2

    .line 4
    if-ne p1, v2, :cond_1

    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->q0()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-boolean p0, p0, Lcom/android/launcher3/F1$b;->y:Z

    .line 11
    .line 12
    if-ne p1, p0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    return v0

    .line 16
    :cond_1
    iget-boolean p1, p0, Lcom/android/launcher3/F1$b;->N:Z

    .line 17
    .line 18
    if-nez p1, :cond_5

    .line 19
    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    iget p0, p0, Lcom/android/launcher3/F1$b;->h:I

    .line 24
    .line 25
    if-ne p0, v1, :cond_3

    .line 26
    .line 27
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_3
    if-ne p0, v2, :cond_4

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    xor-int/2addr p0, v1

    .line 39
    return p0

    .line 40
    :cond_4
    return v1

    .line 41
    :cond_5
    :goto_0
    if-eqz p1, :cond_6

    .line 42
    .line 43
    if-eqz p2, :cond_6

    .line 44
    .line 45
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_6

    .line 50
    .line 51
    return v1

    .line 52
    :cond_6
    return v0
.end method

.method public G(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    if-eq p1, v1, :cond_2

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    if-eq p1, v2, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    iget p0, p0, Lcom/android/launcher3/F1$b;->g:I

    .line 12
    .line 13
    and-int/2addr p0, v2

    .line 14
    if-ne p0, v2, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    return v0

    .line 18
    :cond_2
    iget p0, p0, Lcom/android/launcher3/F1$b;->g:I

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    and-int/2addr p0, p1

    .line 22
    if-ne p0, p1, :cond_3

    .line 23
    .line 24
    return v1

    .line 25
    :cond_3
    return v0

    .line 26
    :cond_4
    iget p0, p0, Lcom/android/launcher3/F1$b;->g:I

    .line 27
    .line 28
    and-int/2addr p0, v1

    .line 29
    if-ne p0, v1, :cond_5

    .line 30
    .line 31
    return v1

    .line 32
    :cond_5
    return v0
.end method
