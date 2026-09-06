.class public Lu/h;
.super Ljava/lang/Object;
.source "Direct.java"


# static fields
.field private static a:Lu/b$a;

.field private static b:I

.field private static c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lu/b$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lu/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lu/h;->a:Lu/b$a;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput v0, Lu/h;->b:I

    .line 10
    .line 11
    sput v0, Lu/h;->c:I

    .line 12
    .line 13
    return-void
.end method

.method private static a(ILt/e;)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Lt/e;->A()Lt/e$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lt/e;->T()Lt/e$b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Lt/e;->K()Lt/e;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lt/e;->K()Lt/e;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lt/f;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lt/e;->A()Lt/e$b;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lt/e$b;->g:Lt/e$b;

    .line 30
    .line 31
    :cond_1
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1}, Lt/e;->T()Lt/e$b;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v2, Lt/e$b;->g:Lt/e$b;

    .line 38
    .line 39
    :cond_2
    sget-object v1, Lt/e$b;->g:Lt/e$b;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    const/4 v3, 0x0

    .line 43
    const/4 v4, 0x1

    .line 44
    if-eq p0, v1, :cond_5

    .line 45
    .line 46
    invoke-virtual {p1}, Lt/e;->n0()Z

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-nez v5, :cond_5

    .line 51
    .line 52
    sget-object v5, Lt/e$b;->h:Lt/e$b;

    .line 53
    .line 54
    if-eq p0, v5, :cond_5

    .line 55
    .line 56
    sget-object v5, Lt/e$b;->i:Lt/e$b;

    .line 57
    .line 58
    if-ne p0, v5, :cond_3

    .line 59
    .line 60
    iget v6, p1, Lt/e;->w:I

    .line 61
    .line 62
    if-nez v6, :cond_3

    .line 63
    .line 64
    iget v6, p1, Lt/e;->d0:F

    .line 65
    .line 66
    cmpl-float v6, v6, v2

    .line 67
    .line 68
    if-nez v6, :cond_3

    .line 69
    .line 70
    invoke-virtual {p1, v3}, Lt/e;->a0(I)Z

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    if-nez v6, :cond_5

    .line 75
    .line 76
    :cond_3
    if-ne p0, v5, :cond_4

    .line 77
    .line 78
    iget p0, p1, Lt/e;->w:I

    .line 79
    .line 80
    if-ne p0, v4, :cond_4

    .line 81
    .line 82
    invoke-virtual {p1}, Lt/e;->W()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {p1, v3, p0}, Lt/e;->d0(II)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_4

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    move p0, v3

    .line 94
    goto :goto_2

    .line 95
    :cond_5
    :goto_1
    move p0, v4

    .line 96
    :goto_2
    if-eq v0, v1, :cond_8

    .line 97
    .line 98
    invoke-virtual {p1}, Lt/e;->o0()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-nez v1, :cond_8

    .line 103
    .line 104
    sget-object v1, Lt/e$b;->h:Lt/e$b;

    .line 105
    .line 106
    if-eq v0, v1, :cond_8

    .line 107
    .line 108
    sget-object v1, Lt/e$b;->i:Lt/e$b;

    .line 109
    .line 110
    if-ne v0, v1, :cond_6

    .line 111
    .line 112
    iget v5, p1, Lt/e;->x:I

    .line 113
    .line 114
    if-nez v5, :cond_6

    .line 115
    .line 116
    iget v5, p1, Lt/e;->d0:F

    .line 117
    .line 118
    cmpl-float v5, v5, v2

    .line 119
    .line 120
    if-nez v5, :cond_6

    .line 121
    .line 122
    invoke-virtual {p1, v4}, Lt/e;->a0(I)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-nez v5, :cond_8

    .line 127
    .line 128
    :cond_6
    if-ne v0, v1, :cond_7

    .line 129
    .line 130
    iget v0, p1, Lt/e;->x:I

    .line 131
    .line 132
    if-ne v0, v4, :cond_7

    .line 133
    .line 134
    invoke-virtual {p1}, Lt/e;->x()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-virtual {p1, v4, v0}, Lt/e;->d0(II)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_7

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_7
    move v0, v3

    .line 146
    goto :goto_4

    .line 147
    :cond_8
    :goto_3
    move v0, v4

    .line 148
    :goto_4
    iget p1, p1, Lt/e;->d0:F

    .line 149
    .line 150
    cmpl-float p1, p1, v2

    .line 151
    .line 152
    if-lez p1, :cond_a

    .line 153
    .line 154
    if-nez p0, :cond_9

    .line 155
    .line 156
    if-eqz v0, :cond_a

    .line 157
    .line 158
    :cond_9
    return v4

    .line 159
    :cond_a
    if-eqz p0, :cond_b

    .line 160
    .line 161
    if-eqz v0, :cond_b

    .line 162
    .line 163
    return v4

    .line 164
    :cond_b
    return v3
.end method

.method private static b(ILt/e;Lu/b$b;Z)V
    .locals 18

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v0}, Lt/e;->g0()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget v3, Lu/h;->b:I

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    add-int/2addr v3, v4

    .line 18
    sput v3, Lu/h;->b:I

    .line 19
    .line 20
    instance-of v3, v0, Lt/f;

    .line 21
    .line 22
    if-nez v3, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0}, Lt/e;->m0()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    add-int/lit8 v3, p0, 0x1

    .line 31
    .line 32
    invoke-static {v3, v0}, Lu/h;->a(ILt/e;)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_1

    .line 37
    .line 38
    new-instance v5, Lu/b$a;

    .line 39
    .line 40
    invoke-direct {v5}, Lu/b$a;-><init>()V

    .line 41
    .line 42
    .line 43
    sget v6, Lu/b$a;->k:I

    .line 44
    .line 45
    invoke-static {v3, v0, v1, v5, v6}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 46
    .line 47
    .line 48
    :cond_1
    sget-object v3, Lt/d$a;->h:Lt/d$a;

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    sget-object v5, Lt/d$a;->j:Lt/d$a;

    .line 55
    .line 56
    invoke-virtual {v0, v5}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v3}, Lt/d;->e()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    invoke-virtual {v5}, Lt/d;->e()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    invoke-virtual {v3}, Lt/d;->d()Ljava/util/HashSet;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    const/16 v10, 0x8

    .line 73
    .line 74
    const/4 v11, 0x0

    .line 75
    if-eqz v8, :cond_d

    .line 76
    .line 77
    invoke-virtual {v3}, Lt/d;->n()Z

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    if-eqz v8, :cond_d

    .line 82
    .line 83
    invoke-virtual {v3}, Lt/d;->d()Ljava/util/HashSet;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    if-eqz v8, :cond_d

    .line 96
    .line 97
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    check-cast v8, Lt/d;

    .line 102
    .line 103
    iget-object v12, v8, Lt/d;->d:Lt/e;

    .line 104
    .line 105
    add-int/lit8 v13, p0, 0x1

    .line 106
    .line 107
    invoke-static {v13, v12}, Lu/h;->a(ILt/e;)Z

    .line 108
    .line 109
    .line 110
    move-result v14

    .line 111
    invoke-virtual {v12}, Lt/e;->m0()Z

    .line 112
    .line 113
    .line 114
    move-result v15

    .line 115
    if-eqz v15, :cond_2

    .line 116
    .line 117
    if-eqz v14, :cond_2

    .line 118
    .line 119
    new-instance v15, Lu/b$a;

    .line 120
    .line 121
    invoke-direct {v15}, Lu/b$a;-><init>()V

    .line 122
    .line 123
    .line 124
    move/from16 v16, v4

    .line 125
    .line 126
    sget v4, Lu/b$a;->k:I

    .line 127
    .line 128
    invoke-static {v13, v12, v1, v15, v4}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    move/from16 v16, v4

    .line 133
    .line 134
    :goto_1
    iget-object v4, v12, Lt/e;->O:Lt/d;

    .line 135
    .line 136
    if-ne v8, v4, :cond_3

    .line 137
    .line 138
    iget-object v4, v12, Lt/e;->Q:Lt/d;

    .line 139
    .line 140
    iget-object v4, v4, Lt/d;->f:Lt/d;

    .line 141
    .line 142
    if-eqz v4, :cond_3

    .line 143
    .line 144
    invoke-virtual {v4}, Lt/d;->n()Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-nez v4, :cond_4

    .line 149
    .line 150
    :cond_3
    iget-object v4, v12, Lt/e;->Q:Lt/d;

    .line 151
    .line 152
    if-ne v8, v4, :cond_5

    .line 153
    .line 154
    iget-object v4, v12, Lt/e;->O:Lt/d;

    .line 155
    .line 156
    iget-object v4, v4, Lt/d;->f:Lt/d;

    .line 157
    .line 158
    if-eqz v4, :cond_5

    .line 159
    .line 160
    invoke-virtual {v4}, Lt/d;->n()Z

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-eqz v4, :cond_5

    .line 165
    .line 166
    :cond_4
    move/from16 v4, v16

    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_5
    move v4, v11

    .line 170
    :goto_2
    invoke-virtual {v12}, Lt/e;->A()Lt/e$b;

    .line 171
    .line 172
    .line 173
    move-result-object v15

    .line 174
    const/16 v17, 0x0

    .line 175
    .line 176
    sget-object v9, Lt/e$b;->i:Lt/e$b;

    .line 177
    .line 178
    if-ne v15, v9, :cond_8

    .line 179
    .line 180
    if-eqz v14, :cond_6

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_6
    invoke-virtual {v12}, Lt/e;->A()Lt/e$b;

    .line 184
    .line 185
    .line 186
    move-result-object v8

    .line 187
    if-ne v8, v9, :cond_9

    .line 188
    .line 189
    iget v8, v12, Lt/e;->A:I

    .line 190
    .line 191
    if-ltz v8, :cond_9

    .line 192
    .line 193
    iget v8, v12, Lt/e;->z:I

    .line 194
    .line 195
    if-ltz v8, :cond_9

    .line 196
    .line 197
    invoke-virtual {v12}, Lt/e;->V()I

    .line 198
    .line 199
    .line 200
    move-result v8

    .line 201
    if-eq v8, v10, :cond_7

    .line 202
    .line 203
    iget v8, v12, Lt/e;->w:I

    .line 204
    .line 205
    if-nez v8, :cond_9

    .line 206
    .line 207
    invoke-virtual {v12}, Lt/e;->v()F

    .line 208
    .line 209
    .line 210
    move-result v8

    .line 211
    cmpl-float v8, v8, v17

    .line 212
    .line 213
    if-nez v8, :cond_9

    .line 214
    .line 215
    :cond_7
    invoke-virtual {v12}, Lt/e;->i0()Z

    .line 216
    .line 217
    .line 218
    move-result v8

    .line 219
    if-nez v8, :cond_9

    .line 220
    .line 221
    invoke-virtual {v12}, Lt/e;->l0()Z

    .line 222
    .line 223
    .line 224
    move-result v8

    .line 225
    if-nez v8, :cond_9

    .line 226
    .line 227
    if-eqz v4, :cond_9

    .line 228
    .line 229
    invoke-virtual {v12}, Lt/e;->i0()Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-nez v4, :cond_9

    .line 234
    .line 235
    invoke-static {v13, v0, v1, v12, v2}, Lu/h;->e(ILt/e;Lu/b$b;Lt/e;Z)V

    .line 236
    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_8
    :goto_3
    invoke-virtual {v12}, Lt/e;->m0()Z

    .line 240
    .line 241
    .line 242
    move-result v9

    .line 243
    if-eqz v9, :cond_a

    .line 244
    .line 245
    :cond_9
    :goto_4
    move/from16 v4, v16

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_a
    iget-object v9, v12, Lt/e;->O:Lt/d;

    .line 250
    .line 251
    if-ne v8, v9, :cond_b

    .line 252
    .line 253
    iget-object v14, v12, Lt/e;->Q:Lt/d;

    .line 254
    .line 255
    iget-object v14, v14, Lt/d;->f:Lt/d;

    .line 256
    .line 257
    if-nez v14, :cond_b

    .line 258
    .line 259
    invoke-virtual {v9}, Lt/d;->f()I

    .line 260
    .line 261
    .line 262
    move-result v4

    .line 263
    add-int/2addr v4, v6

    .line 264
    invoke-virtual {v12}, Lt/e;->W()I

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    add-int/2addr v8, v4

    .line 269
    invoke-virtual {v12, v4, v8}, Lt/e;->G0(II)V

    .line 270
    .line 271
    .line 272
    invoke-static {v13, v12, v1, v2}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 273
    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_b
    iget-object v14, v12, Lt/e;->Q:Lt/d;

    .line 277
    .line 278
    if-ne v8, v14, :cond_c

    .line 279
    .line 280
    iget-object v8, v9, Lt/d;->f:Lt/d;

    .line 281
    .line 282
    if-nez v8, :cond_c

    .line 283
    .line 284
    invoke-virtual {v14}, Lt/d;->f()I

    .line 285
    .line 286
    .line 287
    move-result v4

    .line 288
    sub-int v4, v6, v4

    .line 289
    .line 290
    invoke-virtual {v12}, Lt/e;->W()I

    .line 291
    .line 292
    .line 293
    move-result v8

    .line 294
    sub-int v8, v4, v8

    .line 295
    .line 296
    invoke-virtual {v12, v8, v4}, Lt/e;->G0(II)V

    .line 297
    .line 298
    .line 299
    invoke-static {v13, v12, v1, v2}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 300
    .line 301
    .line 302
    goto :goto_4

    .line 303
    :cond_c
    if-eqz v4, :cond_9

    .line 304
    .line 305
    invoke-virtual {v12}, Lt/e;->i0()Z

    .line 306
    .line 307
    .line 308
    move-result v4

    .line 309
    if-nez v4, :cond_9

    .line 310
    .line 311
    invoke-static {v13, v1, v12, v2}, Lu/h;->d(ILu/b$b;Lt/e;Z)V

    .line 312
    .line 313
    .line 314
    goto :goto_4

    .line 315
    :cond_d
    move/from16 v16, v4

    .line 316
    .line 317
    const/16 v17, 0x0

    .line 318
    .line 319
    instance-of v3, v0, Lt/h;

    .line 320
    .line 321
    if-eqz v3, :cond_e

    .line 322
    .line 323
    return-void

    .line 324
    :cond_e
    invoke-virtual {v5}, Lt/d;->d()Ljava/util/HashSet;

    .line 325
    .line 326
    .line 327
    move-result-object v3

    .line 328
    if-eqz v3, :cond_1a

    .line 329
    .line 330
    invoke-virtual {v5}, Lt/d;->n()Z

    .line 331
    .line 332
    .line 333
    move-result v3

    .line 334
    if-eqz v3, :cond_1a

    .line 335
    .line 336
    invoke-virtual {v5}, Lt/d;->d()Ljava/util/HashSet;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    :cond_f
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 345
    .line 346
    .line 347
    move-result v4

    .line 348
    if-eqz v4, :cond_1a

    .line 349
    .line 350
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v4

    .line 354
    check-cast v4, Lt/d;

    .line 355
    .line 356
    iget-object v5, v4, Lt/d;->d:Lt/e;

    .line 357
    .line 358
    add-int/lit8 v6, p0, 0x1

    .line 359
    .line 360
    invoke-static {v6, v5}, Lu/h;->a(ILt/e;)Z

    .line 361
    .line 362
    .line 363
    move-result v8

    .line 364
    invoke-virtual {v5}, Lt/e;->m0()Z

    .line 365
    .line 366
    .line 367
    move-result v9

    .line 368
    if-eqz v9, :cond_10

    .line 369
    .line 370
    if-eqz v8, :cond_10

    .line 371
    .line 372
    new-instance v9, Lu/b$a;

    .line 373
    .line 374
    invoke-direct {v9}, Lu/b$a;-><init>()V

    .line 375
    .line 376
    .line 377
    sget v12, Lu/b$a;->k:I

    .line 378
    .line 379
    invoke-static {v6, v5, v1, v9, v12}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 380
    .line 381
    .line 382
    :cond_10
    iget-object v9, v5, Lt/e;->O:Lt/d;

    .line 383
    .line 384
    if-ne v4, v9, :cond_11

    .line 385
    .line 386
    iget-object v9, v5, Lt/e;->Q:Lt/d;

    .line 387
    .line 388
    iget-object v9, v9, Lt/d;->f:Lt/d;

    .line 389
    .line 390
    if-eqz v9, :cond_11

    .line 391
    .line 392
    invoke-virtual {v9}, Lt/d;->n()Z

    .line 393
    .line 394
    .line 395
    move-result v9

    .line 396
    if-nez v9, :cond_12

    .line 397
    .line 398
    :cond_11
    iget-object v9, v5, Lt/e;->Q:Lt/d;

    .line 399
    .line 400
    if-ne v4, v9, :cond_13

    .line 401
    .line 402
    iget-object v9, v5, Lt/e;->O:Lt/d;

    .line 403
    .line 404
    iget-object v9, v9, Lt/d;->f:Lt/d;

    .line 405
    .line 406
    if-eqz v9, :cond_13

    .line 407
    .line 408
    invoke-virtual {v9}, Lt/d;->n()Z

    .line 409
    .line 410
    .line 411
    move-result v9

    .line 412
    if-eqz v9, :cond_13

    .line 413
    .line 414
    :cond_12
    move/from16 v9, v16

    .line 415
    .line 416
    goto :goto_6

    .line 417
    :cond_13
    move v9, v11

    .line 418
    :goto_6
    invoke-virtual {v5}, Lt/e;->A()Lt/e$b;

    .line 419
    .line 420
    .line 421
    move-result-object v12

    .line 422
    sget-object v13, Lt/e$b;->i:Lt/e$b;

    .line 423
    .line 424
    if-ne v12, v13, :cond_16

    .line 425
    .line 426
    if-eqz v8, :cond_14

    .line 427
    .line 428
    goto :goto_7

    .line 429
    :cond_14
    invoke-virtual {v5}, Lt/e;->A()Lt/e$b;

    .line 430
    .line 431
    .line 432
    move-result-object v4

    .line 433
    if-ne v4, v13, :cond_f

    .line 434
    .line 435
    iget v4, v5, Lt/e;->A:I

    .line 436
    .line 437
    if-ltz v4, :cond_f

    .line 438
    .line 439
    iget v4, v5, Lt/e;->z:I

    .line 440
    .line 441
    if-ltz v4, :cond_f

    .line 442
    .line 443
    invoke-virtual {v5}, Lt/e;->V()I

    .line 444
    .line 445
    .line 446
    move-result v4

    .line 447
    if-eq v4, v10, :cond_15

    .line 448
    .line 449
    iget v4, v5, Lt/e;->w:I

    .line 450
    .line 451
    if-nez v4, :cond_f

    .line 452
    .line 453
    invoke-virtual {v5}, Lt/e;->v()F

    .line 454
    .line 455
    .line 456
    move-result v4

    .line 457
    cmpl-float v4, v4, v17

    .line 458
    .line 459
    if-nez v4, :cond_f

    .line 460
    .line 461
    :cond_15
    invoke-virtual {v5}, Lt/e;->i0()Z

    .line 462
    .line 463
    .line 464
    move-result v4

    .line 465
    if-nez v4, :cond_f

    .line 466
    .line 467
    invoke-virtual {v5}, Lt/e;->l0()Z

    .line 468
    .line 469
    .line 470
    move-result v4

    .line 471
    if-nez v4, :cond_f

    .line 472
    .line 473
    if-eqz v9, :cond_f

    .line 474
    .line 475
    invoke-virtual {v5}, Lt/e;->i0()Z

    .line 476
    .line 477
    .line 478
    move-result v4

    .line 479
    if-nez v4, :cond_f

    .line 480
    .line 481
    invoke-static {v6, v0, v1, v5, v2}, Lu/h;->e(ILt/e;Lu/b$b;Lt/e;Z)V

    .line 482
    .line 483
    .line 484
    goto/16 :goto_5

    .line 485
    .line 486
    :cond_16
    :goto_7
    invoke-virtual {v5}, Lt/e;->m0()Z

    .line 487
    .line 488
    .line 489
    move-result v8

    .line 490
    if-eqz v8, :cond_17

    .line 491
    .line 492
    goto/16 :goto_5

    .line 493
    .line 494
    :cond_17
    iget-object v8, v5, Lt/e;->O:Lt/d;

    .line 495
    .line 496
    if-ne v4, v8, :cond_18

    .line 497
    .line 498
    iget-object v12, v5, Lt/e;->Q:Lt/d;

    .line 499
    .line 500
    iget-object v12, v12, Lt/d;->f:Lt/d;

    .line 501
    .line 502
    if-nez v12, :cond_18

    .line 503
    .line 504
    invoke-virtual {v8}, Lt/d;->f()I

    .line 505
    .line 506
    .line 507
    move-result v4

    .line 508
    add-int/2addr v4, v7

    .line 509
    invoke-virtual {v5}, Lt/e;->W()I

    .line 510
    .line 511
    .line 512
    move-result v8

    .line 513
    add-int/2addr v8, v4

    .line 514
    invoke-virtual {v5, v4, v8}, Lt/e;->G0(II)V

    .line 515
    .line 516
    .line 517
    invoke-static {v6, v5, v1, v2}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 518
    .line 519
    .line 520
    goto/16 :goto_5

    .line 521
    .line 522
    :cond_18
    iget-object v12, v5, Lt/e;->Q:Lt/d;

    .line 523
    .line 524
    if-ne v4, v12, :cond_19

    .line 525
    .line 526
    iget-object v4, v8, Lt/d;->f:Lt/d;

    .line 527
    .line 528
    if-nez v4, :cond_19

    .line 529
    .line 530
    invoke-virtual {v12}, Lt/d;->f()I

    .line 531
    .line 532
    .line 533
    move-result v4

    .line 534
    sub-int v4, v7, v4

    .line 535
    .line 536
    invoke-virtual {v5}, Lt/e;->W()I

    .line 537
    .line 538
    .line 539
    move-result v8

    .line 540
    sub-int v8, v4, v8

    .line 541
    .line 542
    invoke-virtual {v5, v8, v4}, Lt/e;->G0(II)V

    .line 543
    .line 544
    .line 545
    invoke-static {v6, v5, v1, v2}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 546
    .line 547
    .line 548
    goto/16 :goto_5

    .line 549
    .line 550
    :cond_19
    if-eqz v9, :cond_f

    .line 551
    .line 552
    invoke-virtual {v5}, Lt/e;->i0()Z

    .line 553
    .line 554
    .line 555
    move-result v4

    .line 556
    if-nez v4, :cond_f

    .line 557
    .line 558
    invoke-static {v6, v1, v5, v2}, Lu/h;->d(ILu/b$b;Lt/e;Z)V

    .line 559
    .line 560
    .line 561
    goto/16 :goto_5

    .line 562
    .line 563
    :cond_1a
    invoke-virtual {v0}, Lt/e;->q0()V

    .line 564
    .line 565
    .line 566
    return-void
.end method

.method private static c(ILt/a;Lu/b$b;IZ)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lt/a;->u1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0, p1, p2, p4}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0, p1, p2}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private static d(ILu/b$b;Lt/e;Z)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lt/e;->y()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p2, Lt/e;->O:Lt/d;

    .line 6
    .line 7
    iget-object v1, v1, Lt/d;->f:Lt/d;

    .line 8
    .line 9
    invoke-virtual {v1}, Lt/d;->e()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p2, Lt/e;->Q:Lt/d;

    .line 14
    .line 15
    iget-object v2, v2, Lt/d;->f:Lt/d;

    .line 16
    .line 17
    invoke-virtual {v2}, Lt/d;->e()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p2, Lt/e;->O:Lt/d;

    .line 22
    .line 23
    invoke-virtual {v3}, Lt/d;->f()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    add-int/2addr v3, v1

    .line 28
    iget-object v4, p2, Lt/e;->Q:Lt/d;

    .line 29
    .line 30
    invoke-virtual {v4}, Lt/d;->f()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    sub-int v4, v2, v4

    .line 35
    .line 36
    const/high16 v5, 0x3f000000    # 0.5f

    .line 37
    .line 38
    if-ne v1, v2, :cond_0

    .line 39
    .line 40
    move v0, v5

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v1, v3

    .line 43
    move v2, v4

    .line 44
    :goto_0
    invoke-virtual {p2}, Lt/e;->W()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int v4, v2, v1

    .line 49
    .line 50
    sub-int/2addr v4, v3

    .line 51
    if-le v1, v2, :cond_1

    .line 52
    .line 53
    sub-int v4, v1, v2

    .line 54
    .line 55
    sub-int/2addr v4, v3

    .line 56
    :cond_1
    if-lez v4, :cond_2

    .line 57
    .line 58
    int-to-float v4, v4

    .line 59
    mul-float/2addr v0, v4

    .line 60
    add-float/2addr v0, v5

    .line 61
    :goto_1
    float-to-int v0, v0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    int-to-float v4, v4

    .line 64
    mul-float/2addr v0, v4

    .line 65
    goto :goto_1

    .line 66
    :goto_2
    add-int/2addr v0, v1

    .line 67
    add-int v4, v0, v3

    .line 68
    .line 69
    if-le v1, v2, :cond_3

    .line 70
    .line 71
    sub-int v4, v0, v3

    .line 72
    .line 73
    :cond_3
    invoke-virtual {p2, v0, v4}, Lt/e;->G0(II)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 p0, p0, 0x1

    .line 77
    .line 78
    invoke-static {p0, p2, p1, p3}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method private static e(ILt/e;Lu/b$b;Lt/e;Z)V
    .locals 7

    .line 1
    invoke-virtual {p3}, Lt/e;->y()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p3, Lt/e;->O:Lt/d;

    .line 6
    .line 7
    iget-object v1, v1, Lt/d;->f:Lt/d;

    .line 8
    .line 9
    invoke-virtual {v1}, Lt/d;->e()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p3, Lt/e;->O:Lt/d;

    .line 14
    .line 15
    invoke-virtual {v2}, Lt/d;->f()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v1, v2

    .line 20
    iget-object v2, p3, Lt/e;->Q:Lt/d;

    .line 21
    .line 22
    iget-object v2, v2, Lt/d;->f:Lt/d;

    .line 23
    .line 24
    invoke-virtual {v2}, Lt/d;->e()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p3, Lt/e;->Q:Lt/d;

    .line 29
    .line 30
    invoke-virtual {v3}, Lt/d;->f()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    sub-int/2addr v2, v3

    .line 35
    if-lt v2, v1, :cond_4

    .line 36
    .line 37
    invoke-virtual {p3}, Lt/e;->W()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {p3}, Lt/e;->V()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    const/high16 v6, 0x3f000000    # 0.5f

    .line 48
    .line 49
    if-eq v4, v5, :cond_3

    .line 50
    .line 51
    iget v4, p3, Lt/e;->w:I

    .line 52
    .line 53
    const/4 v5, 0x2

    .line 54
    if-ne v4, v5, :cond_1

    .line 55
    .line 56
    instance-of v3, p1, Lt/f;

    .line 57
    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    invoke-virtual {p1}, Lt/e;->W()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p1}, Lt/e;->K()Lt/e;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lt/e;->W()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    :goto_0
    invoke-virtual {p3}, Lt/e;->y()F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    mul-float/2addr v3, v6

    .line 78
    int-to-float p1, p1

    .line 79
    mul-float/2addr v3, p1

    .line 80
    float-to-int v3, v3

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    if-nez v4, :cond_2

    .line 83
    .line 84
    sub-int v3, v2, v1

    .line 85
    .line 86
    :cond_2
    :goto_1
    iget p1, p3, Lt/e;->z:I

    .line 87
    .line 88
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    iget p1, p3, Lt/e;->A:I

    .line 93
    .line 94
    if-lez p1, :cond_3

    .line 95
    .line 96
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    :cond_3
    sub-int/2addr v2, v1

    .line 101
    sub-int/2addr v2, v3

    .line 102
    int-to-float p1, v2

    .line 103
    mul-float/2addr v0, p1

    .line 104
    add-float/2addr v0, v6

    .line 105
    float-to-int p1, v0

    .line 106
    add-int/2addr v1, p1

    .line 107
    add-int/2addr v3, v1

    .line 108
    invoke-virtual {p3, v1, v3}, Lt/e;->G0(II)V

    .line 109
    .line 110
    .line 111
    add-int/lit8 p0, p0, 0x1

    .line 112
    .line 113
    invoke-static {p0, p3, p2, p4}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 114
    .line 115
    .line 116
    :cond_4
    return-void
.end method

.method private static f(ILu/b$b;Lt/e;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lt/e;->R()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p2, Lt/e;->P:Lt/d;

    .line 6
    .line 7
    iget-object v1, v1, Lt/d;->f:Lt/d;

    .line 8
    .line 9
    invoke-virtual {v1}, Lt/d;->e()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p2, Lt/e;->R:Lt/d;

    .line 14
    .line 15
    iget-object v2, v2, Lt/d;->f:Lt/d;

    .line 16
    .line 17
    invoke-virtual {v2}, Lt/d;->e()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p2, Lt/e;->P:Lt/d;

    .line 22
    .line 23
    invoke-virtual {v3}, Lt/d;->f()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    add-int/2addr v3, v1

    .line 28
    iget-object v4, p2, Lt/e;->R:Lt/d;

    .line 29
    .line 30
    invoke-virtual {v4}, Lt/d;->f()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    sub-int v4, v2, v4

    .line 35
    .line 36
    const/high16 v5, 0x3f000000    # 0.5f

    .line 37
    .line 38
    if-ne v1, v2, :cond_0

    .line 39
    .line 40
    move v0, v5

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v1, v3

    .line 43
    move v2, v4

    .line 44
    :goto_0
    invoke-virtual {p2}, Lt/e;->x()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    sub-int v4, v2, v1

    .line 49
    .line 50
    sub-int/2addr v4, v3

    .line 51
    if-le v1, v2, :cond_1

    .line 52
    .line 53
    sub-int v4, v1, v2

    .line 54
    .line 55
    sub-int/2addr v4, v3

    .line 56
    :cond_1
    if-lez v4, :cond_2

    .line 57
    .line 58
    int-to-float v4, v4

    .line 59
    mul-float/2addr v0, v4

    .line 60
    add-float/2addr v0, v5

    .line 61
    :goto_1
    float-to-int v0, v0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    int-to-float v4, v4

    .line 64
    mul-float/2addr v0, v4

    .line 65
    goto :goto_1

    .line 66
    :goto_2
    add-int v4, v1, v0

    .line 67
    .line 68
    add-int v5, v4, v3

    .line 69
    .line 70
    if-le v1, v2, :cond_3

    .line 71
    .line 72
    sub-int v4, v1, v0

    .line 73
    .line 74
    sub-int v5, v4, v3

    .line 75
    .line 76
    :cond_3
    invoke-virtual {p2, v4, v5}, Lt/e;->J0(II)V

    .line 77
    .line 78
    .line 79
    add-int/lit8 p0, p0, 0x1

    .line 80
    .line 81
    invoke-static {p0, p2, p1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private static g(ILt/e;Lu/b$b;Lt/e;)V
    .locals 7

    .line 1
    invoke-virtual {p3}, Lt/e;->R()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p3, Lt/e;->P:Lt/d;

    .line 6
    .line 7
    iget-object v1, v1, Lt/d;->f:Lt/d;

    .line 8
    .line 9
    invoke-virtual {v1}, Lt/d;->e()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p3, Lt/e;->P:Lt/d;

    .line 14
    .line 15
    invoke-virtual {v2}, Lt/d;->f()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v1, v2

    .line 20
    iget-object v2, p3, Lt/e;->R:Lt/d;

    .line 21
    .line 22
    iget-object v2, v2, Lt/d;->f:Lt/d;

    .line 23
    .line 24
    invoke-virtual {v2}, Lt/d;->e()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p3, Lt/e;->R:Lt/d;

    .line 29
    .line 30
    invoke-virtual {v3}, Lt/d;->f()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    sub-int/2addr v2, v3

    .line 35
    if-lt v2, v1, :cond_4

    .line 36
    .line 37
    invoke-virtual {p3}, Lt/e;->x()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-virtual {p3}, Lt/e;->V()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    const/high16 v6, 0x3f000000    # 0.5f

    .line 48
    .line 49
    if-eq v4, v5, :cond_3

    .line 50
    .line 51
    iget v4, p3, Lt/e;->x:I

    .line 52
    .line 53
    const/4 v5, 0x2

    .line 54
    if-ne v4, v5, :cond_1

    .line 55
    .line 56
    instance-of v3, p1, Lt/f;

    .line 57
    .line 58
    if-eqz v3, :cond_0

    .line 59
    .line 60
    invoke-virtual {p1}, Lt/e;->x()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p1}, Lt/e;->K()Lt/e;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1}, Lt/e;->x()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    :goto_0
    mul-float v3, v0, v6

    .line 74
    .line 75
    int-to-float p1, p1

    .line 76
    mul-float/2addr v3, p1

    .line 77
    float-to-int v3, v3

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    if-nez v4, :cond_2

    .line 80
    .line 81
    sub-int v3, v2, v1

    .line 82
    .line 83
    :cond_2
    :goto_1
    iget p1, p3, Lt/e;->C:I

    .line 84
    .line 85
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    iget p1, p3, Lt/e;->D:I

    .line 90
    .line 91
    if-lez p1, :cond_3

    .line 92
    .line 93
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    :cond_3
    sub-int/2addr v2, v1

    .line 98
    sub-int/2addr v2, v3

    .line 99
    int-to-float p1, v2

    .line 100
    mul-float/2addr v0, p1

    .line 101
    add-float/2addr v0, v6

    .line 102
    float-to-int p1, v0

    .line 103
    add-int/2addr v1, p1

    .line 104
    add-int/2addr v3, v1

    .line 105
    invoke-virtual {p3, v1, v3}, Lt/e;->J0(II)V

    .line 106
    .line 107
    .line 108
    add-int/lit8 p0, p0, 0x1

    .line 109
    .line 110
    invoke-static {p0, p3, p2}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    return-void
.end method

.method public static h(Lt/f;Lu/b$b;)V
    .locals 13

    .line 1
    invoke-virtual {p0}, Lt/e;->A()Lt/e$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lt/e;->T()Lt/e$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    sput v2, Lu/h;->b:I

    .line 11
    .line 12
    sput v2, Lu/h;->c:I

    .line 13
    .line 14
    invoke-virtual {p0}, Lt/e;->v0()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lt/m;->s1()Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    move v5, v2

    .line 26
    :goto_0
    if-ge v5, v4, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    check-cast v6, Lt/e;

    .line 33
    .line 34
    invoke-virtual {v6}, Lt/e;->v0()V

    .line 35
    .line 36
    .line 37
    add-int/lit8 v5, v5, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Lt/f;->R1()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    sget-object v6, Lt/e$b;->g:Lt/e$b;

    .line 45
    .line 46
    if-ne v0, v6, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Lt/e;->W()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {p0, v2, v0}, Lt/e;->G0(II)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p0, v2}, Lt/e;->H0(I)V

    .line 57
    .line 58
    .line 59
    :goto_1
    move v0, v2

    .line 60
    move v6, v0

    .line 61
    move v7, v6

    .line 62
    :goto_2
    const/high16 v8, 0x3f000000    # 0.5f

    .line 63
    .line 64
    const/4 v9, -0x1

    .line 65
    const/4 v10, 0x1

    .line 66
    if-ge v0, v4, :cond_7

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v11

    .line 72
    check-cast v11, Lt/e;

    .line 73
    .line 74
    instance-of v12, v11, Lt/h;

    .line 75
    .line 76
    if-eqz v12, :cond_5

    .line 77
    .line 78
    check-cast v11, Lt/h;

    .line 79
    .line 80
    invoke-virtual {v11}, Lt/h;->t1()I

    .line 81
    .line 82
    .line 83
    move-result v12

    .line 84
    if-ne v12, v10, :cond_6

    .line 85
    .line 86
    invoke-virtual {v11}, Lt/h;->u1()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    if-eq v6, v9, :cond_2

    .line 91
    .line 92
    invoke-virtual {v11}, Lt/h;->u1()I

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    invoke-virtual {v11, v6}, Lt/h;->x1(I)V

    .line 97
    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_2
    invoke-virtual {v11}, Lt/h;->v1()I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-eq v6, v9, :cond_3

    .line 105
    .line 106
    invoke-virtual {p0}, Lt/e;->n0()Z

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-eqz v6, :cond_3

    .line 111
    .line 112
    invoke-virtual {p0}, Lt/e;->W()I

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    invoke-virtual {v11}, Lt/h;->v1()I

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    sub-int/2addr v6, v8

    .line 121
    invoke-virtual {v11, v6}, Lt/h;->x1(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_3
    invoke-virtual {p0}, Lt/e;->n0()Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_4

    .line 130
    .line 131
    invoke-virtual {v11}, Lt/h;->w1()F

    .line 132
    .line 133
    .line 134
    move-result v6

    .line 135
    invoke-virtual {p0}, Lt/e;->W()I

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    int-to-float v9, v9

    .line 140
    mul-float/2addr v6, v9

    .line 141
    add-float/2addr v6, v8

    .line 142
    float-to-int v6, v6

    .line 143
    invoke-virtual {v11, v6}, Lt/h;->x1(I)V

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_3
    move v6, v10

    .line 147
    goto :goto_4

    .line 148
    :cond_5
    instance-of v8, v11, Lt/a;

    .line 149
    .line 150
    if-eqz v8, :cond_6

    .line 151
    .line 152
    check-cast v11, Lt/a;

    .line 153
    .line 154
    invoke-virtual {v11}, Lt/a;->y1()I

    .line 155
    .line 156
    .line 157
    move-result v8

    .line 158
    if-nez v8, :cond_6

    .line 159
    .line 160
    move v7, v10

    .line 161
    :cond_6
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_7
    if-eqz v6, :cond_9

    .line 165
    .line 166
    move v0, v2

    .line 167
    :goto_5
    if-ge v0, v4, :cond_9

    .line 168
    .line 169
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    check-cast v6, Lt/e;

    .line 174
    .line 175
    instance-of v11, v6, Lt/h;

    .line 176
    .line 177
    if-eqz v11, :cond_8

    .line 178
    .line 179
    check-cast v6, Lt/h;

    .line 180
    .line 181
    invoke-virtual {v6}, Lt/h;->t1()I

    .line 182
    .line 183
    .line 184
    move-result v11

    .line 185
    if-ne v11, v10, :cond_8

    .line 186
    .line 187
    invoke-static {v2, v6, p1, v5}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 188
    .line 189
    .line 190
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_9
    invoke-static {v2, p0, p1, v5}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 194
    .line 195
    .line 196
    if-eqz v7, :cond_b

    .line 197
    .line 198
    move v0, v2

    .line 199
    :goto_6
    if-ge v0, v4, :cond_b

    .line 200
    .line 201
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    check-cast v6, Lt/e;

    .line 206
    .line 207
    instance-of v7, v6, Lt/a;

    .line 208
    .line 209
    if-eqz v7, :cond_a

    .line 210
    .line 211
    check-cast v6, Lt/a;

    .line 212
    .line 213
    invoke-virtual {v6}, Lt/a;->y1()I

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    if-nez v7, :cond_a

    .line 218
    .line 219
    invoke-static {v2, v6, p1, v2, v5}, Lu/h;->c(ILt/a;Lu/b$b;IZ)V

    .line 220
    .line 221
    .line 222
    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 223
    .line 224
    goto :goto_6

    .line 225
    :cond_b
    sget-object v0, Lt/e$b;->g:Lt/e$b;

    .line 226
    .line 227
    if-ne v1, v0, :cond_c

    .line 228
    .line 229
    invoke-virtual {p0}, Lt/e;->x()I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    invoke-virtual {p0, v2, v0}, Lt/e;->J0(II)V

    .line 234
    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_c
    invoke-virtual {p0, v2}, Lt/e;->I0(I)V

    .line 238
    .line 239
    .line 240
    :goto_7
    move v0, v2

    .line 241
    move v1, v0

    .line 242
    move v6, v1

    .line 243
    :goto_8
    if-ge v0, v4, :cond_12

    .line 244
    .line 245
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v7

    .line 249
    check-cast v7, Lt/e;

    .line 250
    .line 251
    instance-of v11, v7, Lt/h;

    .line 252
    .line 253
    if-eqz v11, :cond_10

    .line 254
    .line 255
    check-cast v7, Lt/h;

    .line 256
    .line 257
    invoke-virtual {v7}, Lt/h;->t1()I

    .line 258
    .line 259
    .line 260
    move-result v11

    .line 261
    if-nez v11, :cond_11

    .line 262
    .line 263
    invoke-virtual {v7}, Lt/h;->u1()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eq v1, v9, :cond_d

    .line 268
    .line 269
    invoke-virtual {v7}, Lt/h;->u1()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    invoke-virtual {v7, v1}, Lt/h;->x1(I)V

    .line 274
    .line 275
    .line 276
    goto :goto_9

    .line 277
    :cond_d
    invoke-virtual {v7}, Lt/h;->v1()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-eq v1, v9, :cond_e

    .line 282
    .line 283
    invoke-virtual {p0}, Lt/e;->o0()Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-eqz v1, :cond_e

    .line 288
    .line 289
    invoke-virtual {p0}, Lt/e;->x()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    invoke-virtual {v7}, Lt/h;->v1()I

    .line 294
    .line 295
    .line 296
    move-result v11

    .line 297
    sub-int/2addr v1, v11

    .line 298
    invoke-virtual {v7, v1}, Lt/h;->x1(I)V

    .line 299
    .line 300
    .line 301
    goto :goto_9

    .line 302
    :cond_e
    invoke-virtual {p0}, Lt/e;->o0()Z

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    if-eqz v1, :cond_f

    .line 307
    .line 308
    invoke-virtual {v7}, Lt/h;->w1()F

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    invoke-virtual {p0}, Lt/e;->x()I

    .line 313
    .line 314
    .line 315
    move-result v11

    .line 316
    int-to-float v11, v11

    .line 317
    mul-float/2addr v1, v11

    .line 318
    add-float/2addr v1, v8

    .line 319
    float-to-int v1, v1

    .line 320
    invoke-virtual {v7, v1}, Lt/h;->x1(I)V

    .line 321
    .line 322
    .line 323
    :cond_f
    :goto_9
    move v1, v10

    .line 324
    goto :goto_a

    .line 325
    :cond_10
    instance-of v11, v7, Lt/a;

    .line 326
    .line 327
    if-eqz v11, :cond_11

    .line 328
    .line 329
    check-cast v7, Lt/a;

    .line 330
    .line 331
    invoke-virtual {v7}, Lt/a;->y1()I

    .line 332
    .line 333
    .line 334
    move-result v7

    .line 335
    if-ne v7, v10, :cond_11

    .line 336
    .line 337
    move v6, v10

    .line 338
    :cond_11
    :goto_a
    add-int/lit8 v0, v0, 0x1

    .line 339
    .line 340
    goto :goto_8

    .line 341
    :cond_12
    if-eqz v1, :cond_14

    .line 342
    .line 343
    move v0, v2

    .line 344
    :goto_b
    if-ge v0, v4, :cond_14

    .line 345
    .line 346
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    check-cast v1, Lt/e;

    .line 351
    .line 352
    instance-of v7, v1, Lt/h;

    .line 353
    .line 354
    if-eqz v7, :cond_13

    .line 355
    .line 356
    check-cast v1, Lt/h;

    .line 357
    .line 358
    invoke-virtual {v1}, Lt/h;->t1()I

    .line 359
    .line 360
    .line 361
    move-result v7

    .line 362
    if-nez v7, :cond_13

    .line 363
    .line 364
    invoke-static {v10, v1, p1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 365
    .line 366
    .line 367
    :cond_13
    add-int/lit8 v0, v0, 0x1

    .line 368
    .line 369
    goto :goto_b

    .line 370
    :cond_14
    invoke-static {v2, p0, p1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 371
    .line 372
    .line 373
    if-eqz v6, :cond_16

    .line 374
    .line 375
    move p0, v2

    .line 376
    :goto_c
    if-ge p0, v4, :cond_16

    .line 377
    .line 378
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    check-cast v0, Lt/e;

    .line 383
    .line 384
    instance-of v1, v0, Lt/a;

    .line 385
    .line 386
    if-eqz v1, :cond_15

    .line 387
    .line 388
    check-cast v0, Lt/a;

    .line 389
    .line 390
    invoke-virtual {v0}, Lt/a;->y1()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    if-ne v1, v10, :cond_15

    .line 395
    .line 396
    invoke-static {v2, v0, p1, v10, v5}, Lu/h;->c(ILt/a;Lu/b$b;IZ)V

    .line 397
    .line 398
    .line 399
    :cond_15
    add-int/lit8 p0, p0, 0x1

    .line 400
    .line 401
    goto :goto_c

    .line 402
    :cond_16
    move p0, v2

    .line 403
    :goto_d
    if-ge p0, v4, :cond_1a

    .line 404
    .line 405
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    check-cast v0, Lt/e;

    .line 410
    .line 411
    invoke-virtual {v0}, Lt/e;->m0()Z

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    if-eqz v1, :cond_19

    .line 416
    .line 417
    invoke-static {v2, v0}, Lu/h;->a(ILt/e;)Z

    .line 418
    .line 419
    .line 420
    move-result v1

    .line 421
    if-eqz v1, :cond_19

    .line 422
    .line 423
    sget-object v1, Lu/h;->a:Lu/b$a;

    .line 424
    .line 425
    sget v6, Lu/b$a;->k:I

    .line 426
    .line 427
    invoke-static {v2, v0, p1, v1, v6}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 428
    .line 429
    .line 430
    instance-of v1, v0, Lt/h;

    .line 431
    .line 432
    if-eqz v1, :cond_18

    .line 433
    .line 434
    move-object v1, v0

    .line 435
    check-cast v1, Lt/h;

    .line 436
    .line 437
    invoke-virtual {v1}, Lt/h;->t1()I

    .line 438
    .line 439
    .line 440
    move-result v1

    .line 441
    if-nez v1, :cond_17

    .line 442
    .line 443
    invoke-static {v2, v0, p1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 444
    .line 445
    .line 446
    goto :goto_e

    .line 447
    :cond_17
    invoke-static {v2, v0, p1, v5}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 448
    .line 449
    .line 450
    goto :goto_e

    .line 451
    :cond_18
    invoke-static {v2, v0, p1, v5}, Lu/h;->b(ILt/e;Lu/b$b;Z)V

    .line 452
    .line 453
    .line 454
    invoke-static {v2, v0, p1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 455
    .line 456
    .line 457
    :cond_19
    :goto_e
    add-int/lit8 p0, p0, 0x1

    .line 458
    .line 459
    goto :goto_d

    .line 460
    :cond_1a
    return-void
.end method

.method private static i(ILt/e;Lu/b$b;)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v0}, Lt/e;->p0()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget v2, Lu/h;->c:I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    add-int/2addr v2, v3

    .line 16
    sput v2, Lu/h;->c:I

    .line 17
    .line 18
    instance-of v2, v0, Lt/f;

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Lt/e;->m0()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    add-int/lit8 v2, p0, 0x1

    .line 29
    .line 30
    invoke-static {v2, v0}, Lu/h;->a(ILt/e;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_1

    .line 35
    .line 36
    new-instance v4, Lu/b$a;

    .line 37
    .line 38
    invoke-direct {v4}, Lu/b$a;-><init>()V

    .line 39
    .line 40
    .line 41
    sget v5, Lu/b$a;->k:I

    .line 42
    .line 43
    invoke-static {v2, v0, v1, v4, v5}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 44
    .line 45
    .line 46
    :cond_1
    sget-object v2, Lt/d$a;->i:Lt/d$a;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    sget-object v4, Lt/d$a;->k:Lt/d$a;

    .line 53
    .line 54
    invoke-virtual {v0, v4}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v2}, Lt/d;->e()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-virtual {v4}, Lt/d;->e()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    invoke-virtual {v2}, Lt/d;->d()Ljava/util/HashSet;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    const/4 v8, 0x0

    .line 71
    const/16 v9, 0x8

    .line 72
    .line 73
    const/4 v10, 0x0

    .line 74
    if-eqz v7, :cond_d

    .line 75
    .line 76
    invoke-virtual {v2}, Lt/d;->n()Z

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    if-eqz v7, :cond_d

    .line 81
    .line 82
    invoke-virtual {v2}, Lt/d;->d()Ljava/util/HashSet;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v7

    .line 94
    if-eqz v7, :cond_d

    .line 95
    .line 96
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    check-cast v7, Lt/d;

    .line 101
    .line 102
    iget-object v11, v7, Lt/d;->d:Lt/e;

    .line 103
    .line 104
    add-int/lit8 v12, p0, 0x1

    .line 105
    .line 106
    invoke-static {v12, v11}, Lu/h;->a(ILt/e;)Z

    .line 107
    .line 108
    .line 109
    move-result v13

    .line 110
    invoke-virtual {v11}, Lt/e;->m0()Z

    .line 111
    .line 112
    .line 113
    move-result v14

    .line 114
    if-eqz v14, :cond_2

    .line 115
    .line 116
    if-eqz v13, :cond_2

    .line 117
    .line 118
    new-instance v14, Lu/b$a;

    .line 119
    .line 120
    invoke-direct {v14}, Lu/b$a;-><init>()V

    .line 121
    .line 122
    .line 123
    sget v15, Lu/b$a;->k:I

    .line 124
    .line 125
    invoke-static {v12, v11, v1, v14, v15}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 126
    .line 127
    .line 128
    :cond_2
    iget-object v14, v11, Lt/e;->P:Lt/d;

    .line 129
    .line 130
    if-ne v7, v14, :cond_3

    .line 131
    .line 132
    iget-object v14, v11, Lt/e;->R:Lt/d;

    .line 133
    .line 134
    iget-object v14, v14, Lt/d;->f:Lt/d;

    .line 135
    .line 136
    if-eqz v14, :cond_3

    .line 137
    .line 138
    invoke-virtual {v14}, Lt/d;->n()Z

    .line 139
    .line 140
    .line 141
    move-result v14

    .line 142
    if-nez v14, :cond_4

    .line 143
    .line 144
    :cond_3
    iget-object v14, v11, Lt/e;->R:Lt/d;

    .line 145
    .line 146
    if-ne v7, v14, :cond_5

    .line 147
    .line 148
    iget-object v14, v11, Lt/e;->P:Lt/d;

    .line 149
    .line 150
    iget-object v14, v14, Lt/d;->f:Lt/d;

    .line 151
    .line 152
    if-eqz v14, :cond_5

    .line 153
    .line 154
    invoke-virtual {v14}, Lt/d;->n()Z

    .line 155
    .line 156
    .line 157
    move-result v14

    .line 158
    if-eqz v14, :cond_5

    .line 159
    .line 160
    :cond_4
    move v14, v3

    .line 161
    goto :goto_1

    .line 162
    :cond_5
    move v14, v10

    .line 163
    :goto_1
    invoke-virtual {v11}, Lt/e;->T()Lt/e$b;

    .line 164
    .line 165
    .line 166
    move-result-object v15

    .line 167
    move/from16 v16, v3

    .line 168
    .line 169
    sget-object v3, Lt/e$b;->i:Lt/e$b;

    .line 170
    .line 171
    if-ne v15, v3, :cond_8

    .line 172
    .line 173
    if-eqz v13, :cond_6

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_6
    invoke-virtual {v11}, Lt/e;->T()Lt/e$b;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    if-ne v7, v3, :cond_9

    .line 181
    .line 182
    iget v3, v11, Lt/e;->D:I

    .line 183
    .line 184
    if-ltz v3, :cond_9

    .line 185
    .line 186
    iget v3, v11, Lt/e;->C:I

    .line 187
    .line 188
    if-ltz v3, :cond_9

    .line 189
    .line 190
    invoke-virtual {v11}, Lt/e;->V()I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-eq v3, v9, :cond_7

    .line 195
    .line 196
    iget v3, v11, Lt/e;->x:I

    .line 197
    .line 198
    if-nez v3, :cond_9

    .line 199
    .line 200
    invoke-virtual {v11}, Lt/e;->v()F

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    cmpl-float v3, v3, v8

    .line 205
    .line 206
    if-nez v3, :cond_9

    .line 207
    .line 208
    :cond_7
    invoke-virtual {v11}, Lt/e;->k0()Z

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-nez v3, :cond_9

    .line 213
    .line 214
    invoke-virtual {v11}, Lt/e;->l0()Z

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    if-nez v3, :cond_9

    .line 219
    .line 220
    if-eqz v14, :cond_9

    .line 221
    .line 222
    invoke-virtual {v11}, Lt/e;->k0()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-nez v3, :cond_9

    .line 227
    .line 228
    invoke-static {v12, v0, v1, v11}, Lu/h;->g(ILt/e;Lu/b$b;Lt/e;)V

    .line 229
    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_8
    :goto_2
    invoke-virtual {v11}, Lt/e;->m0()Z

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    if-eqz v3, :cond_a

    .line 237
    .line 238
    :cond_9
    :goto_3
    move/from16 v3, v16

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :cond_a
    iget-object v3, v11, Lt/e;->P:Lt/d;

    .line 243
    .line 244
    if-ne v7, v3, :cond_b

    .line 245
    .line 246
    iget-object v13, v11, Lt/e;->R:Lt/d;

    .line 247
    .line 248
    iget-object v13, v13, Lt/d;->f:Lt/d;

    .line 249
    .line 250
    if-nez v13, :cond_b

    .line 251
    .line 252
    invoke-virtual {v3}, Lt/d;->f()I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    add-int/2addr v3, v5

    .line 257
    invoke-virtual {v11}, Lt/e;->x()I

    .line 258
    .line 259
    .line 260
    move-result v7

    .line 261
    add-int/2addr v7, v3

    .line 262
    invoke-virtual {v11, v3, v7}, Lt/e;->J0(II)V

    .line 263
    .line 264
    .line 265
    invoke-static {v12, v11, v1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 266
    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_b
    iget-object v13, v11, Lt/e;->R:Lt/d;

    .line 270
    .line 271
    if-ne v7, v13, :cond_c

    .line 272
    .line 273
    iget-object v3, v3, Lt/d;->f:Lt/d;

    .line 274
    .line 275
    if-nez v3, :cond_c

    .line 276
    .line 277
    invoke-virtual {v13}, Lt/d;->f()I

    .line 278
    .line 279
    .line 280
    move-result v3

    .line 281
    sub-int v3, v5, v3

    .line 282
    .line 283
    invoke-virtual {v11}, Lt/e;->x()I

    .line 284
    .line 285
    .line 286
    move-result v7

    .line 287
    sub-int v7, v3, v7

    .line 288
    .line 289
    invoke-virtual {v11, v7, v3}, Lt/e;->J0(II)V

    .line 290
    .line 291
    .line 292
    invoke-static {v12, v11, v1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 293
    .line 294
    .line 295
    goto :goto_3

    .line 296
    :cond_c
    if-eqz v14, :cond_9

    .line 297
    .line 298
    invoke-virtual {v11}, Lt/e;->k0()Z

    .line 299
    .line 300
    .line 301
    move-result v3

    .line 302
    if-nez v3, :cond_9

    .line 303
    .line 304
    invoke-static {v12, v1, v11}, Lu/h;->f(ILu/b$b;Lt/e;)V

    .line 305
    .line 306
    .line 307
    goto :goto_3

    .line 308
    :cond_d
    move/from16 v16, v3

    .line 309
    .line 310
    instance-of v2, v0, Lt/h;

    .line 311
    .line 312
    if-eqz v2, :cond_e

    .line 313
    .line 314
    return-void

    .line 315
    :cond_e
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    if-eqz v2, :cond_1a

    .line 320
    .line 321
    invoke-virtual {v4}, Lt/d;->n()Z

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    if-eqz v2, :cond_1a

    .line 326
    .line 327
    invoke-virtual {v4}, Lt/d;->d()Ljava/util/HashSet;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    :cond_f
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 336
    .line 337
    .line 338
    move-result v3

    .line 339
    if-eqz v3, :cond_1a

    .line 340
    .line 341
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v3

    .line 345
    check-cast v3, Lt/d;

    .line 346
    .line 347
    iget-object v4, v3, Lt/d;->d:Lt/e;

    .line 348
    .line 349
    add-int/lit8 v5, p0, 0x1

    .line 350
    .line 351
    invoke-static {v5, v4}, Lu/h;->a(ILt/e;)Z

    .line 352
    .line 353
    .line 354
    move-result v7

    .line 355
    invoke-virtual {v4}, Lt/e;->m0()Z

    .line 356
    .line 357
    .line 358
    move-result v11

    .line 359
    if-eqz v11, :cond_10

    .line 360
    .line 361
    if-eqz v7, :cond_10

    .line 362
    .line 363
    new-instance v11, Lu/b$a;

    .line 364
    .line 365
    invoke-direct {v11}, Lu/b$a;-><init>()V

    .line 366
    .line 367
    .line 368
    sget v12, Lu/b$a;->k:I

    .line 369
    .line 370
    invoke-static {v5, v4, v1, v11, v12}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 371
    .line 372
    .line 373
    :cond_10
    iget-object v11, v4, Lt/e;->P:Lt/d;

    .line 374
    .line 375
    if-ne v3, v11, :cond_11

    .line 376
    .line 377
    iget-object v11, v4, Lt/e;->R:Lt/d;

    .line 378
    .line 379
    iget-object v11, v11, Lt/d;->f:Lt/d;

    .line 380
    .line 381
    if-eqz v11, :cond_11

    .line 382
    .line 383
    invoke-virtual {v11}, Lt/d;->n()Z

    .line 384
    .line 385
    .line 386
    move-result v11

    .line 387
    if-nez v11, :cond_12

    .line 388
    .line 389
    :cond_11
    iget-object v11, v4, Lt/e;->R:Lt/d;

    .line 390
    .line 391
    if-ne v3, v11, :cond_13

    .line 392
    .line 393
    iget-object v11, v4, Lt/e;->P:Lt/d;

    .line 394
    .line 395
    iget-object v11, v11, Lt/d;->f:Lt/d;

    .line 396
    .line 397
    if-eqz v11, :cond_13

    .line 398
    .line 399
    invoke-virtual {v11}, Lt/d;->n()Z

    .line 400
    .line 401
    .line 402
    move-result v11

    .line 403
    if-eqz v11, :cond_13

    .line 404
    .line 405
    :cond_12
    move/from16 v11, v16

    .line 406
    .line 407
    goto :goto_5

    .line 408
    :cond_13
    move v11, v10

    .line 409
    :goto_5
    invoke-virtual {v4}, Lt/e;->T()Lt/e$b;

    .line 410
    .line 411
    .line 412
    move-result-object v12

    .line 413
    sget-object v13, Lt/e$b;->i:Lt/e$b;

    .line 414
    .line 415
    if-ne v12, v13, :cond_16

    .line 416
    .line 417
    if-eqz v7, :cond_14

    .line 418
    .line 419
    goto :goto_6

    .line 420
    :cond_14
    invoke-virtual {v4}, Lt/e;->T()Lt/e$b;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    if-ne v3, v13, :cond_f

    .line 425
    .line 426
    iget v3, v4, Lt/e;->D:I

    .line 427
    .line 428
    if-ltz v3, :cond_f

    .line 429
    .line 430
    iget v3, v4, Lt/e;->C:I

    .line 431
    .line 432
    if-ltz v3, :cond_f

    .line 433
    .line 434
    invoke-virtual {v4}, Lt/e;->V()I

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    if-eq v3, v9, :cond_15

    .line 439
    .line 440
    iget v3, v4, Lt/e;->x:I

    .line 441
    .line 442
    if-nez v3, :cond_f

    .line 443
    .line 444
    invoke-virtual {v4}, Lt/e;->v()F

    .line 445
    .line 446
    .line 447
    move-result v3

    .line 448
    cmpl-float v3, v3, v8

    .line 449
    .line 450
    if-nez v3, :cond_f

    .line 451
    .line 452
    :cond_15
    invoke-virtual {v4}, Lt/e;->k0()Z

    .line 453
    .line 454
    .line 455
    move-result v3

    .line 456
    if-nez v3, :cond_f

    .line 457
    .line 458
    invoke-virtual {v4}, Lt/e;->l0()Z

    .line 459
    .line 460
    .line 461
    move-result v3

    .line 462
    if-nez v3, :cond_f

    .line 463
    .line 464
    if-eqz v11, :cond_f

    .line 465
    .line 466
    invoke-virtual {v4}, Lt/e;->k0()Z

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    if-nez v3, :cond_f

    .line 471
    .line 472
    invoke-static {v5, v0, v1, v4}, Lu/h;->g(ILt/e;Lu/b$b;Lt/e;)V

    .line 473
    .line 474
    .line 475
    goto/16 :goto_4

    .line 476
    .line 477
    :cond_16
    :goto_6
    invoke-virtual {v4}, Lt/e;->m0()Z

    .line 478
    .line 479
    .line 480
    move-result v7

    .line 481
    if-eqz v7, :cond_17

    .line 482
    .line 483
    goto/16 :goto_4

    .line 484
    .line 485
    :cond_17
    iget-object v7, v4, Lt/e;->P:Lt/d;

    .line 486
    .line 487
    if-ne v3, v7, :cond_18

    .line 488
    .line 489
    iget-object v12, v4, Lt/e;->R:Lt/d;

    .line 490
    .line 491
    iget-object v12, v12, Lt/d;->f:Lt/d;

    .line 492
    .line 493
    if-nez v12, :cond_18

    .line 494
    .line 495
    invoke-virtual {v7}, Lt/d;->f()I

    .line 496
    .line 497
    .line 498
    move-result v3

    .line 499
    add-int/2addr v3, v6

    .line 500
    invoke-virtual {v4}, Lt/e;->x()I

    .line 501
    .line 502
    .line 503
    move-result v7

    .line 504
    add-int/2addr v7, v3

    .line 505
    invoke-virtual {v4, v3, v7}, Lt/e;->J0(II)V

    .line 506
    .line 507
    .line 508
    invoke-static {v5, v4, v1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 509
    .line 510
    .line 511
    goto/16 :goto_4

    .line 512
    .line 513
    :cond_18
    iget-object v12, v4, Lt/e;->R:Lt/d;

    .line 514
    .line 515
    if-ne v3, v12, :cond_19

    .line 516
    .line 517
    iget-object v3, v7, Lt/d;->f:Lt/d;

    .line 518
    .line 519
    if-nez v3, :cond_19

    .line 520
    .line 521
    invoke-virtual {v12}, Lt/d;->f()I

    .line 522
    .line 523
    .line 524
    move-result v3

    .line 525
    sub-int v3, v6, v3

    .line 526
    .line 527
    invoke-virtual {v4}, Lt/e;->x()I

    .line 528
    .line 529
    .line 530
    move-result v7

    .line 531
    sub-int v7, v3, v7

    .line 532
    .line 533
    invoke-virtual {v4, v7, v3}, Lt/e;->J0(II)V

    .line 534
    .line 535
    .line 536
    invoke-static {v5, v4, v1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 537
    .line 538
    .line 539
    goto/16 :goto_4

    .line 540
    .line 541
    :cond_19
    if-eqz v11, :cond_f

    .line 542
    .line 543
    invoke-virtual {v4}, Lt/e;->k0()Z

    .line 544
    .line 545
    .line 546
    move-result v3

    .line 547
    if-nez v3, :cond_f

    .line 548
    .line 549
    invoke-static {v5, v1, v4}, Lu/h;->f(ILu/b$b;Lt/e;)V

    .line 550
    .line 551
    .line 552
    goto/16 :goto_4

    .line 553
    .line 554
    :cond_1a
    sget-object v2, Lt/d$a;->l:Lt/d$a;

    .line 555
    .line 556
    invoke-virtual {v0, v2}, Lt/e;->o(Lt/d$a;)Lt/d;

    .line 557
    .line 558
    .line 559
    move-result-object v2

    .line 560
    invoke-virtual {v2}, Lt/d;->d()Ljava/util/HashSet;

    .line 561
    .line 562
    .line 563
    move-result-object v3

    .line 564
    if-eqz v3, :cond_1f

    .line 565
    .line 566
    invoke-virtual {v2}, Lt/d;->n()Z

    .line 567
    .line 568
    .line 569
    move-result v3

    .line 570
    if-eqz v3, :cond_1f

    .line 571
    .line 572
    invoke-virtual {v2}, Lt/d;->e()I

    .line 573
    .line 574
    .line 575
    move-result v3

    .line 576
    invoke-virtual {v2}, Lt/d;->d()Ljava/util/HashSet;

    .line 577
    .line 578
    .line 579
    move-result-object v2

    .line 580
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 581
    .line 582
    .line 583
    move-result-object v2

    .line 584
    :cond_1b
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 585
    .line 586
    .line 587
    move-result v4

    .line 588
    if-eqz v4, :cond_1f

    .line 589
    .line 590
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 591
    .line 592
    .line 593
    move-result-object v4

    .line 594
    check-cast v4, Lt/d;

    .line 595
    .line 596
    iget-object v5, v4, Lt/d;->d:Lt/e;

    .line 597
    .line 598
    add-int/lit8 v6, p0, 0x1

    .line 599
    .line 600
    invoke-static {v6, v5}, Lu/h;->a(ILt/e;)Z

    .line 601
    .line 602
    .line 603
    move-result v7

    .line 604
    invoke-virtual {v5}, Lt/e;->m0()Z

    .line 605
    .line 606
    .line 607
    move-result v8

    .line 608
    if-eqz v8, :cond_1c

    .line 609
    .line 610
    if-eqz v7, :cond_1c

    .line 611
    .line 612
    new-instance v8, Lu/b$a;

    .line 613
    .line 614
    invoke-direct {v8}, Lu/b$a;-><init>()V

    .line 615
    .line 616
    .line 617
    sget v9, Lu/b$a;->k:I

    .line 618
    .line 619
    invoke-static {v6, v5, v1, v8, v9}, Lt/f;->U1(ILt/e;Lu/b$b;Lu/b$a;I)Z

    .line 620
    .line 621
    .line 622
    :cond_1c
    invoke-virtual {v5}, Lt/e;->T()Lt/e$b;

    .line 623
    .line 624
    .line 625
    move-result-object v8

    .line 626
    sget-object v9, Lt/e$b;->i:Lt/e$b;

    .line 627
    .line 628
    if-ne v8, v9, :cond_1d

    .line 629
    .line 630
    if-eqz v7, :cond_1b

    .line 631
    .line 632
    :cond_1d
    invoke-virtual {v5}, Lt/e;->m0()Z

    .line 633
    .line 634
    .line 635
    move-result v7

    .line 636
    if-eqz v7, :cond_1e

    .line 637
    .line 638
    goto :goto_7

    .line 639
    :cond_1e
    iget-object v7, v5, Lt/e;->S:Lt/d;

    .line 640
    .line 641
    if-ne v4, v7, :cond_1b

    .line 642
    .line 643
    invoke-virtual {v4}, Lt/d;->f()I

    .line 644
    .line 645
    .line 646
    move-result v4

    .line 647
    add-int/2addr v4, v3

    .line 648
    invoke-virtual {v5, v4}, Lt/e;->F0(I)V

    .line 649
    .line 650
    .line 651
    invoke-static {v6, v5, v1}, Lu/h;->i(ILt/e;Lu/b$b;)V

    .line 652
    .line 653
    .line 654
    goto :goto_7

    .line 655
    :cond_1f
    invoke-virtual {v0}, Lt/e;->r0()V

    .line 656
    .line 657
    .line 658
    return-void
.end method
