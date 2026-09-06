.class public Lcom/android/launcher3/dragndrop/I;
.super Lcom/android/launcher3/dragndrop/j;
.source "LauncherDragController.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/dragndrop/j<",
        "Lcom/android/launcher3/C2;",
        ">;"
    }
.end annotation


# instance fields
.field private final x:Lcom/android/launcher3/dragndrop/z;

.field private y:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/j;-><init>(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/I;->y:Z

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/dragndrop/z;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lcom/android/launcher3/dragndrop/z;-><init>(Lcom/android/launcher3/C2;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/I;->x:Lcom/android/launcher3/dragndrop/z;

    .line 13
    .line 14
    return-void
.end method

.method private T(Lcom/android/launcher3/model/data/y;)F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->Y:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lm1/a;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 23
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    check-cast v1, Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const v2, 0x3f99999a    # 1.2f

    .line 32
    .line 33
    .line 34
    if-eqz v1, :cond_5

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 37
    .line 38
    check-cast p0, Lcom/android/launcher3/C2;

    .line 39
    .line 40
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    invoke-interface {p0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_5

    .line 47
    .line 48
    instance-of p0, p1, Lcom/android/launcher3/model/data/A;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const p0, 0x3f47ae14    # 0.78f

    .line 53
    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    instance-of p0, p1, Lcom/android/launcher3/widget/z0;

    .line 57
    .line 58
    if-nez p0, :cond_4

    .line 59
    .line 60
    instance-of p0, p1, Lcom/android/launcher3/widget/y0;

    .line 61
    .line 62
    if-eqz p0, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    const/high16 p0, 0x3f800000    # 1.0f

    .line 66
    .line 67
    return p0

    .line 68
    :cond_4
    :goto_2
    return v2

    .line 69
    :cond_5
    instance-of p0, p1, Lcom/android/launcher3/model/data/A;

    .line 70
    .line 71
    const p1, 0x3f866666    # 1.05f

    .line 72
    .line 73
    .line 74
    if-eqz p0, :cond_6

    .line 75
    .line 76
    return p1

    .line 77
    :cond_6
    if-eqz v0, :cond_7

    .line 78
    .line 79
    return p1

    .line 80
    :cond_7
    return v2
.end method


# virtual methods
.method protected P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p7

    .line 6
    .line 7
    move-object/from16 v3, p8

    .line 8
    .line 9
    move-object/from16 v4, p11

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->A0()Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    if-eqz v5, :cond_0

    .line 16
    .line 17
    iget-boolean v5, v0, Lcom/android/launcher3/dragndrop/I;->y:Z

    .line 18
    .line 19
    if-eqz v5, :cond_0

    .line 20
    .line 21
    iget-object v5, v4, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 22
    .line 23
    if-nez v5, :cond_0

    .line 24
    .line 25
    instance-of v5, v1, Landroid/view/View;

    .line 26
    .line 27
    if-eqz v5, :cond_0

    .line 28
    .line 29
    move-object v5, v1

    .line 30
    check-cast v5, Landroid/view/View;

    .line 31
    .line 32
    new-instance v6, Lcom/android/launcher3/dragndrop/I$a;

    .line 33
    .line 34
    invoke-direct {v6, v0, v5}, Lcom/android/launcher3/dragndrop/I$a;-><init>(Lcom/android/launcher3/dragndrop/I;Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iput-object v6, v4, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 38
    .line 39
    :cond_0
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 40
    .line 41
    check-cast v5, Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 44
    .line 45
    .line 46
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 47
    .line 48
    const/16 v6, 0x40

    .line 49
    .line 50
    const/4 v7, 0x0

    .line 51
    invoke-static {v5, v7, v6}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 52
    .line 53
    .line 54
    iput-object v4, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 55
    .line 56
    iget-object v5, v4, Lcom/android/launcher3/dragndrop/p;->c:Landroid/graphics/Point;

    .line 57
    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    iget-object v6, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 61
    .line 62
    iget-object v8, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 63
    .line 64
    iget v9, v5, Landroid/graphics/Point;->x:I

    .line 65
    .line 66
    iput v9, v8, Landroid/graphics/Point;->x:I

    .line 67
    .line 68
    iput v9, v6, Landroid/graphics/Point;->x:I

    .line 69
    .line 70
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 71
    .line 72
    iput v5, v8, Landroid/graphics/Point;->y:I

    .line 73
    .line 74
    iput v5, v6, Landroid/graphics/Point;->y:I

    .line 75
    .line 76
    :cond_1
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 77
    .line 78
    iget v6, v5, Landroid/graphics/Point;->x:I

    .line 79
    .line 80
    sub-int v11, v6, p4

    .line 81
    .line 82
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 83
    .line 84
    sub-int v12, v5, p5

    .line 85
    .line 86
    if-nez v3, :cond_2

    .line 87
    .line 88
    move v5, v7

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 91
    .line 92
    :goto_0
    if-nez v3, :cond_3

    .line 93
    .line 94
    move v6, v7

    .line 95
    goto :goto_1

    .line 96
    :cond_3
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 97
    .line 98
    :goto_1
    const/4 v8, 0x0

    .line 99
    iput-object v8, v0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 100
    .line 101
    new-instance v8, Lcom/android/launcher3/n0$a;

    .line 102
    .line 103
    iget-object v9, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 104
    .line 105
    check-cast v9, Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {v9}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v9

    .line 111
    invoke-direct {v8, v9}, Lcom/android/launcher3/n0$a;-><init>(Landroid/content/Context;)V

    .line 112
    .line 113
    .line 114
    iput-object v8, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 115
    .line 116
    iput-object v1, v8, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 117
    .line 118
    iget-object v8, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 119
    .line 120
    iget-object v8, v8, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 121
    .line 122
    const/16 v18, 0x1

    .line 123
    .line 124
    if-eqz v8, :cond_4

    .line 125
    .line 126
    const-wide/16 v9, 0x0

    .line 127
    .line 128
    invoke-interface {v8, v9, v10}, Lcom/android/launcher3/dragndrop/p$a;->a(D)Z

    .line 129
    .line 130
    .line 131
    move-result v8

    .line 132
    if-nez v8, :cond_4

    .line 133
    .line 134
    move/from16 v8, v18

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_4
    move v8, v7

    .line 138
    :goto_2
    iput-boolean v8, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 139
    .line 140
    iget-object v8, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 141
    .line 142
    check-cast v8, Lcom/android/launcher3/C2;

    .line 143
    .line 144
    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 145
    .line 146
    .line 147
    invoke-direct {v0, v2}, Lcom/android/launcher3/dragndrop/I;->T(Lcom/android/launcher3/model/data/y;)F

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    iget-object v9, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 152
    .line 153
    check-cast v9, Lcom/android/launcher3/C2;

    .line 154
    .line 155
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    iget-boolean v9, v9, Lcom/android/launcher3/X3;->B0:Z

    .line 160
    .line 161
    if-eqz v9, :cond_6

    .line 162
    .line 163
    instance-of v9, v1, Lcom/android/launcher3/BubbleTextView;

    .line 164
    .line 165
    if-eqz v9, :cond_5

    .line 166
    .line 167
    move-object v9, v1

    .line 168
    check-cast v9, Lcom/android/launcher3/BubbleTextView;

    .line 169
    .line 170
    invoke-virtual {v9}, Lcom/android/launcher3/BubbleTextView;->n0()Z

    .line 171
    .line 172
    .line 173
    move-result v9

    .line 174
    if-eqz v9, :cond_5

    .line 175
    .line 176
    if-eqz p1, :cond_5

    .line 177
    .line 178
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 179
    .line 180
    .line 181
    move-result v9

    .line 182
    if-lez v9, :cond_5

    .line 183
    .line 184
    iget-object v9, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 185
    .line 186
    check-cast v9, Lcom/android/launcher3/C2;

    .line 187
    .line 188
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 189
    .line 190
    .line 191
    move-result-object v9

    .line 192
    iget v9, v9, Lcom/android/launcher3/h0;->B1:I

    .line 193
    .line 194
    iget-object v10, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 195
    .line 196
    check-cast v10, Lcom/android/launcher3/C2;

    .line 197
    .line 198
    invoke-virtual {v10}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 199
    .line 200
    .line 201
    move-result-object v10

    .line 202
    const v13, 0x7f070144

    .line 203
    .line 204
    .line 205
    invoke-virtual {v10, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 206
    .line 207
    .line 208
    move-result v10

    .line 209
    add-int/2addr v9, v10

    .line 210
    const/high16 v10, 0x3f800000    # 1.0f

    .line 211
    .line 212
    int-to-float v9, v9

    .line 213
    mul-float/2addr v9, v10

    .line 214
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 215
    .line 216
    .line 217
    move-result v10

    .line 218
    int-to-float v10, v10

    .line 219
    div-float/2addr v9, v10

    .line 220
    mul-float/2addr v8, v9

    .line 221
    :cond_5
    if-eqz p1, :cond_6

    .line 222
    .line 223
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 224
    .line 225
    .line 226
    move-result v9

    .line 227
    if-lez v9, :cond_6

    .line 228
    .line 229
    iget-object v9, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 230
    .line 231
    check-cast v9, Lcom/android/launcher3/C2;

    .line 232
    .line 233
    invoke-virtual {v9}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 234
    .line 235
    .line 236
    move-result-object v9

    .line 237
    iget v9, v9, Lcom/android/launcher3/h0;->T0:I

    .line 238
    .line 239
    iget-object v10, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 240
    .line 241
    check-cast v10, Lcom/android/launcher3/C2;

    .line 242
    .line 243
    invoke-virtual {v10}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 244
    .line 245
    .line 246
    move-result-object v10

    .line 247
    iget v10, v10, Lcom/android/launcher3/X3;->C:I

    .line 248
    .line 249
    mul-int/lit8 v10, v10, 0x2

    .line 250
    .line 251
    sub-int/2addr v9, v10

    .line 252
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 253
    .line 254
    .line 255
    move-result v10

    .line 256
    int-to-float v10, v10

    .line 257
    mul-float/2addr v10, v8

    .line 258
    int-to-float v9, v9

    .line 259
    cmpl-float v10, v10, v9

    .line 260
    .line 261
    if-lez v10, :cond_6

    .line 262
    .line 263
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 264
    .line 265
    .line 266
    move-result v8

    .line 267
    int-to-float v8, v8

    .line 268
    div-float v8, v9, v8

    .line 269
    .line 270
    :cond_6
    move v15, v8

    .line 271
    iget-object v8, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 272
    .line 273
    if-eqz p1, :cond_7

    .line 274
    .line 275
    move-object v9, v8

    .line 276
    new-instance v8, Lcom/android/launcher3/dragndrop/J;

    .line 277
    .line 278
    iget-object v10, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 279
    .line 280
    check-cast v10, Lcom/android/launcher3/C2;

    .line 281
    .line 282
    move/from16 v13, p9

    .line 283
    .line 284
    move/from16 v14, p10

    .line 285
    .line 286
    move-object v7, v9

    .line 287
    move-object v9, v10

    .line 288
    move-object/from16 v10, p1

    .line 289
    .line 290
    invoke-direct/range {v8 .. v15}, Lcom/android/launcher3/dragndrop/J;-><init>(Lcom/android/launcher3/C2;Landroid/graphics/drawable/Drawable;IIFFF)V

    .line 291
    .line 292
    .line 293
    goto :goto_3

    .line 294
    :cond_7
    move-object v7, v8

    .line 295
    new-instance v8, Lcom/android/launcher3/dragndrop/J;

    .line 296
    .line 297
    iget-object v9, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 298
    .line 299
    check-cast v9, Lcom/android/launcher3/C2;

    .line 300
    .line 301
    move v13, v11

    .line 302
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 303
    .line 304
    .line 305
    move-result v11

    .line 306
    move v14, v12

    .line 307
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 308
    .line 309
    .line 310
    move-result v12

    .line 311
    move-object/from16 v10, p2

    .line 312
    .line 313
    move/from16 v16, p10

    .line 314
    .line 315
    move/from16 v17, v15

    .line 316
    .line 317
    move/from16 v15, p9

    .line 318
    .line 319
    invoke-direct/range {v8 .. v17}, Lcom/android/launcher3/dragndrop/J;-><init>(Lcom/android/launcher3/C2;Landroid/view/View;IIIIFFF)V

    .line 320
    .line 321
    .line 322
    :goto_3
    iput-object v8, v7, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 323
    .line 324
    const/4 v7, 0x4

    .line 325
    invoke-virtual {v8, v7}, Landroid/widget/FrameLayout;->setImportantForAccessibility(I)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v8, v2}, Lcom/android/launcher3/dragndrop/v;->setItemInfo(Lcom/android/launcher3/model/data/y;)V

    .line 329
    .line 330
    .line 331
    instance-of v7, v1, Landroid/view/View;

    .line 332
    .line 333
    if-eqz v7, :cond_8

    .line 334
    .line 335
    check-cast v1, Landroid/view/View;

    .line 336
    .line 337
    invoke-virtual {v8, v1}, Lcom/android/launcher3/dragndrop/v;->setOriginViewForTransformFolderIcon(Landroid/view/View;)V

    .line 338
    .line 339
    .line 340
    :cond_8
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 341
    .line 342
    const/4 v7, 0x0

    .line 343
    iput-boolean v7, v1, Lcom/android/launcher3/n0$a;->e:Z

    .line 344
    .line 345
    iget-object v7, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 346
    .line 347
    iget v9, v7, Landroid/graphics/Point;->x:I

    .line 348
    .line 349
    add-int v5, p4, v5

    .line 350
    .line 351
    sub-int/2addr v9, v5

    .line 352
    iput v9, v1, Lcom/android/launcher3/n0$a;->c:I

    .line 353
    .line 354
    iget v5, v7, Landroid/graphics/Point;->y:I

    .line 355
    .line 356
    add-int v6, p5, v6

    .line 357
    .line 358
    sub-int/2addr v5, v6

    .line 359
    iput v5, v1, Lcom/android/launcher3/n0$a;->d:I

    .line 360
    .line 361
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 362
    .line 363
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/I;->x:Lcom/android/launcher3/dragndrop/z;

    .line 364
    .line 365
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    new-instance v6, Lcom/android/launcher3/dragndrop/G;

    .line 369
    .line 370
    invoke-direct {v6, v5}, Lcom/android/launcher3/dragndrop/G;-><init>(Lcom/android/launcher3/dragndrop/z;)V

    .line 371
    .line 372
    .line 373
    invoke-static {v0, v1, v6}, Lcom/android/launcher3/dragndrop/k;->a(Lcom/android/launcher3/dragndrop/j;Lcom/android/launcher3/dragndrop/p;Ljava/util/function/Consumer;)Lcom/android/launcher3/dragndrop/k;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    iput-object v1, v0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 378
    .line 379
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 380
    .line 381
    iget-boolean v1, v1, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 382
    .line 383
    if-nez v1, :cond_9

    .line 384
    .line 385
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 386
    .line 387
    invoke-static {v8}, LO0/e;->d(Landroid/view/View;)LO0/e;

    .line 388
    .line 389
    .line 390
    move-result-object v5

    .line 391
    iput-object v5, v1, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 392
    .line 393
    :cond_9
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 394
    .line 395
    move-object/from16 v5, p6

    .line 396
    .line 397
    iput-object v5, v1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 398
    .line 399
    iput-object v2, v1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 400
    .line 401
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->makeShallowCopy()Lcom/android/launcher3/model/data/y;

    .line 402
    .line 403
    .line 404
    move-result-object v2

    .line 405
    iput-object v2, v1, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 406
    .line 407
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 408
    .line 409
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 410
    .line 411
    if-eqz v1, :cond_c

    .line 412
    .line 413
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 418
    .line 419
    if-nez v1, :cond_b

    .line 420
    .line 421
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 422
    .line 423
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 424
    .line 425
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 430
    .line 431
    if-eqz v1, :cond_a

    .line 432
    .line 433
    goto :goto_4

    .line 434
    :cond_a
    const/4 v1, 0x0

    .line 435
    goto :goto_5

    .line 436
    :cond_b
    :goto_4
    move/from16 v1, v18

    .line 437
    .line 438
    :goto_5
    invoke-virtual {v8, v1}, Lcom/android/launcher3/dragndrop/v;->setHasDragOffset(Z)V

    .line 439
    .line 440
    .line 441
    :cond_c
    if-eqz v3, :cond_d

    .line 442
    .line 443
    new-instance v1, Landroid/graphics/Rect;

    .line 444
    .line 445
    invoke-direct {v1, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v8, v1}, Lcom/android/launcher3/dragndrop/v;->setDragRegion(Landroid/graphics/Rect;)V

    .line 449
    .line 450
    .line 451
    :cond_d
    invoke-static {}, Lx1/d;->h()Z

    .line 452
    .line 453
    .line 454
    move-result v1

    .line 455
    if-eqz v1, :cond_e

    .line 456
    .line 457
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 458
    .line 459
    check-cast v1, Lcom/android/launcher3/C2;

    .line 460
    .line 461
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 462
    .line 463
    .line 464
    move-result-object v1

    .line 465
    const-string v2, "launcher_start_drag"

    .line 466
    .line 467
    invoke-static {v1, v2}, Lx1/d;->i(Landroid/content/Context;Ljava/lang/String;)V

    .line 468
    .line 469
    .line 470
    const/4 v7, 0x0

    .line 471
    goto :goto_6

    .line 472
    :cond_e
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 473
    .line 474
    check-cast v1, Lcom/android/launcher3/C2;

    .line 475
    .line 476
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    const/4 v7, 0x0

    .line 481
    invoke-virtual {v1, v7}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 482
    .line 483
    .line 484
    :goto_6
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 485
    .line 486
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 487
    .line 488
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 489
    .line 490
    invoke-virtual {v8, v2, v1}, Lcom/android/launcher3/dragndrop/v;->F(II)V

    .line 491
    .line 492
    .line 493
    iput v7, v0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 494
    .line 495
    iget-boolean v1, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 496
    .line 497
    if-nez v1, :cond_f

    .line 498
    .line 499
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->k()V

    .line 500
    .line 501
    .line 502
    goto :goto_7

    .line 503
    :cond_f
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 504
    .line 505
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 506
    .line 507
    if-eqz v1, :cond_10

    .line 508
    .line 509
    iget-object v2, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 510
    .line 511
    invoke-interface {v1, v2}, Lcom/android/launcher3/dragndrop/p$a;->b(Lcom/android/launcher3/n0$a;)V

    .line 512
    .line 513
    .line 514
    :cond_10
    :goto_7
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 515
    .line 516
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 517
    .line 518
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 519
    .line 520
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/dragndrop/j;->F(II)V

    .line 521
    .line 522
    .line 523
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->I()Z

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    if-eqz v1, :cond_12

    .line 528
    .line 529
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 530
    .line 531
    check-cast v1, Lcom/android/launcher3/C2;

    .line 532
    .line 533
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->b3()Z

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    if-nez v1, :cond_11

    .line 538
    .line 539
    iget-object v1, v4, Lcom/android/launcher3/dragndrop/p;->c:Landroid/graphics/Point;

    .line 540
    .line 541
    if-nez v1, :cond_11

    .line 542
    .line 543
    goto :goto_8

    .line 544
    :cond_11
    return-object v8

    .line 545
    :cond_12
    :goto_8
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 546
    .line 547
    new-instance v2, Lcom/android/launcher3/dragndrop/H;

    .line 548
    .line 549
    invoke-direct {v2, v0}, Lcom/android/launcher3/dragndrop/H;-><init>(Lcom/android/launcher3/dragndrop/I;)V

    .line 550
    .line 551
    .line 552
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 553
    .line 554
    .line 555
    return-object v8
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/util/H2;->a(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/I;->y:Z

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/dragndrop/j;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method protected r()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/I;->x:Lcom/android/launcher3/dragndrop/z;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/z;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected s()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/I;->x:Lcom/android/launcher3/dragndrop/z;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/dragndrop/z;->c(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/I;->x:Lcom/android/launcher3/dragndrop/z;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/z;->b()Lcom/android/launcher3/n0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1, v0}, Lcom/android/launcher3/dragndrop/j;->q(Lcom/android/launcher3/n0;Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/dragndrop/j;->s()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method protected t()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    sget-object v1, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 14
    .line 15
    check-cast v0, Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->V0(Z)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 30
    .line 31
    check-cast v0, Lcom/android/launcher3/C2;

    .line 32
    .line 33
    sget-object v1, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 42
    .line 43
    check-cast p0, Lcom/android/launcher3/C2;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 50
    .line 51
    const-wide/16 v1, 0x1f4

    .line 52
    .line 53
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher3/statemanager/d;->I(Lcom/android/launcher3/statemanager/a;J)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method protected x([I)Lcom/android/launcher3/n0;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    check-cast v1, Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->mapCoordInSelfToDescendant(Landroid/view/View;[I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    check-cast p0, Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
