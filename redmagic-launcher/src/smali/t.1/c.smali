.class public Lt/c;
.super Ljava/lang/Object;
.source "ChainHead.java"


# instance fields
.field protected a:Lt/e;

.field protected b:Lt/e;

.field protected c:Lt/e;

.field protected d:Lt/e;

.field protected e:Lt/e;

.field protected f:Lt/e;

.field protected g:Lt/e;

.field protected h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lt/e;",
            ">;"
        }
    .end annotation
.end field

.field protected i:I

.field protected j:I

.field protected k:F

.field l:I

.field m:I

.field n:I

.field o:Z

.field private p:I

.field private q:Z

.field protected r:Z

.field protected s:Z

.field protected t:Z

.field protected u:Z

.field private v:Z


# direct methods
.method public constructor <init>(Lt/e;IZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lt/c;->k:F

    .line 6
    .line 7
    iput-object p1, p0, Lt/c;->a:Lt/e;

    .line 8
    .line 9
    iput p2, p0, Lt/c;->p:I

    .line 10
    .line 11
    iput-boolean p3, p0, Lt/c;->q:Z

    .line 12
    .line 13
    return-void
.end method

.method private b()V
    .locals 12

    .line 1
    iget v0, p0, Lt/c;->p:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    mul-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Lt/c;->a:Lt/e;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    iput-boolean v3, p0, Lt/c;->o:Z

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    move-object v5, v2

    .line 12
    move v6, v4

    .line 13
    :goto_0
    if-nez v6, :cond_15

    .line 14
    .line 15
    iget v7, p0, Lt/c;->i:I

    .line 16
    .line 17
    add-int/2addr v7, v3

    .line 18
    iput v7, p0, Lt/c;->i:I

    .line 19
    .line 20
    iget-object v7, v2, Lt/e;->F0:[Lt/e;

    .line 21
    .line 22
    iget v8, p0, Lt/c;->p:I

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    aput-object v9, v7, v8

    .line 26
    .line 27
    iget-object v7, v2, Lt/e;->E0:[Lt/e;

    .line 28
    .line 29
    aput-object v9, v7, v8

    .line 30
    .line 31
    invoke-virtual {v2}, Lt/e;->V()I

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    const/16 v8, 0x8

    .line 36
    .line 37
    if-eq v7, v8, :cond_10

    .line 38
    .line 39
    iget v7, p0, Lt/c;->l:I

    .line 40
    .line 41
    add-int/2addr v7, v3

    .line 42
    iput v7, p0, Lt/c;->l:I

    .line 43
    .line 44
    iget v7, p0, Lt/c;->p:I

    .line 45
    .line 46
    invoke-virtual {v2, v7}, Lt/e;->u(I)Lt/e$b;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    sget-object v8, Lt/e$b;->i:Lt/e$b;

    .line 51
    .line 52
    if-eq v7, v8, :cond_0

    .line 53
    .line 54
    iget v7, p0, Lt/c;->m:I

    .line 55
    .line 56
    iget v10, p0, Lt/c;->p:I

    .line 57
    .line 58
    invoke-virtual {v2, v10}, Lt/e;->E(I)I

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    add-int/2addr v7, v10

    .line 63
    iput v7, p0, Lt/c;->m:I

    .line 64
    .line 65
    :cond_0
    iget v7, p0, Lt/c;->m:I

    .line 66
    .line 67
    iget-object v10, v2, Lt/e;->W:[Lt/d;

    .line 68
    .line 69
    aget-object v10, v10, v0

    .line 70
    .line 71
    invoke-virtual {v10}, Lt/d;->f()I

    .line 72
    .line 73
    .line 74
    move-result v10

    .line 75
    add-int/2addr v7, v10

    .line 76
    iput v7, p0, Lt/c;->m:I

    .line 77
    .line 78
    iget-object v10, v2, Lt/e;->W:[Lt/d;

    .line 79
    .line 80
    add-int/lit8 v11, v0, 0x1

    .line 81
    .line 82
    aget-object v10, v10, v11

    .line 83
    .line 84
    invoke-virtual {v10}, Lt/d;->f()I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    add-int/2addr v7, v10

    .line 89
    iput v7, p0, Lt/c;->m:I

    .line 90
    .line 91
    iget v7, p0, Lt/c;->n:I

    .line 92
    .line 93
    iget-object v10, v2, Lt/e;->W:[Lt/d;

    .line 94
    .line 95
    aget-object v10, v10, v0

    .line 96
    .line 97
    invoke-virtual {v10}, Lt/d;->f()I

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    add-int/2addr v7, v10

    .line 102
    iput v7, p0, Lt/c;->n:I

    .line 103
    .line 104
    iget-object v10, v2, Lt/e;->W:[Lt/d;

    .line 105
    .line 106
    aget-object v10, v10, v11

    .line 107
    .line 108
    invoke-virtual {v10}, Lt/d;->f()I

    .line 109
    .line 110
    .line 111
    move-result v10

    .line 112
    add-int/2addr v7, v10

    .line 113
    iput v7, p0, Lt/c;->n:I

    .line 114
    .line 115
    iget-object v7, p0, Lt/c;->b:Lt/e;

    .line 116
    .line 117
    if-nez v7, :cond_1

    .line 118
    .line 119
    iput-object v2, p0, Lt/c;->b:Lt/e;

    .line 120
    .line 121
    :cond_1
    iput-object v2, p0, Lt/c;->d:Lt/e;

    .line 122
    .line 123
    iget-object v7, v2, Lt/e;->Z:[Lt/e$b;

    .line 124
    .line 125
    iget v10, p0, Lt/c;->p:I

    .line 126
    .line 127
    aget-object v7, v7, v10

    .line 128
    .line 129
    if-ne v7, v8, :cond_10

    .line 130
    .line 131
    iget-object v7, v2, Lt/e;->y:[I

    .line 132
    .line 133
    aget v7, v7, v10

    .line 134
    .line 135
    const/4 v8, 0x0

    .line 136
    if-eqz v7, :cond_2

    .line 137
    .line 138
    const/4 v11, 0x3

    .line 139
    if-eq v7, v11, :cond_2

    .line 140
    .line 141
    if-ne v7, v1, :cond_9

    .line 142
    .line 143
    :cond_2
    iget v7, p0, Lt/c;->j:I

    .line 144
    .line 145
    add-int/2addr v7, v3

    .line 146
    iput v7, p0, Lt/c;->j:I

    .line 147
    .line 148
    iget-object v7, v2, Lt/e;->D0:[F

    .line 149
    .line 150
    aget v7, v7, v10

    .line 151
    .line 152
    cmpl-float v11, v7, v8

    .line 153
    .line 154
    if-lez v11, :cond_3

    .line 155
    .line 156
    iget v11, p0, Lt/c;->k:F

    .line 157
    .line 158
    add-float/2addr v11, v7

    .line 159
    iput v11, p0, Lt/c;->k:F

    .line 160
    .line 161
    :cond_3
    invoke-static {v2, v10}, Lt/c;->c(Lt/e;I)Z

    .line 162
    .line 163
    .line 164
    move-result v10

    .line 165
    if-eqz v10, :cond_6

    .line 166
    .line 167
    cmpg-float v7, v7, v8

    .line 168
    .line 169
    if-gez v7, :cond_4

    .line 170
    .line 171
    iput-boolean v3, p0, Lt/c;->r:Z

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_4
    iput-boolean v3, p0, Lt/c;->s:Z

    .line 175
    .line 176
    :goto_1
    iget-object v7, p0, Lt/c;->h:Ljava/util/ArrayList;

    .line 177
    .line 178
    if-nez v7, :cond_5

    .line 179
    .line 180
    new-instance v7, Ljava/util/ArrayList;

    .line 181
    .line 182
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object v7, p0, Lt/c;->h:Ljava/util/ArrayList;

    .line 186
    .line 187
    :cond_5
    iget-object v7, p0, Lt/c;->h:Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    :cond_6
    iget-object v7, p0, Lt/c;->f:Lt/e;

    .line 193
    .line 194
    if-nez v7, :cond_7

    .line 195
    .line 196
    iput-object v2, p0, Lt/c;->f:Lt/e;

    .line 197
    .line 198
    :cond_7
    iget-object v7, p0, Lt/c;->g:Lt/e;

    .line 199
    .line 200
    if-eqz v7, :cond_8

    .line 201
    .line 202
    iget-object v7, v7, Lt/e;->E0:[Lt/e;

    .line 203
    .line 204
    iget v10, p0, Lt/c;->p:I

    .line 205
    .line 206
    aput-object v2, v7, v10

    .line 207
    .line 208
    :cond_8
    iput-object v2, p0, Lt/c;->g:Lt/e;

    .line 209
    .line 210
    :cond_9
    iget v7, p0, Lt/c;->p:I

    .line 211
    .line 212
    if-nez v7, :cond_c

    .line 213
    .line 214
    iget v7, v2, Lt/e;->w:I

    .line 215
    .line 216
    if-eqz v7, :cond_a

    .line 217
    .line 218
    iput-boolean v4, p0, Lt/c;->o:Z

    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_a
    iget v7, v2, Lt/e;->z:I

    .line 222
    .line 223
    if-nez v7, :cond_b

    .line 224
    .line 225
    iget v7, v2, Lt/e;->A:I

    .line 226
    .line 227
    if-eqz v7, :cond_f

    .line 228
    .line 229
    :cond_b
    iput-boolean v4, p0, Lt/c;->o:Z

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_c
    iget v7, v2, Lt/e;->x:I

    .line 233
    .line 234
    if-eqz v7, :cond_d

    .line 235
    .line 236
    iput-boolean v4, p0, Lt/c;->o:Z

    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_d
    iget v7, v2, Lt/e;->C:I

    .line 240
    .line 241
    if-nez v7, :cond_e

    .line 242
    .line 243
    iget v7, v2, Lt/e;->D:I

    .line 244
    .line 245
    if-eqz v7, :cond_f

    .line 246
    .line 247
    :cond_e
    iput-boolean v4, p0, Lt/c;->o:Z

    .line 248
    .line 249
    :cond_f
    :goto_2
    iget v7, v2, Lt/e;->d0:F

    .line 250
    .line 251
    cmpl-float v7, v7, v8

    .line 252
    .line 253
    if-eqz v7, :cond_10

    .line 254
    .line 255
    iput-boolean v4, p0, Lt/c;->o:Z

    .line 256
    .line 257
    iput-boolean v3, p0, Lt/c;->u:Z

    .line 258
    .line 259
    :cond_10
    if-eq v5, v2, :cond_11

    .line 260
    .line 261
    iget-object v5, v5, Lt/e;->F0:[Lt/e;

    .line 262
    .line 263
    iget v7, p0, Lt/c;->p:I

    .line 264
    .line 265
    aput-object v2, v5, v7

    .line 266
    .line 267
    :cond_11
    iget-object v5, v2, Lt/e;->W:[Lt/d;

    .line 268
    .line 269
    add-int/lit8 v7, v0, 0x1

    .line 270
    .line 271
    aget-object v5, v5, v7

    .line 272
    .line 273
    iget-object v5, v5, Lt/d;->f:Lt/d;

    .line 274
    .line 275
    if-eqz v5, :cond_13

    .line 276
    .line 277
    iget-object v5, v5, Lt/d;->d:Lt/e;

    .line 278
    .line 279
    iget-object v7, v5, Lt/e;->W:[Lt/d;

    .line 280
    .line 281
    aget-object v7, v7, v0

    .line 282
    .line 283
    iget-object v7, v7, Lt/d;->f:Lt/d;

    .line 284
    .line 285
    if-eqz v7, :cond_13

    .line 286
    .line 287
    iget-object v7, v7, Lt/d;->d:Lt/e;

    .line 288
    .line 289
    if-eq v7, v2, :cond_12

    .line 290
    .line 291
    goto :goto_3

    .line 292
    :cond_12
    move-object v9, v5

    .line 293
    :cond_13
    :goto_3
    if-eqz v9, :cond_14

    .line 294
    .line 295
    goto :goto_4

    .line 296
    :cond_14
    move-object v9, v2

    .line 297
    move v6, v3

    .line 298
    :goto_4
    move-object v5, v2

    .line 299
    move-object v2, v9

    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :cond_15
    iget-object v1, p0, Lt/c;->b:Lt/e;

    .line 303
    .line 304
    if-eqz v1, :cond_16

    .line 305
    .line 306
    iget v5, p0, Lt/c;->m:I

    .line 307
    .line 308
    iget-object v1, v1, Lt/e;->W:[Lt/d;

    .line 309
    .line 310
    aget-object v1, v1, v0

    .line 311
    .line 312
    invoke-virtual {v1}, Lt/d;->f()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    sub-int/2addr v5, v1

    .line 317
    iput v5, p0, Lt/c;->m:I

    .line 318
    .line 319
    :cond_16
    iget-object v1, p0, Lt/c;->d:Lt/e;

    .line 320
    .line 321
    if-eqz v1, :cond_17

    .line 322
    .line 323
    iget v5, p0, Lt/c;->m:I

    .line 324
    .line 325
    iget-object v1, v1, Lt/e;->W:[Lt/d;

    .line 326
    .line 327
    add-int/2addr v0, v3

    .line 328
    aget-object v0, v1, v0

    .line 329
    .line 330
    invoke-virtual {v0}, Lt/d;->f()I

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    sub-int/2addr v5, v0

    .line 335
    iput v5, p0, Lt/c;->m:I

    .line 336
    .line 337
    :cond_17
    iput-object v2, p0, Lt/c;->c:Lt/e;

    .line 338
    .line 339
    iget v0, p0, Lt/c;->p:I

    .line 340
    .line 341
    if-nez v0, :cond_18

    .line 342
    .line 343
    iget-boolean v0, p0, Lt/c;->q:Z

    .line 344
    .line 345
    if-eqz v0, :cond_18

    .line 346
    .line 347
    iput-object v2, p0, Lt/c;->e:Lt/e;

    .line 348
    .line 349
    goto :goto_5

    .line 350
    :cond_18
    iget-object v0, p0, Lt/c;->a:Lt/e;

    .line 351
    .line 352
    iput-object v0, p0, Lt/c;->e:Lt/e;

    .line 353
    .line 354
    :goto_5
    iget-boolean v0, p0, Lt/c;->s:Z

    .line 355
    .line 356
    if-eqz v0, :cond_19

    .line 357
    .line 358
    iget-boolean v0, p0, Lt/c;->r:Z

    .line 359
    .line 360
    if-eqz v0, :cond_19

    .line 361
    .line 362
    goto :goto_6

    .line 363
    :cond_19
    move v3, v4

    .line 364
    :goto_6
    iput-boolean v3, p0, Lt/c;->t:Z

    .line 365
    .line 366
    return-void
.end method

.method private static c(Lt/e;I)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lt/e;->V()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lt/e;->Z:[Lt/e$b;

    .line 10
    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    sget-object v1, Lt/e$b;->i:Lt/e$b;

    .line 14
    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lt/e;->y:[I

    .line 18
    .line 19
    aget p0, p0, p1

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x3

    .line 24
    if-ne p0, p1, :cond_1

    .line 25
    .line 26
    :cond_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lt/c;->v:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lt/c;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lt/c;->v:Z

    .line 10
    .line 11
    return-void
.end method
