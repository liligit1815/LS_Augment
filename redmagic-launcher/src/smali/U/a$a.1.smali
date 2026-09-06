.class public final LU/a$a;
.super Ljava/lang/Object;
.source "SvgPathParser.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LU/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LU/a$a;-><init>()V

    return-void
.end method

.method private final a(FFFFFFFFF)Ljava/util/List;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFFFFFFF)",
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation

    .line 1
    move/from16 v0, p3

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x4

    .line 9
    int-to-float v2, v2

    .line 10
    mul-float v3, p9, v2

    .line 11
    .line 12
    float-to-double v3, v3

    .line 13
    const-wide v5, 0x400921fb54442d18L    # Math.PI

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    div-double/2addr v3, v5

    .line 19
    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    double-to-int v3, v3

    .line 28
    move/from16 v4, p7

    .line 29
    .line 30
    float-to-double v4, v4

    .line 31
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v6

    .line 35
    double-to-float v6, v6

    .line 36
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    double-to-float v4, v4

    .line 41
    move/from16 v5, p8

    .line 42
    .line 43
    float-to-double v7, v5

    .line 44
    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    .line 45
    .line 46
    .line 47
    move-result-wide v9

    .line 48
    double-to-float v9, v9

    .line 49
    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v7

    .line 53
    double-to-float v7, v7

    .line 54
    neg-float v8, v0

    .line 55
    mul-float v10, v8, v6

    .line 56
    .line 57
    mul-float v11, v10, v7

    .line 58
    .line 59
    mul-float v12, p4, v4

    .line 60
    .line 61
    mul-float v13, v12, v9

    .line 62
    .line 63
    sub-float/2addr v11, v13

    .line 64
    mul-float/2addr v8, v4

    .line 65
    mul-float/2addr v7, v8

    .line 66
    mul-float v13, p4, v6

    .line 67
    .line 68
    mul-float/2addr v9, v13

    .line 69
    add-float/2addr v7, v9

    .line 70
    int-to-float v9, v3

    .line 71
    div-float v9, p9, v9

    .line 72
    .line 73
    const/4 v14, 0x0

    .line 74
    move/from16 v15, p5

    .line 75
    .line 76
    move/from16 v16, p6

    .line 77
    .line 78
    :goto_0
    if-ge v14, v3, :cond_0

    .line 79
    .line 80
    add-float v0, v5, v9

    .line 81
    .line 82
    move/from16 p0, v2

    .line 83
    .line 84
    move/from16 v23, v3

    .line 85
    .line 86
    float-to-double v2, v0

    .line 87
    move-wide/from16 v17, v2

    .line 88
    .line 89
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide v2

    .line 93
    double-to-float v2, v2

    .line 94
    move/from16 v19, v2

    .line 95
    .line 96
    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->cos(D)D

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    double-to-float v2, v2

    .line 101
    mul-float v3, p3, v6

    .line 102
    .line 103
    mul-float/2addr v3, v2

    .line 104
    add-float v3, p1, v3

    .line 105
    .line 106
    mul-float v17, v12, v19

    .line 107
    .line 108
    sub-float v21, v3, v17

    .line 109
    .line 110
    mul-float v3, p3, v4

    .line 111
    .line 112
    mul-float/2addr v3, v2

    .line 113
    add-float v3, p2, v3

    .line 114
    .line 115
    mul-float v17, v13, v19

    .line 116
    .line 117
    add-float v22, v3, v17

    .line 118
    .line 119
    mul-float v3, v10, v19

    .line 120
    .line 121
    mul-float v17, v12, v2

    .line 122
    .line 123
    sub-float v3, v3, v17

    .line 124
    .line 125
    mul-float v17, v8, v19

    .line 126
    .line 127
    mul-float/2addr v2, v13

    .line 128
    add-float v2, v17, v2

    .line 129
    .line 130
    sub-float v5, v0, v5

    .line 131
    .line 132
    move/from16 p4, v0

    .line 133
    .line 134
    const/4 v0, 0x2

    .line 135
    int-to-float v0, v0

    .line 136
    div-float v0, v5, v0

    .line 137
    .line 138
    move/from16 p6, v2

    .line 139
    .line 140
    move/from16 p5, v3

    .line 141
    .line 142
    float-to-double v2, v0

    .line 143
    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    .line 144
    .line 145
    .line 146
    move-result-wide v2

    .line 147
    double-to-float v0, v2

    .line 148
    float-to-double v2, v5

    .line 149
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 150
    .line 151
    .line 152
    move-result-wide v2

    .line 153
    double-to-float v2, v2

    .line 154
    const/4 v3, 0x3

    .line 155
    int-to-float v3, v3

    .line 156
    mul-float v5, v3, v0

    .line 157
    .line 158
    mul-float/2addr v5, v0

    .line 159
    add-float v0, p0, v5

    .line 160
    .line 161
    move v5, v2

    .line 162
    move/from16 v17, v3

    .line 163
    .line 164
    float-to-double v2, v0

    .line 165
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 166
    .line 167
    .line 168
    move-result-wide v2

    .line 169
    double-to-float v0, v2

    .line 170
    const/4 v2, 0x1

    .line 171
    int-to-float v2, v2

    .line 172
    sub-float/2addr v0, v2

    .line 173
    mul-float v2, v5, v0

    .line 174
    .line 175
    div-float v2, v2, v17

    .line 176
    .line 177
    mul-float/2addr v11, v2

    .line 178
    add-float v17, v15, v11

    .line 179
    .line 180
    mul-float/2addr v7, v2

    .line 181
    add-float v18, v16, v7

    .line 182
    .line 183
    mul-float v3, v2, p5

    .line 184
    .line 185
    sub-float v19, v21, v3

    .line 186
    .line 187
    mul-float v2, v2, p6

    .line 188
    .line 189
    sub-float v20, v22, v2

    .line 190
    .line 191
    invoke-static/range {v15 .. v22}, LU/d;->a(FFFFFFFF)LU/c;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    add-int/lit8 v14, v14, 0x1

    .line 199
    .line 200
    move/from16 v2, p0

    .line 201
    .line 202
    move/from16 v0, p3

    .line 203
    .line 204
    move/from16 v5, p4

    .line 205
    .line 206
    move/from16 v11, p5

    .line 207
    .line 208
    move/from16 v7, p6

    .line 209
    .line 210
    move/from16 v15, v21

    .line 211
    .line 212
    move/from16 v16, v22

    .line 213
    .line 214
    move/from16 v3, v23

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :cond_0
    return-object v1
.end method


# virtual methods
.method public final b(FFFFFFFZZ)Ljava/util/List;
    .locals 38
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFFFFFFZZ)",
            "Ljava/util/List<",
            "LU/c;",
            ">;"
        }
    .end annotation

    .line 1
    move/from16 v1, p1

    .line 2
    .line 3
    move/from16 v3, p3

    .line 4
    .line 5
    move/from16 v0, p5

    .line 6
    .line 7
    move/from16 v4, p6

    .line 8
    .line 9
    move/from16 v7, p7

    .line 10
    .line 11
    float-to-double v5, v7

    .line 12
    const/16 v2, 0xb4

    .line 13
    .line 14
    int-to-double v8, v2

    .line 15
    div-double/2addr v5, v8

    .line 16
    const-wide v8, 0x400921fb54442d18L    # Math.PI

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    mul-double/2addr v5, v8

    .line 22
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide v8

    .line 26
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    .line 27
    .line 28
    .line 29
    move-result-wide v10

    .line 30
    float-to-double v12, v1

    .line 31
    mul-double/2addr v12, v8

    .line 32
    move/from16 v2, p2

    .line 33
    .line 34
    float-to-double v14, v2

    .line 35
    mul-double v16, v14, v10

    .line 36
    .line 37
    add-double v12, v12, v16

    .line 38
    .line 39
    move-wide/from16 v16, v8

    .line 40
    .line 41
    float-to-double v7, v0

    .line 42
    div-double/2addr v12, v7

    .line 43
    neg-float v9, v1

    .line 44
    float-to-double v0, v9

    .line 45
    mul-double/2addr v0, v10

    .line 46
    mul-double v14, v14, v16

    .line 47
    .line 48
    add-double/2addr v0, v14

    .line 49
    float-to-double v14, v4

    .line 50
    div-double/2addr v0, v14

    .line 51
    move-wide/from16 v18, v0

    .line 52
    .line 53
    float-to-double v0, v3

    .line 54
    mul-double v0, v0, v16

    .line 55
    .line 56
    move/from16 v9, p4

    .line 57
    .line 58
    move-wide/from16 v20, v0

    .line 59
    .line 60
    float-to-double v0, v9

    .line 61
    mul-double v22, v0, v10

    .line 62
    .line 63
    add-double v20, v20, v22

    .line 64
    .line 65
    div-double v20, v20, v7

    .line 66
    .line 67
    move-wide/from16 v22, v0

    .line 68
    .line 69
    neg-float v0, v3

    .line 70
    float-to-double v0, v0

    .line 71
    mul-double/2addr v0, v10

    .line 72
    mul-double v22, v22, v16

    .line 73
    .line 74
    add-double v0, v0, v22

    .line 75
    .line 76
    div-double/2addr v0, v14

    .line 77
    sub-double v22, v12, v20

    .line 78
    .line 79
    sub-double v24, v18, v0

    .line 80
    .line 81
    add-double v26, v12, v20

    .line 82
    .line 83
    move-wide/from16 v28, v0

    .line 84
    .line 85
    const/4 v0, 0x2

    .line 86
    int-to-double v0, v0

    .line 87
    div-double v26, v26, v0

    .line 88
    .line 89
    add-double v30, v18, v28

    .line 90
    .line 91
    div-double v30, v30, v0

    .line 92
    .line 93
    mul-double v0, v22, v22

    .line 94
    .line 95
    mul-double v32, v24, v24

    .line 96
    .line 97
    add-double v0, v0, v32

    .line 98
    .line 99
    const-wide/16 v32, 0x0

    .line 100
    .line 101
    cmpg-double v34, v0, v32

    .line 102
    .line 103
    if-nez v34, :cond_0

    .line 104
    .line 105
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    return-object v0

    .line 110
    :cond_0
    const-wide/high16 v34, 0x3ff0000000000000L    # 1.0

    .line 111
    .line 112
    div-double v34, v34, v0

    .line 113
    .line 114
    const-wide/high16 v36, 0x3fd0000000000000L    # 0.25

    .line 115
    .line 116
    sub-double v34, v34, v36

    .line 117
    .line 118
    cmpg-double v36, v34, v32

    .line 119
    .line 120
    if-gez v36, :cond_1

    .line 121
    .line 122
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 123
    .line 124
    .line 125
    move-result-wide v0

    .line 126
    const-wide v5, 0x3ffffff583a53b8eL    # 1.99999

    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    div-double/2addr v0, v5

    .line 132
    double-to-float v0, v0

    .line 133
    mul-float v5, p5, v0

    .line 134
    .line 135
    mul-float v6, v4, v0

    .line 136
    .line 137
    move-object/from16 v0, p0

    .line 138
    .line 139
    move/from16 v1, p1

    .line 140
    .line 141
    move/from16 v7, p7

    .line 142
    .line 143
    move/from16 v8, p8

    .line 144
    .line 145
    move v4, v9

    .line 146
    move/from16 v9, p9

    .line 147
    .line 148
    invoke-virtual/range {v0 .. v9}, LU/a$a;->b(FFFFFFFZZ)Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    return-object v0

    .line 153
    :cond_1
    move/from16 v9, p9

    .line 154
    .line 155
    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->sqrt(D)D

    .line 156
    .line 157
    .line 158
    move-result-wide v0

    .line 159
    mul-double v22, v22, v0

    .line 160
    .line 161
    mul-double v0, v0, v24

    .line 162
    .line 163
    move/from16 v2, p8

    .line 164
    .line 165
    if-ne v2, v9, :cond_2

    .line 166
    .line 167
    sub-double v26, v26, v0

    .line 168
    .line 169
    add-double v30, v30, v22

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_2
    add-double v26, v26, v0

    .line 173
    .line 174
    sub-double v30, v30, v22

    .line 175
    .line 176
    :goto_0
    sub-double v0, v18, v30

    .line 177
    .line 178
    sub-double v12, v12, v26

    .line 179
    .line 180
    invoke-static {v0, v1, v12, v13}, Ljava/lang/Math;->atan2(DD)D

    .line 181
    .line 182
    .line 183
    move-result-wide v0

    .line 184
    sub-double v2, v28, v30

    .line 185
    .line 186
    sub-double v12, v20, v26

    .line 187
    .line 188
    invoke-static {v2, v3, v12, v13}, Ljava/lang/Math;->atan2(DD)D

    .line 189
    .line 190
    .line 191
    move-result-wide v2

    .line 192
    sub-double/2addr v2, v0

    .line 193
    cmpl-double v12, v2, v32

    .line 194
    .line 195
    if-ltz v12, :cond_3

    .line 196
    .line 197
    const/4 v13, 0x1

    .line 198
    goto :goto_1

    .line 199
    :cond_3
    const/4 v13, 0x0

    .line 200
    :goto_1
    if-eq v9, v13, :cond_5

    .line 201
    .line 202
    const-wide v18, 0x401921fb54442d18L    # 6.283185307179586

    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    if-lez v12, :cond_4

    .line 208
    .line 209
    sub-double v2, v2, v18

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_4
    add-double v2, v2, v18

    .line 213
    .line 214
    :cond_5
    :goto_2
    mul-double v26, v26, v7

    .line 215
    .line 216
    mul-double v30, v30, v14

    .line 217
    .line 218
    mul-double v8, v26, v16

    .line 219
    .line 220
    mul-double v12, v30, v10

    .line 221
    .line 222
    sub-double/2addr v8, v12

    .line 223
    mul-double v26, v26, v10

    .line 224
    .line 225
    mul-double v30, v30, v16

    .line 226
    .line 227
    add-double v10, v26, v30

    .line 228
    .line 229
    double-to-float v7, v8

    .line 230
    double-to-float v8, v10

    .line 231
    double-to-float v5, v5

    .line 232
    double-to-float v0, v0

    .line 233
    double-to-float v9, v2

    .line 234
    move/from16 v6, p2

    .line 235
    .line 236
    move/from16 v3, p5

    .line 237
    .line 238
    move v1, v7

    .line 239
    move v2, v8

    .line 240
    move v8, v0

    .line 241
    move v7, v5

    .line 242
    move-object/from16 v0, p0

    .line 243
    .line 244
    move/from16 v5, p1

    .line 245
    .line 246
    invoke-direct/range {v0 .. v9}, LU/a$a;->a(FFFFFFFFF)Ljava/util/List;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    return-object v0
.end method
