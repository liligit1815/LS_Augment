.class public Lf2/h;
.super Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;
.source "QuickstepAtomicAnimationFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/util/RecentsAtomicAnimationFactory<",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field private a:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lf2/h;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/RecentsView;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(F)F
    .locals 1

    .line 1
    sget-object v0, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public d(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;LQ1/f;)V
    .locals 17

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
    move-object/from16 v3, p3

    .line 8
    .line 9
    iget-object v4, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 10
    .line 11
    check-cast v4, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 12
    .line 13
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    check-cast v4, Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    iget-object v5, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 20
    .line 21
    invoke-static {v5}, Lcom/android/launcher3/util/Z;->C(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    sget-object v6, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    const/4 v8, 0x3

    .line 28
    const/16 v9, 0xe

    .line 29
    .line 30
    const/16 v12, 0xb

    .line 31
    .line 32
    const/16 v15, 0x9

    .line 33
    .line 34
    const/4 v7, 0x0

    .line 35
    const/16 v16, 0x2

    .line 36
    .line 37
    const/4 v14, 0x1

    .line 38
    if-eq v1, v6, :cond_0

    .line 39
    .line 40
    sget-object v10, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    if-ne v1, v10, :cond_15

    .line 43
    .line 44
    :cond_0
    sget-object v10, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 45
    .line 46
    if-ne v2, v10, :cond_15

    .line 47
    .line 48
    new-instance v2, Lf2/f;

    .line 49
    .line 50
    invoke-direct {v2, v4}, Lf2/f;-><init>(Lcom/android/quickstep/views/RecentsView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, v2}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    sget-object v2, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 57
    .line 58
    const v6, 0x3ea8f5c3    # 0.33f

    .line 59
    .line 60
    .line 61
    if-ne v1, v2, :cond_1

    .line 62
    .line 63
    sget-object v10, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    const v13, 0x3ecccccd    # 0.4f

    .line 66
    .line 67
    .line 68
    invoke-static {v10, v7, v13}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    .line 71
    move-result-object v10

    .line 72
    const/16 v13, 0x11

    .line 73
    .line 74
    invoke-virtual {v3, v13, v10}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 75
    .line 76
    .line 77
    sget-object v10, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    invoke-static {v10, v7, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    .line 82
    move-result-object v10

    .line 83
    const/16 v13, 0x12

    .line 84
    .line 85
    invoke-virtual {v3, v13, v10}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 86
    .line 87
    .line 88
    :cond_1
    if-eqz v5, :cond_2

    .line 89
    .line 90
    iget-object v5, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 91
    .line 92
    invoke-static {v5}, Lcom/android/launcher3/util/Z;->B(Landroid/content/Context;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-nez v5, :cond_2

    .line 97
    .line 98
    move v5, v14

    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const/4 v5, 0x0

    .line 101
    :goto_0
    invoke-static {v5}, Lcom/android/launcher3/q5;->y0(Z)I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    int-to-float v13, v13

    .line 106
    iget-wide v10, v3, LQ1/f;->g:J

    .line 107
    .line 108
    long-to-float v10, v10

    .line 109
    div-float/2addr v13, v10

    .line 110
    const/high16 v10, 0x3f800000    # 1.0f

    .line 111
    .line 112
    invoke-static {v13, v10}, Ljava/lang/Math;->min(FF)F

    .line 113
    .line 114
    .line 115
    move-result v10

    .line 116
    sget-object v11, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 117
    .line 118
    const/high16 v13, 0x3e800000    # 0.25f

    .line 119
    .line 120
    invoke-static {v11, v7, v13}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 121
    .line 122
    .line 123
    move-result-object v13

    .line 124
    invoke-virtual {v3, v9, v13}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 125
    .line 126
    .line 127
    if-ne v1, v2, :cond_3

    .line 128
    .line 129
    invoke-static {v11, v6, v10}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 130
    .line 131
    .line 132
    move-result-object v11

    .line 133
    :cond_3
    invoke-virtual {v3, v12, v11}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 134
    .line 135
    .line 136
    sget-object v6, LJ0/h;->I:Landroid/view/animation/Interpolator;

    .line 137
    .line 138
    invoke-virtual {v3, v14, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 139
    .line 140
    .line 141
    sget-object v6, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 142
    .line 143
    invoke-virtual {v3, v8, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 144
    .line 145
    .line 146
    iget-object v8, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 147
    .line 148
    invoke-static {v8}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 149
    .line 150
    .line 151
    move-result-object v8

    .line 152
    iget-boolean v8, v8, Lcom/android/launcher3/util/C1;->g:Z

    .line 153
    .line 154
    if-eqz v8, :cond_d

    .line 155
    .line 156
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    if-eqz v8, :cond_d

    .line 161
    .line 162
    sget-object v6, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 163
    .line 164
    const/4 v8, 0x6

    .line 165
    invoke-virtual {v3, v8, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 166
    .line 167
    .line 168
    sget-object v8, Lcom/android/launcher3/anim/L;->i:Landroid/view/animation/Interpolator;

    .line 169
    .line 170
    invoke-virtual {v3, v15, v8}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 171
    .line 172
    .line 173
    if-ne v1, v2, :cond_4

    .line 174
    .line 175
    sget-object v1, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 176
    .line 177
    :goto_1
    const/4 v2, 0x7

    .line 178
    goto :goto_3

    .line 179
    :cond_4
    invoke-static {}, Lx1/O;->I3()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_5

    .line 184
    .line 185
    sget-object v1, Lcom/android/launcher3/anim/L;->R:Landroid/view/animation/Interpolator;

    .line 186
    .line 187
    goto :goto_2

    .line 188
    :cond_5
    sget-object v1, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 189
    .line 190
    :goto_2
    const/high16 v2, 0x3f400000    # 0.75f

    .line 191
    .line 192
    invoke-static {v1, v7, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    goto :goto_1

    .line 197
    :goto_3
    invoke-virtual {v3, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 198
    .line 199
    .line 200
    const/16 v1, 0x8

    .line 201
    .line 202
    invoke-virtual {v3, v1, v6}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 206
    .line 207
    .line 208
    const/16 v1, 0x190

    .line 209
    .line 210
    invoke-static {v1, v1}, Ljava/lang/Math;->min(II)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    int-to-long v1, v1

    .line 215
    iget-wide v8, v3, LQ1/f;->g:J

    .line 216
    .line 217
    invoke-static {v8, v9, v1, v2}, Ljava/lang/Math;->max(JJ)J

    .line 218
    .line 219
    .line 220
    move-result-wide v1

    .line 221
    iput-wide v1, v3, LQ1/f;->g:J

    .line 222
    .line 223
    iget-object v1, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 224
    .line 225
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 226
    .line 227
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->p3:Z

    .line 232
    .line 233
    if-eqz v1, :cond_6

    .line 234
    .line 235
    iget-wide v1, v3, LQ1/f;->g:J

    .line 236
    .line 237
    invoke-static {v5}, Lcom/android/launcher3/q5;->y0(Z)I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    int-to-long v5, v5

    .line 242
    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 243
    .line 244
    .line 245
    move-result-wide v1

    .line 246
    iput-wide v1, v3, LQ1/f;->g:J

    .line 247
    .line 248
    :cond_6
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-eqz v1, :cond_7

    .line 253
    .line 254
    move/from16 v1, v16

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :cond_7
    move v1, v14

    .line 258
    :goto_4
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 259
    .line 260
    .line 261
    move-result v2

    .line 262
    if-eqz v2, :cond_b

    .line 263
    .line 264
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    mul-int/lit8 v5, v1, 0x2

    .line 269
    .line 270
    if-lt v2, v5, :cond_b

    .line 271
    .line 272
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    invoke-virtual {v4, v2}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    instance-of v5, v2, Lcom/android/quickstep/views/TaskView;

    .line 281
    .line 282
    if-eqz v5, :cond_8

    .line 283
    .line 284
    check-cast v2, Lcom/android/quickstep/views/TaskView;

    .line 285
    .line 286
    invoke-virtual {v4, v2}, Lcom/android/quickstep/views/RecentsView;->isOnGridBottomRow(Lcom/android/quickstep/views/TaskView;)Z

    .line 287
    .line 288
    .line 289
    move-result v2

    .line 290
    goto :goto_5

    .line 291
    :cond_8
    const/4 v2, 0x0

    .line 292
    :goto_5
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 293
    .line 294
    .line 295
    move-result v5

    .line 296
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getTaskViewCount()I

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    sub-int/2addr v6, v14

    .line 301
    if-ne v5, v6, :cond_9

    .line 302
    .line 303
    goto :goto_6

    .line 304
    :cond_9
    move/from16 v16, v14

    .line 305
    .line 306
    :goto_6
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 307
    .line 308
    .line 309
    move-result v5

    .line 310
    mul-int v16, v16, v1

    .line 311
    .line 312
    if-eqz v2, :cond_a

    .line 313
    .line 314
    add-int/lit8 v16, v16, 0x1

    .line 315
    .line 316
    :cond_a
    sub-int v5, v5, v16

    .line 317
    .line 318
    add-int/lit8 v1, v5, -0x1

    .line 319
    .line 320
    goto :goto_7

    .line 321
    :cond_b
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->showAsGrid()Z

    .line 322
    .line 323
    .line 324
    move-result v1

    .line 325
    if-nez v1, :cond_c

    .line 326
    .line 327
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-le v1, v14, :cond_c

    .line 332
    .line 333
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    add-int/lit8 v1, v1, -0x2

    .line 338
    .line 339
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    add-int/lit8 v5, v2, -0x1

    .line 344
    .line 345
    goto :goto_7

    .line 346
    :cond_c
    const/4 v1, -0x1

    .line 347
    const/4 v5, 0x0

    .line 348
    :goto_7
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 349
    .line 350
    .line 351
    move-result v2

    .line 352
    invoke-virtual {v4, v2, v1}, Lcom/android/quickstep/views/RecentsView;->setExitAnimTaskAlpha(II)V

    .line 353
    .line 354
    .line 355
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    if-eq v1, v5, :cond_e

    .line 360
    .line 361
    iget-wide v1, v3, LQ1/f;->g:J

    .line 362
    .line 363
    invoke-static {v1, v2}, Ljava/lang/Math;->toIntExact(J)I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    invoke-virtual {v4, v5, v1}, Lcom/android/launcher3/V4;->snapToPage(II)Z

    .line 368
    .line 369
    .line 370
    goto :goto_8

    .line 371
    :cond_d
    sget-object v1, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 372
    .line 373
    const/4 v2, 0x7

    .line 374
    invoke-virtual {v3, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 375
    .line 376
    .line 377
    const v1, 0x3f666666    # 0.9f

    .line 378
    .line 379
    .line 380
    invoke-static {v6, v7, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 381
    .line 382
    .line 383
    move-result-object v1

    .line 384
    const/4 v8, 0x6

    .line 385
    invoke-virtual {v3, v8, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 386
    .line 387
    .line 388
    sget-object v1, LJ0/h;->K:Landroid/view/animation/Interpolator;

    .line 389
    .line 390
    invoke-virtual {v3, v15, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 391
    .line 392
    .line 393
    :cond_e
    :goto_8
    iget-object v1, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 394
    .line 395
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 396
    .line 397
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getVisibility()I

    .line 402
    .line 403
    .line 404
    move-result v2

    .line 405
    if-nez v2, :cond_f

    .line 406
    .line 407
    move v2, v14

    .line 408
    goto :goto_9

    .line 409
    :cond_f
    const/4 v2, 0x0

    .line 410
    :goto_9
    if-eqz v2, :cond_12

    .line 411
    .line 412
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 413
    .line 414
    .line 415
    move-result v2

    .line 416
    invoke-virtual {v1, v2}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 421
    .line 422
    if-nez v2, :cond_11

    .line 423
    .line 424
    new-instance v2, Ljava/lang/StringBuilder;

    .line 425
    .line 426
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 427
    .line 428
    .line 429
    const-string v3, "prepareForAtomicAnimation error, workspace.getCurrentPage():"

    .line 430
    .line 431
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    const-string v3, "QuickstepAtomicAnimationFactory"

    .line 446
    .line 447
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    .line 449
    .line 450
    :cond_10
    const/4 v2, 0x0

    .line 451
    goto :goto_a

    .line 452
    :cond_11
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getVisibility()I

    .line 453
    .line 454
    .line 455
    move-result v3

    .line 456
    if-nez v3, :cond_10

    .line 457
    .line 458
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 459
    .line 460
    .line 461
    move-result-object v2

    .line 462
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getAlpha()F

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    cmpl-float v2, v2, v7

    .line 467
    .line 468
    if-lez v2, :cond_10

    .line 469
    .line 470
    move v2, v14

    .line 471
    :cond_12
    :goto_a
    const v3, 0x3f6b851f    # 0.92f

    .line 472
    .line 473
    .line 474
    if-nez v2, :cond_13

    .line 475
    .line 476
    invoke-virtual {v1, v3}, Lcom/android/launcher3/Workspace;->setScaleX(F)V

    .line 477
    .line 478
    .line 479
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 480
    .line 481
    .line 482
    :cond_13
    iget-object v0, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 483
    .line 484
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 485
    .line 486
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getVisibility()I

    .line 491
    .line 492
    .line 493
    move-result v1

    .line 494
    if-nez v1, :cond_14

    .line 495
    .line 496
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    cmpl-float v1, v1, v7

    .line 501
    .line 502
    if-lez v1, :cond_14

    .line 503
    .line 504
    goto :goto_b

    .line 505
    :cond_14
    const/4 v14, 0x0

    .line 506
    :goto_b
    if-nez v14, :cond_24

    .line 507
    .line 508
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 509
    .line 510
    .line 511
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 512
    .line 513
    .line 514
    return-void

    .line 515
    :cond_15
    sget-object v5, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 516
    .line 517
    const/16 v10, 0xd

    .line 518
    .line 519
    if-eq v1, v5, :cond_16

    .line 520
    .line 521
    sget-object v11, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 522
    .line 523
    if-eq v1, v11, :cond_16

    .line 524
    .line 525
    sget-object v11, Lcom/android/launcher3/V3;->u:Lcom/android/launcher3/V3;

    .line 526
    .line 527
    if-ne v1, v11, :cond_1c

    .line 528
    .line 529
    :cond_16
    if-ne v2, v6, :cond_1c

    .line 530
    .line 531
    iget-object v0, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 532
    .line 533
    invoke-static {v0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 534
    .line 535
    .line 536
    move-result-object v0

    .line 537
    iget-boolean v0, v0, Lcom/android/launcher3/util/C1;->g:Z

    .line 538
    .line 539
    if-eqz v0, :cond_19

    .line 540
    .line 541
    if-ne v1, v5, :cond_17

    .line 542
    .line 543
    sget-object v0, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 544
    .line 545
    goto :goto_c

    .line 546
    :cond_17
    sget-object v0, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 547
    .line 548
    :goto_c
    invoke-virtual {v3, v14, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 549
    .line 550
    .line 551
    sget-object v0, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 552
    .line 553
    move/from16 v1, v16

    .line 554
    .line 555
    invoke-virtual {v3, v1, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 556
    .line 557
    .line 558
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->hasTaskViews()Z

    .line 559
    .line 560
    .line 561
    move-result v0

    .line 562
    if-eqz v0, :cond_18

    .line 563
    .line 564
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 565
    .line 566
    invoke-virtual {v3, v15, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 567
    .line 568
    .line 569
    goto :goto_d

    .line 570
    :cond_18
    sget-object v0, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 571
    .line 572
    invoke-virtual {v3, v15, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 573
    .line 574
    .line 575
    goto :goto_d

    .line 576
    :cond_19
    sget-object v0, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 577
    .line 578
    invoke-virtual {v3, v14, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 579
    .line 580
    .line 581
    invoke-virtual {v3, v15, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 582
    .line 583
    .line 584
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getVisibility()I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    if-nez v0, :cond_1a

    .line 589
    .line 590
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getContentAlpha()F

    .line 591
    .line 592
    .line 593
    move-result v0

    .line 594
    cmpl-float v0, v0, v7

    .line 595
    .line 596
    if-nez v0, :cond_1b

    .line 597
    .line 598
    :cond_1a
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 599
    .line 600
    const v1, 0x3faa3d71    # 1.33f

    .line 601
    .line 602
    .line 603
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 604
    .line 605
    .line 606
    move-result-object v1

    .line 607
    invoke-virtual {v0, v4, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 608
    .line 609
    .line 610
    :cond_1b
    :goto_d
    sget-object v0, LJ0/h;->i:Landroid/view/animation/Interpolator;

    .line 611
    .line 612
    invoke-virtual {v3, v8, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 613
    .line 614
    .line 615
    const/16 v1, 0xa

    .line 616
    .line 617
    invoke-virtual {v3, v1, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 618
    .line 619
    .line 620
    sget-object v1, Lcom/android/launcher3/anim/L;->n:Landroid/view/animation/Interpolator;

    .line 621
    .line 622
    const/4 v8, 0x6

    .line 623
    invoke-virtual {v3, v8, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 624
    .line 625
    .line 626
    invoke-virtual {v3, v10, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 627
    .line 628
    .line 629
    new-instance v0, Lf2/g;

    .line 630
    .line 631
    invoke-direct {v0}, Lf2/g;-><init>()V

    .line 632
    .line 633
    .line 634
    invoke-virtual {v3, v12, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 635
    .line 636
    .line 637
    const/4 v2, 0x7

    .line 638
    invoke-virtual {v3, v2, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 639
    .line 640
    .line 641
    const/16 v0, 0x8

    .line 642
    .line 643
    invoke-virtual {v3, v0, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 644
    .line 645
    .line 646
    return-void

    .line 647
    :cond_1c
    sget-object v4, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 648
    .line 649
    if-ne v1, v4, :cond_1e

    .line 650
    .line 651
    if-ne v2, v5, :cond_1e

    .line 652
    .line 653
    sget-object v1, LJ0/h;->N:Landroid/view/animation/Interpolator;

    .line 654
    .line 655
    invoke-virtual {v3, v10, v1}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 656
    .line 657
    .line 658
    iget v1, v0, Lf2/h;->a:I

    .line 659
    .line 660
    const/4 v4, -0x1

    .line 661
    if-ne v1, v4, :cond_1d

    .line 662
    .line 663
    iget-object v1, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 664
    .line 665
    move-object v4, v1

    .line 666
    check-cast v4, Lcom/android/launcher3/C2;

    .line 667
    .line 668
    check-cast v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 669
    .line 670
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    iget-object v5, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 675
    .line 676
    check-cast v5, Lcom/android/launcher3/C2;

    .line 677
    .line 678
    invoke-virtual {v2, v5}, Lcom/android/launcher3/V3;->x(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3$h;

    .line 679
    .line 680
    .line 681
    move-result-object v2

    .line 682
    iget v2, v2, Lcom/android/launcher3/V3$h;->a:F

    .line 683
    .line 684
    invoke-static {v4, v1, v2}, Lcom/android/launcher3/N6;->g(Lcom/android/launcher3/C2;Lcom/android/launcher3/Workspace;F)Landroid/animation/ValueAnimator;

    .line 685
    .line 686
    .line 687
    move-result-object v1

    .line 688
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 689
    .line 690
    .line 691
    move-result-wide v1

    .line 692
    long-to-int v1, v1

    .line 693
    iput v1, v0, Lf2/h;->a:I

    .line 694
    .line 695
    :cond_1d
    iget-wide v1, v3, LQ1/f;->g:J

    .line 696
    .line 697
    iget v0, v0, Lf2/h;->a:I

    .line 698
    .line 699
    int-to-long v4, v0

    .line 700
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 701
    .line 702
    .line 703
    move-result-wide v0

    .line 704
    iput-wide v0, v3, LQ1/f;->g:J

    .line 705
    .line 706
    return-void

    .line 707
    :cond_1e
    sget-object v4, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 708
    .line 709
    if-ne v1, v4, :cond_1f

    .line 710
    .line 711
    if-ne v2, v5, :cond_1f

    .line 712
    .line 713
    iget-object v0, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 714
    .line 715
    check-cast v0, Lcom/android/launcher3/C2;

    .line 716
    .line 717
    invoke-static {v0, v3}, Lcom/android/launcher3/touch/e;->c(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 718
    .line 719
    .line 720
    return-void

    .line 721
    :cond_1f
    if-ne v1, v5, :cond_20

    .line 722
    .line 723
    if-ne v2, v4, :cond_20

    .line 724
    .line 725
    iget-object v0, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 726
    .line 727
    check-cast v0, Lcom/android/launcher3/C2;

    .line 728
    .line 729
    invoke-static {v0, v3}, Lcom/android/launcher3/touch/e;->d(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 730
    .line 731
    .line 732
    return-void

    .line 733
    :cond_20
    if-ne v1, v6, :cond_22

    .line 734
    .line 735
    sget-object v6, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 736
    .line 737
    if-ne v2, v6, :cond_22

    .line 738
    .line 739
    iget-object v0, v0, Lcom/android/quickstep/util/RecentsAtomicAnimationFactory;->mContainer:Landroid/content/Context;

    .line 740
    .line 741
    check-cast v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 742
    .line 743
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 744
    .line 745
    .line 746
    move-result-object v0

    .line 747
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 748
    .line 749
    if-eqz v0, :cond_21

    .line 750
    .line 751
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 752
    .line 753
    goto :goto_e

    .line 754
    :cond_21
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 755
    .line 756
    :goto_e
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 757
    .line 758
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getActionsFadeStartOffset()F

    .line 759
    .line 760
    .line 761
    move-result v2

    .line 762
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getActionsFadeEndOffset()F

    .line 763
    .line 764
    .line 765
    move-result v0

    .line 766
    invoke-static {v1, v2, v0}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 767
    .line 768
    .line 769
    move-result-object v0

    .line 770
    invoke-virtual {v3, v9, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 771
    .line 772
    .line 773
    return-void

    .line 774
    :cond_22
    if-eq v1, v5, :cond_23

    .line 775
    .line 776
    if-ne v1, v4, :cond_24

    .line 777
    .line 778
    :cond_23
    sget-object v0, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 779
    .line 780
    if-ne v2, v0, :cond_24

    .line 781
    .line 782
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 783
    .line 784
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 785
    .line 786
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getScrimFadeInStartOffset()F

    .line 787
    .line 788
    .line 789
    move-result v2

    .line 790
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getScrimFadeInEndOffset()F

    .line 791
    .line 792
    .line 793
    move-result v0

    .line 794
    invoke-static {v1, v2, v0}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 795
    .line 796
    .line 797
    move-result-object v0

    .line 798
    invoke-virtual {v3, v12, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 799
    .line 800
    .line 801
    sget-object v0, LJ0/h;->h:Landroid/view/animation/Interpolator;

    .line 802
    .line 803
    const/4 v2, 0x7

    .line 804
    invoke-virtual {v3, v2, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 805
    .line 806
    .line 807
    const/16 v1, 0x8

    .line 808
    .line 809
    invoke-virtual {v3, v1, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 810
    .line 811
    .line 812
    :cond_24
    return-void
.end method

.method public bridge synthetic prepareForAtomicAnimation(Ljava/lang/Object;Ljava/lang/Object;LQ1/f;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lf2/h;->d(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
