.class public Lcom/android/launcher3/apppairs/a;
.super Landroid/graphics/drawable/Drawable;
.source "AppPairIconDrawable.java"


# static fields
.field private static final e:Landroid/graphics/RectF;

.field private static final f:[F


# instance fields
.field private final a:Landroid/graphics/Paint;

.field private final b:LW0/b;

.field private final c:Ls1/o;

.field private final d:Ls1/o;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/apppairs/a;->e:Landroid/graphics/RectF;

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    sput-object v0, Lcom/android/launcher3/apppairs/a;->f:[F

    .line 13
    .line 14
    return-void
.end method

.method constructor <init>(LW0/b;Ls1/o;Ls1/o;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/apppairs/a;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 13
    .line 14
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, LW0/b;->b()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Lcom/android/launcher3/apppairs/a;->c:Ls1/o;

    .line 27
    .line 28
    iput-object p3, p0, Lcom/android/launcher3/apppairs/a;->d:Ls1/o;

    .line 29
    .line 30
    return-void
.end method

.method private a(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V
    .locals 6

    .line 1
    sget-object v3, Lcom/android/launcher3/apppairs/a;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    sget-object v4, Lcom/android/launcher3/apppairs/a;->f:[F

    .line 4
    .line 5
    iget-object v5, p0, Lcom/android/launcher3/apppairs/a;->a:Landroid/graphics/Paint;

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    move-object v1, p2

    .line 9
    move-object v2, p3

    .line 10
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawDoubleRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/RectF;[FLandroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private b(Landroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 6
    .line 7
    invoke-virtual {v2}, LW0/b;->g()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 12
    .line 13
    invoke-virtual {v3}, LW0/b;->g()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    new-instance v4, Landroid/graphics/RectF;

    .line 18
    .line 19
    iget-object v5, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 20
    .line 21
    invoke-virtual {v5}, LW0/b;->l()F

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 26
    .line 27
    invoke-virtual {v6}, LW0/b;->j()F

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    add-float/2addr v5, v6

    .line 32
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 33
    .line 34
    invoke-virtual {v6}, LW0/b;->l()F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 39
    .line 40
    invoke-virtual {v7}, LW0/b;->j()F

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    add-float/2addr v6, v7

    .line 45
    int-to-float v2, v2

    .line 46
    const/high16 v7, 0x40000000    # 2.0f

    .line 47
    .line 48
    div-float v8, v2, v7

    .line 49
    .line 50
    iget-object v9, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 51
    .line 52
    invoke-virtual {v9}, LW0/b;->d()F

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    div-float/2addr v9, v7

    .line 57
    sub-float v9, v8, v9

    .line 58
    .line 59
    int-to-float v3, v3

    .line 60
    iget-object v10, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 61
    .line 62
    invoke-virtual {v10}, LW0/b;->l()F

    .line 63
    .line 64
    .line 65
    move-result v10

    .line 66
    iget-object v11, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 67
    .line 68
    invoke-virtual {v11}, LW0/b;->j()F

    .line 69
    .line 70
    .line 71
    move-result v11

    .line 72
    add-float/2addr v10, v11

    .line 73
    sub-float v10, v3, v10

    .line 74
    .line 75
    invoke-direct {v4, v5, v6, v9, v10}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 76
    .line 77
    .line 78
    new-instance v5, Landroid/graphics/RectF;

    .line 79
    .line 80
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 81
    .line 82
    invoke-virtual {v6}, LW0/b;->d()F

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    div-float/2addr v6, v7

    .line 87
    add-float/2addr v8, v6

    .line 88
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 89
    .line 90
    invoke-virtual {v6}, LW0/b;->l()F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 95
    .line 96
    invoke-virtual {v7}, LW0/b;->j()F

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    add-float/2addr v6, v7

    .line 101
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 102
    .line 103
    invoke-virtual {v7}, LW0/b;->l()F

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    iget-object v9, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 108
    .line 109
    invoke-virtual {v9}, LW0/b;->j()F

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    add-float/2addr v7, v9

    .line 114
    sub-float/2addr v2, v7

    .line 115
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 116
    .line 117
    invoke-virtual {v7}, LW0/b;->l()F

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    iget-object v9, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 122
    .line 123
    invoke-virtual {v9}, LW0/b;->j()F

    .line 124
    .line 125
    .line 126
    move-result v9

    .line 127
    add-float/2addr v7, v9

    .line 128
    sub-float/2addr v3, v7

    .line 129
    invoke-direct {v5, v8, v6, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 130
    .line 131
    .line 132
    iget v2, v4, Landroid/graphics/RectF;->left:F

    .line 133
    .line 134
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    add-float/2addr v2, v3

    .line 139
    iget v3, v4, Landroid/graphics/RectF;->top:F

    .line 140
    .line 141
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    add-float/2addr v3, v6

    .line 146
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 147
    .line 148
    invoke-virtual {v6}, LW0/b;->f()F

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    invoke-static {v4, v2, v3, v6}, Lcom/android/launcher3/N5;->c0(Landroid/graphics/RectF;FFF)V

    .line 153
    .line 154
    .line 155
    iget v2, v5, Landroid/graphics/RectF;->left:F

    .line 156
    .line 157
    iget v3, v5, Landroid/graphics/RectF;->top:F

    .line 158
    .line 159
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    add-float/2addr v3, v6

    .line 164
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 165
    .line 166
    invoke-virtual {v6}, LW0/b;->f()F

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    invoke-static {v5, v2, v3, v6}, Lcom/android/launcher3/N5;->c0(Landroid/graphics/RectF;FFF)V

    .line 171
    .line 172
    .line 173
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 174
    .line 175
    invoke-virtual {v2}, LW0/b;->c()F

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 180
    .line 181
    invoke-virtual {v3}, LW0/b;->c()F

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 186
    .line 187
    invoke-virtual {v6}, LW0/b;->k()F

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 192
    .line 193
    invoke-virtual {v7}, LW0/b;->k()F

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    iget-object v8, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 198
    .line 199
    invoke-virtual {v8}, LW0/b;->k()F

    .line 200
    .line 201
    .line 202
    move-result v8

    .line 203
    iget-object v9, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 204
    .line 205
    invoke-virtual {v9}, LW0/b;->k()F

    .line 206
    .line 207
    .line 208
    move-result v9

    .line 209
    iget-object v10, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 210
    .line 211
    invoke-virtual {v10}, LW0/b;->c()F

    .line 212
    .line 213
    .line 214
    move-result v10

    .line 215
    iget-object v11, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 216
    .line 217
    invoke-virtual {v11}, LW0/b;->c()F

    .line 218
    .line 219
    .line 220
    move-result v11

    .line 221
    const/16 v12, 0x8

    .line 222
    .line 223
    new-array v13, v12, [F

    .line 224
    .line 225
    const/4 v14, 0x0

    .line 226
    aput v2, v13, v14

    .line 227
    .line 228
    const/4 v2, 0x1

    .line 229
    aput v3, v13, v2

    .line 230
    .line 231
    const/4 v3, 0x2

    .line 232
    aput v6, v13, v3

    .line 233
    .line 234
    const/4 v6, 0x3

    .line 235
    aput v7, v13, v6

    .line 236
    .line 237
    const/4 v7, 0x4

    .line 238
    aput v8, v13, v7

    .line 239
    .line 240
    const/4 v8, 0x5

    .line 241
    aput v9, v13, v8

    .line 242
    .line 243
    const/4 v9, 0x6

    .line 244
    aput v10, v13, v9

    .line 245
    .line 246
    const/4 v10, 0x7

    .line 247
    aput v11, v13, v10

    .line 248
    .line 249
    invoke-direct {v0, v1, v4, v13}, Lcom/android/launcher3/apppairs/a;->a(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 250
    .line 251
    .line 252
    iget-object v4, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 253
    .line 254
    invoke-virtual {v4}, LW0/b;->k()F

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    iget-object v11, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 259
    .line 260
    invoke-virtual {v11}, LW0/b;->k()F

    .line 261
    .line 262
    .line 263
    move-result v11

    .line 264
    iget-object v13, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 265
    .line 266
    invoke-virtual {v13}, LW0/b;->c()F

    .line 267
    .line 268
    .line 269
    move-result v13

    .line 270
    iget-object v15, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 271
    .line 272
    invoke-virtual {v15}, LW0/b;->c()F

    .line 273
    .line 274
    .line 275
    move-result v15

    .line 276
    move/from16 v16, v2

    .line 277
    .line 278
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 279
    .line 280
    invoke-virtual {v2}, LW0/b;->c()F

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    move/from16 v17, v3

    .line 285
    .line 286
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 287
    .line 288
    invoke-virtual {v3}, LW0/b;->c()F

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    move/from16 v18, v6

    .line 293
    .line 294
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 295
    .line 296
    invoke-virtual {v6}, LW0/b;->k()F

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    move/from16 v19, v7

    .line 301
    .line 302
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 303
    .line 304
    invoke-virtual {v7}, LW0/b;->k()F

    .line 305
    .line 306
    .line 307
    move-result v7

    .line 308
    new-array v12, v12, [F

    .line 309
    .line 310
    aput v4, v12, v14

    .line 311
    .line 312
    aput v11, v12, v16

    .line 313
    .line 314
    aput v13, v12, v17

    .line 315
    .line 316
    aput v15, v12, v18

    .line 317
    .line 318
    aput v2, v12, v19

    .line 319
    .line 320
    aput v3, v12, v8

    .line 321
    .line 322
    aput v6, v12, v9

    .line 323
    .line 324
    aput v7, v12, v10

    .line 325
    .line 326
    invoke-direct {v0, v1, v5, v12}, Lcom/android/launcher3/apppairs/a;->a(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method private c(Landroid/graphics/Canvas;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 6
    .line 7
    invoke-virtual {v2}, LW0/b;->g()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 12
    .line 13
    invoke-virtual {v3}, LW0/b;->g()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    new-instance v4, Landroid/graphics/RectF;

    .line 18
    .line 19
    iget-object v5, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 20
    .line 21
    invoke-virtual {v5}, LW0/b;->l()F

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 26
    .line 27
    invoke-virtual {v6}, LW0/b;->j()F

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    add-float/2addr v5, v6

    .line 32
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 33
    .line 34
    invoke-virtual {v6}, LW0/b;->l()F

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 39
    .line 40
    invoke-virtual {v7}, LW0/b;->j()F

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    add-float/2addr v6, v7

    .line 45
    int-to-float v2, v2

    .line 46
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 47
    .line 48
    invoke-virtual {v7}, LW0/b;->l()F

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    iget-object v8, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 53
    .line 54
    invoke-virtual {v8}, LW0/b;->j()F

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    add-float/2addr v7, v8

    .line 59
    sub-float v7, v2, v7

    .line 60
    .line 61
    int-to-float v3, v3

    .line 62
    const/high16 v8, 0x40000000    # 2.0f

    .line 63
    .line 64
    div-float v9, v3, v8

    .line 65
    .line 66
    iget-object v10, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 67
    .line 68
    invoke-virtual {v10}, LW0/b;->d()F

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    div-float/2addr v10, v8

    .line 73
    sub-float v10, v9, v10

    .line 74
    .line 75
    invoke-direct {v4, v5, v6, v7, v10}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 76
    .line 77
    .line 78
    new-instance v5, Landroid/graphics/RectF;

    .line 79
    .line 80
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 81
    .line 82
    invoke-virtual {v6}, LW0/b;->l()F

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 87
    .line 88
    invoke-virtual {v7}, LW0/b;->j()F

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    add-float/2addr v6, v7

    .line 93
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 94
    .line 95
    invoke-virtual {v7}, LW0/b;->d()F

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    div-float/2addr v7, v8

    .line 100
    add-float/2addr v9, v7

    .line 101
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 102
    .line 103
    invoke-virtual {v7}, LW0/b;->l()F

    .line 104
    .line 105
    .line 106
    move-result v7

    .line 107
    iget-object v8, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 108
    .line 109
    invoke-virtual {v8}, LW0/b;->j()F

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    add-float/2addr v7, v8

    .line 114
    sub-float/2addr v2, v7

    .line 115
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 116
    .line 117
    invoke-virtual {v7}, LW0/b;->l()F

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    iget-object v8, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 122
    .line 123
    invoke-virtual {v8}, LW0/b;->j()F

    .line 124
    .line 125
    .line 126
    move-result v8

    .line 127
    add-float/2addr v7, v8

    .line 128
    sub-float/2addr v3, v7

    .line 129
    invoke-direct {v5, v6, v9, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 130
    .line 131
    .line 132
    iget v2, v4, Landroid/graphics/RectF;->left:F

    .line 133
    .line 134
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    add-float/2addr v2, v3

    .line 139
    iget v3, v4, Landroid/graphics/RectF;->top:F

    .line 140
    .line 141
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    add-float/2addr v3, v6

    .line 146
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 147
    .line 148
    invoke-virtual {v6}, LW0/b;->f()F

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    invoke-static {v4, v2, v3, v6}, Lcom/android/launcher3/N5;->c0(Landroid/graphics/RectF;FFF)V

    .line 153
    .line 154
    .line 155
    iget v2, v5, Landroid/graphics/RectF;->left:F

    .line 156
    .line 157
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    add-float/2addr v2, v3

    .line 162
    iget v3, v5, Landroid/graphics/RectF;->top:F

    .line 163
    .line 164
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 165
    .line 166
    invoke-virtual {v6}, LW0/b;->f()F

    .line 167
    .line 168
    .line 169
    move-result v6

    .line 170
    invoke-static {v5, v2, v3, v6}, Lcom/android/launcher3/N5;->c0(Landroid/graphics/RectF;FFF)V

    .line 171
    .line 172
    .line 173
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 174
    .line 175
    invoke-virtual {v2}, LW0/b;->c()F

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 180
    .line 181
    invoke-virtual {v3}, LW0/b;->c()F

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 186
    .line 187
    invoke-virtual {v6}, LW0/b;->c()F

    .line 188
    .line 189
    .line 190
    move-result v6

    .line 191
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 192
    .line 193
    invoke-virtual {v7}, LW0/b;->c()F

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    iget-object v8, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 198
    .line 199
    invoke-virtual {v8}, LW0/b;->k()F

    .line 200
    .line 201
    .line 202
    move-result v8

    .line 203
    iget-object v9, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 204
    .line 205
    invoke-virtual {v9}, LW0/b;->k()F

    .line 206
    .line 207
    .line 208
    move-result v9

    .line 209
    iget-object v10, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 210
    .line 211
    invoke-virtual {v10}, LW0/b;->k()F

    .line 212
    .line 213
    .line 214
    move-result v10

    .line 215
    iget-object v11, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 216
    .line 217
    invoke-virtual {v11}, LW0/b;->k()F

    .line 218
    .line 219
    .line 220
    move-result v11

    .line 221
    const/16 v12, 0x8

    .line 222
    .line 223
    new-array v13, v12, [F

    .line 224
    .line 225
    const/4 v14, 0x0

    .line 226
    aput v2, v13, v14

    .line 227
    .line 228
    const/4 v2, 0x1

    .line 229
    aput v3, v13, v2

    .line 230
    .line 231
    const/4 v3, 0x2

    .line 232
    aput v6, v13, v3

    .line 233
    .line 234
    const/4 v6, 0x3

    .line 235
    aput v7, v13, v6

    .line 236
    .line 237
    const/4 v7, 0x4

    .line 238
    aput v8, v13, v7

    .line 239
    .line 240
    const/4 v8, 0x5

    .line 241
    aput v9, v13, v8

    .line 242
    .line 243
    const/4 v9, 0x6

    .line 244
    aput v10, v13, v9

    .line 245
    .line 246
    const/4 v10, 0x7

    .line 247
    aput v11, v13, v10

    .line 248
    .line 249
    invoke-direct {v0, v1, v4, v13}, Lcom/android/launcher3/apppairs/a;->a(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 250
    .line 251
    .line 252
    iget-object v4, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 253
    .line 254
    invoke-virtual {v4}, LW0/b;->k()F

    .line 255
    .line 256
    .line 257
    move-result v4

    .line 258
    iget-object v11, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 259
    .line 260
    invoke-virtual {v11}, LW0/b;->k()F

    .line 261
    .line 262
    .line 263
    move-result v11

    .line 264
    iget-object v13, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 265
    .line 266
    invoke-virtual {v13}, LW0/b;->k()F

    .line 267
    .line 268
    .line 269
    move-result v13

    .line 270
    iget-object v15, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 271
    .line 272
    invoke-virtual {v15}, LW0/b;->k()F

    .line 273
    .line 274
    .line 275
    move-result v15

    .line 276
    move/from16 v16, v2

    .line 277
    .line 278
    iget-object v2, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 279
    .line 280
    invoke-virtual {v2}, LW0/b;->c()F

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    move/from16 v17, v3

    .line 285
    .line 286
    iget-object v3, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 287
    .line 288
    invoke-virtual {v3}, LW0/b;->c()F

    .line 289
    .line 290
    .line 291
    move-result v3

    .line 292
    move/from16 v18, v6

    .line 293
    .line 294
    iget-object v6, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 295
    .line 296
    invoke-virtual {v6}, LW0/b;->c()F

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    move/from16 v19, v7

    .line 301
    .line 302
    iget-object v7, v0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 303
    .line 304
    invoke-virtual {v7}, LW0/b;->c()F

    .line 305
    .line 306
    .line 307
    move-result v7

    .line 308
    new-array v12, v12, [F

    .line 309
    .line 310
    aput v4, v12, v14

    .line 311
    .line 312
    aput v11, v12, v16

    .line 313
    .line 314
    aput v13, v12, v17

    .line 315
    .line 316
    aput v15, v12, v18

    .line 317
    .line 318
    aput v2, v12, v19

    .line 319
    .line 320
    aput v3, v12, v8

    .line 321
    .line 322
    aput v6, v12, v9

    .line 323
    .line 324
    aput v7, v12, v10

    .line 325
    .line 326
    invoke-direct {v0, v1, v5, v12}, Lcom/android/launcher3/apppairs/a;->a(Landroid/graphics/Canvas;Landroid/graphics/RectF;[F)V

    .line 327
    .line 328
    .line 329
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 2
    .line 3
    invoke-virtual {v0}, LW0/b;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/android/launcher3/apppairs/a;->b(Landroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/apppairs/a;->c(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 17
    .line 18
    invoke-virtual {v0}, LW0/b;->l()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 23
    .line 24
    invoke-virtual {v1}, LW0/b;->j()F

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-float/2addr v0, v1

    .line 29
    iget-object v1, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 30
    .line 31
    invoke-virtual {v1}, LW0/b;->l()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 36
    .line 37
    invoke-virtual {v2}, LW0/b;->j()F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    add-float/2addr v1, v2

    .line 42
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 49
    .line 50
    invoke-virtual {v0}, LW0/b;->m()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/high16 v1, 0x40000000    # 2.0f

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 59
    .line 60
    invoke-virtual {v0}, LW0/b;->h()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 65
    .line 66
    invoke-virtual {v2}, LW0/b;->a()F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    div-float/2addr v2, v1

    .line 71
    iget-object v3, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 72
    .line 73
    invoke-virtual {v3}, LW0/b;->i()F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    div-float/2addr v3, v1

    .line 78
    sub-float/2addr v2, v3

    .line 79
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 84
    .line 85
    invoke-virtual {v0}, LW0/b;->a()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    div-float/2addr v0, v1

    .line 90
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 91
    .line 92
    invoke-virtual {v2}, LW0/b;->i()F

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    div-float/2addr v2, v1

    .line 97
    sub-float/2addr v0, v2

    .line 98
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 99
    .line 100
    invoke-virtual {v2}, LW0/b;->h()F

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 105
    .line 106
    .line 107
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->c:Ls1/o;

    .line 108
    .line 109
    invoke-virtual {v0, p1}, Ls1/o;->draw(Landroid/graphics/Canvas;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 119
    .line 120
    invoke-virtual {v0}, LW0/b;->m()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 127
    .line 128
    invoke-virtual {v0}, LW0/b;->a()F

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 133
    .line 134
    invoke-virtual {v2}, LW0/b;->h()F

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iget-object v3, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 139
    .line 140
    invoke-virtual {v3}, LW0/b;->i()F

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    add-float/2addr v2, v3

    .line 145
    sub-float/2addr v0, v2

    .line 146
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 147
    .line 148
    invoke-virtual {v2}, LW0/b;->a()F

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    div-float/2addr v2, v1

    .line 153
    iget-object v3, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 154
    .line 155
    invoke-virtual {v3}, LW0/b;->i()F

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    div-float/2addr v3, v1

    .line 160
    sub-float/2addr v2, v3

    .line 161
    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 162
    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 166
    .line 167
    invoke-virtual {v0}, LW0/b;->a()F

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    div-float/2addr v0, v1

    .line 172
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 173
    .line 174
    invoke-virtual {v2}, LW0/b;->i()F

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    div-float/2addr v2, v1

    .line 179
    sub-float/2addr v0, v2

    .line 180
    iget-object v1, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 181
    .line 182
    invoke-virtual {v1}, LW0/b;->a()F

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    iget-object v2, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 187
    .line 188
    invoke-virtual {v2}, LW0/b;->h()F

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    iget-object v3, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 193
    .line 194
    invoke-virtual {v3}, LW0/b;->i()F

    .line 195
    .line 196
    .line 197
    move-result v3

    .line 198
    add-float/2addr v2, v3

    .line 199
    sub-float/2addr v1, v2

    .line 200
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 201
    .line 202
    .line 203
    :goto_2
    iget-object p0, p0, Lcom/android/launcher3/apppairs/a;->d:Ls1/o;

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Ls1/o;->draw(Landroid/graphics/Canvas;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LW0/b;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/a;->b:LW0/b;

    .line 2
    .line 3
    invoke-virtual {p0}, LW0/b;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/a;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/apppairs/a;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 4
    .line 5
    .line 6
    return-void
.end method
