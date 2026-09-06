.class public Lz1/e;
.super Ljava/lang/Object;
.source "AddPrivateFolderTask.java"

# interfaces
.implements Lcom/android/launcher3/D3$d;


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/e;->a:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;ILz1/y0$b;)V
    .locals 0

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/model/data/p;->B(Lcom/android/launcher3/model/data/y;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/model/data/p;Ljava/util/ArrayList;Lz1/y0$b;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/model/data/p;->M(Ljava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic d(Lz1/o3;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lz1/o3;->Y()Lz1/J3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v2, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 6
    .line 7
    iget v3, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 8
    .line 9
    iget v4, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 10
    .line 11
    iget v5, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 12
    .line 13
    move-object v1, p2

    .line 14
    invoke-virtual/range {v0 .. v5}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic e(Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;Lz1/y0$b;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/lit8 v2, v2, -0x1

    .line 22
    .line 23
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 28
    .line 29
    iget v2, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 30
    .line 31
    instance-of v3, p2, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    move-object v2, p2

    .line 36
    check-cast v2, Lcom/android/launcher3/C2;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 61
    .line 62
    iget v4, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 63
    .line 64
    if-ne v4, v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-interface {p2, p1, v1, v0}, Lz1/y0$b;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method


# virtual methods
.method public a(Lz1/o3;Lz1/y0;Lz1/m;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v3, v0, Lz1/e;->a:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v3, :cond_14

    .line 10
    .line 11
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-nez v3, :cond_14

    .line 16
    .line 17
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto/16 :goto_8

    .line 28
    .line 29
    :cond_0
    invoke-virtual {v1}, Lz1/o3;->V()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    new-instance v4, Lz1/z5;

    .line 38
    .line 39
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v1}, Lz1/o3;->X()Lcom/android/launcher3/D3;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-direct {v4, v2, v5, v6}, Lz1/z5;-><init>(Lz1/y0;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;)V

    .line 48
    .line 49
    .line 50
    new-instance v10, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance v6, Lcom/android/launcher3/util/x0;

    .line 56
    .line 57
    invoke-direct {v6}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 58
    .line 59
    .line 60
    iget-object v5, v2, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 61
    .line 62
    invoke-virtual {v5}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    const/16 v8, 0x20

    .line 71
    .line 72
    const/4 v11, 0x1

    .line 73
    if-eqz v7, :cond_8

    .line 74
    .line 75
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v7

    .line 79
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 80
    .line 81
    instance-of v9, v7, Lcom/android/launcher3/model/data/p;

    .line 82
    .line 83
    if-eqz v9, :cond_1

    .line 84
    .line 85
    check-cast v7, Lcom/android/launcher3/model/data/p;

    .line 86
    .line 87
    invoke-virtual {v7, v8}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_1

    .line 92
    .line 93
    const-string v2, "AddPrivateFolderTask"

    .line 94
    .line 95
    const-string v4, "createPrivateFolder, folder is exist"

    .line 96
    .line 97
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    new-instance v2, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v5, :cond_3

    .line 118
    .line 119
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 124
    .line 125
    invoke-static {v5}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-nez v6, :cond_2

    .line 130
    .line 131
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_3
    const-string v4, "AddPrivateFolderTask"

    .line 136
    .line 137
    new-instance v5, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .line 141
    .line 142
    const-string v6, "updateHideOrShowData privateFolders.removeAll needRemoveInfos: "

    .line 143
    .line 144
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-nez v4, :cond_4

    .line 162
    .line 163
    new-instance v4, Lz1/a;

    .line 164
    .line 165
    invoke-direct {v4, v7, v2}, Lz1/a;-><init>(Lcom/android/launcher3/model/data/p;Ljava/util/ArrayList;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v4}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->M0()Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_4

    .line 180
    .line 181
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    new-instance v5, Lx1/O$b;

    .line 186
    .line 187
    invoke-direct {v5, v2}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v5}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {v4, v2, v11}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 195
    .line 196
    .line 197
    :cond_4
    iget-object v0, v0, Lz1/e;->a:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    :cond_5
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    if-eqz v2, :cond_13

    .line 208
    .line 209
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    check-cast v2, Landroid/util/Pair;

    .line 214
    .line 215
    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 216
    .line 217
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 218
    .line 219
    if-nez v2, :cond_6

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_6
    invoke-static {v7, v2}, Lcom/android/launcher3/resource/h1;->g0(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;)Z

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    if-eqz v4, :cond_7

    .line 227
    .line 228
    const-string v2, "AddPrivateFolderTask"

    .line 229
    .line 230
    const-string v4, "item is already in folder, continue"

    .line 231
    .line 232
    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_7
    iget v4, v7, Lcom/android/launcher3/model/data/y;->id:I

    .line 237
    .line 238
    iput v4, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 239
    .line 240
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    invoke-static {v4, v2, v7}, Lx1/Y;->d(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/p;)I

    .line 245
    .line 246
    .line 247
    move-result v4

    .line 248
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/p;->x()Ljava/util/ArrayList;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    move-object v6, v2

    .line 253
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 254
    .line 255
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    if-nez v5, :cond_5

    .line 260
    .line 261
    new-instance v5, Lz1/b;

    .line 262
    .line 263
    invoke-direct {v5, v7, v2, v4}, Lz1/b;-><init>(Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/model/data/y;I)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v1, v5}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 267
    .line 268
    .line 269
    goto :goto_1

    .line 270
    :cond_8
    monitor-enter p2

    .line 271
    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    .line 272
    .line 273
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 274
    .line 275
    .line 276
    iget-object v0, v0, Lz1/e;->a:Ljava/util/List;

    .line 277
    .line 278
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    :cond_9
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 283
    .line 284
    .line 285
    move-result v7

    .line 286
    if-eqz v7, :cond_c

    .line 287
    .line 288
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v7

    .line 292
    check-cast v7, Landroid/util/Pair;

    .line 293
    .line 294
    iget-object v7, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 295
    .line 296
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 297
    .line 298
    if-nez v7, :cond_a

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_a
    iget v9, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 302
    .line 303
    if-nez v9, :cond_b

    .line 304
    .line 305
    instance-of v9, v7, Lcom/android/launcher3/model/data/F;

    .line 306
    .line 307
    if-eqz v9, :cond_b

    .line 308
    .line 309
    check-cast v7, Lcom/android/launcher3/model/data/F;

    .line 310
    .line 311
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 312
    .line 313
    .line 314
    move-result-object v9

    .line 315
    invoke-interface {v7, v9}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 316
    .line 317
    .line 318
    move-result-object v7

    .line 319
    goto :goto_3

    .line 320
    :catchall_0
    move-exception v0

    .line 321
    goto/16 :goto_7

    .line 322
    .line 323
    :cond_b
    :goto_3
    if-eqz v7, :cond_9

    .line 324
    .line 325
    check-cast v7, Lcom/android/launcher3/model/data/I;

    .line 326
    .line 327
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    goto :goto_2

    .line 331
    :cond_c
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-nez v0, :cond_12

    .line 336
    .line 337
    new-instance v13, Lcom/android/launcher3/model/data/p;

    .line 338
    .line 339
    invoke-direct {v13}, Lcom/android/launcher3/model/data/p;-><init>()V

    .line 340
    .line 341
    .line 342
    const/16 v0, -0x64

    .line 343
    .line 344
    iput v0, v13, Lcom/android/launcher3/model/data/y;->container:I

    .line 345
    .line 346
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    const v7, 0x7f140306

    .line 355
    .line 356
    .line 357
    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iput-object v0, v13, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 362
    .line 363
    const/4 v0, 0x0

    .line 364
    invoke-virtual {v13, v8, v11, v0}, Lcom/android/launcher3/model/data/p;->P(IZLz1/J3;)V

    .line 365
    .line 366
    .line 367
    iput v11, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 368
    .line 369
    iput v11, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 370
    .line 371
    iput v11, v13, Lcom/android/launcher3/model/data/p;->k:I

    .line 372
    .line 373
    iput v11, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 374
    .line 375
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 380
    .line 381
    .line 382
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 391
    .line 392
    .line 393
    move-result v5

    .line 394
    if-eqz v5, :cond_d

    .line 395
    .line 396
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object v5

    .line 400
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 401
    .line 402
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 403
    .line 404
    .line 405
    move-result-object v7

    .line 406
    invoke-static {v7, v5, v13}, Lx1/Y;->d(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/p;)I

    .line 407
    .line 408
    .line 409
    move-result v7

    .line 410
    iput v7, v5, Lcom/android/launcher3/model/data/y;->rank:I

    .line 411
    .line 412
    goto :goto_4

    .line 413
    :cond_d
    invoke-virtual {v2}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 414
    .line 415
    .line 416
    move-result-object v5

    .line 417
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    invoke-static {v0}, Lx1/Y;->e(Landroid/content/Context;)[I

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    const-string v7, "AddPrivateFolderTask"

    .line 426
    .line 427
    new-instance v8, Ljava/lang/StringBuilder;

    .line 428
    .line 429
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 430
    .line 431
    .line 432
    const-string v9, "savedPosition: "

    .line 433
    .line 434
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v9

    .line 441
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v8

    .line 448
    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    .line 450
    .line 451
    array-length v7, v0

    .line 452
    const/4 v12, 0x5

    .line 453
    const/4 v14, 0x4

    .line 454
    const/4 v15, 0x0

    .line 455
    const/16 v16, 0x3

    .line 456
    .line 457
    const/16 v17, 0x2

    .line 458
    .line 459
    if-eqz v7, :cond_e

    .line 460
    .line 461
    aget v7, v0, v11

    .line 462
    .line 463
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 464
    .line 465
    .line 466
    move-result v7

    .line 467
    if-eqz v7, :cond_e

    .line 468
    .line 469
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 470
    .line 471
    .line 472
    move-result-object v7

    .line 473
    invoke-static {v7, v2, v0}, Lx1/Y;->k(Landroid/content/Context;Lz1/y0;[I)Z

    .line 474
    .line 475
    .line 476
    move-result v7

    .line 477
    if-nez v7, :cond_e

    .line 478
    .line 479
    const-string v3, "AddPrivateFolderTask"

    .line 480
    .line 481
    const-string v4, "coords !positionIsOccupied "

    .line 482
    .line 483
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    .line 485
    .line 486
    aget v3, v0, v11

    .line 487
    .line 488
    aget v4, v0, v17

    .line 489
    .line 490
    aget v5, v0, v16

    .line 491
    .line 492
    filled-new-array {v3, v4, v5}, [I

    .line 493
    .line 494
    .line 495
    move-result-object v3

    .line 496
    aget v4, v3, v15

    .line 497
    .line 498
    goto :goto_6

    .line 499
    :cond_e
    array-length v7, v0

    .line 500
    if-eqz v7, :cond_f

    .line 501
    .line 502
    aget v7, v0, v11

    .line 503
    .line 504
    invoke-virtual {v5, v7}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 505
    .line 506
    .line 507
    move-result v7

    .line 508
    if-nez v7, :cond_f

    .line 509
    .line 510
    const-string v4, "AddPrivateFolderTask"

    .line 511
    .line 512
    const-string v7, "saved screen not exit "

    .line 513
    .line 514
    invoke-static {v4, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    .line 516
    .line 517
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 518
    .line 519
    .line 520
    move-result-object v3

    .line 521
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 522
    .line 523
    .line 524
    move-result-object v3

    .line 525
    invoke-virtual {v3}, Lz1/k2;->F()I

    .line 526
    .line 527
    .line 528
    move-result v4

    .line 529
    invoke-virtual {v5, v4}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 530
    .line 531
    .line 532
    invoke-virtual {v6, v4}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 533
    .line 534
    .line 535
    aget v3, v0, v17

    .line 536
    .line 537
    aget v5, v0, v16

    .line 538
    .line 539
    filled-new-array {v4, v3, v5}, [I

    .line 540
    .line 541
    .line 542
    move-result-object v3

    .line 543
    goto :goto_6

    .line 544
    :cond_f
    const-string v3, "AddPrivateFolderTask"

    .line 545
    .line 546
    const-string v7, "findSpaceForItem"

    .line 547
    .line 548
    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 549
    .line 550
    .line 551
    array-length v3, v0

    .line 552
    if-eqz v3, :cond_10

    .line 553
    .line 554
    aget v3, v0, v14

    .line 555
    .line 556
    aget v7, v0, v12

    .line 557
    .line 558
    move v8, v7

    .line 559
    move v7, v3

    .line 560
    goto :goto_5

    .line 561
    :cond_10
    move v7, v11

    .line 562
    move v8, v7

    .line 563
    :goto_5
    iget-boolean v9, v13, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 564
    .line 565
    invoke-virtual/range {v4 .. v9}, Lz1/z5;->c(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;IIZ)[I

    .line 566
    .line 567
    .line 568
    move-result-object v3

    .line 569
    aget v4, v3, v15

    .line 570
    .line 571
    :goto_6
    iput-boolean v15, v13, Lcom/android/launcher3/model/data/y;->isCollisionInWorkspace:Z

    .line 572
    .line 573
    array-length v5, v0

    .line 574
    if-eqz v5, :cond_11

    .line 575
    .line 576
    aget v5, v0, v17

    .line 577
    .line 578
    iput v5, v13, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 579
    .line 580
    aget v5, v0, v16

    .line 581
    .line 582
    iput v5, v13, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 583
    .line 584
    aget v5, v0, v14

    .line 585
    .line 586
    iput v5, v13, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 587
    .line 588
    aget v5, v0, v12

    .line 589
    .line 590
    iput v5, v13, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 591
    .line 592
    const/4 v5, 0x6

    .line 593
    aget v5, v0, v5

    .line 594
    .line 595
    iput v5, v13, Lcom/android/launcher3/model/data/p;->k:I

    .line 596
    .line 597
    const/4 v5, 0x7

    .line 598
    aget v5, v0, v5

    .line 599
    .line 600
    iput v5, v13, Lcom/android/launcher3/model/data/p;->l:I

    .line 601
    .line 602
    const/16 v5, 0x8

    .line 603
    .line 604
    aget v0, v0, v5

    .line 605
    .line 606
    iput v0, v13, Lcom/android/launcher3/model/data/p;->o:I

    .line 607
    .line 608
    :cond_11
    const-string v0, "AddPrivateFolderTask"

    .line 609
    .line 610
    new-instance v5, Ljava/lang/StringBuilder;

    .line 611
    .line 612
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 613
    .line 614
    .line 615
    const-string v7, "coords: "

    .line 616
    .line 617
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 618
    .line 619
    .line 620
    invoke-static {v3}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v7

    .line 624
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    .line 626
    .line 627
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v5

    .line 631
    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    .line 633
    .line 634
    invoke-virtual {v1}, Lz1/o3;->Y()Lz1/J3;

    .line 635
    .line 636
    .line 637
    move-result-object v12

    .line 638
    aget v16, v3, v11

    .line 639
    .line 640
    aget v17, v3, v17

    .line 641
    .line 642
    const/16 v14, -0x64

    .line 643
    .line 644
    move v15, v4

    .line 645
    invoke-virtual/range {v12 .. v17}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 646
    .line 647
    .line 648
    invoke-virtual {v13}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 649
    .line 650
    .line 651
    move-result-object v0

    .line 652
    new-instance v3, Lz1/c;

    .line 653
    .line 654
    invoke-direct {v3, v1, v13}, Lz1/c;-><init>(Lz1/o3;Lcom/android/launcher3/model/data/p;)V

    .line 655
    .line 656
    .line 657
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    .line 658
    .line 659
    .line 660
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 661
    .line 662
    .line 663
    :cond_12
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 664
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 665
    .line 666
    .line 667
    move-result v0

    .line 668
    if-nez v0, :cond_13

    .line 669
    .line 670
    new-instance v0, Lz1/d;

    .line 671
    .line 672
    invoke-direct {v0, v10, v6}, Lz1/d;-><init>(Ljava/util/ArrayList;Lcom/android/launcher3/util/x0;)V

    .line 673
    .line 674
    .line 675
    invoke-virtual {v1, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 676
    .line 677
    .line 678
    :cond_13
    return-void

    .line 679
    :goto_7
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 680
    throw v0

    .line 681
    :cond_14
    :goto_8
    const-string v0, "AddPrivateFolderTask"

    .line 682
    .line 683
    const-string v1, "execute: return!"

    .line 684
    .line 685
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    .line 687
    .line 688
    return-void
.end method
