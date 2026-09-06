.class public LJ1/r;
.super Lcom/android/launcher3/dragndrop/j;
.source "SecondaryDragController.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/dragndrop/j<",
        "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/dragndrop/j;-><init>(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    return-void
.end method

.method static synthetic U(LJ1/r;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic V(LJ1/r;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic W(LJ1/r;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic X(LJ1/r;)Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method protected P(Landroid/graphics/drawable/Drawable;Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p7

    .line 4
    .line 5
    move-object/from16 v2, p8

    .line 6
    .line 7
    move-object/from16 v3, p11

    .line 8
    .line 9
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    check-cast v4, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 12
    .line 13
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 14
    .line 15
    .line 16
    iput-object v3, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 17
    .line 18
    iget-object v3, v3, Lcom/android/launcher3/dragndrop/p;->c:Landroid/graphics/Point;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    iget-object v4, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 23
    .line 24
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 25
    .line 26
    iget v6, v3, Landroid/graphics/Point;->x:I

    .line 27
    .line 28
    iput v6, v5, Landroid/graphics/Point;->x:I

    .line 29
    .line 30
    iput v6, v4, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 33
    .line 34
    iput v3, v5, Landroid/graphics/Point;->y:I

    .line 35
    .line 36
    iput v3, v4, Landroid/graphics/Point;->y:I

    .line 37
    .line 38
    :cond_0
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 39
    .line 40
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 41
    .line 42
    sub-int v8, v4, p4

    .line 43
    .line 44
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 45
    .line 46
    sub-int v9, v3, p5

    .line 47
    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    const/4 v4, 0x0

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget v4, v2, Landroid/graphics/Rect;->left:I

    .line 53
    .line 54
    :goto_0
    if-nez v2, :cond_2

    .line 55
    .line 56
    const/4 v15, 0x0

    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 59
    .line 60
    move v15, v5

    .line 61
    :goto_1
    const/4 v5, 0x0

    .line 62
    iput-object v5, v0, Lcom/android/launcher3/dragndrop/j;->r:Lcom/android/launcher3/n0;

    .line 63
    .line 64
    new-instance v5, Lcom/android/launcher3/n0$a;

    .line 65
    .line 66
    iget-object v6, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 67
    .line 68
    check-cast v6, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 69
    .line 70
    invoke-virtual {v6}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-direct {v5, v6}, Lcom/android/launcher3/n0$a;-><init>(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    iput-object v5, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 78
    .line 79
    move-object/from16 v6, p3

    .line 80
    .line 81
    iput-object v6, v5, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 82
    .line 83
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 84
    .line 85
    iget-object v5, v5, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 86
    .line 87
    const/16 v16, 0x1

    .line 88
    .line 89
    if-eqz v5, :cond_3

    .line 90
    .line 91
    const-wide/16 v6, 0x0

    .line 92
    .line 93
    invoke-interface {v5, v6, v7}, Lcom/android/launcher3/dragndrop/p$a;->a(D)Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-nez v5, :cond_3

    .line 98
    .line 99
    move/from16 v5, v16

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    const/4 v5, 0x0

    .line 103
    :goto_2
    iput-boolean v5, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 104
    .line 105
    iget-object v5, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 106
    .line 107
    check-cast v5, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 108
    .line 109
    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    iget-boolean v6, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 114
    .line 115
    if-eqz v6, :cond_4

    .line 116
    .line 117
    const v6, 0x7f0709ee

    .line 118
    .line 119
    .line 120
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 121
    .line 122
    .line 123
    move-result v5

    .line 124
    int-to-float v5, v5

    .line 125
    :goto_3
    move v12, v5

    .line 126
    goto :goto_4

    .line 127
    :cond_4
    const/4 v5, 0x0

    .line 128
    goto :goto_3

    .line 129
    :goto_4
    iget-object v13, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 130
    .line 131
    if-eqz p1, :cond_5

    .line 132
    .line 133
    new-instance v5, LJ1/u;

    .line 134
    .line 135
    iget-object v6, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 136
    .line 137
    check-cast v6, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 138
    .line 139
    move-object/from16 v7, p1

    .line 140
    .line 141
    move/from16 v10, p9

    .line 142
    .line 143
    move/from16 v11, p10

    .line 144
    .line 145
    invoke-direct/range {v5 .. v12}, LJ1/u;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Landroid/graphics/drawable/Drawable;IIFFF)V

    .line 146
    .line 147
    .line 148
    move-object v3, v13

    .line 149
    goto :goto_5

    .line 150
    :cond_5
    new-instance v5, LJ1/u;

    .line 151
    .line 152
    iget-object v6, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 153
    .line 154
    check-cast v6, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 155
    .line 156
    move v10, v8

    .line 157
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    move v11, v9

    .line 162
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    move-object/from16 v7, p2

    .line 167
    .line 168
    move v14, v12

    .line 169
    move-object v3, v13

    .line 170
    move/from16 v12, p9

    .line 171
    .line 172
    move/from16 v13, p10

    .line 173
    .line 174
    invoke-direct/range {v5 .. v14}, LJ1/u;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Landroid/view/View;IIIIFFF)V

    .line 175
    .line 176
    .line 177
    :goto_5
    iput-object v5, v3, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 178
    .line 179
    invoke-virtual {v5, v1}, Lcom/android/launcher3/dragndrop/v;->setItemInfo(Lcom/android/launcher3/model/data/y;)V

    .line 180
    .line 181
    .line 182
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 183
    .line 184
    const/4 v6, 0x0

    .line 185
    iput-boolean v6, v3, Lcom/android/launcher3/n0$a;->e:Z

    .line 186
    .line 187
    iget-object v6, v0, Lcom/android/launcher3/dragndrop/j;->l:Landroid/graphics/Point;

    .line 188
    .line 189
    iget v7, v6, Landroid/graphics/Point;->x:I

    .line 190
    .line 191
    add-int v4, p4, v4

    .line 192
    .line 193
    sub-int/2addr v7, v4

    .line 194
    iput v7, v3, Lcom/android/launcher3/n0$a;->c:I

    .line 195
    .line 196
    iget v4, v6, Landroid/graphics/Point;->y:I

    .line 197
    .line 198
    add-int v6, p5, v15

    .line 199
    .line 200
    sub-int/2addr v4, v6

    .line 201
    iput v4, v3, Lcom/android/launcher3/n0$a;->d:I

    .line 202
    .line 203
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 204
    .line 205
    new-instance v4, LJ1/p;

    .line 206
    .line 207
    invoke-direct {v4}, LJ1/p;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-static {v0, v3, v4}, Lcom/android/launcher3/dragndrop/k;->a(Lcom/android/launcher3/dragndrop/j;Lcom/android/launcher3/dragndrop/p;Ljava/util/function/Consumer;)Lcom/android/launcher3/dragndrop/k;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    iput-object v3, v0, Lcom/android/launcher3/dragndrop/j;->j:Lcom/android/launcher3/dragndrop/k;

    .line 215
    .line 216
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 217
    .line 218
    iget-boolean v3, v3, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 219
    .line 220
    if-nez v3, :cond_6

    .line 221
    .line 222
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 223
    .line 224
    invoke-static {v5}, LO0/e;->d(Landroid/view/View;)LO0/e;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    iput-object v4, v3, Lcom/android/launcher3/n0$a;->l:LO0/e;

    .line 229
    .line 230
    :cond_6
    iget-object v3, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 231
    .line 232
    move-object/from16 v4, p6

    .line 233
    .line 234
    iput-object v4, v3, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 235
    .line 236
    iput-object v1, v3, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/y;->makeShallowCopy()Lcom/android/launcher3/model/data/y;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iput-object v1, v3, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 243
    .line 244
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 245
    .line 246
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 247
    .line 248
    if-eqz v1, :cond_9

    .line 249
    .line 250
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 255
    .line 256
    if-nez v1, :cond_8

    .line 257
    .line 258
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 259
    .line 260
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 261
    .line 262
    invoke-interface {v1}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 267
    .line 268
    if-eqz v1, :cond_7

    .line 269
    .line 270
    goto :goto_6

    .line 271
    :cond_7
    const/4 v1, 0x0

    .line 272
    goto :goto_7

    .line 273
    :cond_8
    :goto_6
    move/from16 v1, v16

    .line 274
    .line 275
    :goto_7
    invoke-virtual {v5, v1}, Lcom/android/launcher3/dragndrop/v;->setHasDragOffset(Z)V

    .line 276
    .line 277
    .line 278
    :cond_9
    if-eqz v2, :cond_a

    .line 279
    .line 280
    new-instance v1, Landroid/graphics/Rect;

    .line 281
    .line 282
    invoke-direct {v1, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5, v1}, Lcom/android/launcher3/dragndrop/v;->setDragRegion(Landroid/graphics/Rect;)V

    .line 286
    .line 287
    .line 288
    :cond_a
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->g:Lcom/android/launcher3/views/k;

    .line 289
    .line 290
    check-cast v1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 291
    .line 292
    invoke-virtual {v1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    const/4 v6, 0x0

    .line 297
    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 298
    .line 299
    .line 300
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 301
    .line 302
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 303
    .line 304
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 305
    .line 306
    invoke-virtual {v5, v2, v1}, Lcom/android/launcher3/dragndrop/v;->F(II)V

    .line 307
    .line 308
    .line 309
    iput v6, v0, Lcom/android/launcher3/dragndrop/j;->t:I

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->I()Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-nez v1, :cond_b

    .line 316
    .line 317
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 318
    .line 319
    new-instance v2, LJ1/q;

    .line 320
    .line 321
    invoke-direct {v2, v0}, LJ1/q;-><init>(LJ1/r;)V

    .line 322
    .line 323
    .line 324
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->n(Ljava/lang/Runnable;)V

    .line 325
    .line 326
    .line 327
    :cond_b
    iget-boolean v1, v0, Lcom/android/launcher3/dragndrop/j;->u:Z

    .line 328
    .line 329
    if-nez v1, :cond_c

    .line 330
    .line 331
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->k()V

    .line 332
    .line 333
    .line 334
    goto :goto_8

    .line 335
    :cond_c
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->k:Lcom/android/launcher3/dragndrop/p;

    .line 336
    .line 337
    iget-object v1, v1, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 338
    .line 339
    if-eqz v1, :cond_d

    .line 340
    .line 341
    iget-object v2, v0, Lcom/android/launcher3/dragndrop/j;->o:Lcom/android/launcher3/n0$a;

    .line 342
    .line 343
    invoke-interface {v1, v2}, Lcom/android/launcher3/dragndrop/p$a;->b(Lcom/android/launcher3/n0$a;)V

    .line 344
    .line 345
    .line 346
    :cond_d
    :goto_8
    iget-object v1, v0, Lcom/android/launcher3/dragndrop/j;->m:Landroid/graphics/Point;

    .line 347
    .line 348
    iget v2, v1, Landroid/graphics/Point;->x:I

    .line 349
    .line 350
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 351
    .line 352
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/dragndrop/j;->F(II)V

    .line 353
    .line 354
    .line 355
    return-object v5
.end method

.method protected t()V
    .locals 0

    .line 1
    return-void
.end method

.method protected x([I)Lcom/android/launcher3/n0;
    .locals 0

    .line 1
    new-instance p1, LJ1/r$a;

    .line 2
    .line 3
    invoke-direct {p1, p0}, LJ1/r$a;-><init>(LJ1/r;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method
