.class public Lcom/android/launcher3/nubia/a;
.super Ljava/lang/Object;
.source "NubiaFancyIconControl.java"


# direct methods
.method public static a(Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/graphics/Point;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {v1, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_3

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    invoke-static {v1, v2}, Lcom/android/launcher3/a;->hasOpenView(Lcom/android/launcher3/views/k;I)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_3

    .line 23
    .line 24
    if-eqz p0, :cond_4

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/graphics/Point;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/android/launcher3/nubia/a;->b(Landroid/graphics/Point;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    return v0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_3
    const-string p0, "NubiaFancyIconControl"

    .line 60
    .line 61
    const-string v1, "isDynamicWallpaperShouldAction: do not support this mode touch"

    .line 62
    .line 63
    invoke-static {p0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 68
    .line 69
    .line 70
    :cond_4
    :goto_1
    return v0
.end method

.method private static b(Landroid/graphics/Point;)Z
    .locals 14

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/4 v4, 0x2

    .line 18
    new-array v5, v4, [I

    .line 19
    .line 20
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getLocationOnScreen([I)V

    .line 21
    .line 22
    .line 23
    aget v6, v5, v1

    .line 24
    .line 25
    const/4 v7, 0x1

    .line 26
    aget v8, v5, v7

    .line 27
    .line 28
    new-instance v9, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v10

    .line 34
    add-int/2addr v10, v6

    .line 35
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v11

    .line 39
    add-int/2addr v11, v8

    .line 40
    invoke-direct {v9, v6, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 41
    .line 42
    .line 43
    iget v6, p0, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    iget v8, p0, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    invoke-virtual {v9, v6, v8}, Landroid/graphics/Rect;->contains(II)Z

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    const-string v8, "isInActionArea point = "

    .line 52
    .line 53
    const-string v10, "NubiaFancyIconControl"

    .line 54
    .line 55
    if-eqz v6, :cond_2

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    div-int/2addr v0, v1

    .line 66
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    div-int/2addr v1, v6

    .line 75
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCellWidth()I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    sub-int v6, v0, v6

    .line 80
    .line 81
    div-int/2addr v6, v4

    .line 82
    iget v4, p0, Landroid/graphics/Point;->x:I

    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    sub-int/2addr v4, v11

    .line 89
    div-int/2addr v4, v0

    .line 90
    iget v11, p0, Landroid/graphics/Point;->y:I

    .line 91
    .line 92
    aget v12, v5, v7

    .line 93
    .line 94
    sub-int/2addr v11, v12

    .line 95
    div-int/2addr v11, v1

    .line 96
    new-instance v12, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v8, ",location = "

    .line 108
    .line 109
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v8, ",hotSeatRect = "

    .line 116
    .line 117
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v8, ",childCount() = "

    .line 124
    .line 125
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    invoke-virtual {v3, v4, v11}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-nez v3, :cond_1

    .line 151
    .line 152
    return v7

    .line 153
    :cond_1
    iget v3, p0, Landroid/graphics/Point;->x:I

    .line 154
    .line 155
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    mul-int/2addr v0, v4

    .line 160
    add-int/2addr v2, v0

    .line 161
    add-int/2addr v2, v6

    .line 162
    sub-int/2addr v3, v2

    .line 163
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 164
    .line 165
    aget v0, v5, v7

    .line 166
    .line 167
    mul-int/2addr v1, v11

    .line 168
    add-int/2addr v0, v1

    .line 169
    sub-int/2addr p0, v0

    .line 170
    invoke-static {v8, v3, p0}, Lcom/android/launcher3/nubia/a;->c(Landroid/view/View;II)Z

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    xor-int/2addr p0, v7

    .line 175
    return p0

    .line 176
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    invoke-virtual {v6}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    invoke-virtual {v3, v6}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    invoke-virtual {v2, v3}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    if-eqz v2, :cond_5

    .line 201
    .line 202
    new-array v3, v4, [I

    .line 203
    .line 204
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getLocationInWindow([I)V

    .line 209
    .line 210
    .line 211
    new-instance v4, Landroid/graphics/Rect;

    .line 212
    .line 213
    aget v6, v3, v1

    .line 214
    .line 215
    aget v9, v3, v7

    .line 216
    .line 217
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 218
    .line 219
    .line 220
    move-result-object v11

    .line 221
    invoke-virtual {v11}, Landroid/view/ViewGroup;->getWidth()I

    .line 222
    .line 223
    .line 224
    move-result v11

    .line 225
    aget v12, v3, v1

    .line 226
    .line 227
    add-int/2addr v11, v12

    .line 228
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 229
    .line 230
    .line 231
    move-result-object v12

    .line 232
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getHeight()I

    .line 233
    .line 234
    .line 235
    move-result v12

    .line 236
    aget v13, v3, v7

    .line 237
    .line 238
    add-int/2addr v12, v13

    .line 239
    invoke-direct {v4, v6, v9, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 240
    .line 241
    .line 242
    iget v6, p0, Landroid/graphics/Point;->x:I

    .line 243
    .line 244
    iget v9, p0, Landroid/graphics/Point;->y:I

    .line 245
    .line 246
    invoke-virtual {v4, v6, v9}, Landroid/graphics/Rect;->contains(II)Z

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    if-eqz v4, :cond_4

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 257
    .line 258
    iget v4, v0, Lcom/android/launcher3/F1;->H0:I

    .line 259
    .line 260
    iget v0, v0, Lcom/android/launcher3/F1;->G0:I

    .line 261
    .line 262
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getWidth()I

    .line 267
    .line 268
    .line 269
    move-result v5

    .line 270
    div-int/2addr v5, v4

    .line 271
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 272
    .line 273
    .line 274
    move-result-object v4

    .line 275
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getHeight()I

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    div-int/2addr v4, v0

    .line 280
    iget v0, p0, Landroid/graphics/Point;->x:I

    .line 281
    .line 282
    aget v6, v3, v1

    .line 283
    .line 284
    sub-int/2addr v0, v6

    .line 285
    div-int/2addr v0, v5

    .line 286
    iget v6, p0, Landroid/graphics/Point;->y:I

    .line 287
    .line 288
    aget v9, v3, v7

    .line 289
    .line 290
    sub-int/2addr v6, v9

    .line 291
    div-int/2addr v6, v4

    .line 292
    new-instance v9, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v8, ",shortcutLocation[0] = "

    .line 304
    .line 305
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    aget v8, v3, v1

    .line 309
    .line 310
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v8, ",shortcutLocation[1] = "

    .line 314
    .line 315
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    aget v8, v3, v7

    .line 319
    .line 320
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    const-string v8, ",isDynamicWallpaperShouldAction xPosition = "

    .line 324
    .line 325
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string v8, ",yPosition = "

    .line 332
    .line 333
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 337
    .line 338
    .line 339
    const-string v8, ",occupy ="

    .line 340
    .line 341
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 345
    .line 346
    .line 347
    move-result-object v8

    .line 348
    invoke-virtual {v8, v0, v6}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 349
    .line 350
    .line 351
    move-result-object v8

    .line 352
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v8

    .line 359
    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    .line 361
    .line 362
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 363
    .line 364
    .line 365
    move-result-object v8

    .line 366
    invoke-virtual {v8, v0, v6}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v8

    .line 370
    if-nez v8, :cond_3

    .line 371
    .line 372
    return v7

    .line 373
    :cond_3
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    invoke-virtual {v2, v0, v6}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 378
    .line 379
    .line 380
    move-result-object v2

    .line 381
    iget v8, p0, Landroid/graphics/Point;->x:I

    .line 382
    .line 383
    aget v1, v3, v1

    .line 384
    .line 385
    sub-int/2addr v8, v1

    .line 386
    mul-int/2addr v0, v5

    .line 387
    sub-int/2addr v8, v0

    .line 388
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 389
    .line 390
    aget v0, v3, v7

    .line 391
    .line 392
    sub-int/2addr p0, v0

    .line 393
    mul-int/2addr v6, v4

    .line 394
    sub-int/2addr p0, v6

    .line 395
    invoke-static {v2, v8, p0}, Lcom/android/launcher3/nubia/a;->c(Landroid/view/View;II)Z

    .line 396
    .line 397
    .line 398
    move-result p0

    .line 399
    xor-int/2addr p0, v7

    .line 400
    return p0

    .line 401
    :cond_4
    new-instance v0, Landroid/graphics/Rect;

    .line 402
    .line 403
    aget v4, v3, v1

    .line 404
    .line 405
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 406
    .line 407
    .line 408
    move-result-object v6

    .line 409
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getHeight()I

    .line 410
    .line 411
    .line 412
    move-result v6

    .line 413
    aget v8, v3, v7

    .line 414
    .line 415
    add-int/2addr v6, v8

    .line 416
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getWidth()I

    .line 421
    .line 422
    .line 423
    move-result v2

    .line 424
    aget v1, v3, v1

    .line 425
    .line 426
    add-int/2addr v2, v1

    .line 427
    aget v1, v5, v7

    .line 428
    .line 429
    invoke-direct {v0, v4, v6, v2, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 430
    .line 431
    .line 432
    iget v1, p0, Landroid/graphics/Point;->x:I

    .line 433
    .line 434
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 435
    .line 436
    invoke-virtual {v0, v1, p0}, Landroid/graphics/Rect;->contains(II)Z

    .line 437
    .line 438
    .line 439
    :cond_5
    return v7
.end method

.method private static c(Landroid/view/View;II)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    instance-of v1, p0, Lcom/android/launcher3/BubbleTextView;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 24
    .line 25
    int-to-float p1, p1

    .line 26
    int-to-float p2, p2

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/BubbleTextView;->p0(FF)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    instance-of v1, p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget v0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 42
    .line 43
    int-to-float p1, p1

    .line 44
    int-to-float p2, p2

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/folder/FolderIcon;->Q(FF)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_1
    instance-of p0, p0, Lcom/android/launcher3/widget/T;

    .line 51
    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_2
    const/4 p0, 0x0

    .line 57
    return p0
.end method
