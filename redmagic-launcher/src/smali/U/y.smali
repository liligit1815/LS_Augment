.class public final LU/y;
.super Ljava/lang/Object;
.source "RoundedPolygon.kt"


# direct methods
.method public static final a(Ljava/util/List;FF)LU/x;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "LU/g;",
            ">;FF)",
            "LU/x;"
        }
    .end annotation

    .line 1
    const-string v0, "features"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x2

    .line 11
    if-lt v0, v1, :cond_4

    .line 12
    .line 13
    invoke-static {}, Li4/m;->c()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, LU/g;

    .line 32
    .line 33
    invoke-virtual {v2}, LU/g;->a()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, LU/c;

    .line 52
    .line 53
    invoke-virtual {v3}, LU/c;->b()F

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, LU/c;->c()F

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {v0}, Li4/m;->a(Ljava/util/List;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Li4/m;->C0(Ljava/util/Collection;)[F

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    invoke-static {v0}, LU/y;->d([F)J

    .line 91
    .line 92
    .line 93
    move-result-wide v1

    .line 94
    const/16 p1, 0x20

    .line 95
    .line 96
    shr-long/2addr v1, p1

    .line 97
    long-to-int p1, v1

    .line 98
    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    :cond_2
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_3

    .line 107
    .line 108
    invoke-static {v0}, LU/y;->d([F)J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    const-wide v2, 0xffffffffL

    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    and-long/2addr v0, v2

    .line 118
    long-to-int p2, v0

    .line 119
    invoke-static {p2}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    :cond_3
    new-instance v0, LU/x;

    .line 124
    .line 125
    invoke-static {p1, p2}, Lo/e;->b(FF)J

    .line 126
    .line 127
    .line 128
    move-result-wide p1

    .line 129
    const/4 v1, 0x0

    .line 130
    invoke-direct {v0, p0, p1, p2, v1}, LU/x;-><init>(Ljava/util/List;JLkotlin/jvm/internal/j;)V

    .line 131
    .line 132
    .line 133
    return-object v0

    .line 134
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 135
    .line 136
    const-string p1, "Polygons must have at least 2 features"

    .line 137
    .line 138
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    throw p0
.end method

.method public static final b([FLU/b;Ljava/util/List;FF)LU/x;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F",
            "LU/b;",
            "Ljava/util/List<",
            "LU/b;",
            ">;FF)",
            "LU/x;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "vertices"

    .line 6
    .line 7
    invoke-static {v0, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "rounding"

    .line 11
    .line 12
    move-object/from16 v3, p1

    .line 13
    .line 14
    invoke-static {v3, v2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    array-length v2, v0

    .line 18
    const/4 v4, 0x6

    .line 19
    if-lt v2, v4, :cond_e

    .line 20
    .line 21
    array-length v2, v0

    .line 22
    const/4 v4, 0x2

    .line 23
    rem-int/2addr v2, v4

    .line 24
    const/4 v5, 0x1

    .line 25
    if-eq v2, v5, :cond_d

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    mul-int/2addr v2, v4

    .line 34
    array-length v6, v0

    .line 35
    if-ne v2, v6, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 39
    .line 40
    const-string v1, "perVertexRounding list should be either null or the same size as the number of vertices (vertices.size / 2)"

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw v0

    .line 46
    :cond_1
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    array-length v6, v0

    .line 52
    div-int/2addr v6, v4

    .line 53
    new-instance v7, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    const/4 v8, 0x0

    .line 59
    move v9, v8

    .line 60
    :goto_1
    if-ge v9, v6, :cond_4

    .line 61
    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v10

    .line 68
    check-cast v10, LU/b;

    .line 69
    .line 70
    if-nez v10, :cond_2

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    move-object/from16 v18, v10

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_3
    :goto_2
    move-object/from16 v18, v3

    .line 77
    .line 78
    :goto_3
    add-int v10, v9, v6

    .line 79
    .line 80
    sub-int/2addr v10, v5

    .line 81
    rem-int/2addr v10, v6

    .line 82
    mul-int/2addr v10, v4

    .line 83
    add-int/lit8 v20, v9, 0x1

    .line 84
    .line 85
    rem-int v11, v20, v6

    .line 86
    .line 87
    mul-int/2addr v11, v4

    .line 88
    move v12, v11

    .line 89
    new-instance v11, LU/w;

    .line 90
    .line 91
    aget v13, v0, v10

    .line 92
    .line 93
    add-int/2addr v10, v5

    .line 94
    aget v10, v0, v10

    .line 95
    .line 96
    invoke-static {v13, v10}, Lo/e;->b(FF)J

    .line 97
    .line 98
    .line 99
    move-result-wide v13

    .line 100
    mul-int/lit8 v9, v9, 0x2

    .line 101
    .line 102
    aget v10, v0, v9

    .line 103
    .line 104
    add-int/2addr v9, v5

    .line 105
    aget v9, v0, v9

    .line 106
    .line 107
    invoke-static {v10, v9}, Lo/e;->b(FF)J

    .line 108
    .line 109
    .line 110
    move-result-wide v9

    .line 111
    aget v15, v0, v12

    .line 112
    .line 113
    add-int/2addr v12, v5

    .line 114
    aget v12, v0, v12

    .line 115
    .line 116
    invoke-static {v15, v12}, Lo/e;->b(FF)J

    .line 117
    .line 118
    .line 119
    move-result-wide v16

    .line 120
    const/16 v19, 0x0

    .line 121
    .line 122
    move-wide v12, v13

    .line 123
    move-wide v14, v9

    .line 124
    invoke-direct/range {v11 .. v19}, LU/w;-><init>(JJJLU/b;Lkotlin/jvm/internal/j;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move/from16 v9, v20

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_4
    invoke-static {v8, v6}, LA4/d;->l(II)LA4/c;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    new-instance v3, Ljava/util/ArrayList;

    .line 138
    .line 139
    const/16 v9, 0xa

    .line 140
    .line 141
    invoke-static {v1, v9}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 142
    .line 143
    .line 144
    move-result v9

    .line 145
    invoke-direct {v3, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 146
    .line 147
    .line 148
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 153
    .line 154
    .line 155
    move-result v9

    .line 156
    if-eqz v9, :cond_7

    .line 157
    .line 158
    move-object v9, v1

    .line 159
    check-cast v9, Li4/E;

    .line 160
    .line 161
    invoke-virtual {v9}, Li4/E;->nextInt()I

    .line 162
    .line 163
    .line 164
    move-result v9

    .line 165
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v10

    .line 169
    check-cast v10, LU/w;

    .line 170
    .line 171
    invoke-virtual {v10}, LU/w;->e()F

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    add-int/lit8 v11, v9, 0x1

    .line 176
    .line 177
    rem-int/2addr v11, v6

    .line 178
    invoke-interface {v7, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v12

    .line 182
    check-cast v12, LU/w;

    .line 183
    .line 184
    invoke-virtual {v12}, LU/w;->e()F

    .line 185
    .line 186
    .line 187
    move-result v12

    .line 188
    add-float/2addr v10, v12

    .line 189
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v12

    .line 193
    check-cast v12, LU/w;

    .line 194
    .line 195
    invoke-virtual {v12}, LU/w;->d()F

    .line 196
    .line 197
    .line 198
    move-result v12

    .line 199
    invoke-interface {v7, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v13

    .line 203
    check-cast v13, LU/w;

    .line 204
    .line 205
    invoke-virtual {v13}, LU/w;->d()F

    .line 206
    .line 207
    .line 208
    move-result v13

    .line 209
    add-float/2addr v12, v13

    .line 210
    mul-int/2addr v9, v4

    .line 211
    aget v13, v0, v9

    .line 212
    .line 213
    add-int/2addr v9, v5

    .line 214
    aget v9, v0, v9

    .line 215
    .line 216
    mul-int/2addr v11, v4

    .line 217
    aget v14, v0, v11

    .line 218
    .line 219
    add-int/2addr v11, v5

    .line 220
    aget v11, v0, v11

    .line 221
    .line 222
    sub-float/2addr v13, v14

    .line 223
    sub-float/2addr v9, v11

    .line 224
    invoke-static {v13, v9}, LU/C;->d(FF)F

    .line 225
    .line 226
    .line 227
    move-result v9

    .line 228
    cmpl-float v11, v10, v9

    .line 229
    .line 230
    if-lez v11, :cond_5

    .line 231
    .line 232
    div-float/2addr v9, v10

    .line 233
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 234
    .line 235
    .line 236
    move-result-object v9

    .line 237
    const/4 v10, 0x0

    .line 238
    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    invoke-static {v9, v10}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 243
    .line 244
    .line 245
    move-result-object v9

    .line 246
    goto :goto_5

    .line 247
    :cond_5
    cmpl-float v11, v12, v9

    .line 248
    .line 249
    const/high16 v13, 0x3f800000    # 1.0f

    .line 250
    .line 251
    if-lez v11, :cond_6

    .line 252
    .line 253
    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 254
    .line 255
    .line 256
    move-result-object v11

    .line 257
    sub-float/2addr v9, v10

    .line 258
    sub-float/2addr v12, v10

    .line 259
    div-float/2addr v9, v12

    .line 260
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 261
    .line 262
    .line 263
    move-result-object v9

    .line 264
    invoke-static {v11, v9}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 265
    .line 266
    .line 267
    move-result-object v9

    .line 268
    goto :goto_5

    .line 269
    :cond_6
    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 274
    .line 275
    .line 276
    move-result-object v10

    .line 277
    invoke-static {v9, v10}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 278
    .line 279
    .line 280
    move-result-object v9

    .line 281
    :goto_5
    invoke-interface {v3, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    goto/16 :goto_4

    .line 285
    .line 286
    :cond_7
    move v1, v8

    .line 287
    :goto_6
    if-ge v1, v6, :cond_9

    .line 288
    .line 289
    new-instance v9, Lo/m;

    .line 290
    .line 291
    invoke-direct {v9, v4}, Lo/m;-><init>(I)V

    .line 292
    .line 293
    .line 294
    move v10, v8

    .line 295
    :goto_7
    if-ge v10, v4, :cond_8

    .line 296
    .line 297
    add-int v11, v1, v6

    .line 298
    .line 299
    sub-int/2addr v11, v5

    .line 300
    add-int/2addr v11, v10

    .line 301
    rem-int/2addr v11, v6

    .line 302
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v11

    .line 306
    check-cast v11, Lh4/l;

    .line 307
    .line 308
    invoke-virtual {v11}, Lh4/l;->a()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v12

    .line 312
    check-cast v12, Ljava/lang/Number;

    .line 313
    .line 314
    invoke-virtual {v12}, Ljava/lang/Number;->floatValue()F

    .line 315
    .line 316
    .line 317
    move-result v12

    .line 318
    invoke-virtual {v11}, Lh4/l;->b()Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v11

    .line 322
    check-cast v11, Ljava/lang/Number;

    .line 323
    .line 324
    invoke-virtual {v11}, Ljava/lang/Number;->floatValue()F

    .line 325
    .line 326
    .line 327
    move-result v11

    .line 328
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v13

    .line 332
    check-cast v13, LU/w;

    .line 333
    .line 334
    invoke-virtual {v13}, LU/w;->e()F

    .line 335
    .line 336
    .line 337
    move-result v13

    .line 338
    mul-float/2addr v13, v12

    .line 339
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v12

    .line 343
    check-cast v12, LU/w;

    .line 344
    .line 345
    invoke-virtual {v12}, LU/w;->d()F

    .line 346
    .line 347
    .line 348
    move-result v12

    .line 349
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v14

    .line 353
    check-cast v14, LU/w;

    .line 354
    .line 355
    invoke-virtual {v14}, LU/w;->e()F

    .line 356
    .line 357
    .line 358
    move-result v14

    .line 359
    sub-float/2addr v12, v14

    .line 360
    mul-float/2addr v12, v11

    .line 361
    add-float/2addr v13, v12

    .line 362
    invoke-virtual {v9, v13}, Lo/m;->h(F)Z

    .line 363
    .line 364
    .line 365
    add-int/lit8 v10, v10, 0x1

    .line 366
    .line 367
    goto :goto_7

    .line 368
    :cond_8
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v10

    .line 372
    check-cast v10, LU/w;

    .line 373
    .line 374
    invoke-virtual {v9, v8}, Lo/f;->b(I)F

    .line 375
    .line 376
    .line 377
    move-result v11

    .line 378
    invoke-virtual {v9, v5}, Lo/f;->b(I)F

    .line 379
    .line 380
    .line 381
    move-result v9

    .line 382
    invoke-virtual {v10, v11, v9}, LU/w;->c(FF)Ljava/util/List;

    .line 383
    .line 384
    .line 385
    move-result-object v9

    .line 386
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    add-int/lit8 v1, v1, 0x1

    .line 390
    .line 391
    goto :goto_6

    .line 392
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    .line 393
    .line 394
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 395
    .line 396
    .line 397
    :goto_8
    if-ge v8, v6, :cond_a

    .line 398
    .line 399
    add-int v3, v8, v6

    .line 400
    .line 401
    sub-int/2addr v3, v5

    .line 402
    rem-int/2addr v3, v6

    .line 403
    add-int/lit8 v7, v8, 0x1

    .line 404
    .line 405
    rem-int v9, v7, v6

    .line 406
    .line 407
    mul-int/lit8 v10, v8, 0x2

    .line 408
    .line 409
    aget v11, v0, v10

    .line 410
    .line 411
    add-int/2addr v10, v5

    .line 412
    aget v10, v0, v10

    .line 413
    .line 414
    invoke-static {v11, v10}, Lo/e;->b(FF)J

    .line 415
    .line 416
    .line 417
    move-result-wide v14

    .line 418
    mul-int/2addr v3, v4

    .line 419
    aget v10, v0, v3

    .line 420
    .line 421
    add-int/2addr v3, v5

    .line 422
    aget v3, v0, v3

    .line 423
    .line 424
    invoke-static {v10, v3}, Lo/e;->b(FF)J

    .line 425
    .line 426
    .line 427
    move-result-wide v12

    .line 428
    mul-int/lit8 v3, v9, 0x2

    .line 429
    .line 430
    aget v10, v0, v3

    .line 431
    .line 432
    add-int/2addr v3, v5

    .line 433
    aget v3, v0, v3

    .line 434
    .line 435
    invoke-static {v10, v3}, Lo/e;->b(FF)J

    .line 436
    .line 437
    .line 438
    move-result-wide v16

    .line 439
    invoke-static/range {v12 .. v17}, LU/C;->b(JJJ)Z

    .line 440
    .line 441
    .line 442
    move-result v3

    .line 443
    new-instance v10, LU/g$a;

    .line 444
    .line 445
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 446
    .line 447
    .line 448
    move-result-object v11

    .line 449
    check-cast v11, Ljava/util/List;

    .line 450
    .line 451
    invoke-direct {v10, v11, v3}, LU/g$a;-><init>(Ljava/util/List;Z)V

    .line 452
    .line 453
    .line 454
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    new-instance v3, LU/g$b;

    .line 458
    .line 459
    sget-object v10, LU/c;->b:LU/c$a;

    .line 460
    .line 461
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v11

    .line 465
    check-cast v11, Ljava/util/List;

    .line 466
    .line 467
    invoke-static {v11}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v11

    .line 471
    check-cast v11, LU/c;

    .line 472
    .line 473
    invoke-virtual {v11}, LU/c;->d()F

    .line 474
    .line 475
    .line 476
    move-result v11

    .line 477
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 478
    .line 479
    .line 480
    move-result-object v8

    .line 481
    check-cast v8, Ljava/util/List;

    .line 482
    .line 483
    invoke-static {v8}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v8

    .line 487
    check-cast v8, LU/c;

    .line 488
    .line 489
    invoke-virtual {v8}, LU/c;->e()F

    .line 490
    .line 491
    .line 492
    move-result v8

    .line 493
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 494
    .line 495
    .line 496
    move-result-object v12

    .line 497
    check-cast v12, Ljava/util/List;

    .line 498
    .line 499
    invoke-static {v12}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 500
    .line 501
    .line 502
    move-result-object v12

    .line 503
    check-cast v12, LU/c;

    .line 504
    .line 505
    invoke-virtual {v12}, LU/c;->b()F

    .line 506
    .line 507
    .line 508
    move-result v12

    .line 509
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object v9

    .line 513
    check-cast v9, Ljava/util/List;

    .line 514
    .line 515
    invoke-static {v9}, Li4/m;->a0(Ljava/util/List;)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v9

    .line 519
    check-cast v9, LU/c;

    .line 520
    .line 521
    invoke-virtual {v9}, LU/c;->c()F

    .line 522
    .line 523
    .line 524
    move-result v9

    .line 525
    invoke-virtual {v10, v11, v8, v12, v9}, LU/c$a;->c(FFFF)LU/c;

    .line 526
    .line 527
    .line 528
    move-result-object v8

    .line 529
    invoke-static {v8}, Li4/m;->d(Ljava/lang/Object;)Ljava/util/List;

    .line 530
    .line 531
    .line 532
    move-result-object v8

    .line 533
    invoke-direct {v3, v8}, LU/g$b;-><init>(Ljava/util/List;)V

    .line 534
    .line 535
    .line 536
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    .line 538
    .line 539
    move v8, v7

    .line 540
    goto/16 :goto_8

    .line 541
    .line 542
    :cond_a
    const/4 v2, 0x1

    .line 543
    cmpg-float v3, p3, v2

    .line 544
    .line 545
    if-nez v3, :cond_b

    .line 546
    .line 547
    goto :goto_9

    .line 548
    :cond_b
    cmpg-float v2, p4, v2

    .line 549
    .line 550
    if-nez v2, :cond_c

    .line 551
    .line 552
    :goto_9
    invoke-static {v0}, LU/y;->d([F)J

    .line 553
    .line 554
    .line 555
    move-result-wide v2

    .line 556
    goto :goto_a

    .line 557
    :cond_c
    invoke-static/range {p3 .. p4}, Lo/e;->b(FF)J

    .line 558
    .line 559
    .line 560
    move-result-wide v2

    .line 561
    :goto_a
    const/16 v0, 0x20

    .line 562
    .line 563
    shr-long v4, v2, v0

    .line 564
    .line 565
    long-to-int v0, v4

    .line 566
    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 567
    .line 568
    .line 569
    move-result v0

    .line 570
    const-wide v4, 0xffffffffL

    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    and-long/2addr v2, v4

    .line 576
    long-to-int v2, v2

    .line 577
    invoke-static {v2}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 578
    .line 579
    .line 580
    move-result v2

    .line 581
    invoke-static {v1, v0, v2}, LU/y;->a(Ljava/util/List;FF)LU/x;

    .line 582
    .line 583
    .line 584
    move-result-object v0

    .line 585
    return-object v0

    .line 586
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 587
    .line 588
    const-string v1, "The vertices array should have even size"

    .line 589
    .line 590
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    throw v0

    .line 594
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 595
    .line 596
    const-string v1, "Polygons must have at least 3 vertices"

    .line 597
    .line 598
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 599
    .line 600
    .line 601
    throw v0
.end method

.method public static synthetic c(Ljava/util/List;FFILjava/lang/Object;)LU/x;
    .locals 1

    .line 1
    and-int/lit8 p4, p3, 0x2

    .line 2
    .line 3
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    move p1, v0

    .line 8
    :cond_0
    and-int/lit8 p3, p3, 0x4

    .line 9
    .line 10
    if-eqz p3, :cond_1

    .line 11
    .line 12
    move p2, v0

    .line 13
    :cond_1
    invoke-static {p0, p1, p2}, LU/y;->a(Ljava/util/List;FF)LU/x;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static final d([F)J
    .locals 5

    .line 1
    const-string v0, "vertices"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    move v1, v0

    .line 10
    :goto_0
    array-length v3, p0

    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    add-int/lit8 v3, v2, 0x1

    .line 14
    .line 15
    aget v4, p0, v2

    .line 16
    .line 17
    add-float/2addr v0, v4

    .line 18
    add-int/lit8 v2, v2, 0x2

    .line 19
    .line 20
    aget v3, p0, v3

    .line 21
    .line 22
    add-float/2addr v1, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    array-length v2, p0

    .line 25
    div-int/lit8 v2, v2, 0x2

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    div-float/2addr v0, v2

    .line 29
    array-length p0, p0

    .line 30
    div-int/lit8 p0, p0, 0x2

    .line 31
    .line 32
    int-to-float p0, p0

    .line 33
    div-float/2addr v1, p0

    .line 34
    invoke-static {v0, v1}, Lo/e;->b(FF)J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    return-wide v0
.end method
