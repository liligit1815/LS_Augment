.class public LJ0/l;
.super Ljava/lang/Object;
.source "InterpolatorsAndroidX.java"


# static fields
.field public static final A:Ly/n;

.field public static final B:Ly/n;

.field public static final C:Ly/n;

.field public static final D:Ly/n;

.field public static final E:Ly/n;

.field public static final F:Ly/n;

.field public static final G:Ly/n;

.field public static final H:Ly/n;

.field public static final I:Ly/n;

.field public static final J:Ly/n;

.field public static final K:Ly/n;

.field public static final L:Ly/n;

.field public static final M:Ly/n;

.field public static final N:Ly/n;

.field public static final O:Ly/n;

.field public static final P:Ly/n;

.field public static final Q:Ly/n;

.field public static final R:Ly/n;

.field public static final S:Ly/n;

.field public static final T:Ly/n;

.field public static final U:Ly/n;

.field public static final V:Ly/n;

.field public static final W:Ly/n;

.field public static final X:Ly/n;

.field public static final Y:Ly/n;

.field public static final Z:Ly/n;

.field public static final a:Ly/n;

.field public static final a0:Ly/n;

.field public static final b:Ly/n;

.field public static final b0:Ly/n;

.field public static final c:Ly/n;

.field public static final d:Ly/n;

.field public static final e:Ly/n;

.field public static final f:Ly/n;

.field public static final g:Ly/n;

.field public static final h:Ly/n;

.field public static final i:Ly/n;

.field public static final j:Ly/n;

.field public static final k:Ly/n;

.field public static final l:Ly/n;

.field public static final m:Ly/n;

.field public static final n:Ly/n;

.field public static final o:Ly/n;

.field public static final p:Ly/n;

.field public static final q:Ly/n;

.field public static final r:Ly/n;

.field public static final s:Ly/n;

.field public static final t:Ly/n;

.field public static final u:Ly/n;

.field public static final v:Ly/n;

.field public static final w:Ly/n;

.field public static final x:Ly/n;

.field public static final y:Ly/n;

.field public static final z:Ly/n;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    invoke-static {}, LJ0/l;->e()Ly/u;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, LJ0/l;->a:Ly/n;

    .line 6
    .line 7
    invoke-static {}, LJ0/l;->d()Ly/u;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, LJ0/l;->b:Ly/n;

    .line 12
    .line 13
    new-instance v0, Ly/u;

    .line 14
    .line 15
    const v1, 0x3e19999a    # 0.15f

    .line 16
    .line 17
    .line 18
    const v2, 0x3e99999a    # 0.3f

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    const v4, 0x3f4ccccd    # 0.8f

    .line 23
    .line 24
    .line 25
    invoke-direct {v0, v2, v3, v4, v1}, Ly/u;-><init>(FFFF)V

    .line 26
    .line 27
    .line 28
    sput-object v0, LJ0/l;->c:Ly/n;

    .line 29
    .line 30
    new-instance v0, Ly/u;

    .line 31
    .line 32
    const v1, 0x3d4ccccd    # 0.05f

    .line 33
    .line 34
    .line 35
    const v5, 0x3f333333    # 0.7f

    .line 36
    .line 37
    .line 38
    const v6, 0x3dcccccd    # 0.1f

    .line 39
    .line 40
    .line 41
    const/high16 v7, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-direct {v0, v1, v5, v6, v7}, Ly/u;-><init>(FFFF)V

    .line 44
    .line 45
    .line 46
    sput-object v0, LJ0/l;->d:Ly/n;

    .line 47
    .line 48
    new-instance v8, Landroid/graphics/Path;

    .line 49
    .line 50
    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v8, v3, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 54
    .line 55
    .line 56
    const v13, 0x3e2aaa7e

    .line 57
    .line 58
    .line 59
    const v14, 0x3ecccccd    # 0.4f

    .line 60
    .line 61
    .line 62
    const v9, 0x3d4ccccd    # 0.05f

    .line 63
    .line 64
    .line 65
    const/4 v10, 0x0

    .line 66
    const v11, 0x3e088872

    .line 67
    .line 68
    .line 69
    const v12, 0x3da3d70a    # 0.08f

    .line 70
    .line 71
    .line 72
    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 73
    .line 74
    .line 75
    const/high16 v13, 0x3f800000    # 1.0f

    .line 76
    .line 77
    const/high16 v14, 0x3f800000    # 1.0f

    .line 78
    .line 79
    const v9, 0x3e666666    # 0.225f

    .line 80
    .line 81
    .line 82
    const v10, 0x3f70a3d7    # 0.94f

    .line 83
    .line 84
    .line 85
    const/high16 v11, 0x3f000000    # 0.5f

    .line 86
    .line 87
    const/high16 v12, 0x3f800000    # 1.0f

    .line 88
    .line 89
    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 90
    .line 91
    .line 92
    new-instance v0, Ly/u;

    .line 93
    .line 94
    invoke-direct {v0, v8}, Ly/u;-><init>(Landroid/graphics/Path;)V

    .line 95
    .line 96
    .line 97
    sput-object v0, LJ0/l;->e:Ly/n;

    .line 98
    .line 99
    new-instance v0, LJ0/i;

    .line 100
    .line 101
    invoke-direct {v0}, LJ0/i;-><init>()V

    .line 102
    .line 103
    .line 104
    sput-object v0, LJ0/l;->f:Ly/n;

    .line 105
    .line 106
    new-instance v0, LJ0/j;

    .line 107
    .line 108
    invoke-direct {v0}, LJ0/j;-><init>()V

    .line 109
    .line 110
    .line 111
    sput-object v0, LJ0/l;->g:Ly/n;

    .line 112
    .line 113
    new-instance v0, Ly/t;

    .line 114
    .line 115
    const/high16 v1, 0x3f400000    # 0.75f

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ly/t;-><init>(F)V

    .line 118
    .line 119
    .line 120
    sput-object v0, LJ0/l;->h:Ly/n;

    .line 121
    .line 122
    new-instance v0, Ly/t;

    .line 123
    .line 124
    const v8, 0x3f99999a    # 1.2f

    .line 125
    .line 126
    .line 127
    invoke-direct {v0, v8}, Ly/t;-><init>(F)V

    .line 128
    .line 129
    .line 130
    sput-object v0, LJ0/l;->i:Ly/n;

    .line 131
    .line 132
    new-instance v0, Ly/t;

    .line 133
    .line 134
    const v8, 0x3fd9999a    # 1.7f

    .line 135
    .line 136
    .line 137
    invoke-direct {v0, v8}, Ly/t;-><init>(F)V

    .line 138
    .line 139
    .line 140
    sput-object v0, LJ0/l;->j:Ly/n;

    .line 141
    .line 142
    new-instance v0, Ly/u;

    .line 143
    .line 144
    const v9, 0x3e4ccccd    # 0.2f

    .line 145
    .line 146
    .line 147
    invoke-direct {v0, v9, v3, v3, v7}, Ly/u;-><init>(FFFF)V

    .line 148
    .line 149
    .line 150
    sput-object v0, LJ0/l;->k:Ly/n;

    .line 151
    .line 152
    new-instance v0, Ly/u;

    .line 153
    .line 154
    invoke-direct {v0, v2, v3, v7, v7}, Ly/u;-><init>(FFFF)V

    .line 155
    .line 156
    .line 157
    sput-object v0, LJ0/l;->l:Ly/n;

    .line 158
    .line 159
    new-instance v0, Ly/u;

    .line 160
    .line 161
    invoke-direct {v0, v3, v3, v3, v7}, Ly/u;-><init>(FFFF)V

    .line 162
    .line 163
    .line 164
    sput-object v0, LJ0/l;->m:Ly/n;

    .line 165
    .line 166
    new-instance v0, Ly/u;

    .line 167
    .line 168
    const v10, 0x3ecccccd    # 0.4f

    .line 169
    .line 170
    .line 171
    invoke-direct {v0, v10, v3, v9, v7}, Ly/u;-><init>(FFFF)V

    .line 172
    .line 173
    .line 174
    sput-object v0, LJ0/l;->n:Ly/n;

    .line 175
    .line 176
    new-instance v11, Ly/u;

    .line 177
    .line 178
    invoke-direct {v11, v10, v3, v7, v7}, Ly/u;-><init>(FFFF)V

    .line 179
    .line 180
    .line 181
    sput-object v11, LJ0/l;->o:Ly/n;

    .line 182
    .line 183
    new-instance v12, Ly/u;

    .line 184
    .line 185
    invoke-direct {v12, v3, v3, v9, v7}, Ly/u;-><init>(FFFF)V

    .line 186
    .line 187
    .line 188
    sput-object v12, LJ0/l;->p:Ly/n;

    .line 189
    .line 190
    new-instance v13, Ly/r;

    .line 191
    .line 192
    invoke-direct {v13}, Ly/r;-><init>()V

    .line 193
    .line 194
    .line 195
    sput-object v13, LJ0/l;->q:Ly/n;

    .line 196
    .line 197
    sput-object v0, LJ0/l;->r:Ly/n;

    .line 198
    .line 199
    sput-object v11, LJ0/l;->s:Ly/n;

    .line 200
    .line 201
    sput-object v12, LJ0/l;->t:Ly/n;

    .line 202
    .line 203
    new-instance v0, Ly/u;

    .line 204
    .line 205
    const v11, 0x3f19999a    # 0.6f

    .line 206
    .line 207
    .line 208
    invoke-direct {v0, v4, v3, v11, v7}, Ly/u;-><init>(FFFF)V

    .line 209
    .line 210
    .line 211
    sput-object v0, LJ0/l;->u:Ly/n;

    .line 212
    .line 213
    new-instance v0, Ly/u;

    .line 214
    .line 215
    invoke-direct {v0, v4, v3, v7, v7}, Ly/u;-><init>(FFFF)V

    .line 216
    .line 217
    .line 218
    sput-object v0, LJ0/l;->v:Ly/n;

    .line 219
    .line 220
    new-instance v0, Ly/u;

    .line 221
    .line 222
    invoke-direct {v0, v9, v3, v3, v7}, Ly/u;-><init>(FFFF)V

    .line 223
    .line 224
    .line 225
    sput-object v0, LJ0/l;->w:Ly/n;

    .line 226
    .line 227
    new-instance v0, Ly/u;

    .line 228
    .line 229
    invoke-direct {v0, v11, v3, v10, v7}, Ly/u;-><init>(FFFF)V

    .line 230
    .line 231
    .line 232
    sput-object v0, LJ0/l;->x:Ly/n;

    .line 233
    .line 234
    new-instance v0, Ly/u;

    .line 235
    .line 236
    invoke-direct {v0, v3, v3, v9, v7}, Ly/u;-><init>(FFFF)V

    .line 237
    .line 238
    .line 239
    sput-object v0, LJ0/l;->y:Ly/n;

    .line 240
    .line 241
    new-instance v0, Ly/u;

    .line 242
    .line 243
    invoke-direct {v0, v10, v3, v7, v7}, Ly/u;-><init>(FFFF)V

    .line 244
    .line 245
    .line 246
    sput-object v0, LJ0/l;->z:Ly/n;

    .line 247
    .line 248
    new-instance v0, Ly/u;

    .line 249
    .line 250
    invoke-direct {v0, v10, v3, v7, v7}, Ly/u;-><init>(FFFF)V

    .line 251
    .line 252
    .line 253
    sput-object v0, LJ0/l;->A:Ly/n;

    .line 254
    .line 255
    new-instance v0, Ly/u;

    .line 256
    .line 257
    invoke-direct {v0, v3, v3, v4, v7}, Ly/u;-><init>(FFFF)V

    .line 258
    .line 259
    .line 260
    sput-object v0, LJ0/l;->B:Ly/n;

    .line 261
    .line 262
    new-instance v0, Ly/b;

    .line 263
    .line 264
    invoke-direct {v0}, Ly/b;-><init>()V

    .line 265
    .line 266
    .line 267
    sput-object v0, LJ0/l;->C:Ly/n;

    .line 268
    .line 269
    new-instance v0, Ly/b;

    .line 270
    .line 271
    const/high16 v4, 0x3f000000    # 0.5f

    .line 272
    .line 273
    invoke-direct {v0, v4}, Ly/b;-><init>(F)V

    .line 274
    .line 275
    .line 276
    sput-object v0, LJ0/l;->D:Ly/n;

    .line 277
    .line 278
    new-instance v0, Ly/b;

    .line 279
    .line 280
    invoke-direct {v0, v1}, Ly/b;-><init>(F)V

    .line 281
    .line 282
    .line 283
    sput-object v0, LJ0/l;->E:Ly/n;

    .line 284
    .line 285
    new-instance v0, Ly/b;

    .line 286
    .line 287
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 288
    .line 289
    invoke-direct {v0, v1}, Ly/b;-><init>(F)V

    .line 290
    .line 291
    .line 292
    sput-object v0, LJ0/l;->F:Ly/n;

    .line 293
    .line 294
    new-instance v0, Ly/b;

    .line 295
    .line 296
    const/high16 v12, 0x40000000    # 2.0f

    .line 297
    .line 298
    invoke-direct {v0, v12}, Ly/b;-><init>(F)V

    .line 299
    .line 300
    .line 301
    sput-object v0, LJ0/l;->G:Ly/n;

    .line 302
    .line 303
    new-instance v0, Ly/a;

    .line 304
    .line 305
    invoke-direct {v0}, Ly/a;-><init>()V

    .line 306
    .line 307
    .line 308
    sput-object v0, LJ0/l;->H:Ly/n;

    .line 309
    .line 310
    new-instance v0, Ly/i;

    .line 311
    .line 312
    invoke-direct {v0}, Ly/i;-><init>()V

    .line 313
    .line 314
    .line 315
    sput-object v0, LJ0/l;->I:Ly/n;

    .line 316
    .line 317
    new-instance v0, Ly/i;

    .line 318
    .line 319
    invoke-direct {v0, v1}, Ly/i;-><init>(F)V

    .line 320
    .line 321
    .line 322
    sput-object v0, LJ0/l;->J:Ly/n;

    .line 323
    .line 324
    new-instance v0, Ly/i;

    .line 325
    .line 326
    invoke-direct {v0, v8}, Ly/i;-><init>(F)V

    .line 327
    .line 328
    .line 329
    sput-object v0, LJ0/l;->K:Ly/n;

    .line 330
    .line 331
    new-instance v0, Ly/i;

    .line 332
    .line 333
    invoke-direct {v0, v12}, Ly/i;-><init>(F)V

    .line 334
    .line 335
    .line 336
    sput-object v0, LJ0/l;->L:Ly/n;

    .line 337
    .line 338
    new-instance v0, Ly/i;

    .line 339
    .line 340
    const/high16 v1, 0x40200000    # 2.5f

    .line 341
    .line 342
    invoke-direct {v0, v1}, Ly/i;-><init>(F)V

    .line 343
    .line 344
    .line 345
    sput-object v0, LJ0/l;->M:Ly/n;

    .line 346
    .line 347
    new-instance v0, Ly/i;

    .line 348
    .line 349
    const/high16 v1, 0x40400000    # 3.0f

    .line 350
    .line 351
    invoke-direct {v0, v1}, Ly/i;-><init>(F)V

    .line 352
    .line 353
    .line 354
    sput-object v0, LJ0/l;->N:Ly/n;

    .line 355
    .line 356
    new-instance v0, Ly/u;

    .line 357
    .line 358
    invoke-direct {v0, v10, v3, v11, v7}, Ly/u;-><init>(FFFF)V

    .line 359
    .line 360
    .line 361
    sput-object v0, LJ0/l;->O:Ly/n;

    .line 362
    .line 363
    new-instance v0, Ly/u;

    .line 364
    .line 365
    const v1, 0x3fb33333    # 1.4f

    .line 366
    .line 367
    .line 368
    invoke-direct {v0, v10, v3, v9, v1}, Ly/u;-><init>(FFFF)V

    .line 369
    .line 370
    .line 371
    sput-object v0, LJ0/l;->P:Ly/n;

    .line 372
    .line 373
    new-instance v0, Ly/u;

    .line 374
    .line 375
    const v1, 0x3f8ccccd    # 1.1f

    .line 376
    .line 377
    .line 378
    invoke-direct {v0, v10, v3, v9, v1}, Ly/u;-><init>(FFFF)V

    .line 379
    .line 380
    .line 381
    sput-object v0, LJ0/l;->Q:Ly/n;

    .line 382
    .line 383
    new-instance v0, Ly/u;

    .line 384
    .line 385
    invoke-direct {v0, v2, v3, v4, v7}, Ly/u;-><init>(FFFF)V

    .line 386
    .line 387
    .line 388
    sput-object v0, LJ0/l;->R:Ly/n;

    .line 389
    .line 390
    new-instance v0, Ly/h;

    .line 391
    .line 392
    invoke-direct {v0}, Ly/h;-><init>()V

    .line 393
    .line 394
    .line 395
    sput-object v0, LJ0/l;->S:Ly/n;

    .line 396
    .line 397
    new-instance v0, Ly/u;

    .line 398
    .line 399
    invoke-direct {v0, v10, v3, v9, v7}, Ly/u;-><init>(FFFF)V

    .line 400
    .line 401
    .line 402
    sput-object v0, LJ0/l;->T:Ly/n;

    .line 403
    .line 404
    new-instance v0, Ly/u;

    .line 405
    .line 406
    invoke-direct {v0, v2, v3, v6, v7}, Ly/u;-><init>(FFFF)V

    .line 407
    .line 408
    .line 409
    sput-object v0, LJ0/l;->U:Ly/n;

    .line 410
    .line 411
    new-instance v0, Ly/u;

    .line 412
    .line 413
    const v1, 0x3f666666    # 0.9f

    .line 414
    .line 415
    .line 416
    invoke-direct {v0, v1, v3, v5, v7}, Ly/u;-><init>(FFFF)V

    .line 417
    .line 418
    .line 419
    sput-object v0, LJ0/l;->V:Ly/n;

    .line 420
    .line 421
    new-instance v0, LJ0/k;

    .line 422
    .line 423
    invoke-direct {v0}, LJ0/k;-><init>()V

    .line 424
    .line 425
    .line 426
    sput-object v0, LJ0/l;->W:Ly/n;

    .line 427
    .line 428
    new-instance v0, LJ0/l$a;

    .line 429
    .line 430
    invoke-direct {v0}, LJ0/l$a;-><init>()V

    .line 431
    .line 432
    .line 433
    sput-object v0, LJ0/l;->X:Ly/n;

    .line 434
    .line 435
    new-instance v0, LJ0/l$b;

    .line 436
    .line 437
    invoke-direct {v0}, LJ0/l$b;-><init>()V

    .line 438
    .line 439
    .line 440
    sput-object v0, LJ0/l;->Y:Ly/n;

    .line 441
    .line 442
    new-instance v0, LJ0/l$c;

    .line 443
    .line 444
    invoke-direct {v0}, LJ0/l$c;-><init>()V

    .line 445
    .line 446
    .line 447
    sput-object v0, LJ0/l;->Z:Ly/n;

    .line 448
    .line 449
    new-instance v0, LJ0/l$d;

    .line 450
    .line 451
    invoke-direct {v0}, LJ0/l$d;-><init>()V

    .line 452
    .line 453
    .line 454
    sput-object v0, LJ0/l;->a0:Ly/n;

    .line 455
    .line 456
    new-instance v0, Ly/u;

    .line 457
    .line 458
    invoke-direct {v0, v6, v6, v3, v7}, Ly/u;-><init>(FFFF)V

    .line 459
    .line 460
    .line 461
    sput-object v0, LJ0/l;->b0:Ly/n;

    .line 462
    .line 463
    return-void
.end method

.method public static synthetic a(F)F
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpg-float p0, p0, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    return v0
.end method

.method public static synthetic b(F)F
    .locals 2

    .line 1
    sget-object v0, LJ0/l;->H:Ly/n;

    .line 2
    .line 3
    sget-object v1, LJ0/l;->U:Ly/n;

    .line 4
    .line 5
    invoke-interface {v1, p0}, Ly/n;->getInterpolation(F)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {v0, p0}, Ly/n;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic c(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    return p0
.end method

.method private static d()Ly/u;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 8
    .line 9
    .line 10
    const v5, 0x3e2ab368    # 0.1667f

    .line 11
    .line 12
    .line 13
    const v6, 0x3f28f5c3    # 0.66f

    .line 14
    .line 15
    .line 16
    const v1, 0x3df93dd9    # 0.1217f

    .line 17
    .line 18
    .line 19
    const v2, 0x3d3d3c36    # 0.0462f

    .line 20
    .line 21
    .line 22
    const v3, 0x3e19999a    # 0.15f

    .line 23
    .line 24
    .line 25
    const v4, 0x3eefec57    # 0.4686f

    .line 26
    .line 27
    .line 28
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 29
    .line 30
    .line 31
    const/high16 v5, 0x3f800000    # 1.0f

    .line 32
    .line 33
    const/high16 v6, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const v1, 0x3e3bcd36    # 0.1834f

    .line 36
    .line 37
    .line 38
    const v2, 0x3f6346dc    # 0.8878f

    .line 39
    .line 40
    .line 41
    const v3, 0x3e2ab368    # 0.1667f

    .line 42
    .line 43
    .line 44
    const/high16 v4, 0x3f800000    # 1.0f

    .line 45
    .line 46
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Ly/u;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Ly/u;-><init>(Landroid/graphics/Path;)V

    .line 52
    .line 53
    .line 54
    return-object v1
.end method

.method private static e()Ly/u;
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 8
    .line 9
    .line 10
    const v5, 0x3e2aaa7e

    .line 11
    .line 12
    .line 13
    const v6, 0x3ecccccd    # 0.4f

    .line 14
    .line 15
    .line 16
    const v1, 0x3d4ccccd    # 0.05f

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const v3, 0x3e088872

    .line 21
    .line 22
    .line 23
    const v4, 0x3d75c28f    # 0.06f

    .line 24
    .line 25
    .line 26
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 27
    .line 28
    .line 29
    const/high16 v5, 0x3f800000    # 1.0f

    .line 30
    .line 31
    const/high16 v6, 0x3f800000    # 1.0f

    .line 32
    .line 33
    const v1, 0x3e55553f    # 0.208333f

    .line 34
    .line 35
    .line 36
    const v2, 0x3f51eb85    # 0.82f

    .line 37
    .line 38
    .line 39
    const/high16 v3, 0x3e800000    # 0.25f

    .line 40
    .line 41
    const/high16 v4, 0x3f800000    # 1.0f

    .line 42
    .line 43
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Ly/u;

    .line 47
    .line 48
    invoke-direct {v1, v0}, Ly/u;-><init>(Landroid/graphics/Path;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method
