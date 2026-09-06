.class public Lz1/i1$a;
.super Ljava/lang/Object;
.source "GridSizeMigrationDBController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/i1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field final a:Landroid/database/sqlite/SQLiteDatabase;

.field final b:Ljava/lang/String;

.field final c:Landroid/content/Context;

.field d:I

.field e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lz1/i1$a;->d:I

    .line 6
    .line 7
    new-instance v0, Landroid/util/ArrayMap;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lz1/i1$a;->e:Ljava/util/Map;

    .line 13
    .line 14
    iput-object p1, p0, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 15
    .line 16
    iput-object p2, p0, Lz1/i1$a;->b:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p3, p0, Lz1/i1$a;->c:Landroid/content/Context;

    .line 19
    .line 20
    return-void
.end method

.method private a(Lz1/K0;)I
    .locals 7

    .line 1
    const-string v0, "_id"

    .line 2
    .line 3
    const-string v1, "intent"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "container = "

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p0, v0, v1}, Lz1/i1$a;->d([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    move v2, v1

    .line 34
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_1

    .line 39
    .line 40
    :try_start_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    const/4 v4, 0x1

    .line 45
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    iget-object v5, p1, Lz1/K0;->i:Ljava/util/Map;

    .line 52
    .line 53
    invoke-interface {v5, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-nez v5, :cond_0

    .line 58
    .line 59
    iget-object v5, p1, Lz1/K0;->i:Ljava/util/Map;

    .line 60
    .line 61
    new-instance v6, Ljava/util/HashSet;

    .line 62
    .line 63
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v5, p1, Lz1/K0;->i:Ljava/util/Map;

    .line 70
    .line 71
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Ljava/util/Set;

    .line 76
    .line 77
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :catch_0
    iget-object v3, p0, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 86
    .line 87
    iget-object v4, p0, Lz1/i1$a;->b:Ljava/lang/String;

    .line 88
    .line 89
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    filled-new-array {v5}, [I

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-static {v5}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    invoke-static {v3, v4, v5}, Lz1/i1;->x(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/android/launcher3/util/x0;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 106
    .line 107
    .line 108
    return v2
.end method

.method private d([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8

    .line 1
    iget-object v0, p0, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/i1$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    const/4 v7, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    const/4 v5, 0x0

    .line 9
    move-object v2, p1

    .line 10
    move-object v3, p2

    .line 11
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method protected b()Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lz1/i1$a;->e:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 6
    .line 7
    .line 8
    new-instance v2, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v11, "appWidgetProvider"

    .line 14
    .line 15
    const-string v12, "appWidgetId"

    .line 16
    .line 17
    const-string v3, "_id"

    .line 18
    .line 19
    const-string v4, "itemType"

    .line 20
    .line 21
    const-string v5, "screen"

    .line 22
    .line 23
    const-string v6, "cellX"

    .line 24
    .line 25
    const-string v7, "cellY"

    .line 26
    .line 27
    const-string v8, "spanX"

    .line 28
    .line 29
    const-string v9, "spanY"

    .line 30
    .line 31
    const-string v10, "intent"

    .line 32
    .line 33
    filled-new-array/range {v3 .. v12}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v3, "container = -100"

    .line 38
    .line 39
    invoke-direct {v1, v0, v3}, Lz1/i1$a;->d([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v0, "_id"

    .line 44
    .line 45
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const-string v0, "itemType"

    .line 50
    .line 51
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    const-string v0, "screen"

    .line 56
    .line 57
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    const-string v0, "cellX"

    .line 62
    .line 63
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    const-string v0, "cellY"

    .line 68
    .line 69
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    const-string v0, "spanX"

    .line 74
    .line 75
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    const-string v0, "spanY"

    .line 80
    .line 81
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v10

    .line 85
    const-string v0, "intent"

    .line 86
    .line 87
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v11

    .line 91
    const-string v0, "appWidgetProvider"

    .line 92
    .line 93
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v12

    .line 97
    const-string v0, "appWidgetId"

    .line 98
    .line 99
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v13

    .line 103
    new-instance v14, Lcom/android/launcher3/util/x0;

    .line 104
    .line 105
    invoke-direct {v14}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 106
    .line 107
    .line 108
    new-instance v15, Lcom/android/launcher3/widget/Y0;

    .line 109
    .line 110
    iget-object v0, v1, Lz1/i1$a;->c:Landroid/content/Context;

    .line 111
    .line 112
    invoke-direct {v15, v0}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 113
    .line 114
    .line 115
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-eqz v0, :cond_b

    .line 120
    .line 121
    move-object/from16 v16, v14

    .line 122
    .line 123
    new-instance v14, Lz1/K0;

    .line 124
    .line 125
    invoke-direct {v14}, Lz1/K0;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    iput v0, v14, Lcom/android/launcher3/model/data/y;->id:I

    .line 133
    .line 134
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    iput v0, v14, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 139
    .line 140
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, v14, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 145
    .line 146
    move/from16 v17, v4

    .line 147
    .line 148
    iget v4, v1, Lz1/i1$a;->d:I

    .line 149
    .line 150
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    iput v0, v1, Lz1/i1$a;->d:I

    .line 155
    .line 156
    invoke-interface {v3, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput v0, v14, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 161
    .line 162
    invoke-interface {v3, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iput v0, v14, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 167
    .line 168
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput v0, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 173
    .line 174
    invoke-interface {v3, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    iput v0, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 179
    .line 180
    :try_start_0
    iget v0, v14, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 181
    .line 182
    if-eqz v0, :cond_9

    .line 183
    .line 184
    const/4 v4, 0x2

    .line 185
    if-eq v0, v4, :cond_7

    .line 186
    .line 187
    const/4 v4, 0x4

    .line 188
    if-eq v0, v4, :cond_2

    .line 189
    .line 190
    const/4 v4, 0x6

    .line 191
    if-eq v0, v4, :cond_9

    .line 192
    .line 193
    const/16 v4, 0xa

    .line 194
    .line 195
    if-ne v0, v4, :cond_1

    .line 196
    .line 197
    invoke-direct {v1, v14}, Lz1/i1$a;->a(Lz1/K0;)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    const/4 v4, 0x2

    .line 202
    if-ne v0, v4, :cond_0

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    .line 206
    .line 207
    const-string v4, "App pair contains fewer or more than 2 items"

    .line 208
    .line 209
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    throw v0

    .line 213
    :catch_0
    move-exception v0

    .line 214
    move-object/from16 v18, v2

    .line 215
    .line 216
    goto/16 :goto_7

    .line 217
    .line 218
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    .line 219
    .line 220
    const-string v4, "Invalid item type"

    .line 221
    .line 222
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw v0

    .line 226
    :cond_2
    invoke-interface {v3, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, v14, Lz1/K0;->h:Ljava/lang/String;

    .line 231
    .line 232
    invoke-interface {v3, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    iput v0, v14, Lz1/K0;->j:I

    .line 237
    .line 238
    iget-object v0, v14, Lz1/K0;->h:Ljava/lang/String;

    .line 239
    .line 240
    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    iget v4, v14, Lz1/K0;->j:I

    .line 245
    .line 246
    invoke-virtual {v15, v4, v0}, Lcom/android/launcher3/widget/Y0;->g(ILandroid/content/ComponentName;)Lcom/android/launcher3/widget/U;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    if-eqz v0, :cond_3

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->l()Landroid/graphics/Point;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    goto :goto_1

    .line 257
    :cond_3
    const/4 v0, 0x0

    .line 258
    :goto_1
    if-eqz v0, :cond_6

    .line 259
    .line 260
    iget v4, v0, Landroid/graphics/Point;->x:I

    .line 261
    .line 262
    if-lez v4, :cond_4

    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_4
    iget v4, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 266
    .line 267
    :goto_2
    iput v4, v14, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 268
    .line 269
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 270
    .line 271
    if-lez v0, :cond_5

    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_5
    iget v0, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 275
    .line 276
    :goto_3
    iput v0, v14, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 277
    .line 278
    goto :goto_4

    .line 279
    :cond_6
    const/4 v4, 0x2

    .line 280
    iput v4, v14, Lcom/android/launcher3/model/data/y;->minSpanY:I

    .line 281
    .line 282
    iput v4, v14, Lcom/android/launcher3/model/data/y;->minSpanX:I

    .line 283
    .line 284
    goto :goto_4

    .line 285
    :cond_7
    invoke-direct {v1, v14}, Lz1/i1$a;->a(Lz1/K0;)I

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_8

    .line 290
    .line 291
    goto :goto_4

    .line 292
    :cond_8
    new-instance v0, Ljava/lang/Exception;

    .line 293
    .line 294
    const-string v4, "Folder is empty"

    .line 295
    .line 296
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    throw v0

    .line 300
    :cond_9
    invoke-interface {v3, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iput-object v0, v14, Lz1/K0;->g:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 305
    .line 306
    :goto_4
    invoke-interface {v2, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    iget-object v0, v1, Lz1/i1$a;->e:Ljava/util/Map;

    .line 310
    .line 311
    iget v4, v14, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 312
    .line 313
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_a

    .line 322
    .line 323
    iget-object v0, v1, Lz1/i1$a;->e:Ljava/util/Map;

    .line 324
    .line 325
    iget v4, v14, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 326
    .line 327
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    move-object/from16 v18, v2

    .line 332
    .line 333
    new-instance v2, Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 336
    .line 337
    .line 338
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    goto :goto_5

    .line 342
    :cond_a
    move-object/from16 v18, v2

    .line 343
    .line 344
    :goto_5
    iget-object v0, v1, Lz1/i1$a;->e:Ljava/util/Map;

    .line 345
    .line 346
    iget v2, v14, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 347
    .line 348
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    check-cast v0, Ljava/util/List;

    .line 357
    .line 358
    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-object/from16 v14, v16

    .line 362
    .line 363
    :goto_6
    move/from16 v4, v17

    .line 364
    .line 365
    move-object/from16 v2, v18

    .line 366
    .line 367
    goto/16 :goto_0

    .line 368
    .line 369
    :goto_7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 372
    .line 373
    .line 374
    const-string v4, "Removing item "

    .line 375
    .line 376
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    iget v4, v14, Lcom/android/launcher3/model/data/y;->id:I

    .line 380
    .line 381
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    const-string v4, "GridSizeMigrationDBController"

    .line 389
    .line 390
    invoke-static {v4, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 391
    .line 392
    .line 393
    iget v0, v14, Lcom/android/launcher3/model/data/y;->id:I

    .line 394
    .line 395
    move-object/from16 v2, v16

    .line 396
    .line 397
    invoke-virtual {v2, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 398
    .line 399
    .line 400
    move-object v14, v2

    .line 401
    goto :goto_6

    .line 402
    :cond_b
    move-object/from16 v18, v2

    .line 403
    .line 404
    move-object v2, v14

    .line 405
    iget-object v0, v1, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 406
    .line 407
    iget-object v1, v1, Lz1/i1$a;->b:Ljava/lang/String;

    .line 408
    .line 409
    invoke-static {v0, v1, v2}, Lz1/i1;->x(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/android/launcher3/util/x0;)V

    .line 410
    .line 411
    .line 412
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 413
    .line 414
    .line 415
    return-object v18
.end method

.method protected c()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lz1/K0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "_id"

    .line 7
    .line 8
    const-string v2, "itemType"

    .line 9
    .line 10
    const-string v3, "intent"

    .line 11
    .line 12
    const-string v4, "screen"

    .line 13
    .line 14
    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    const-string v6, "container = -101"

    .line 19
    .line 20
    invoke-direct {p0, v5, v6}, Lz1/i1$a;->d([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 41
    .line 42
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-eqz v7, :cond_5

    .line 50
    .line 51
    new-instance v7, Lz1/K0;

    .line 52
    .line 53
    invoke-direct {v7}, Lz1/K0;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    iput v8, v7, Lcom/android/launcher3/model/data/y;->id:I

    .line 61
    .line 62
    invoke-interface {v5, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 63
    .line 64
    .line 65
    move-result v8

    .line 66
    iput v8, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 67
    .line 68
    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    iput v8, v7, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 73
    .line 74
    :try_start_0
    iget v8, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 75
    .line 76
    if-eqz v8, :cond_4

    .line 77
    .line 78
    const/4 v9, 0x2

    .line 79
    if-eq v8, v9, :cond_2

    .line 80
    .line 81
    const/4 v10, 0x6

    .line 82
    if-eq v8, v10, :cond_4

    .line 83
    .line 84
    const/16 v10, 0xa

    .line 85
    .line 86
    if-ne v8, v10, :cond_1

    .line 87
    .line 88
    invoke-direct {p0, v7}, Lz1/i1$a;->a(Lz1/K0;)I

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    if-ne v8, v9, :cond_0

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_0
    new-instance v8, Ljava/lang/Exception;

    .line 96
    .line 97
    const-string v9, "App pair contains fewer or more than 2 items"

    .line 98
    .line 99
    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    throw v8

    .line 103
    :catch_0
    move-exception v8

    .line 104
    goto :goto_2

    .line 105
    :cond_1
    new-instance v8, Ljava/lang/Exception;

    .line 106
    .line 107
    const-string v9, "Invalid item type"

    .line 108
    .line 109
    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    throw v8

    .line 113
    :cond_2
    invoke-direct {p0, v7}, Lz1/i1$a;->a(Lz1/K0;)I

    .line 114
    .line 115
    .line 116
    move-result v8

    .line 117
    if-eqz v8, :cond_3

    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    new-instance v8, Ljava/lang/Exception;

    .line 121
    .line 122
    const-string v9, "Folder is empty"

    .line 123
    .line 124
    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw v8

    .line 128
    :cond_4
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    iput-object v8, v7, Lz1/K0;->g:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .line 134
    :goto_1
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :goto_2
    new-instance v9, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v10, "Removing item "

    .line 144
    .line 145
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget v10, v7, Lcom/android/launcher3/model/data/y;->id:I

    .line 149
    .line 150
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    const-string v10, "GridSizeMigrationDBController"

    .line 158
    .line 159
    invoke-static {v10, v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 160
    .line 161
    .line 162
    iget v7, v7, Lcom/android/launcher3/model/data/y;->id:I

    .line 163
    .line 164
    invoke-virtual {v6, v7}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 165
    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_5
    iget-object v1, p0, Lz1/i1$a;->a:Landroid/database/sqlite/SQLiteDatabase;

    .line 169
    .line 170
    iget-object p0, p0, Lz1/i1$a;->b:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v1, p0, v6}, Lz1/i1;->x(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/android/launcher3/util/x0;)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 176
    .line 177
    .line 178
    return-object v0
.end method
