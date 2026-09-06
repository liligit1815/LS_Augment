.class public Lcom/zte/mifavor/widget/h;
.super Ljava/lang/Object;
.source "G2ContinuousRoundedPath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/h$b;,
        Lcom/zte/mifavor/widget/h$a;,
        Lcom/zte/mifavor/widget/h$c;
    }
.end annotation


# static fields
.field private static final a:Lcom/zte/mifavor/widget/h$b;

.field private static final b:Lcom/zte/mifavor/widget/h$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/widget/h$b;->c()Lcom/zte/mifavor/widget/h$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/zte/mifavor/widget/h;->a:Lcom/zte/mifavor/widget/h$b;

    .line 6
    .line 7
    invoke-static {}, Lcom/zte/mifavor/widget/h$b;->b()Lcom/zte/mifavor/widget/h$b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/zte/mifavor/widget/h;->b:Lcom/zte/mifavor/widget/h$b;

    .line 12
    .line 13
    return-void
.end method

.method private static a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/h$c;DDDD)V
    .locals 6

    .line 1
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 2
    .line 3
    mul-double/2addr v0, p8

    .line 4
    add-double/2addr v0, p6

    .line 5
    new-instance v2, Lcom/zte/mifavor/widget/h$c;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-direct {v2, v3, v4, v0, v1}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 16
    .line 17
    .line 18
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 19
    .line 20
    sub-double/2addr v0, p4

    .line 21
    mul-double/2addr v0, p2

    .line 22
    invoke-virtual {v2, v0, v1}, Lcom/zte/mifavor/widget/h$c;->c(D)Lcom/zte/mifavor/widget/h$c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lcom/zte/mifavor/widget/h$c;->b(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    mul-double/2addr p2, p4

    .line 31
    new-instance p4, Landroid/graphics/RectF;

    .line 32
    .line 33
    iget-wide v0, p1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 34
    .line 35
    sub-double v2, v0, p2

    .line 36
    .line 37
    double-to-float p5, v2

    .line 38
    iget-wide v2, p1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 39
    .line 40
    sub-double v4, v2, p2

    .line 41
    .line 42
    double-to-float p1, v4

    .line 43
    add-double/2addr v0, p2

    .line 44
    double-to-float v0, v0

    .line 45
    add-double/2addr v2, p2

    .line 46
    double-to-float p2, v2

    .line 47
    invoke-direct {p4, p5, p1, v0, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 48
    .line 49
    .line 50
    const-wide p1, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    mul-double/2addr p6, p1

    .line 56
    double-to-float p3, p6

    .line 57
    mul-double/2addr p8, p1

    .line 58
    double-to-float p1, p8

    .line 59
    invoke-virtual {p0, p4, p3, p1}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private static b(DDD)D
    .locals 0

    .line 1
    invoke-static {p0, p1, p4, p5}, Ljava/lang/Math;->min(DD)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(DD)D

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public static c(DDDDDD)Landroid/graphics/Path;
    .locals 20

    .line 1
    invoke-static/range {p0 .. p3}, Ljava/lang/Math;->min(DD)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 6
    .line 7
    mul-double/2addr v0, v2

    .line 8
    move-wide/from16 v2, p4

    .line 9
    .line 10
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 17
    .line 18
    .line 19
    move-result-wide v10

    .line 20
    move-wide/from16 v2, p6

    .line 21
    .line 22
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 27
    .line 28
    .line 29
    move-result-wide v12

    .line 30
    move-wide/from16 v2, p8

    .line 31
    .line 32
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 37
    .line 38
    .line 39
    move-result-wide v14

    .line 40
    move-wide/from16 v2, p10

    .line 41
    .line 42
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(DD)D

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(DD)D

    .line 47
    .line 48
    .line 49
    move-result-wide v16

    .line 50
    add-double v0, v10, v12

    .line 51
    .line 52
    add-double/2addr v0, v14

    .line 53
    add-double v0, v0, v16

    .line 54
    .line 55
    cmpl-double v0, v0, v4

    .line 56
    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    new-instance v0, Landroid/graphics/Path;

    .line 60
    .line 61
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 62
    .line 63
    .line 64
    move-wide/from16 v6, p0

    .line 65
    .line 66
    double-to-float v1, v6

    .line 67
    move-wide/from16 v8, p2

    .line 68
    .line 69
    double-to-float v2, v8

    .line 70
    sget-object v3, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 71
    .line 72
    const/4 v4, 0x0

    .line 73
    const/4 v5, 0x0

    .line 74
    move-object/from16 p0, v0

    .line 75
    .line 76
    move/from16 p3, v1

    .line 77
    .line 78
    move/from16 p4, v2

    .line 79
    .line 80
    move-object/from16 p5, v3

    .line 81
    .line 82
    move/from16 p1, v4

    .line 83
    .line 84
    move/from16 p2, v5

    .line 85
    .line 86
    invoke-virtual/range {p0 .. p5}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 87
    .line 88
    .line 89
    return-object v0

    .line 90
    :cond_0
    move-wide/from16 v6, p0

    .line 91
    .line 92
    move-wide/from16 v8, p2

    .line 93
    .line 94
    sget-object v18, Lcom/zte/mifavor/widget/h;->a:Lcom/zte/mifavor/widget/h$b;

    .line 95
    .line 96
    sget-object v19, Lcom/zte/mifavor/widget/h;->b:Lcom/zte/mifavor/widget/h$b;

    .line 97
    .line 98
    invoke-static/range {v6 .. v19}, Lcom/zte/mifavor/widget/h;->d(DDDDDDLcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Landroid/graphics/Path;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    return-object v0
.end method

.method private static d(DDDDDDLcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Landroid/graphics/Path;
    .locals 109

    .line 1
    move-object/from16 v10, p12

    .line 2
    .line 3
    move-object/from16 v11, p13

    .line 4
    .line 5
    const-wide/high16 v16, 0x3fe0000000000000L    # 0.5

    .line 6
    .line 7
    mul-double v12, p0, v16

    .line 8
    .line 9
    mul-double v18, p2, v16

    .line 10
    .line 11
    div-double v20, v18, p4

    .line 12
    .line 13
    const-wide/high16 v22, 0x3ff0000000000000L    # 1.0

    .line 14
    .line 15
    sub-double v20, v20, v22

    .line 16
    .line 17
    move-wide/from16 v24, v12

    .line 18
    .line 19
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 20
    .line 21
    div-double v26, v20, v12

    .line 22
    .line 23
    const-wide/16 v28, 0x0

    .line 24
    .line 25
    const-wide/high16 v30, 0x3ff0000000000000L    # 1.0

    .line 26
    .line 27
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 28
    .line 29
    .line 30
    move-result-wide v12

    .line 31
    div-double v20, v24, p4

    .line 32
    .line 33
    sub-double v20, v20, v22

    .line 34
    .line 35
    iget-wide v2, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 36
    .line 37
    div-double v26, v20, v2

    .line 38
    .line 39
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    div-double v20, v24, p6

    .line 44
    .line 45
    sub-double v20, v20, v22

    .line 46
    .line 47
    iget-wide v0, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 48
    .line 49
    div-double v26, v20, v0

    .line 50
    .line 51
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    div-double v20, v18, p6

    .line 56
    .line 57
    sub-double v20, v20, v22

    .line 58
    .line 59
    iget-wide v8, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 60
    .line 61
    div-double v26, v20, v8

    .line 62
    .line 63
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 64
    .line 65
    .line 66
    move-result-wide v8

    .line 67
    div-double v20, v18, p8

    .line 68
    .line 69
    sub-double v20, v20, v22

    .line 70
    .line 71
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 72
    .line 73
    div-double v26, v20, v4

    .line 74
    .line 75
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 76
    .line 77
    .line 78
    move-result-wide v4

    .line 79
    div-double v20, v24, p8

    .line 80
    .line 81
    sub-double v20, v20, v22

    .line 82
    .line 83
    iget-wide v14, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 84
    .line 85
    div-double v26, v20, v14

    .line 86
    .line 87
    invoke-static/range {v26 .. v31}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 88
    .line 89
    .line 90
    move-result-wide v14

    .line 91
    div-double v20, v24, p10

    .line 92
    .line 93
    sub-double v20, v20, v22

    .line 94
    .line 95
    iget-wide v6, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 96
    .line 97
    div-double v24, v20, v6

    .line 98
    .line 99
    const-wide/16 v26, 0x0

    .line 100
    .line 101
    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    .line 102
    .line 103
    invoke-static/range {v24 .. v29}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 104
    .line 105
    .line 106
    move-result-wide v6

    .line 107
    div-double v18, v18, p10

    .line 108
    .line 109
    sub-double v18, v18, v22

    .line 110
    .line 111
    move-wide/from16 v20, v6

    .line 112
    .line 113
    iget-wide v6, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 114
    .line 115
    div-double v24, v18, v6

    .line 116
    .line 117
    invoke-static/range {v24 .. v29}, Lcom/zte/mifavor/widget/h;->b(DDD)D

    .line 118
    .line 119
    .line 120
    move-result-wide v6

    .line 121
    invoke-static {v12, v13, v2, v3}, Ljava/lang/Math;->min(DD)D

    .line 122
    .line 123
    .line 124
    move-result-wide v28

    .line 125
    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->min(DD)D

    .line 126
    .line 127
    .line 128
    move-result-wide v34

    .line 129
    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->min(DD)D

    .line 130
    .line 131
    .line 132
    move-result-wide v40

    .line 133
    move-wide/from16 v18, v0

    .line 134
    .line 135
    move-wide/from16 v0, v20

    .line 136
    .line 137
    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->min(DD)D

    .line 138
    .line 139
    .line 140
    move-result-wide v46

    .line 141
    iget-wide v0, v11, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 142
    .line 143
    move-wide/from16 v24, v0

    .line 144
    .line 145
    iget-wide v0, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 146
    .line 147
    move-wide/from16 v26, v0

    .line 148
    .line 149
    invoke-static/range {v24 .. v29}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 150
    .line 151
    .line 152
    move-result-wide v0

    .line 153
    move-wide/from16 v24, v0

    .line 154
    .line 155
    iget-wide v0, v11, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 156
    .line 157
    move-wide/from16 v30, v0

    .line 158
    .line 159
    iget-wide v0, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 160
    .line 161
    move-wide/from16 v32, v0

    .line 162
    .line 163
    invoke-static/range {v30 .. v35}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 164
    .line 165
    .line 166
    move-result-wide v0

    .line 167
    move-wide/from16 v26, v0

    .line 168
    .line 169
    move-wide/from16 v48, v34

    .line 170
    .line 171
    iget-wide v0, v11, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 172
    .line 173
    move-wide/from16 v36, v0

    .line 174
    .line 175
    iget-wide v0, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 176
    .line 177
    move-wide/from16 v38, v0

    .line 178
    .line 179
    invoke-static/range {v36 .. v41}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 180
    .line 181
    .line 182
    move-result-wide v0

    .line 183
    move-wide/from16 v30, v0

    .line 184
    .line 185
    iget-wide v0, v11, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 186
    .line 187
    move-wide/from16 v42, v0

    .line 188
    .line 189
    iget-wide v0, v10, Lcom/zte/mifavor/widget/h$b;->a:D

    .line 190
    .line 191
    move-wide/from16 v44, v0

    .line 192
    .line 193
    invoke-static/range {v42 .. v47}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 194
    .line 195
    .line 196
    move-result-wide v0

    .line 197
    mul-double v51, v24, v12

    .line 198
    .line 199
    mul-double v59, v24, v2

    .line 200
    .line 201
    mul-double v62, v26, v18

    .line 202
    .line 203
    mul-double v70, v26, v8

    .line 204
    .line 205
    mul-double v73, v30, v4

    .line 206
    .line 207
    mul-double v81, v30, v14

    .line 208
    .line 209
    mul-double v84, v0, v20

    .line 210
    .line 211
    mul-double/2addr v0, v6

    .line 212
    move-wide/from16 v86, v0

    .line 213
    .line 214
    move-wide/from16 v24, v2

    .line 215
    .line 216
    move-wide/from16 v0, p4

    .line 217
    .line 218
    neg-double v2, v0

    .line 219
    mul-double v88, v2, v51

    .line 220
    .line 221
    mul-double v2, v2, v59

    .line 222
    .line 223
    move-wide/from16 v30, v4

    .line 224
    .line 225
    move-wide/from16 v26, v14

    .line 226
    .line 227
    move-wide/from16 v14, p6

    .line 228
    .line 229
    neg-double v4, v14

    .line 230
    mul-double v90, v4, v62

    .line 231
    .line 232
    mul-double v4, v4, v70

    .line 233
    .line 234
    move-wide/from16 v92, v4

    .line 235
    .line 236
    move-wide/from16 v38, v6

    .line 237
    .line 238
    move-wide/from16 v4, p8

    .line 239
    .line 240
    neg-double v6, v4

    .line 241
    mul-double v94, v6, v73

    .line 242
    .line 243
    mul-double v6, v6, v81

    .line 244
    .line 245
    move-wide/from16 v4, p10

    .line 246
    .line 247
    move-wide/from16 v96, v6

    .line 248
    .line 249
    neg-double v6, v4

    .line 250
    mul-double v98, v6, v84

    .line 251
    .line 252
    mul-double v6, v6, v86

    .line 253
    .line 254
    iget-wide v4, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 255
    .line 256
    move-wide/from16 v32, v4

    .line 257
    .line 258
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 259
    .line 260
    move-wide/from16 v34, v4

    .line 261
    .line 262
    move-wide/from16 v36, v12

    .line 263
    .line 264
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 265
    .line 266
    .line 267
    move-result-wide v55

    .line 268
    iget-wide v4, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 269
    .line 270
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 271
    .line 272
    move-wide/from16 v32, v4

    .line 273
    .line 274
    move-wide/from16 v34, v12

    .line 275
    .line 276
    move-wide/from16 v36, v24

    .line 277
    .line 278
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 279
    .line 280
    .line 281
    move-result-wide v4

    .line 282
    iget-wide v12, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 283
    .line 284
    move-wide/from16 v64, v4

    .line 285
    .line 286
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 287
    .line 288
    move-wide/from16 v34, v4

    .line 289
    .line 290
    move-wide/from16 v32, v12

    .line 291
    .line 292
    move-wide/from16 v36, v18

    .line 293
    .line 294
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 295
    .line 296
    .line 297
    move-result-wide v66

    .line 298
    iget-wide v4, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 299
    .line 300
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 301
    .line 302
    move-wide/from16 v32, v4

    .line 303
    .line 304
    move-wide/from16 v36, v8

    .line 305
    .line 306
    move-wide/from16 v34, v12

    .line 307
    .line 308
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 309
    .line 310
    .line 311
    move-result-wide v4

    .line 312
    iget-wide v8, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 313
    .line 314
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 315
    .line 316
    move-wide/from16 v32, v8

    .line 317
    .line 318
    move-wide/from16 v34, v12

    .line 319
    .line 320
    move-wide/from16 v36, v30

    .line 321
    .line 322
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 323
    .line 324
    .line 325
    move-result-wide v77

    .line 326
    iget-wide v8, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 327
    .line 328
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 329
    .line 330
    move-wide/from16 v32, v8

    .line 331
    .line 332
    move-wide/from16 v34, v12

    .line 333
    .line 334
    move-wide/from16 v36, v26

    .line 335
    .line 336
    invoke-static/range {v32 .. v37}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 337
    .line 338
    .line 339
    move-result-wide v8

    .line 340
    iget-wide v12, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 341
    .line 342
    move-wide/from16 v18, v4

    .line 343
    .line 344
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 345
    .line 346
    move-wide/from16 v32, v4

    .line 347
    .line 348
    move-wide/from16 v30, v12

    .line 349
    .line 350
    move-wide/from16 v34, v20

    .line 351
    .line 352
    invoke-static/range {v30 .. v35}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 353
    .line 354
    .line 355
    move-result-wide v4

    .line 356
    iget-wide v12, v11, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 357
    .line 358
    move-wide/from16 v20, v4

    .line 359
    .line 360
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->c:D

    .line 361
    .line 362
    move-wide/from16 v32, v4

    .line 363
    .line 364
    move-wide/from16 v30, v12

    .line 365
    .line 366
    move-wide/from16 v34, v38

    .line 367
    .line 368
    invoke-static/range {v30 .. v35}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 369
    .line 370
    .line 371
    move-result-wide v4

    .line 372
    iget-wide v12, v11, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 373
    .line 374
    move-wide/from16 v100, v4

    .line 375
    .line 376
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 377
    .line 378
    move-wide/from16 v26, v4

    .line 379
    .line 380
    move-wide/from16 v24, v12

    .line 381
    .line 382
    invoke-static/range {v24 .. v29}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 383
    .line 384
    .line 385
    move-result-wide v53

    .line 386
    iget-wide v4, v11, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 387
    .line 388
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 389
    .line 390
    move-wide/from16 v30, v4

    .line 391
    .line 392
    move-wide/from16 v32, v12

    .line 393
    .line 394
    move-wide/from16 v34, v48

    .line 395
    .line 396
    invoke-static/range {v30 .. v35}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 397
    .line 398
    .line 399
    move-result-wide v4

    .line 400
    iget-wide v12, v11, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 401
    .line 402
    move-wide/from16 v24, v4

    .line 403
    .line 404
    iget-wide v4, v10, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 405
    .line 406
    move-wide/from16 v38, v4

    .line 407
    .line 408
    move-wide/from16 v36, v12

    .line 409
    .line 410
    invoke-static/range {v36 .. v41}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 411
    .line 412
    .line 413
    move-result-wide v75

    .line 414
    iget-wide v4, v11, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 415
    .line 416
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->b:D

    .line 417
    .line 418
    move-wide/from16 v42, v4

    .line 419
    .line 420
    move-wide/from16 v44, v12

    .line 421
    .line 422
    invoke-static/range {v42 .. v47}, Lcom/zte/mifavor/widget/h;->e(DDD)D

    .line 423
    .line 424
    .line 425
    move-result-wide v4

    .line 426
    iget-wide v12, v10, Lcom/zte/mifavor/widget/h$b;->d:D

    .line 427
    .line 428
    sub-double v26, v12, v22

    .line 429
    .line 430
    mul-double v26, v26, v28

    .line 431
    .line 432
    add-double v57, v26, v22

    .line 433
    .line 434
    sub-double v26, v12, v22

    .line 435
    .line 436
    mul-double v26, v26, v34

    .line 437
    .line 438
    add-double v68, v26, v22

    .line 439
    .line 440
    sub-double v26, v12, v22

    .line 441
    .line 442
    mul-double v26, v26, v40

    .line 443
    .line 444
    add-double v79, v26, v22

    .line 445
    .line 446
    sub-double v12, v12, v22

    .line 447
    .line 448
    mul-double v12, v12, v46

    .line 449
    .line 450
    add-double v37, v12, v22

    .line 451
    .line 452
    new-instance v50, Lcom/zte/mifavor/widget/h$b;

    .line 453
    .line 454
    invoke-direct/range {v50 .. v58}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 455
    .line 456
    .line 457
    move-object/from16 v12, v50

    .line 458
    .line 459
    invoke-static {v12, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 460
    .line 461
    .line 462
    move-result-object v12

    .line 463
    move-wide/from16 v26, v57

    .line 464
    .line 465
    move-wide/from16 v56, v53

    .line 466
    .line 467
    new-instance v53, Lcom/zte/mifavor/widget/h$b;

    .line 468
    .line 469
    move-wide/from16 v54, v59

    .line 470
    .line 471
    move-wide/from16 v58, v64

    .line 472
    .line 473
    move-wide/from16 v60, v26

    .line 474
    .line 475
    invoke-direct/range {v53 .. v61}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 476
    .line 477
    .line 478
    move-object/from16 v13, v53

    .line 479
    .line 480
    move-wide/from16 v53, v56

    .line 481
    .line 482
    move-wide/from16 v57, v60

    .line 483
    .line 484
    invoke-static {v13, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 485
    .line 486
    .line 487
    move-result-object v13

    .line 488
    new-instance v61, Lcom/zte/mifavor/widget/h$b;

    .line 489
    .line 490
    move-wide/from16 v64, v24

    .line 491
    .line 492
    invoke-direct/range {v61 .. v69}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 493
    .line 494
    .line 495
    move-wide/from16 v33, v4

    .line 496
    .line 497
    move-object/from16 v4, v61

    .line 498
    .line 499
    move-wide/from16 v26, v68

    .line 500
    .line 501
    move-wide/from16 v67, v64

    .line 502
    .line 503
    invoke-static {v4, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 504
    .line 505
    .line 506
    move-result-object v4

    .line 507
    new-instance v64, Lcom/zte/mifavor/widget/h$b;

    .line 508
    .line 509
    move-wide/from16 v65, v70

    .line 510
    .line 511
    move-wide/from16 v69, v18

    .line 512
    .line 513
    move-wide/from16 v71, v26

    .line 514
    .line 515
    invoke-direct/range {v64 .. v72}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 516
    .line 517
    .line 518
    move-object/from16 v5, v64

    .line 519
    .line 520
    invoke-static {v5, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 521
    .line 522
    .line 523
    move-result-object v5

    .line 524
    new-instance v72, Lcom/zte/mifavor/widget/h$b;

    .line 525
    .line 526
    invoke-direct/range {v72 .. v80}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 527
    .line 528
    .line 529
    move-object/from16 v18, v4

    .line 530
    .line 531
    move-object/from16 v4, v72

    .line 532
    .line 533
    invoke-static {v4, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 534
    .line 535
    .line 536
    move-result-object v4

    .line 537
    move-wide/from16 v107, v79

    .line 538
    .line 539
    move-wide/from16 v78, v75

    .line 540
    .line 541
    move-wide/from16 v76, v81

    .line 542
    .line 543
    move-wide/from16 v82, v107

    .line 544
    .line 545
    new-instance v75, Lcom/zte/mifavor/widget/h$b;

    .line 546
    .line 547
    move-wide/from16 v80, v8

    .line 548
    .line 549
    invoke-direct/range {v75 .. v83}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 550
    .line 551
    .line 552
    move-object/from16 v8, v75

    .line 553
    .line 554
    move-wide/from16 v75, v78

    .line 555
    .line 556
    invoke-static {v8, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 557
    .line 558
    .line 559
    move-result-object v8

    .line 560
    new-instance v30, Lcom/zte/mifavor/widget/h$b;

    .line 561
    .line 562
    move-wide/from16 v35, v20

    .line 563
    .line 564
    move-wide/from16 v31, v84

    .line 565
    .line 566
    invoke-direct/range {v30 .. v38}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 567
    .line 568
    .line 569
    move-object/from16 v9, v30

    .line 570
    .line 571
    invoke-static {v9, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 572
    .line 573
    .line 574
    move-result-object v9

    .line 575
    new-instance v30, Lcom/zte/mifavor/widget/h$b;

    .line 576
    .line 577
    move-wide/from16 v31, v86

    .line 578
    .line 579
    move-wide/from16 v35, v100

    .line 580
    .line 581
    invoke-direct/range {v30 .. v38}, Lcom/zte/mifavor/widget/h$b;-><init>(DDDD)V

    .line 582
    .line 583
    .line 584
    move-object/from16 v19, v4

    .line 585
    .line 586
    move-object/from16 v4, v30

    .line 587
    .line 588
    invoke-static {v4, v10, v11}, Lcom/zte/mifavor/widget/h;->f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;

    .line 589
    .line 590
    .line 591
    move-result-object v4

    .line 592
    new-instance v10, Landroid/graphics/Path;

    .line 593
    .line 594
    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V

    .line 595
    .line 596
    .line 597
    const-wide/16 v14, 0x0

    .line 598
    .line 599
    double-to-float v11, v14

    .line 600
    move-wide/from16 p12, v14

    .line 601
    .line 602
    sub-double v14, v0, v88

    .line 603
    .line 604
    double-to-float v14, v14

    .line 605
    invoke-virtual {v10, v11, v14}, Landroid/graphics/Path;->moveTo(FF)V

    .line 606
    .line 607
    .line 608
    cmpl-double v14, v0, p12

    .line 609
    .line 610
    const-wide v20, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    if-lez v14, :cond_0

    .line 616
    .line 617
    iget-object v14, v12, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 618
    .line 619
    move-object/from16 v24, v4

    .line 620
    .line 621
    move-object v15, v5

    .line 622
    iget-wide v4, v14, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 623
    .line 624
    mul-double/2addr v4, v0

    .line 625
    add-double v4, v4, p12

    .line 626
    .line 627
    double-to-float v4, v4

    .line 628
    move/from16 v40, v4

    .line 629
    .line 630
    iget-wide v4, v14, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 631
    .line 632
    mul-double/2addr v4, v0

    .line 633
    sub-double v4, v0, v4

    .line 634
    .line 635
    double-to-float v4, v4

    .line 636
    iget-object v5, v12, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 637
    .line 638
    move-wide/from16 v28, v6

    .line 639
    .line 640
    iget-wide v6, v5, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 641
    .line 642
    mul-double/2addr v6, v0

    .line 643
    add-double v6, v6, p12

    .line 644
    .line 645
    double-to-float v6, v6

    .line 646
    move/from16 v41, v4

    .line 647
    .line 648
    iget-wide v4, v5, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 649
    .line 650
    mul-double/2addr v4, v0

    .line 651
    sub-double v4, v0, v4

    .line 652
    .line 653
    double-to-float v4, v4

    .line 654
    iget-object v5, v12, Lcom/zte/mifavor/widget/h$a;->d:Lcom/zte/mifavor/widget/h$c;

    .line 655
    .line 656
    move/from16 v42, v6

    .line 657
    .line 658
    iget-wide v6, v5, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 659
    .line 660
    mul-double/2addr v6, v0

    .line 661
    add-double v6, v6, p12

    .line 662
    .line 663
    double-to-float v6, v6

    .line 664
    move/from16 v43, v4

    .line 665
    .line 666
    iget-wide v4, v5, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 667
    .line 668
    mul-double/2addr v4, v0

    .line 669
    sub-double v4, v0, v4

    .line 670
    .line 671
    double-to-float v4, v4

    .line 672
    move/from16 v45, v4

    .line 673
    .line 674
    move/from16 v44, v6

    .line 675
    .line 676
    move-object/from16 v39, v10

    .line 677
    .line 678
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 679
    .line 680
    .line 681
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 682
    .line 683
    invoke-direct {v5, v0, v1, v0, v1}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 684
    .line 685
    .line 686
    div-double v6, v22, v57

    .line 687
    .line 688
    sub-double v30, v22, v53

    .line 689
    .line 690
    mul-double v30, v30, v20

    .line 691
    .line 692
    mul-double v30, v30, v16

    .line 693
    .line 694
    const-wide v35, 0x400921fb54442d18L    # Math.PI

    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    add-double v30, v30, v35

    .line 700
    .line 701
    mul-double v53, v53, v20

    .line 702
    .line 703
    move-object/from16 v104, v8

    .line 704
    .line 705
    move-object/from16 v105, v9

    .line 706
    .line 707
    move-object v14, v15

    .line 708
    move-object/from16 v106, v24

    .line 709
    .line 710
    move-wide/from16 v102, v28

    .line 711
    .line 712
    move-object/from16 v4, v39

    .line 713
    .line 714
    move-wide v8, v6

    .line 715
    move v15, v11

    .line 716
    move-wide/from16 v10, v30

    .line 717
    .line 718
    move-wide v6, v0

    .line 719
    move-object v0, v13

    .line 720
    move-object/from16 v1, v18

    .line 721
    .line 722
    move-wide/from16 v12, v53

    .line 723
    .line 724
    invoke-static/range {v4 .. v13}, Lcom/zte/mifavor/widget/h;->a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/h$c;DDDD)V

    .line 725
    .line 726
    .line 727
    iget-object v4, v0, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 728
    .line 729
    iget-wide v5, v4, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 730
    .line 731
    mul-double v5, v5, p4

    .line 732
    .line 733
    sub-double v5, p4, v5

    .line 734
    .line 735
    double-to-float v5, v5

    .line 736
    iget-wide v6, v4, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 737
    .line 738
    mul-double v6, v6, p4

    .line 739
    .line 740
    add-double v6, v6, p12

    .line 741
    .line 742
    double-to-float v4, v6

    .line 743
    iget-object v6, v0, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 744
    .line 745
    iget-wide v7, v6, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 746
    .line 747
    mul-double v7, v7, p4

    .line 748
    .line 749
    sub-double v7, p4, v7

    .line 750
    .line 751
    double-to-float v7, v7

    .line 752
    iget-wide v8, v6, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 753
    .line 754
    mul-double v8, v8, p4

    .line 755
    .line 756
    add-double v8, v8, p12

    .line 757
    .line 758
    double-to-float v6, v8

    .line 759
    iget-object v8, v0, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 760
    .line 761
    iget-wide v8, v8, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 762
    .line 763
    mul-double v8, v8, p4

    .line 764
    .line 765
    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 766
    .line 767
    .line 768
    move-result-wide v2

    .line 769
    sub-double v2, p4, v2

    .line 770
    .line 771
    double-to-float v2, v2

    .line 772
    iget-object v0, v0, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 773
    .line 774
    iget-wide v8, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 775
    .line 776
    mul-double v8, v8, p4

    .line 777
    .line 778
    add-double v8, v8, p12

    .line 779
    .line 780
    double-to-float v0, v8

    .line 781
    move/from16 v45, v0

    .line 782
    .line 783
    move/from16 v44, v2

    .line 784
    .line 785
    move/from16 v41, v4

    .line 786
    .line 787
    move/from16 v40, v5

    .line 788
    .line 789
    move/from16 v43, v6

    .line 790
    .line 791
    move/from16 v42, v7

    .line 792
    .line 793
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 794
    .line 795
    .line 796
    move-object/from16 v4, v39

    .line 797
    .line 798
    goto :goto_0

    .line 799
    :cond_0
    move-object/from16 v106, v4

    .line 800
    .line 801
    move-object v14, v5

    .line 802
    move-wide/from16 v102, v6

    .line 803
    .line 804
    move-object/from16 v104, v8

    .line 805
    .line 806
    move-object/from16 v105, v9

    .line 807
    .line 808
    move-object v4, v10

    .line 809
    move v15, v11

    .line 810
    move-object/from16 v1, v18

    .line 811
    .line 812
    :goto_0
    sub-double v2, p0, p6

    .line 813
    .line 814
    add-double v5, v2, v90

    .line 815
    .line 816
    double-to-float v0, v5

    .line 817
    invoke-virtual {v4, v0, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 818
    .line 819
    .line 820
    cmpl-double v0, p6, p12

    .line 821
    .line 822
    if-lez v0, :cond_1

    .line 823
    .line 824
    iget-object v0, v1, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 825
    .line 826
    iget-wide v5, v0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 827
    .line 828
    mul-double v5, v5, p6

    .line 829
    .line 830
    add-double/2addr v5, v2

    .line 831
    double-to-float v5, v5

    .line 832
    iget-wide v6, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 833
    .line 834
    mul-double v6, v6, p6

    .line 835
    .line 836
    add-double v6, v6, p12

    .line 837
    .line 838
    double-to-float v0, v6

    .line 839
    iget-object v6, v1, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 840
    .line 841
    iget-wide v7, v6, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 842
    .line 843
    mul-double v7, v7, p6

    .line 844
    .line 845
    add-double/2addr v7, v2

    .line 846
    double-to-float v7, v7

    .line 847
    iget-wide v8, v6, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 848
    .line 849
    mul-double v8, v8, p6

    .line 850
    .line 851
    add-double v8, v8, p12

    .line 852
    .line 853
    double-to-float v6, v8

    .line 854
    iget-object v1, v1, Lcom/zte/mifavor/widget/h$a;->d:Lcom/zte/mifavor/widget/h$c;

    .line 855
    .line 856
    iget-wide v8, v1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 857
    .line 858
    mul-double v8, v8, p6

    .line 859
    .line 860
    add-double/2addr v8, v2

    .line 861
    double-to-float v8, v8

    .line 862
    iget-wide v9, v1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 863
    .line 864
    mul-double v9, v9, p6

    .line 865
    .line 866
    add-double v9, v9, p12

    .line 867
    .line 868
    double-to-float v1, v9

    .line 869
    move/from16 v41, v0

    .line 870
    .line 871
    move/from16 v45, v1

    .line 872
    .line 873
    move-object/from16 v39, v4

    .line 874
    .line 875
    move/from16 v40, v5

    .line 876
    .line 877
    move/from16 v43, v6

    .line 878
    .line 879
    move/from16 v42, v7

    .line 880
    .line 881
    move/from16 v44, v8

    .line 882
    .line 883
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 884
    .line 885
    .line 886
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 887
    .line 888
    move-wide/from16 v6, p6

    .line 889
    .line 890
    invoke-direct {v5, v2, v3, v6, v7}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 891
    .line 892
    .line 893
    div-double v8, v22, v26

    .line 894
    .line 895
    sub-double v0, v22, v67

    .line 896
    .line 897
    mul-double v0, v0, v20

    .line 898
    .line 899
    mul-double v0, v0, v16

    .line 900
    .line 901
    const-wide v2, -0x4006de04abbbd2e8L    # -1.5707963267948966

    .line 902
    .line 903
    .line 904
    .line 905
    .line 906
    add-double v10, v0, v2

    .line 907
    .line 908
    mul-double v12, v67, v20

    .line 909
    .line 910
    invoke-static/range {v4 .. v13}, Lcom/zte/mifavor/widget/h;->a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/h$c;DDDD)V

    .line 911
    .line 912
    .line 913
    iget-object v0, v14, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 914
    .line 915
    iget-wide v1, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 916
    .line 917
    mul-double v1, v1, p6

    .line 918
    .line 919
    sub-double v1, p0, v1

    .line 920
    .line 921
    double-to-float v1, v1

    .line 922
    iget-wide v2, v0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 923
    .line 924
    mul-double v2, v2, p6

    .line 925
    .line 926
    sub-double v2, p6, v2

    .line 927
    .line 928
    double-to-float v0, v2

    .line 929
    iget-object v2, v14, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 930
    .line 931
    iget-wide v3, v2, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 932
    .line 933
    mul-double v3, v3, p6

    .line 934
    .line 935
    sub-double v3, p0, v3

    .line 936
    .line 937
    double-to-float v3, v3

    .line 938
    iget-wide v4, v2, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 939
    .line 940
    mul-double v4, v4, p6

    .line 941
    .line 942
    sub-double v4, p6, v4

    .line 943
    .line 944
    double-to-float v2, v4

    .line 945
    iget-object v4, v14, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 946
    .line 947
    iget-wide v5, v4, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 948
    .line 949
    mul-double v5, v5, p6

    .line 950
    .line 951
    sub-double v5, p0, v5

    .line 952
    .line 953
    double-to-float v5, v5

    .line 954
    iget-wide v6, v4, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 955
    .line 956
    mul-double v6, v6, p6

    .line 957
    .line 958
    move-wide/from16 v8, v92

    .line 959
    .line 960
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(DD)D

    .line 961
    .line 962
    .line 963
    move-result-wide v6

    .line 964
    sub-double v6, p6, v6

    .line 965
    .line 966
    double-to-float v4, v6

    .line 967
    move/from16 v41, v0

    .line 968
    .line 969
    move/from16 v40, v1

    .line 970
    .line 971
    move/from16 v43, v2

    .line 972
    .line 973
    move/from16 v42, v3

    .line 974
    .line 975
    move/from16 v45, v4

    .line 976
    .line 977
    move/from16 v44, v5

    .line 978
    .line 979
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 980
    .line 981
    .line 982
    move-object/from16 v4, v39

    .line 983
    .line 984
    :cond_1
    sub-double v0, p2, p8

    .line 985
    .line 986
    move-wide/from16 v2, p0

    .line 987
    .line 988
    double-to-float v5, v2

    .line 989
    add-double v6, v0, v94

    .line 990
    .line 991
    double-to-float v6, v6

    .line 992
    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    .line 993
    .line 994
    .line 995
    cmpl-double v5, p8, p12

    .line 996
    .line 997
    if-lez v5, :cond_2

    .line 998
    .line 999
    move-object/from16 v5, v19

    .line 1000
    .line 1001
    iget-object v6, v5, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 1002
    .line 1003
    iget-wide v7, v6, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1004
    .line 1005
    mul-double v7, v7, p8

    .line 1006
    .line 1007
    sub-double v7, v2, v7

    .line 1008
    .line 1009
    double-to-float v7, v7

    .line 1010
    iget-wide v8, v6, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1011
    .line 1012
    mul-double v8, v8, p8

    .line 1013
    .line 1014
    add-double/2addr v8, v0

    .line 1015
    double-to-float v6, v8

    .line 1016
    iget-object v8, v5, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 1017
    .line 1018
    iget-wide v9, v8, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1019
    .line 1020
    mul-double v9, v9, p8

    .line 1021
    .line 1022
    sub-double v9, v2, v9

    .line 1023
    .line 1024
    double-to-float v9, v9

    .line 1025
    iget-wide v10, v8, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1026
    .line 1027
    mul-double v10, v10, p8

    .line 1028
    .line 1029
    add-double/2addr v10, v0

    .line 1030
    double-to-float v8, v10

    .line 1031
    iget-object v5, v5, Lcom/zte/mifavor/widget/h$a;->d:Lcom/zte/mifavor/widget/h$c;

    .line 1032
    .line 1033
    iget-wide v10, v5, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1034
    .line 1035
    mul-double v10, v10, p8

    .line 1036
    .line 1037
    sub-double v10, v2, v10

    .line 1038
    .line 1039
    double-to-float v10, v10

    .line 1040
    iget-wide v11, v5, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1041
    .line 1042
    mul-double v11, v11, p8

    .line 1043
    .line 1044
    add-double/2addr v11, v0

    .line 1045
    double-to-float v5, v11

    .line 1046
    move-object/from16 v39, v4

    .line 1047
    .line 1048
    move/from16 v45, v5

    .line 1049
    .line 1050
    move/from16 v41, v6

    .line 1051
    .line 1052
    move/from16 v40, v7

    .line 1053
    .line 1054
    move/from16 v43, v8

    .line 1055
    .line 1056
    move/from16 v42, v9

    .line 1057
    .line 1058
    move/from16 v44, v10

    .line 1059
    .line 1060
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1061
    .line 1062
    .line 1063
    new-instance v5, Lcom/zte/mifavor/widget/h$c;

    .line 1064
    .line 1065
    sub-double v2, v2, p8

    .line 1066
    .line 1067
    invoke-direct {v5, v2, v3, v0, v1}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 1068
    .line 1069
    .line 1070
    div-double v8, v22, v82

    .line 1071
    .line 1072
    sub-double v0, v22, v75

    .line 1073
    .line 1074
    mul-double v0, v0, v20

    .line 1075
    .line 1076
    mul-double v0, v0, v16

    .line 1077
    .line 1078
    add-double v10, v0, p12

    .line 1079
    .line 1080
    mul-double v12, v75, v20

    .line 1081
    .line 1082
    move-wide/from16 v6, p8

    .line 1083
    .line 1084
    invoke-static/range {v4 .. v13}, Lcom/zte/mifavor/widget/h;->a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/h$c;DDDD)V

    .line 1085
    .line 1086
    .line 1087
    move-object/from16 v0, v104

    .line 1088
    .line 1089
    iget-object v1, v0, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 1090
    .line 1091
    iget-wide v4, v1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1092
    .line 1093
    mul-double v4, v4, p8

    .line 1094
    .line 1095
    add-double/2addr v4, v2

    .line 1096
    double-to-float v4, v4

    .line 1097
    iget-wide v5, v1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1098
    .line 1099
    mul-double v5, v5, p8

    .line 1100
    .line 1101
    sub-double v5, p2, v5

    .line 1102
    .line 1103
    double-to-float v1, v5

    .line 1104
    iget-object v5, v0, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 1105
    .line 1106
    iget-wide v6, v5, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1107
    .line 1108
    mul-double v6, v6, p8

    .line 1109
    .line 1110
    add-double/2addr v6, v2

    .line 1111
    double-to-float v6, v6

    .line 1112
    iget-wide v7, v5, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1113
    .line 1114
    mul-double v7, v7, p8

    .line 1115
    .line 1116
    sub-double v7, p2, v7

    .line 1117
    .line 1118
    double-to-float v5, v7

    .line 1119
    iget-object v7, v0, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 1120
    .line 1121
    iget-wide v7, v7, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1122
    .line 1123
    mul-double v7, v7, p8

    .line 1124
    .line 1125
    move-wide/from16 v9, v96

    .line 1126
    .line 1127
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->max(DD)D

    .line 1128
    .line 1129
    .line 1130
    move-result-wide v7

    .line 1131
    add-double/2addr v2, v7

    .line 1132
    double-to-float v2, v2

    .line 1133
    iget-object v0, v0, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 1134
    .line 1135
    iget-wide v7, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1136
    .line 1137
    mul-double v7, v7, p8

    .line 1138
    .line 1139
    sub-double v7, p2, v7

    .line 1140
    .line 1141
    double-to-float v0, v7

    .line 1142
    move/from16 v45, v0

    .line 1143
    .line 1144
    move/from16 v41, v1

    .line 1145
    .line 1146
    move/from16 v44, v2

    .line 1147
    .line 1148
    move/from16 v40, v4

    .line 1149
    .line 1150
    move/from16 v43, v5

    .line 1151
    .line 1152
    move/from16 v42, v6

    .line 1153
    .line 1154
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1155
    .line 1156
    .line 1157
    move-object/from16 v4, v39

    .line 1158
    .line 1159
    :cond_2
    sub-double v0, p10, v98

    .line 1160
    .line 1161
    double-to-float v0, v0

    .line 1162
    move-wide/from16 v2, p2

    .line 1163
    .line 1164
    double-to-float v1, v2

    .line 1165
    invoke-virtual {v4, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1166
    .line 1167
    .line 1168
    cmpl-double v0, p10, p12

    .line 1169
    .line 1170
    if-lez v0, :cond_3

    .line 1171
    .line 1172
    move-object/from16 v0, v105

    .line 1173
    .line 1174
    iget-object v1, v0, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 1175
    .line 1176
    iget-wide v5, v1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1177
    .line 1178
    mul-double v5, v5, p10

    .line 1179
    .line 1180
    sub-double v5, p10, v5

    .line 1181
    .line 1182
    double-to-float v5, v5

    .line 1183
    iget-wide v6, v1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1184
    .line 1185
    mul-double v6, v6, p10

    .line 1186
    .line 1187
    sub-double v6, v2, v6

    .line 1188
    .line 1189
    double-to-float v1, v6

    .line 1190
    iget-object v6, v0, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 1191
    .line 1192
    iget-wide v7, v6, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1193
    .line 1194
    mul-double v7, v7, p10

    .line 1195
    .line 1196
    sub-double v7, p10, v7

    .line 1197
    .line 1198
    double-to-float v7, v7

    .line 1199
    iget-wide v8, v6, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1200
    .line 1201
    mul-double v8, v8, p10

    .line 1202
    .line 1203
    sub-double v8, v2, v8

    .line 1204
    .line 1205
    double-to-float v6, v8

    .line 1206
    iget-object v0, v0, Lcom/zte/mifavor/widget/h$a;->d:Lcom/zte/mifavor/widget/h$c;

    .line 1207
    .line 1208
    iget-wide v8, v0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1209
    .line 1210
    mul-double v8, v8, p10

    .line 1211
    .line 1212
    sub-double v8, p10, v8

    .line 1213
    .line 1214
    double-to-float v8, v8

    .line 1215
    iget-wide v9, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1216
    .line 1217
    mul-double v9, v9, p10

    .line 1218
    .line 1219
    sub-double v9, v2, v9

    .line 1220
    .line 1221
    double-to-float v0, v9

    .line 1222
    move/from16 v45, v0

    .line 1223
    .line 1224
    move/from16 v41, v1

    .line 1225
    .line 1226
    move-object/from16 v39, v4

    .line 1227
    .line 1228
    move/from16 v40, v5

    .line 1229
    .line 1230
    move/from16 v43, v6

    .line 1231
    .line 1232
    move/from16 v42, v7

    .line 1233
    .line 1234
    move/from16 v44, v8

    .line 1235
    .line 1236
    invoke-virtual/range {v39 .. v45}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1237
    .line 1238
    .line 1239
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 1240
    .line 1241
    sub-double v1, v2, p10

    .line 1242
    .line 1243
    move-wide/from16 v4, p10

    .line 1244
    .line 1245
    invoke-direct {v0, v4, v5, v1, v2}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 1246
    .line 1247
    .line 1248
    div-double v6, v22, v37

    .line 1249
    .line 1250
    sub-double v22, v22, v33

    .line 1251
    .line 1252
    mul-double v22, v22, v20

    .line 1253
    .line 1254
    mul-double v22, v22, v16

    .line 1255
    .line 1256
    add-double v22, v22, v20

    .line 1257
    .line 1258
    mul-double v8, v33, v20

    .line 1259
    .line 1260
    move-object/from16 p1, v0

    .line 1261
    .line 1262
    move-wide/from16 p2, v4

    .line 1263
    .line 1264
    move-wide/from16 p4, v6

    .line 1265
    .line 1266
    move-wide/from16 p8, v8

    .line 1267
    .line 1268
    move-wide/from16 p6, v22

    .line 1269
    .line 1270
    move-object/from16 p0, v39

    .line 1271
    .line 1272
    invoke-static/range {p0 .. p9}, Lcom/zte/mifavor/widget/h;->a(Landroid/graphics/Path;Lcom/zte/mifavor/widget/h$c;DDDD)V

    .line 1273
    .line 1274
    .line 1275
    move-object/from16 v0, v106

    .line 1276
    .line 1277
    iget-object v3, v0, Lcom/zte/mifavor/widget/h$a;->c:Lcom/zte/mifavor/widget/h$c;

    .line 1278
    .line 1279
    iget-wide v4, v3, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1280
    .line 1281
    mul-double v4, v4, p10

    .line 1282
    .line 1283
    add-double v4, v4, p12

    .line 1284
    .line 1285
    double-to-float v4, v4

    .line 1286
    iget-wide v5, v3, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1287
    .line 1288
    mul-double v5, v5, p10

    .line 1289
    .line 1290
    add-double/2addr v5, v1

    .line 1291
    double-to-float v3, v5

    .line 1292
    iget-object v5, v0, Lcom/zte/mifavor/widget/h$a;->b:Lcom/zte/mifavor/widget/h$c;

    .line 1293
    .line 1294
    iget-wide v6, v5, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1295
    .line 1296
    mul-double v6, v6, p10

    .line 1297
    .line 1298
    add-double v6, v6, p12

    .line 1299
    .line 1300
    double-to-float v6, v6

    .line 1301
    iget-wide v7, v5, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1302
    .line 1303
    mul-double v7, v7, p10

    .line 1304
    .line 1305
    add-double/2addr v7, v1

    .line 1306
    double-to-float v5, v7

    .line 1307
    iget-object v0, v0, Lcom/zte/mifavor/widget/h$a;->a:Lcom/zte/mifavor/widget/h$c;

    .line 1308
    .line 1309
    iget-wide v7, v0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 1310
    .line 1311
    mul-double v7, v7, p10

    .line 1312
    .line 1313
    add-double v7, v7, p12

    .line 1314
    .line 1315
    double-to-float v7, v7

    .line 1316
    iget-wide v8, v0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 1317
    .line 1318
    mul-double v8, v8, p10

    .line 1319
    .line 1320
    move-wide/from16 v10, v102

    .line 1321
    .line 1322
    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(DD)D

    .line 1323
    .line 1324
    .line 1325
    move-result-wide v8

    .line 1326
    add-double/2addr v1, v8

    .line 1327
    double-to-float v0, v1

    .line 1328
    move/from16 p6, v0

    .line 1329
    .line 1330
    move/from16 p2, v3

    .line 1331
    .line 1332
    move/from16 p1, v4

    .line 1333
    .line 1334
    move/from16 p4, v5

    .line 1335
    .line 1336
    move/from16 p3, v6

    .line 1337
    .line 1338
    move/from16 p5, v7

    .line 1339
    .line 1340
    invoke-virtual/range {p0 .. p6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 1341
    .line 1342
    .line 1343
    goto :goto_1

    .line 1344
    :cond_3
    move-object/from16 v39, v4

    .line 1345
    .line 1346
    :goto_1
    invoke-virtual/range {v39 .. v39}, Landroid/graphics/Path;->close()V

    .line 1347
    .line 1348
    .line 1349
    return-object v39
.end method

.method private static e(DDD)D
    .locals 0

    .line 1
    sub-double/2addr p2, p0

    .line 2
    mul-double/2addr p2, p4

    .line 3
    add-double/2addr p0, p2

    .line 4
    return-wide p0
.end method

.method private static f(Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;Lcom/zte/mifavor/widget/h$b;)Lcom/zte/mifavor/widget/h$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/h$b;->e()Lcom/zte/mifavor/widget/h$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
