.class public LH3/e;
.super LH3/d;


# static fields
.field public static f:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final b:Landroid/os/Vibrator;

.field private final c:Z

.field private d:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private e:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LH3/e;->f:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 1
    const-string v0, "PatternHeImpl"

    .line 2
    .line 3
    invoke-direct {p0}, LH3/d;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, p0, LH3/e;->c:Z

    .line 8
    .line 9
    iput-object p1, p0, LH3/e;->e:Landroid/content/Context;

    .line 10
    .line 11
    const-string v1, "vibrator"

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/os/Vibrator;

    .line 18
    .line 19
    iput-object p1, p0, LH3/e;->b:Landroid/os/Vibrator;

    .line 20
    .line 21
    :try_start_0
    const-string p1, "android.os.RichTapVibrationEffect"

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, LH3/e;->d:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catch_0
    const-string p1, "failed to reflect class: \"android.os.RichTapVibrationEffect\"!"

    .line 31
    .line 32
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p1, p0, LH3/e;->d:Ljava/lang/Class;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    :try_start_1
    const-string p1, "android.os.VibrationEffect"

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, LH3/e;->d:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_1
    const-string p0, "failed to reflect class: \"android.os.VibrationEffect\"!"

    .line 49
    .line 50
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_0
    :goto_1
    return-void
.end method

.method private f(Lorg/json/JSONArray;)[I
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    return-object v2

    .line 9
    :cond_0
    const/16 v3, 0xc

    .line 10
    .line 11
    new-array v3, v3, [I

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 14
    .line 15
    .line 16
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 17
    const-string v5, "point\'s time must be less than 5000, intensity must between 0~1, frequency must between -100 and 100"

    .line 18
    .line 19
    const-string v6, "PatternHeImpl"

    .line 20
    .line 21
    const/16 v7, -0x64

    .line 22
    .line 23
    const/16 v8, 0x1388

    .line 24
    .line 25
    const-string v9, "Frequency"

    .line 26
    .line 27
    const-string v12, "Intensity"

    .line 28
    .line 29
    const-string v13, "Time"

    .line 30
    .line 31
    const/4 v14, 0x4

    .line 32
    const/16 v15, 0x64

    .line 33
    .line 34
    move-object/from16 v16, v2

    .line 35
    .line 36
    if-ne v4, v14, :cond_4

    .line 37
    .line 38
    const/4 v14, 0x0

    .line 39
    :goto_0
    if-ge v14, v4, :cond_3

    .line 40
    .line 41
    const-wide/high16 v17, 0x4059000000000000L    # 100.0

    .line 42
    .line 43
    :try_start_1
    invoke-virtual {v1, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v11

    .line 51
    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 52
    .line 53
    .line 54
    move-result-wide v19

    .line 55
    move-object/from16 v21, v3

    .line 56
    .line 57
    mul-double v2, v19, v17

    .line 58
    .line 59
    double-to-int v2, v2

    .line 60
    invoke-virtual {v10, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    const/4 v10, 0x0

    .line 65
    invoke-direct {v0, v11, v10, v8}, LH3/e;->g(III)Z

    .line 66
    .line 67
    .line 68
    move-result v19

    .line 69
    if-eqz v19, :cond_2

    .line 70
    .line 71
    invoke-direct {v0, v2, v10, v15}, LH3/e;->g(III)Z

    .line 72
    .line 73
    .line 74
    move-result v19

    .line 75
    if-eqz v19, :cond_2

    .line 76
    .line 77
    invoke-direct {v0, v3, v7, v15}, LH3/e;->g(III)Z

    .line 78
    .line 79
    .line 80
    move-result v10

    .line 81
    if-nez v10, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    mul-int/lit8 v10, v14, 0x3

    .line 85
    .line 86
    aput v11, v21, v10

    .line 87
    .line 88
    add-int/lit8 v11, v10, 0x1

    .line 89
    .line 90
    aput v2, v21, v11

    .line 91
    .line 92
    add-int/lit8 v10, v10, 0x2

    .line 93
    .line 94
    aput v3, v21, v10

    .line 95
    .line 96
    add-int/lit8 v14, v14, 0x1

    .line 97
    .line 98
    move-object/from16 v3, v21

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catch_0
    move-exception v0

    .line 102
    goto/16 :goto_7

    .line 103
    .line 104
    :cond_2
    :goto_1
    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    return-object v16

    .line 108
    :cond_3
    move-object/from16 v21, v3

    .line 109
    .line 110
    goto/16 :goto_6

    .line 111
    .line 112
    :cond_4
    move-object/from16 v21, v3

    .line 113
    .line 114
    const-wide/high16 v17, 0x4059000000000000L    # 100.0

    .line 115
    .line 116
    if-le v4, v14, :cond_c

    .line 117
    .line 118
    const/16 v2, 0x10

    .line 119
    .line 120
    if-gt v4, v2, :cond_c

    .line 121
    .line 122
    const/4 v10, 0x0

    .line 123
    :goto_2
    if-ge v10, v4, :cond_b

    .line 124
    .line 125
    invoke-virtual {v1, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 134
    .line 135
    .line 136
    move-result-wide v19

    .line 137
    mul-double v7, v19, v17

    .line 138
    .line 139
    double-to-int v7, v7

    .line 140
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    const/4 v8, 0x0

    .line 145
    const/16 v14, 0x1388

    .line 146
    .line 147
    invoke-direct {v0, v3, v8, v14}, LH3/e;->g(III)Z

    .line 148
    .line 149
    .line 150
    move-result v19

    .line 151
    if-eqz v19, :cond_a

    .line 152
    .line 153
    invoke-direct {v0, v7, v8, v15}, LH3/e;->g(III)Z

    .line 154
    .line 155
    .line 156
    move-result v19

    .line 157
    if-eqz v19, :cond_a

    .line 158
    .line 159
    const/16 v11, -0x64

    .line 160
    .line 161
    invoke-direct {v0, v2, v11, v15}, LH3/e;->g(III)Z

    .line 162
    .line 163
    .line 164
    move-result v19

    .line 165
    if-nez v19, :cond_5

    .line 166
    .line 167
    goto :goto_5

    .line 168
    :cond_5
    if-nez v10, :cond_6

    .line 169
    .line 170
    mul-int/lit8 v19, v10, 0x3

    .line 171
    .line 172
    aput v3, v21, v19

    .line 173
    .line 174
    add-int/lit8 v3, v19, 0x1

    .line 175
    .line 176
    aput v7, v21, v3

    .line 177
    .line 178
    add-int/lit8 v19, v19, 0x2

    .line 179
    .line 180
    aput v2, v21, v19

    .line 181
    .line 182
    move-object/from16 v19, v12

    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_6
    add-int/lit8 v8, v4, -0x1

    .line 186
    .line 187
    if-ge v10, v8, :cond_8

    .line 188
    .line 189
    move-object/from16 v19, v12

    .line 190
    .line 191
    int-to-double v11, v10

    .line 192
    int-to-double v14, v4

    .line 193
    const-wide/high16 v22, 0x4000000000000000L    # 2.0

    .line 194
    .line 195
    div-double v14, v14, v22

    .line 196
    .line 197
    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    .line 198
    .line 199
    .line 200
    move-result-wide v22

    .line 201
    cmpg-double v8, v11, v22

    .line 202
    .line 203
    const/4 v11, 0x1

    .line 204
    if-gez v8, :cond_7

    .line 205
    .line 206
    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    .line 207
    .line 208
    .line 209
    move-result-wide v14

    .line 210
    const-wide/high16 v22, 0x3ff0000000000000L    # 1.0

    .line 211
    .line 212
    sub-double v14, v14, v22

    .line 213
    .line 214
    double-to-int v8, v14

    .line 215
    goto :goto_3

    .line 216
    :cond_7
    div-int/lit8 v8, v4, 0x2

    .line 217
    .line 218
    sub-int/2addr v8, v11

    .line 219
    const/4 v11, 0x2

    .line 220
    :goto_3
    mul-int/lit8 v11, v11, 0x3

    .line 221
    .line 222
    aget v12, v21, v11

    .line 223
    .line 224
    div-int/2addr v3, v8

    .line 225
    add-int/2addr v12, v3

    .line 226
    aput v12, v21, v11

    .line 227
    .line 228
    add-int/lit8 v3, v11, 0x1

    .line 229
    .line 230
    aget v12, v21, v3

    .line 231
    .line 232
    div-int/2addr v7, v8

    .line 233
    add-int/2addr v12, v7

    .line 234
    aput v12, v21, v3

    .line 235
    .line 236
    add-int/lit8 v11, v11, 0x2

    .line 237
    .line 238
    aget v3, v21, v11

    .line 239
    .line 240
    div-int/2addr v2, v8

    .line 241
    add-int/2addr v3, v2

    .line 242
    aput v3, v21, v11

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_8
    move-object/from16 v19, v12

    .line 246
    .line 247
    if-ne v10, v8, :cond_9

    .line 248
    .line 249
    const/16 v8, 0x9

    .line 250
    .line 251
    aput v3, v21, v8

    .line 252
    .line 253
    const/16 v3, 0xa

    .line 254
    .line 255
    aput v7, v21, v3

    .line 256
    .line 257
    const/16 v3, 0xb

    .line 258
    .line 259
    aput v2, v21, v3

    .line 260
    .line 261
    :cond_9
    :goto_4
    add-int/lit8 v10, v10, 0x1

    .line 262
    .line 263
    move-object/from16 v12, v19

    .line 264
    .line 265
    const/16 v7, -0x64

    .line 266
    .line 267
    const/16 v8, 0x1388

    .line 268
    .line 269
    const/16 v15, 0x64

    .line 270
    .line 271
    goto/16 :goto_2

    .line 272
    .line 273
    :cond_a
    :goto_5
    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 274
    .line 275
    .line 276
    return-object v16

    .line 277
    :cond_b
    :goto_6
    return-object v21

    .line 278
    :cond_c
    return-object v16

    .line 279
    :catch_1
    move-exception v0

    .line 280
    move-object/from16 v16, v2

    .line 281
    .line 282
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 283
    .line 284
    .line 285
    return-object v16
.end method

.method private g(III)Z
    .locals 0

    .line 1
    if-lt p1, p2, :cond_0

    .line 2
    .line 3
    if-gt p1, p3, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0, v0}, LH3/e;->e(III)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(Ljava/lang/String;IIII)V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p4

    .line 4
    .line 5
    iget-object v2, v0, LH3/e;->b:Landroid/os/Vibrator;

    .line 6
    .line 7
    const-string v3, "PatternHeImpl"

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    const-string v0, "Please call the init method"

    .line 12
    .line 13
    :goto_0
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v2, "play new he api, applyPatternHeWithStringOnNoRichTap"

    .line 18
    .line 19
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    move/from16 v4, p2

    .line 24
    .line 25
    if-ge v4, v2, :cond_1

    .line 26
    .line 27
    const-string v0, "The minimum count of loop pattern is 1"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 31
    .line 32
    move-object/from16 v5, p1

    .line 33
    .line 34
    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v5, "Pattern"

    .line 38
    .line 39
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    const/16 v6, 0x10

    .line 48
    .line 49
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    mul-int/lit8 v6, v5, 0x2

    .line 54
    .line 55
    new-array v7, v6, [J

    .line 56
    .line 57
    new-array v8, v6, [I

    .line 58
    .line 59
    const/4 v9, 0x0

    .line 60
    invoke-static {v8, v9}, Ljava/util/Arrays;->fill([II)V

    .line 61
    .line 62
    .line 63
    move v10, v9

    .line 64
    move v11, v10

    .line 65
    move v12, v11

    .line 66
    :goto_1
    if-ge v10, v5, :cond_9

    .line 67
    .line 68
    invoke-virtual {v4, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    move-result-object v13

    .line 72
    const-string v14, "Event"

    .line 73
    .line 74
    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    move-result-object v13

    .line 78
    const-string v14, "Type"

    .line 79
    .line 80
    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v14

    .line 84
    const-string v15, "continuous"

    .line 85
    .line 86
    invoke-static {v15, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v15
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    const-wide/high16 v16, 0x4059000000000000L    # 100.0

    .line 91
    .line 92
    move/from16 p1, v9

    .line 93
    .line 94
    const-string v9, "Frequency"

    .line 95
    .line 96
    const-string v2, "Intensity"

    .line 97
    .line 98
    const-wide/16 v18, 0x32

    .line 99
    .line 100
    const-wide/16 v20, 0x0

    .line 101
    .line 102
    move-object/from16 p2, v4

    .line 103
    .line 104
    const-string v4, "Parameters"

    .line 105
    .line 106
    move/from16 p5, v5

    .line 107
    .line 108
    const-string v5, "RelativeTime"

    .line 109
    .line 110
    move/from16 v22, v10

    .line 111
    .line 112
    if-eqz v15, :cond_6

    .line 113
    .line 114
    :try_start_1
    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    const-string v14, "Curve"

    .line 119
    .line 120
    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 121
    .line 122
    .line 123
    move-result-object v14

    .line 124
    invoke-direct {v0, v14}, LH3/e;->f(Lorg/json/JSONArray;)[I

    .line 125
    .line 126
    .line 127
    move-result-object v14

    .line 128
    mul-int/lit8 v15, v22, 0x2

    .line 129
    .line 130
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v23

    .line 134
    sub-int v23, v23, v11

    .line 135
    .line 136
    sub-int v11, v23, v12

    .line 137
    .line 138
    int-to-long v11, v11

    .line 139
    aput-wide v11, v7, v15

    .line 140
    .line 141
    cmp-long v11, v11, v20

    .line 142
    .line 143
    if-gez v11, :cond_2

    .line 144
    .line 145
    aput-wide v18, v7, v15

    .line 146
    .line 147
    :cond_2
    aput p1, v8, v15

    .line 148
    .line 149
    const-string v11, "Duration"

    .line 150
    .line 151
    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v11

    .line 155
    const/16 v12, 0x32

    .line 156
    .line 157
    const/16 v10, 0x64

    .line 158
    .line 159
    if-le v11, v12, :cond_3

    .line 160
    .line 161
    if-ge v11, v10, :cond_3

    .line 162
    .line 163
    move v11, v12

    .line 164
    goto :goto_2

    .line 165
    :cond_3
    if-le v11, v10, :cond_4

    .line 166
    .line 167
    add-int/lit8 v11, v11, -0x32

    .line 168
    .line 169
    :cond_4
    :goto_2
    add-int/lit8 v15, v15, 0x1

    .line 170
    .line 171
    move-object/from16 v24, v14

    .line 172
    .line 173
    move v12, v15

    .line 174
    int-to-long v14, v11

    .line 175
    aput-wide v14, v7, v12

    .line 176
    .line 177
    const/4 v14, 0x4

    .line 178
    aget v14, v24, v14

    .line 179
    .line 180
    const/16 v15, 0xff

    .line 181
    .line 182
    mul-int/2addr v14, v15

    .line 183
    div-int/2addr v14, v10

    .line 184
    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    .line 185
    .line 186
    .line 187
    move-result v14

    .line 188
    const/16 v18, 0x7

    .line 189
    .line 190
    move/from16 v19, v10

    .line 191
    .line 192
    aget v10, v24, v18

    .line 193
    .line 194
    mul-int/2addr v10, v15

    .line 195
    div-int/lit8 v10, v10, 0x64

    .line 196
    .line 197
    invoke-static {v10, v15}, Ljava/lang/Math;->min(II)I

    .line 198
    .line 199
    .line 200
    move-result v10

    .line 201
    invoke-static {v14, v10}, Ljava/lang/Math;->max(II)I

    .line 202
    .line 203
    .line 204
    move-result v10

    .line 205
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 210
    .line 211
    .line 212
    move-result v4

    .line 213
    int-to-double v14, v2

    .line 214
    div-double v14, v14, v16

    .line 215
    .line 216
    int-to-double v9, v10

    .line 217
    mul-double/2addr v9, v14

    .line 218
    int-to-double v14, v1

    .line 219
    mul-double/2addr v9, v14

    .line 220
    const-wide v14, 0x406fe00000000000L    # 255.0

    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    div-double/2addr v9, v14

    .line 226
    double-to-int v2, v9

    .line 227
    const/4 v9, 0x1

    .line 228
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    const/16 v9, 0x1e

    .line 233
    .line 234
    if-ge v4, v9, :cond_5

    .line 235
    .line 236
    move/from16 v2, p1

    .line 237
    .line 238
    :cond_5
    aput v2, v8, v12

    .line 239
    .line 240
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    move v12, v11

    .line 245
    const/4 v9, 0x1

    .line 246
    :goto_3
    move v11, v2

    .line 247
    goto :goto_4

    .line 248
    :cond_6
    const-string v10, "transient"

    .line 249
    .line 250
    invoke-static {v10, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v10

    .line 254
    if-eqz v10, :cond_8

    .line 255
    .line 256
    mul-int/lit8 v10, v22, 0x2

    .line 257
    .line 258
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 259
    .line 260
    .line 261
    move-result v14

    .line 262
    sub-int/2addr v14, v11

    .line 263
    sub-int/2addr v14, v12

    .line 264
    int-to-long v11, v14

    .line 265
    aput-wide v11, v7, v10

    .line 266
    .line 267
    cmp-long v11, v11, v20

    .line 268
    .line 269
    if-gez v11, :cond_7

    .line 270
    .line 271
    aput-wide v18, v7, v10

    .line 272
    .line 273
    :cond_7
    aput p1, v8, v10

    .line 274
    .line 275
    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    invoke-static {v2, v4}, LH3/d;->a(II)I

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    add-int/lit8 v10, v10, 0x1

    .line 292
    .line 293
    int-to-long v11, v4

    .line 294
    aput-wide v11, v7, v10

    .line 295
    .line 296
    int-to-double v11, v1

    .line 297
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 298
    .line 299
    mul-double/2addr v11, v14

    .line 300
    int-to-double v14, v2

    .line 301
    mul-double/2addr v11, v14

    .line 302
    div-double v11, v11, v16

    .line 303
    .line 304
    double-to-int v2, v11

    .line 305
    const/16 v15, 0xff

    .line 306
    .line 307
    invoke-static {v2, v15}, Ljava/lang/Math;->min(II)I

    .line 308
    .line 309
    .line 310
    move-result v2

    .line 311
    const/4 v9, 0x1

    .line 312
    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    .line 313
    .line 314
    .line 315
    move-result v2

    .line 316
    aput v2, v8, v10

    .line 317
    .line 318
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 319
    .line 320
    .line 321
    move-result v2

    .line 322
    move v12, v4

    .line 323
    goto :goto_3

    .line 324
    :goto_4
    add-int/lit8 v10, v22, 0x1

    .line 325
    .line 326
    move-object/from16 v4, p2

    .line 327
    .line 328
    move/from16 v5, p5

    .line 329
    .line 330
    move v2, v9

    .line 331
    move/from16 v9, p1

    .line 332
    .line 333
    goto/16 :goto_1

    .line 334
    .line 335
    :cond_8
    const-string v1, "haven\'t get type value"

    .line 336
    .line 337
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    .line 339
    .line 340
    goto :goto_5

    .line 341
    :cond_9
    move/from16 p1, v9

    .line 342
    .line 343
    :goto_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .line 347
    .line 348
    const-string v2, "times:"

    .line 349
    .line 350
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-static {v7}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    .line 366
    .line 367
    move/from16 v9, p1

    .line 368
    .line 369
    :goto_6
    if-ge v9, v6, :cond_a

    .line 370
    .line 371
    aget-wide v1, v7, v9

    .line 372
    .line 373
    add-int/lit8 v9, v9, 0x1

    .line 374
    .line 375
    goto :goto_6

    .line 376
    :cond_a
    iget-object v0, v0, LH3/e;->b:Landroid/os/Vibrator;

    .line 377
    .line 378
    const/4 v1, -0x1

    .line 379
    invoke-static {v7, v8, v1}, Landroid/os/VibrationEffect;->createWaveform([J[II)Landroid/os/VibrationEffect;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 384
    .line 385
    .line 386
    return-void

    .line 387
    :catch_0
    move-exception v0

    .line 388
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 389
    .line 390
    .line 391
    return-void
.end method

.method public e(III)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, LH3/e;->d:Ljava/lang/Class;

    .line 2
    .line 3
    const-string v1, "createPatternHeParameter"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 6
    .line 7
    filled-new-array {v2, v2, v2}, [Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {v0, p2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/os/VibrationEffect;

    .line 37
    .line 38
    iget-object p0, p0, LH3/e;->b:Landroid/os/Vibrator;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    const-string p0, "PatternHeImpl"

    .line 49
    .line 50
    const-string p1, "The system doesn\'t integrate richTap software"

    .line 51
    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    return-void
.end method
