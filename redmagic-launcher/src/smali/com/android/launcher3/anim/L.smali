.class public Lcom/android/launcher3/anim/L;
.super Ljava/lang/Object;
.source "InterpolatorsMFV.java"


# static fields
.field public static final A:Landroid/view/animation/Interpolator;

.field public static final B:Landroid/view/animation/Interpolator;

.field public static final C:Landroid/view/animation/Interpolator;

.field public static final D:Landroid/view/animation/Interpolator;

.field public static final E:Landroid/view/animation/Interpolator;

.field public static final F:Landroid/view/animation/Interpolator;

.field public static final G:Landroid/view/animation/Interpolator;

.field public static final H:Landroid/view/animation/Interpolator;

.field public static final I:Landroid/view/animation/Interpolator;

.field public static final J:Landroid/view/animation/Interpolator;

.field public static final K:Landroid/view/animation/Interpolator;

.field public static final L:Landroid/view/animation/Interpolator;

.field public static final M:Landroid/view/animation/Interpolator;

.field public static final N:Landroid/view/animation/Interpolator;

.field public static final O:Landroid/view/animation/Interpolator;

.field public static final P:Landroid/view/animation/Interpolator;

.field public static final Q:Landroid/view/animation/Interpolator;

.field public static final R:Landroid/view/animation/Interpolator;

.field public static final S:Landroid/view/animation/Interpolator;

.field public static final T:Landroid/view/animation/Interpolator;

.field public static final U:Landroid/view/animation/Interpolator;

.field public static final V:Landroid/view/animation/Interpolator;

.field public static final W:Landroid/view/animation/Interpolator;

.field public static final X:Landroid/view/animation/Interpolator;

.field public static final Y:Landroid/view/animation/PathInterpolator;

.field private static final a:F

.field public static final b:Landroid/view/animation/Interpolator;

.field public static final c:Landroid/view/animation/Interpolator;

.field public static final d:Landroid/view/animation/Interpolator;

.field public static final e:Landroid/view/animation/Interpolator;

.field public static final f:Landroid/view/animation/Interpolator;

.field public static final g:Landroid/view/animation/Interpolator;

.field public static final h:Landroid/view/animation/Interpolator;

.field public static final i:Landroid/view/animation/Interpolator;

.field public static final j:Landroid/view/animation/Interpolator;

.field public static final k:Landroid/view/animation/Interpolator;

.field public static final l:Landroid/view/animation/Interpolator;

.field public static final m:Landroid/view/animation/Interpolator;

.field public static final n:Landroid/view/animation/Interpolator;

.field public static final o:Landroid/view/animation/Interpolator;

.field public static final p:Landroid/view/animation/Interpolator;

.field public static final q:Landroid/view/animation/Interpolator;

.field public static final r:Landroid/view/animation/Interpolator;

.field public static final s:Landroid/view/animation/Interpolator;

.field public static final t:Landroid/view/animation/Interpolator;

.field public static final u:Landroid/view/animation/Interpolator;

.field public static final v:Landroid/view/animation/Interpolator;

.field public static final w:F

.field public static final x:Landroid/view/animation/Interpolator;

.field public static final y:Landroid/view/animation/Interpolator;

.field public static final z:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    sget v0, Lcom/android/launcher3/anim/C;->Q:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x41f00000    # 30.0f

    .line 5
    .line 6
    div-float/2addr v1, v0

    .line 7
    sput v1, Lcom/android/launcher3/anim/L;->a:F

    .line 8
    .line 9
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 17
    .line 18
    const/high16 v2, 0x3f000000    # 0.5f

    .line 19
    .line 20
    invoke-direct {v0, v2}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/android/launcher3/anim/L;->c:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 26
    .line 27
    const/high16 v3, 0x3f400000    # 0.75f

    .line 28
    .line 29
    invoke-direct {v0, v3}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/android/launcher3/anim/L;->d:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 35
    .line 36
    const/high16 v3, 0x3fc00000    # 1.5f

    .line 37
    .line 38
    invoke-direct {v0, v3}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/android/launcher3/anim/L;->e:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 44
    .line 45
    const/high16 v4, 0x40000000    # 2.0f

    .line 46
    .line 47
    invoke-direct {v0, v4}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/android/launcher3/anim/L;->f:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 53
    .line 54
    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lcom/android/launcher3/anim/L;->g:Landroid/view/animation/Interpolator;

    .line 58
    .line 59
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 60
    .line 61
    invoke-direct {v0, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 62
    .line 63
    .line 64
    sput-object v0, Lcom/android/launcher3/anim/L;->h:Landroid/view/animation/Interpolator;

    .line 65
    .line 66
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 67
    .line 68
    const v3, 0x3fd9999a    # 1.7f

    .line 69
    .line 70
    .line 71
    invoke-direct {v0, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 72
    .line 73
    .line 74
    sput-object v0, Lcom/android/launcher3/anim/L;->i:Landroid/view/animation/Interpolator;

    .line 75
    .line 76
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 77
    .line 78
    invoke-direct {v0, v4}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 79
    .line 80
    .line 81
    sput-object v0, Lcom/android/launcher3/anim/L;->j:Landroid/view/animation/Interpolator;

    .line 82
    .line 83
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 84
    .line 85
    const/high16 v3, 0x40200000    # 2.5f

    .line 86
    .line 87
    invoke-direct {v0, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/android/launcher3/anim/L;->k:Landroid/view/animation/Interpolator;

    .line 91
    .line 92
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 93
    .line 94
    const/high16 v3, 0x40400000    # 3.0f

    .line 95
    .line 96
    invoke-direct {v0, v3}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 97
    .line 98
    .line 99
    sput-object v0, Lcom/android/launcher3/anim/L;->l:Landroid/view/animation/Interpolator;

    .line 100
    .line 101
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 102
    .line 103
    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 104
    .line 105
    .line 106
    sput-object v0, Lcom/android/launcher3/anim/L;->m:Landroid/view/animation/Interpolator;

    .line 107
    .line 108
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 109
    .line 110
    const v3, 0x3ea8f5c3    # 0.33f

    .line 111
    .line 112
    .line 113
    const/4 v4, 0x0

    .line 114
    const/high16 v5, 0x3f800000    # 1.0f

    .line 115
    .line 116
    invoke-direct {v0, v3, v4, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 117
    .line 118
    .line 119
    sput-object v0, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 120
    .line 121
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 122
    .line 123
    const v6, 0x3dcccccd    # 0.1f

    .line 124
    .line 125
    .line 126
    const v7, 0x3e99999a    # 0.3f

    .line 127
    .line 128
    .line 129
    invoke-direct {v0, v7, v6, v7, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 130
    .line 131
    .line 132
    sput-object v0, Lcom/android/launcher3/anim/L;->o:Landroid/view/animation/Interpolator;

    .line 133
    .line 134
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 135
    .line 136
    const v6, 0x3e428f5c    # 0.19f

    .line 137
    .line 138
    .line 139
    const v8, 0x3e2e147b    # 0.17f

    .line 140
    .line 141
    .line 142
    const/high16 v9, 0x3e800000    # 0.25f

    .line 143
    .line 144
    invoke-direct {v0, v8, v9, v6, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lcom/android/launcher3/anim/L;->p:Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 150
    .line 151
    const v6, 0x3e4ccccd    # 0.2f

    .line 152
    .line 153
    .line 154
    const v10, 0x3e6147ae    # 0.22f

    .line 155
    .line 156
    .line 157
    invoke-direct {v0, v6, v10, v8, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 158
    .line 159
    .line 160
    sput-object v0, Lcom/android/launcher3/anim/L;->q:Landroid/view/animation/Interpolator;

    .line 161
    .line 162
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    .line 163
    .line 164
    const v11, 0x3f666666    # 0.9f

    .line 165
    .line 166
    .line 167
    invoke-direct {v0, v11}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lcom/android/launcher3/anim/L;->r:Landroid/view/animation/Interpolator;

    .line 171
    .line 172
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 173
    .line 174
    invoke-direct {v0, v3, v4, v7, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 175
    .line 176
    .line 177
    sput-object v0, Lcom/android/launcher3/anim/L;->s:Landroid/view/animation/Interpolator;

    .line 178
    .line 179
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 180
    .line 181
    const v11, 0x3f2e147b    # 0.68f

    .line 182
    .line 183
    .line 184
    invoke-direct {v0, v3, v5, v11, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 185
    .line 186
    .line 187
    sput-object v0, Lcom/android/launcher3/anim/L;->t:Landroid/view/animation/Interpolator;

    .line 188
    .line 189
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 190
    .line 191
    invoke-direct {v0, v3, v4, v3, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 192
    .line 193
    .line 194
    sput-object v0, Lcom/android/launcher3/anim/L;->u:Landroid/view/animation/Interpolator;

    .line 195
    .line 196
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 197
    .line 198
    const v11, 0x3e19999a    # 0.15f

    .line 199
    .line 200
    .line 201
    const v12, 0x3f3ae148    # 0.73f

    .line 202
    .line 203
    .line 204
    invoke-direct {v0, v11, v12, v3, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 205
    .line 206
    .line 207
    sput-object v0, Lcom/android/launcher3/anim/L;->v:Landroid/view/animation/Interpolator;

    .line 208
    .line 209
    invoke-interface {v0, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    div-float/2addr v0, v1

    .line 214
    sput v0, Lcom/android/launcher3/anim/L;->w:F

    .line 215
    .line 216
    new-instance v0, Lcom/android/launcher3/anim/K;

    .line 217
    .line 218
    invoke-direct {v0}, Lcom/android/launcher3/anim/K;-><init>()V

    .line 219
    .line 220
    .line 221
    sput-object v0, Lcom/android/launcher3/anim/L;->x:Landroid/view/animation/Interpolator;

    .line 222
    .line 223
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 224
    .line 225
    invoke-direct {v0, v7, v12, v3, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/android/launcher3/anim/L;->y:Landroid/view/animation/Interpolator;

    .line 229
    .line 230
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 231
    .line 232
    const v1, 0x3e851eb8    # 0.26f

    .line 233
    .line 234
    .line 235
    const v11, 0x3f5eb852    # 0.87f

    .line 236
    .line 237
    .line 238
    invoke-direct {v0, v1, v11, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 239
    .line 240
    .line 241
    sput-object v0, Lcom/android/launcher3/anim/L;->z:Landroid/view/animation/Interpolator;

    .line 242
    .line 243
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 244
    .line 245
    const v1, 0x3f19999a    # 0.6f

    .line 246
    .line 247
    .line 248
    const v11, 0x3f5c28f6    # 0.86f

    .line 249
    .line 250
    .line 251
    const v12, 0x3e0f5c29    # 0.14f

    .line 252
    .line 253
    .line 254
    const v13, 0x3eae147b    # 0.34f

    .line 255
    .line 256
    .line 257
    invoke-direct {v0, v12, v13, v1, v11}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 258
    .line 259
    .line 260
    sput-object v0, Lcom/android/launcher3/anim/L;->A:Landroid/view/animation/Interpolator;

    .line 261
    .line 262
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 263
    .line 264
    invoke-direct {v0, v3, v4, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 265
    .line 266
    .line 267
    sput-object v0, Lcom/android/launcher3/anim/L;->B:Landroid/view/animation/Interpolator;

    .line 268
    .line 269
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 270
    .line 271
    const v1, 0x3e75c28f    # 0.24f

    .line 272
    .line 273
    .line 274
    const v11, 0x3ec28f5c    # 0.38f

    .line 275
    .line 276
    .line 277
    invoke-direct {v0, v1, v11, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 278
    .line 279
    .line 280
    sput-object v0, Lcom/android/launcher3/anim/L;->C:Landroid/view/animation/Interpolator;

    .line 281
    .line 282
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 283
    .line 284
    const v12, 0x3f28f5c3    # 0.66f

    .line 285
    .line 286
    .line 287
    invoke-direct {v0, v10, v12, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 288
    .line 289
    .line 290
    sput-object v0, Lcom/android/launcher3/anim/L;->D:Landroid/view/animation/Interpolator;

    .line 291
    .line 292
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 293
    .line 294
    invoke-direct {v0, v1, v11, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 295
    .line 296
    .line 297
    sput-object v0, Lcom/android/launcher3/anim/L;->E:Landroid/view/animation/Interpolator;

    .line 298
    .line 299
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 300
    .line 301
    const v10, 0x3f30a3d7    # 0.69f

    .line 302
    .line 303
    .line 304
    const v11, 0x3f547ae1    # 0.83f

    .line 305
    .line 306
    .line 307
    const v14, 0x3ea3d70a    # 0.32f

    .line 308
    .line 309
    .line 310
    invoke-direct {v0, v8, v14, v10, v11}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 311
    .line 312
    .line 313
    sput-object v0, Lcom/android/launcher3/anim/L;->F:Landroid/view/animation/Interpolator;

    .line 314
    .line 315
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 316
    .line 317
    const v10, 0x3f147ae1    # 0.58f

    .line 318
    .line 319
    .line 320
    const v11, 0x3ed70a3d    # 0.42f

    .line 321
    .line 322
    .line 323
    invoke-direct {v0, v11, v4, v10, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 324
    .line 325
    .line 326
    sput-object v0, Lcom/android/launcher3/anim/L;->G:Landroid/view/animation/Interpolator;

    .line 327
    .line 328
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 329
    .line 330
    invoke-direct {v0, v4, v4, v6, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 331
    .line 332
    .line 333
    sput-object v0, Lcom/android/launcher3/anim/L;->H:Landroid/view/animation/Interpolator;

    .line 334
    .line 335
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 336
    .line 337
    const v10, 0x3e8a3d71    # 0.27f

    .line 338
    .line 339
    .line 340
    invoke-direct {v0, v10, v7, v8, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 341
    .line 342
    .line 343
    sput-object v0, Lcom/android/launcher3/anim/L;->I:Landroid/view/animation/Interpolator;

    .line 344
    .line 345
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 346
    .line 347
    const v14, 0x3f6b851f    # 0.92f

    .line 348
    .line 349
    .line 350
    invoke-direct {v0, v10, v14, v8, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 351
    .line 352
    .line 353
    sput-object v0, Lcom/android/launcher3/anim/L;->J:Landroid/view/animation/Interpolator;

    .line 354
    .line 355
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 356
    .line 357
    invoke-direct {v0, v9, v5, v2, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 358
    .line 359
    .line 360
    sput-object v0, Lcom/android/launcher3/anim/L;->K:Landroid/view/animation/Interpolator;

    .line 361
    .line 362
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 363
    .line 364
    const v9, 0x3da3d70a    # 0.08f

    .line 365
    .line 366
    .line 367
    const v10, 0x3f11eb85    # 0.57f

    .line 368
    .line 369
    .line 370
    invoke-direct {v0, v9, v10, v11, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 371
    .line 372
    .line 373
    sput-object v0, Lcom/android/launcher3/anim/L;->L:Landroid/view/animation/Interpolator;

    .line 374
    .line 375
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 376
    .line 377
    const v9, 0x3ec7ae14    # 0.39f

    .line 378
    .line 379
    .line 380
    const v10, 0x3ee66666    # 0.45f

    .line 381
    .line 382
    .line 383
    invoke-direct {v0, v9, v10, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 384
    .line 385
    .line 386
    sput-object v0, Lcom/android/launcher3/anim/L;->M:Landroid/view/animation/Interpolator;

    .line 387
    .line 388
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 389
    .line 390
    const v9, 0x3ebd70a4    # 0.37f

    .line 391
    .line 392
    .line 393
    invoke-direct {v0, v6, v9, v4, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 394
    .line 395
    .line 396
    sput-object v0, Lcom/android/launcher3/anim/L;->N:Landroid/view/animation/Interpolator;

    .line 397
    .line 398
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 399
    .line 400
    invoke-direct {v0, v3, v13, v8, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 401
    .line 402
    .line 403
    sput-object v0, Lcom/android/launcher3/anim/L;->O:Landroid/view/animation/Interpolator;

    .line 404
    .line 405
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 406
    .line 407
    const v8, 0x3eb851ec    # 0.36f

    .line 408
    .line 409
    .line 410
    const/high16 v9, 0x3fa00000    # 1.25f

    .line 411
    .line 412
    invoke-direct {v0, v8, v9, v7, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 413
    .line 414
    .line 415
    sput-object v0, Lcom/android/launcher3/anim/L;->P:Landroid/view/animation/Interpolator;

    .line 416
    .line 417
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 418
    .line 419
    const v8, 0x3eb33333    # 0.35f

    .line 420
    .line 421
    .line 422
    invoke-direct {v0, v1, v4, v8, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 423
    .line 424
    .line 425
    sput-object v0, Lcom/android/launcher3/anim/L;->Q:Landroid/view/animation/Interpolator;

    .line 426
    .line 427
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 428
    .line 429
    const v1, 0x3ecccccd    # 0.4f

    .line 430
    .line 431
    .line 432
    invoke-direct {v0, v1, v4, v5, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 433
    .line 434
    .line 435
    sput-object v0, Lcom/android/launcher3/anim/L;->R:Landroid/view/animation/Interpolator;

    .line 436
    .line 437
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 438
    .line 439
    invoke-direct {v0, v4, v4, v6, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 440
    .line 441
    .line 442
    sput-object v0, Lcom/android/launcher3/anim/L;->S:Landroid/view/animation/Interpolator;

    .line 443
    .line 444
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 445
    .line 446
    invoke-direct {v0, v1, v4, v6, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 447
    .line 448
    .line 449
    sput-object v0, Lcom/android/launcher3/anim/L;->T:Landroid/view/animation/Interpolator;

    .line 450
    .line 451
    new-instance v1, Landroid/view/animation/PathInterpolator;

    .line 452
    .line 453
    invoke-direct {v1, v2, v4, v7, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 454
    .line 455
    .line 456
    sput-object v1, Lcom/android/launcher3/anim/L;->U:Landroid/view/animation/Interpolator;

    .line 457
    .line 458
    invoke-static {}, Lx1/O;->W2()Z

    .line 459
    .line 460
    .line 461
    move-result v2

    .line 462
    if-nez v2, :cond_0

    .line 463
    .line 464
    invoke-static {}, Lx1/O;->X2()Z

    .line 465
    .line 466
    .line 467
    move-result v2

    .line 468
    if-eqz v2, :cond_1

    .line 469
    .line 470
    :cond_0
    move-object v0, v1

    .line 471
    :cond_1
    sput-object v0, Lcom/android/launcher3/anim/L;->V:Landroid/view/animation/Interpolator;

    .line 472
    .line 473
    invoke-static {}, Lx1/O;->W2()Z

    .line 474
    .line 475
    .line 476
    move-result v2

    .line 477
    if-nez v2, :cond_3

    .line 478
    .line 479
    invoke-static {}, Lx1/O;->X2()Z

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    if-eqz v2, :cond_2

    .line 484
    .line 485
    goto :goto_0

    .line 486
    :cond_2
    move-object v1, v0

    .line 487
    :cond_3
    :goto_0
    sput-object v1, Lcom/android/launcher3/anim/L;->W:Landroid/view/animation/Interpolator;

    .line 488
    .line 489
    new-instance v0, Landroid/view/animation/OvershootInterpolator;

    .line 490
    .line 491
    invoke-direct {v0, v4}, Landroid/view/animation/OvershootInterpolator;-><init>(F)V

    .line 492
    .line 493
    .line 494
    sput-object v0, Lcom/android/launcher3/anim/L;->X:Landroid/view/animation/Interpolator;

    .line 495
    .line 496
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 497
    .line 498
    invoke-direct {v0, v3, v4, v12, v5}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 499
    .line 500
    .line 501
    sput-object v0, Lcom/android/launcher3/anim/L;->Y:Landroid/view/animation/PathInterpolator;

    .line 502
    .line 503
    return-void
.end method

.method public static synthetic a(F)F
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/anim/L;->a:F

    .line 2
    .line 3
    cmpg-float v0, p0, v0

    .line 4
    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sget v0, Lcom/android/launcher3/anim/L;->w:F

    .line 14
    .line 15
    mul-float/2addr p0, v0

    .line 16
    return p0

    .line 17
    :cond_0
    sget-object v0, Lcom/android/launcher3/anim/L;->v:Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    invoke-interface {v0, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method
