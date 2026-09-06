.class public Lcom/android/launcher3/o;
.super Ljava/lang/Object;
.source "AutoAlignHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/o$c;
    }
.end annotation


# static fields
.field public static final a:Landroid/animation/TimeInterpolator;

.field private static b:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v2, v0, v0, v1}, LL/a;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/android/launcher3/o;->a:Landroid/animation/TimeInterpolator;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    sput-object v0, Lcom/android/launcher3/o;->b:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    return-void
.end method

.method static bridge synthetic a(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/android/launcher3/o;->b:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-void
.end method

.method private static b(III)I
    .locals 0

    .line 1
    mul-int/2addr p1, p2

    .line 2
    add-int/2addr p0, p1

    .line 3
    return p0
.end method

.method public static c(ZLcom/android/launcher3/util/t0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static d(Lcom/android/launcher3/C2;Landroid/view/View;Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->J1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    if-nez p2, :cond_1

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    if-eqz p1, :cond_6

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    instance-of p2, p2, Lcom/android/launcher3/model/data/y;

    .line 18
    .line 19
    if-nez p2, :cond_2

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v1, "onItemDelete info= "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "AutoAlignHelper"

    .line 48
    .line 49
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 53
    .line 54
    if-gtz v0, :cond_5

    .line 55
    .line 56
    const/16 v2, -0x65

    .line 57
    .line 58
    if-ne v0, v2, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget p2, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 66
    .line 67
    invoke-virtual {v0, p2}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    if-nez p2, :cond_4

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    filled-new-array {p1}, [Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0, v0, p2}, Lcom/android/launcher3/o;->e(Lcom/android/launcher3/C2;Ljava/util/ArrayList;Lcom/android/launcher3/CellLayout;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_5
    :goto_0
    const-string p0, "onItemDelete: item in folder or hotseat, do not need align."

    .line 92
    .line 93
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    :cond_6
    :goto_1
    return-void
.end method

.method public static e(Lcom/android/launcher3/C2;Ljava/util/ArrayList;Lcom/android/launcher3/CellLayout;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/C2;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Lcom/android/launcher3/CellLayout;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/C2;->J1()Z

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_c

    .line 11
    .line 12
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_1c

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto/16 :goto_c

    .line 21
    .line 22
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_2

    .line 27
    .line 28
    goto/16 :goto_c

    .line 29
    .line 30
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v3, "onItemDeletes size= "

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    const-string v3, "AutoAlignHelper"

    .line 52
    .line 53
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    sget-object v2, Lcom/android/launcher3/o;->b:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    const-string v2, "onItemDeletes last animator not done, end it"

    .line 61
    .line 62
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    sget-object v2, Lcom/android/launcher3/o;->b:Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->end()V

    .line 68
    .line 69
    .line 70
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    new-instance v4, Landroid/graphics/Point;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    .line 85
    .line 86
    .line 87
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    const/4 v7, 0x0

    .line 92
    :cond_4
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    const/4 v9, 0x5

    .line 97
    const/4 v10, 0x4

    .line 98
    if-eqz v8, :cond_9

    .line 99
    .line 100
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v8

    .line 104
    check-cast v8, Landroid/view/View;

    .line 105
    .line 106
    instance-of v12, v8, Lcom/android/launcher3/G5;

    .line 107
    .line 108
    if-eqz v12, :cond_4

    .line 109
    .line 110
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v12

    .line 114
    instance-of v12, v12, Lcom/android/launcher3/model/data/y;

    .line 115
    .line 116
    if-eqz v12, :cond_4

    .line 117
    .line 118
    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    check-cast v12, Lcom/android/launcher3/model/data/y;

    .line 123
    .line 124
    iget v13, v12, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 125
    .line 126
    if-eq v13, v10, :cond_4

    .line 127
    .line 128
    if-ne v13, v9, :cond_5

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_5
    instance-of v9, v12, Lcom/android/launcher3/model/data/p;

    .line 132
    .line 133
    if-eqz v9, :cond_8

    .line 134
    .line 135
    move-object v9, v12

    .line 136
    check-cast v9, Lcom/android/launcher3/model/data/p;

    .line 137
    .line 138
    iget v10, v9, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 139
    .line 140
    if-gt v10, v1, :cond_4

    .line 141
    .line 142
    iget v10, v9, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 143
    .line 144
    if-le v10, v1, :cond_6

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_6
    const v10, 0x7f0b00f1

    .line 148
    .line 149
    .line 150
    invoke-virtual {v8, v10}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v10

    .line 154
    if-eqz v10, :cond_7

    .line 155
    .line 156
    instance-of v13, v10, Ljava/lang/Integer;

    .line 157
    .line 158
    if-eqz v13, :cond_7

    .line 159
    .line 160
    check-cast v10, Ljava/lang/Integer;

    .line 161
    .line 162
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 163
    .line 164
    .line 165
    move-result v10

    .line 166
    if-nez v10, :cond_7

    .line 167
    .line 168
    move v11, v1

    .line 169
    goto :goto_1

    .line 170
    :cond_7
    const/4 v11, 0x0

    .line 171
    :goto_1
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 176
    .line 177
    .line 178
    move-result v10

    .line 179
    if-eqz v10, :cond_8

    .line 180
    .line 181
    if-nez v11, :cond_8

    .line 182
    .line 183
    new-instance v8, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    const-string v10, "onItemsDelete folderInfo size=0, continue. folderInfo= "

    .line 189
    .line 190
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    iget-object v9, v9, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 194
    .line 195
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    invoke-static {v3, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_8
    iget v9, v12, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 207
    .line 208
    iget v10, v12, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 209
    .line 210
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 211
    .line 212
    .line 213
    move-result v11

    .line 214
    invoke-static {v9, v10, v11}, Lcom/android/launcher3/o;->b(III)I

    .line 215
    .line 216
    .line 217
    move-result v9

    .line 218
    iget v10, v4, Landroid/graphics/Point;->x:I

    .line 219
    .line 220
    iget v11, v4, Landroid/graphics/Point;->y:I

    .line 221
    .line 222
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 223
    .line 224
    .line 225
    move-result v13

    .line 226
    invoke-static {v10, v11, v13}, Lcom/android/launcher3/o;->b(III)I

    .line 227
    .line 228
    .line 229
    move-result v10

    .line 230
    if-ge v9, v10, :cond_4

    .line 231
    .line 232
    iget v7, v12, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 233
    .line 234
    iput v7, v4, Landroid/graphics/Point;->x:I

    .line 235
    .line 236
    iget v7, v12, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 237
    .line 238
    iput v7, v4, Landroid/graphics/Point;->y:I

    .line 239
    .line 240
    invoke-static {v2, v8}, Lcom/android/launcher3/o$c;->l(Lcom/android/launcher3/K5;Landroid/view/View;)Landroid/graphics/Point;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    goto/16 :goto_0

    .line 245
    .line 246
    :cond_9
    if-eqz v7, :cond_1b

    .line 247
    .line 248
    iget v5, v4, Landroid/graphics/Point;->x:I

    .line 249
    .line 250
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 251
    .line 252
    .line 253
    move-result v8

    .line 254
    if-eq v5, v8, :cond_1b

    .line 255
    .line 256
    iget v5, v4, Landroid/graphics/Point;->y:I

    .line 257
    .line 258
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 259
    .line 260
    .line 261
    move-result v8

    .line 262
    if-ne v5, v8, :cond_a

    .line 263
    .line 264
    goto/16 :goto_b

    .line 265
    .line 266
    :cond_a
    new-instance v5, Ljava/util/ArrayList;

    .line 267
    .line 268
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 269
    .line 270
    .line 271
    move-object/from16 v8, p1

    .line 272
    .line 273
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 274
    .line 275
    .line 276
    const/4 v8, 0x0

    .line 277
    :goto_2
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 278
    .line 279
    .line 280
    move-result v12

    .line 281
    if-ge v8, v12, :cond_b

    .line 282
    .line 283
    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 284
    .line 285
    .line 286
    move-result-object v12

    .line 287
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    add-int/2addr v8, v1

    .line 291
    goto :goto_2

    .line 292
    :cond_b
    new-instance v8, Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 295
    .line 296
    .line 297
    const/4 v12, 0x0

    .line 298
    const/4 v13, 0x0

    .line 299
    :goto_3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 300
    .line 301
    .line 302
    move-result v14

    .line 303
    const/4 v15, -0x1

    .line 304
    if-ge v12, v14, :cond_10

    .line 305
    .line 306
    const/4 v14, 0x0

    .line 307
    :goto_4
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 308
    .line 309
    .line 310
    move-result v6

    .line 311
    if-ge v14, v6, :cond_f

    .line 312
    .line 313
    const/4 v6, 0x0

    .line 314
    :goto_5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 315
    .line 316
    .line 317
    move-result v11

    .line 318
    if-ge v6, v11, :cond_e

    .line 319
    .line 320
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v11

    .line 324
    check-cast v11, Landroid/view/View;

    .line 325
    .line 326
    move/from16 v16, v1

    .line 327
    .line 328
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    instance-of v1, v1, Lc1/b;

    .line 333
    .line 334
    if-eqz v1, :cond_d

    .line 335
    .line 336
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 337
    .line 338
    .line 339
    move-result-object v1

    .line 340
    check-cast v1, Lc1/b;

    .line 341
    .line 342
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 343
    .line 344
    .line 345
    move-result v9

    .line 346
    iget v10, v4, Landroid/graphics/Point;->x:I

    .line 347
    .line 348
    if-ne v9, v10, :cond_c

    .line 349
    .line 350
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 351
    .line 352
    .line 353
    move-result v9

    .line 354
    iget v10, v4, Landroid/graphics/Point;->y:I

    .line 355
    .line 356
    if-ne v9, v10, :cond_c

    .line 357
    .line 358
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 359
    .line 360
    .line 361
    move-result v1

    .line 362
    if-eq v1, v15, :cond_d

    .line 363
    .line 364
    new-instance v1, Ljava/lang/StringBuilder;

    .line 365
    .line 366
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 367
    .line 368
    .line 369
    const-string v6, "onItemsDelete noNeedAutoAlign x= "

    .line 370
    .line 371
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string v6, " y= "

    .line 378
    .line 379
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    .line 391
    .line 392
    move/from16 v13, v16

    .line 393
    .line 394
    goto :goto_6

    .line 395
    :cond_c
    invoke-virtual {v1}, Lc1/b;->a()I

    .line 396
    .line 397
    .line 398
    move-result v9

    .line 399
    if-ne v9, v14, :cond_d

    .line 400
    .line 401
    invoke-virtual {v1}, Lc1/b;->b()I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    if-ne v1, v12, :cond_d

    .line 406
    .line 407
    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    :cond_d
    add-int/lit8 v6, v6, 0x1

    .line 411
    .line 412
    move/from16 v1, v16

    .line 413
    .line 414
    const/4 v9, 0x5

    .line 415
    const/4 v10, 0x4

    .line 416
    goto :goto_5

    .line 417
    :cond_e
    move/from16 v16, v1

    .line 418
    .line 419
    :goto_6
    add-int/lit8 v14, v14, 0x1

    .line 420
    .line 421
    move/from16 v1, v16

    .line 422
    .line 423
    const/4 v9, 0x5

    .line 424
    const/4 v10, 0x4

    .line 425
    goto :goto_4

    .line 426
    :cond_f
    move/from16 v16, v1

    .line 427
    .line 428
    add-int/lit8 v12, v12, 0x1

    .line 429
    .line 430
    const/4 v9, 0x5

    .line 431
    const/4 v10, 0x4

    .line 432
    goto/16 :goto_3

    .line 433
    .line 434
    :cond_10
    move/from16 v16, v1

    .line 435
    .line 436
    if-eqz v13, :cond_11

    .line 437
    .line 438
    const-string v0, "onItemsDelete noNeedAutoAlign return"

    .line 439
    .line 440
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    .line 442
    .line 443
    return-void

    .line 444
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 445
    .line 446
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 447
    .line 448
    .line 449
    const-string v5, "onItemsDelete startCell= "

    .line 450
    .line 451
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 452
    .line 453
    .line 454
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    const-string v5, " startOffset= "

    .line 458
    .line 459
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 463
    .line 464
    .line 465
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    .line 471
    .line 472
    new-instance v1, Ljava/util/ArrayList;

    .line 473
    .line 474
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 475
    .line 476
    .line 477
    new-instance v5, Landroid/util/Pair;

    .line 478
    .line 479
    invoke-direct {v5, v4, v7}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 483
    .line 484
    .line 485
    new-instance v4, Ljava/util/ArrayList;

    .line 486
    .line 487
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .line 489
    .line 490
    const/4 v5, 0x0

    .line 491
    :goto_7
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 492
    .line 493
    .line 494
    move-result v6

    .line 495
    if-ge v5, v6, :cond_19

    .line 496
    .line 497
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object v6

    .line 501
    check-cast v6, Landroid/view/View;

    .line 502
    .line 503
    instance-of v7, v6, Lcom/android/launcher3/G5;

    .line 504
    .line 505
    if-eqz v7, :cond_18

    .line 506
    .line 507
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v7

    .line 511
    instance-of v7, v7, Lcom/android/launcher3/model/data/y;

    .line 512
    .line 513
    if-eqz v7, :cond_18

    .line 514
    .line 515
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v7

    .line 519
    check-cast v7, Lcom/android/launcher3/model/data/y;

    .line 520
    .line 521
    iget v9, v7, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 522
    .line 523
    const/4 v10, 0x4

    .line 524
    if-eq v9, v10, :cond_18

    .line 525
    .line 526
    const/4 v11, 0x5

    .line 527
    if-ne v9, v11, :cond_12

    .line 528
    .line 529
    goto/16 :goto_a

    .line 530
    .line 531
    :cond_12
    instance-of v9, v7, Lcom/android/launcher3/model/data/p;

    .line 532
    .line 533
    if-eqz v9, :cond_14

    .line 534
    .line 535
    iget v9, v7, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 536
    .line 537
    move/from16 v12, v16

    .line 538
    .line 539
    if-gt v9, v12, :cond_13

    .line 540
    .line 541
    iget v9, v7, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 542
    .line 543
    if-le v9, v12, :cond_14

    .line 544
    .line 545
    :cond_13
    move/from16 v16, v12

    .line 546
    .line 547
    goto/16 :goto_a

    .line 548
    .line 549
    :cond_14
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 550
    .line 551
    .line 552
    move-result-object v9

    .line 553
    instance-of v9, v9, Lc1/b;

    .line 554
    .line 555
    if-eqz v9, :cond_15

    .line 556
    .line 557
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 558
    .line 559
    .line 560
    move-result-object v9

    .line 561
    check-cast v9, Lc1/b;

    .line 562
    .line 563
    const/4 v12, 0x0

    .line 564
    iput-boolean v12, v9, Lc1/b;->e:Z

    .line 565
    .line 566
    goto :goto_8

    .line 567
    :cond_15
    const/4 v12, 0x0

    .line 568
    :goto_8
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 569
    .line 570
    .line 571
    move-result v9

    .line 572
    if-nez v9, :cond_16

    .line 573
    .line 574
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 575
    .line 576
    .line 577
    move-result-object v9

    .line 578
    check-cast v9, Landroid/util/Pair;

    .line 579
    .line 580
    goto :goto_9

    .line 581
    :cond_16
    new-instance v9, Landroid/util/Pair;

    .line 582
    .line 583
    new-instance v13, Landroid/graphics/Point;

    .line 584
    .line 585
    invoke-direct {v13}, Landroid/graphics/Point;-><init>()V

    .line 586
    .line 587
    .line 588
    new-instance v14, Landroid/graphics/Point;

    .line 589
    .line 590
    invoke-direct {v14}, Landroid/graphics/Point;-><init>()V

    .line 591
    .line 592
    .line 593
    invoke-direct {v9, v13, v14}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 594
    .line 595
    .line 596
    :goto_9
    iget-object v13, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 597
    .line 598
    check-cast v13, Landroid/graphics/Point;

    .line 599
    .line 600
    iget-object v14, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 601
    .line 602
    check-cast v14, Landroid/graphics/Point;

    .line 603
    .line 604
    iget v10, v7, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 605
    .line 606
    iget v11, v7, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 607
    .line 608
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 609
    .line 610
    .line 611
    move-result v12

    .line 612
    invoke-static {v10, v11, v12}, Lcom/android/launcher3/o;->b(III)I

    .line 613
    .line 614
    .line 615
    move-result v10

    .line 616
    iget v11, v13, Landroid/graphics/Point;->x:I

    .line 617
    .line 618
    iget v12, v13, Landroid/graphics/Point;->y:I

    .line 619
    .line 620
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 621
    .line 622
    .line 623
    move-result v15

    .line 624
    invoke-static {v11, v12, v15}, Lcom/android/launcher3/o;->b(III)I

    .line 625
    .line 626
    .line 627
    move-result v11

    .line 628
    if-le v10, v11, :cond_18

    .line 629
    .line 630
    invoke-static {v2, v6}, Lcom/android/launcher3/o$c;->l(Lcom/android/launcher3/K5;Landroid/view/View;)Landroid/graphics/Point;

    .line 631
    .line 632
    .line 633
    move-result-object v10

    .line 634
    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 635
    .line 636
    .line 637
    move-result v11

    .line 638
    const/4 v12, -0x1

    .line 639
    if-eq v11, v12, :cond_17

    .line 640
    .line 641
    new-instance v11, Lcom/android/launcher3/o$c;

    .line 642
    .line 643
    const/4 v15, 0x0

    .line 644
    invoke-direct {v11, v15}, Lcom/android/launcher3/o$c;-><init>(Lcom/android/launcher3/q;)V

    .line 645
    .line 646
    .line 647
    move-object v12, v6

    .line 648
    check-cast v12, Lcom/android/launcher3/G5;

    .line 649
    .line 650
    invoke-static {v11, v12}, Lcom/android/launcher3/o$c;->h(Lcom/android/launcher3/o$c;Lcom/android/launcher3/G5;)V

    .line 651
    .line 652
    .line 653
    invoke-static {v11, v6}, Lcom/android/launcher3/o$c;->k(Lcom/android/launcher3/o$c;Landroid/view/View;)V

    .line 654
    .line 655
    .line 656
    new-instance v6, Landroid/graphics/Point;

    .line 657
    .line 658
    iget v12, v7, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 659
    .line 660
    iget v15, v7, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 661
    .line 662
    invoke-direct {v6, v12, v15}, Landroid/graphics/Point;-><init>(II)V

    .line 663
    .line 664
    .line 665
    invoke-static {v11, v6}, Lcom/android/launcher3/o$c;->i(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V

    .line 666
    .line 667
    .line 668
    new-instance v6, Landroid/graphics/Point;

    .line 669
    .line 670
    iget v12, v13, Landroid/graphics/Point;->x:I

    .line 671
    .line 672
    iget v13, v13, Landroid/graphics/Point;->y:I

    .line 673
    .line 674
    invoke-direct {v6, v12, v13}, Landroid/graphics/Point;-><init>(II)V

    .line 675
    .line 676
    .line 677
    invoke-static {v11, v6}, Lcom/android/launcher3/o$c;->f(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V

    .line 678
    .line 679
    .line 680
    invoke-static {v11, v10}, Lcom/android/launcher3/o$c;->j(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V

    .line 681
    .line 682
    .line 683
    new-instance v6, Landroid/graphics/Point;

    .line 684
    .line 685
    iget v12, v14, Landroid/graphics/Point;->x:I

    .line 686
    .line 687
    iget v13, v14, Landroid/graphics/Point;->y:I

    .line 688
    .line 689
    invoke-direct {v6, v12, v13}, Landroid/graphics/Point;-><init>(II)V

    .line 690
    .line 691
    .line 692
    invoke-static {v11, v6}, Lcom/android/launcher3/o$c;->g(Lcom/android/launcher3/o$c;Landroid/graphics/Point;)V

    .line 693
    .line 694
    .line 695
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 696
    .line 697
    .line 698
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 699
    .line 700
    .line 701
    :cond_17
    new-instance v6, Landroid/util/Pair;

    .line 702
    .line 703
    new-instance v9, Landroid/graphics/Point;

    .line 704
    .line 705
    iget v11, v7, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 706
    .line 707
    iget v7, v7, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 708
    .line 709
    invoke-direct {v9, v11, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 710
    .line 711
    .line 712
    invoke-direct {v6, v9, v10}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 713
    .line 714
    .line 715
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 716
    .line 717
    .line 718
    :cond_18
    const/16 v16, 0x1

    .line 719
    .line 720
    :goto_a
    add-int/lit8 v5, v5, 0x1

    .line 721
    .line 722
    const/4 v15, -0x1

    .line 723
    goto/16 :goto_7

    .line 724
    .line 725
    :cond_19
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    if-eqz v1, :cond_1a

    .line 730
    .line 731
    const-string v0, "onItemsDelete return, animList empty"

    .line 732
    .line 733
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    .line 735
    .line 736
    return-void

    .line 737
    :cond_1a
    new-instance v1, Ljava/lang/StringBuilder;

    .line 738
    .line 739
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 740
    .line 741
    .line 742
    const-string v2, "onItemsDelete need do anim items size= "

    .line 743
    .line 744
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 745
    .line 746
    .line 747
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 748
    .line 749
    .line 750
    move-result v2

    .line 751
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 752
    .line 753
    .line 754
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object v1

    .line 758
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 759
    .line 760
    .line 761
    const/4 v1, 0x2

    .line 762
    new-array v1, v1, [F

    .line 763
    .line 764
    fill-array-data v1, :array_0

    .line 765
    .line 766
    .line 767
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    const-wide/16 v2, 0x96

    .line 772
    .line 773
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 774
    .line 775
    .line 776
    sget-object v2, Lcom/android/launcher3/o;->a:Landroid/animation/TimeInterpolator;

    .line 777
    .line 778
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 779
    .line 780
    .line 781
    new-instance v2, Lcom/android/launcher3/o$a;

    .line 782
    .line 783
    invoke-direct {v2, v4}, Lcom/android/launcher3/o$a;-><init>(Ljava/util/ArrayList;)V

    .line 784
    .line 785
    .line 786
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 787
    .line 788
    .line 789
    new-instance v2, Lcom/android/launcher3/o$b;

    .line 790
    .line 791
    move-object/from16 v3, p0

    .line 792
    .line 793
    invoke-direct {v2, v1, v0, v4, v3}, Lcom/android/launcher3/o$b;-><init>(Landroid/animation/ValueAnimator;Lcom/android/launcher3/CellLayout;Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 794
    .line 795
    .line 796
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 797
    .line 798
    .line 799
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 800
    .line 801
    .line 802
    return-void

    .line 803
    :cond_1b
    :goto_b
    const-string v0, "onItemDeletes return, no available in viewlist"

    .line 804
    .line 805
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 806
    .line 807
    .line 808
    :cond_1c
    :goto_c
    return-void

    .line 809
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
