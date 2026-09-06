.class public final Ls1/l;
.super Ljava/lang/Object;
.source "ColorExtractor.kt"


# static fields
.field public static final a:Ls1/l;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ls1/l;

    .line 2
    .line 3
    invoke-direct {v0}, Ls1/l;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ls1/l;->a:Ls1/l;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Landroid/graphics/Bitmap;)I
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "bitmap"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    mul-int v3, v1, v2

    .line 17
    .line 18
    int-to-double v3, v3

    .line 19
    const-wide/high16 v5, 0x4034000000000000L    # 20.0

    .line 20
    .line 21
    div-double/2addr v3, v5

    .line 22
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    double-to-int v3, v3

    .line 27
    const/4 v4, 0x1

    .line 28
    invoke-static {v3, v4}, LA4/d;->c(II)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    sget-object v6, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    .line 37
    .line 38
    if-ne v5, v6, :cond_0

    .line 39
    .line 40
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 41
    .line 42
    invoke-virtual {v0, v5, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v5, "ColorExtractor"

    .line 47
    .line 48
    const-string v6, "findDominantColorByHue need change HARDWARE bitmap to normal"

    .line 49
    .line 50
    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_0
    const/4 v5, 0x3

    .line 54
    new-array v5, v5, [F

    .line 55
    .line 56
    const/16 v6, 0x168

    .line 57
    .line 58
    new-array v7, v6, [F

    .line 59
    .line 60
    const/16 v8, 0x14

    .line 61
    .line 62
    new-array v9, v8, [I

    .line 63
    .line 64
    const/4 v10, 0x0

    .line 65
    invoke-static {v10, v1}, LA4/d;->l(II)LA4/c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1, v3}, LA4/d;->k(LA4/a;I)LA4/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, LA4/a;->e()I

    .line 74
    .line 75
    .line 76
    move-result v11

    .line 77
    invoke-virtual {v1}, LA4/a;->g()I

    .line 78
    .line 79
    .line 80
    move-result v12

    .line 81
    invoke-virtual {v1}, LA4/a;->j()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    const/16 v16, -0x1

    .line 86
    .line 87
    if-lez v1, :cond_1

    .line 88
    .line 89
    if-le v11, v12, :cond_2

    .line 90
    .line 91
    :cond_1
    if-gez v1, :cond_d

    .line 92
    .line 93
    if-gt v12, v11, :cond_d

    .line 94
    .line 95
    :cond_2
    move/from16 v19, v4

    .line 96
    .line 97
    move/from16 v17, v10

    .line 98
    .line 99
    const/high16 v18, -0x40800000    # -1.0f

    .line 100
    .line 101
    :goto_0
    invoke-static {v10, v2}, LA4/d;->l(II)LA4/c;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v4, v3}, LA4/d;->k(LA4/a;I)LA4/a;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    move/from16 p0, v10

    .line 110
    .line 111
    invoke-virtual {v4}, LA4/a;->e()I

    .line 112
    .line 113
    .line 114
    move-result v10

    .line 115
    const/16 v20, 0x2

    .line 116
    .line 117
    invoke-virtual {v4}, LA4/a;->g()I

    .line 118
    .line 119
    .line 120
    move-result v13

    .line 121
    invoke-virtual {v4}, LA4/a;->j()I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    if-lez v4, :cond_3

    .line 126
    .line 127
    if-le v10, v13, :cond_4

    .line 128
    .line 129
    :cond_3
    if-gez v4, :cond_b

    .line 130
    .line 131
    if-gt v13, v10, :cond_b

    .line 132
    .line 133
    :cond_4
    move/from16 v14, v17

    .line 134
    .line 135
    const/high16 v21, -0x1000000

    .line 136
    .line 137
    :goto_1
    invoke-virtual {v0, v10, v11}, Landroid/graphics/Bitmap;->getPixel(II)I

    .line 138
    .line 139
    .line 140
    move-result v17

    .line 141
    shr-int/lit8 v15, v17, 0x18

    .line 142
    .line 143
    and-int/lit16 v15, v15, 0xff

    .line 144
    .line 145
    const/16 v8, 0x80

    .line 146
    .line 147
    if-ge v15, v8, :cond_5

    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_5
    or-int v8, v17, v21

    .line 151
    .line 152
    invoke-static {v8, v5}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 153
    .line 154
    .line 155
    aget v15, v5, p0

    .line 156
    .line 157
    float-to-int v15, v15

    .line 158
    if-ltz v15, :cond_6

    .line 159
    .line 160
    if-lt v15, v6, :cond_7

    .line 161
    .line 162
    :cond_6
    :goto_2
    const/16 v6, 0x14

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_7
    const/16 v6, 0x14

    .line 166
    .line 167
    if-ge v14, v6, :cond_8

    .line 168
    .line 169
    add-int/lit8 v17, v14, 0x1

    .line 170
    .line 171
    aput v8, v9, v14

    .line 172
    .line 173
    move/from16 v14, v17

    .line 174
    .line 175
    :cond_8
    aget v8, v5, v19

    .line 176
    .line 177
    aget v17, v5, v20

    .line 178
    .line 179
    mul-float v8, v8, v17

    .line 180
    .line 181
    aget v17, v7, v15

    .line 182
    .line 183
    add-float v17, v17, v8

    .line 184
    .line 185
    aput v17, v7, v15

    .line 186
    .line 187
    cmpl-float v8, v17, v18

    .line 188
    .line 189
    if-lez v8, :cond_9

    .line 190
    .line 191
    move/from16 v16, v15

    .line 192
    .line 193
    move/from16 v18, v17

    .line 194
    .line 195
    :cond_9
    :goto_3
    if-eq v10, v13, :cond_a

    .line 196
    .line 197
    add-int/2addr v10, v4

    .line 198
    move v8, v6

    .line 199
    const/16 v6, 0x168

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_a
    move/from16 v17, v14

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_b
    move v6, v8

    .line 206
    const/high16 v21, -0x1000000

    .line 207
    .line 208
    :goto_4
    if-eq v11, v12, :cond_c

    .line 209
    .line 210
    add-int/2addr v11, v1

    .line 211
    move/from16 v10, p0

    .line 212
    .line 213
    move v8, v6

    .line 214
    const/16 v6, 0x168

    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_c
    move/from16 v1, v17

    .line 218
    .line 219
    :goto_5
    move/from16 v0, v16

    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_d
    move/from16 v19, v4

    .line 223
    .line 224
    move/from16 p0, v10

    .line 225
    .line 226
    const/16 v20, 0x2

    .line 227
    .line 228
    const/high16 v21, -0x1000000

    .line 229
    .line 230
    move/from16 v1, p0

    .line 231
    .line 232
    goto :goto_5

    .line 233
    :goto_6
    new-instance v2, Landroid/util/SparseArray;

    .line 234
    .line 235
    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    .line 236
    .line 237
    .line 238
    const/high16 v15, -0x40800000    # -1.0f

    .line 239
    .line 240
    move/from16 v3, p0

    .line 241
    .line 242
    move/from16 v14, v21

    .line 243
    .line 244
    :goto_7
    if-ge v3, v1, :cond_10

    .line 245
    .line 246
    aget v4, v9, v3

    .line 247
    .line 248
    invoke-static {v4, v5}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 249
    .line 250
    .line 251
    aget v6, v5, p0

    .line 252
    .line 253
    float-to-int v6, v6

    .line 254
    if-ne v6, v0, :cond_f

    .line 255
    .line 256
    aget v6, v5, v19

    .line 257
    .line 258
    aget v7, v5, v20

    .line 259
    .line 260
    const/16 v8, 0x64

    .line 261
    .line 262
    int-to-float v8, v8

    .line 263
    mul-float/2addr v8, v6

    .line 264
    float-to-int v8, v8

    .line 265
    const/16 v10, 0x2710

    .line 266
    .line 267
    int-to-float v10, v10

    .line 268
    mul-float/2addr v10, v7

    .line 269
    float-to-int v10, v10

    .line 270
    add-int/2addr v8, v10

    .line 271
    mul-float/2addr v6, v7

    .line 272
    invoke-virtual {v2, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v7

    .line 276
    check-cast v7, Ljava/lang/Float;

    .line 277
    .line 278
    if-nez v7, :cond_e

    .line 279
    .line 280
    goto :goto_8

    .line 281
    :cond_e
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 282
    .line 283
    .line 284
    move-result v7

    .line 285
    add-float/2addr v6, v7

    .line 286
    :goto_8
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 287
    .line 288
    .line 289
    move-result-object v7

    .line 290
    invoke-virtual {v2, v8, v7}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 291
    .line 292
    .line 293
    cmpl-float v7, v6, v15

    .line 294
    .line 295
    if-lez v7, :cond_f

    .line 296
    .line 297
    move v14, v4

    .line 298
    move v15, v6

    .line 299
    :cond_f
    add-int/lit8 v3, v3, 0x1

    .line 300
    .line 301
    goto :goto_7

    .line 302
    :cond_10
    return v14
.end method
