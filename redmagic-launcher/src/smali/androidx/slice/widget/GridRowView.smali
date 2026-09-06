.class public Landroidx/slice/widget/GridRowView;
.super Landroidx/slice/widget/h;
.source "GridRowView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnTouchListener;


# static fields
.field private static final D:I

.field private static final E:I


# instance fields
.field private A:[I

.field B:Z

.field private C:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Landroidx/slice/widget/c;

.field private x:Landroid/widget/LinearLayout;

.field private y:Landroid/view/View;

.field z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Li0/c;->e:I

    .line 2
    .line 3
    sput v0, Landroidx/slice/widget/GridRowView;->D:I

    .line 4
    .line 5
    sget v0, Li0/c;->d:I

    .line 6
    .line 7
    sput v0, Landroidx/slice/widget/GridRowView;->E:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/slice/widget/h;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Landroidx/slice/widget/GridRowView;->z:I

    .line 6
    .line 7
    const/4 p2, 0x2

    .line 8
    new-array p2, p2, [I

    .line 9
    .line 10
    iput-object p2, p0, Landroidx/slice/widget/GridRowView;->A:[I

    .line 11
    .line 12
    new-instance p2, Landroidx/slice/widget/GridRowView$a;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Landroidx/slice/widget/GridRowView$a;-><init>(Landroidx/slice/widget/GridRowView;)V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Landroidx/slice/widget/GridRowView;->C:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance v0, Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    invoke-direct {v1, p1, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    const/16 v1, 0x10

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 57
    .line 58
    .line 59
    sget v0, Li0/a;->e:I

    .line 60
    .line 61
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Landroidx/slice/widget/GridRowView;->t:I

    .line 66
    .line 67
    sget v0, Li0/a;->f:I

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput v0, p0, Landroidx/slice/widget/GridRowView;->r:I

    .line 74
    .line 75
    sget v0, Li0/a;->c:I

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Landroidx/slice/widget/GridRowView;->q:I

    .line 82
    .line 83
    sget v0, Li0/a;->b:I

    .line 84
    .line 85
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Landroidx/slice/widget/GridRowView;->s:I

    .line 90
    .line 91
    sget v0, Li0/a;->a:I

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iput v0, p0, Landroidx/slice/widget/GridRowView;->u:I

    .line 98
    .line 99
    sget v0, Li0/a;->d:I

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    iput p2, p0, Landroidx/slice/widget/GridRowView;->v:I

    .line 106
    .line 107
    new-instance p2, Landroid/view/View;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-direct {p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 114
    .line 115
    .line 116
    iput-object p2, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 117
    .line 118
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 119
    .line 120
    invoke-direct {v0, p1, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method private c(Landroidx/slice/widget/c$a;II)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v6, p2

    .line 4
    .line 5
    move/from16 v7, p3

    .line 6
    .line 7
    invoke-virtual {v0}, Landroidx/slice/widget/h;->getMode()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v9, 0x1

    .line 12
    if-ne v1, v9, :cond_0

    .line 13
    .line 14
    iget-object v1, v0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroidx/slice/widget/c;->n()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    move v10, v9

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v10, 0x2

    .line 25
    :goto_0
    new-instance v3, Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/widget/c$a;->a()Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v11

    .line 44
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/widget/c$a;->c()Landroidx/slice/SliceItem;

    .line 45
    .line 46
    .line 47
    move-result-object v12

    .line 48
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-ne v1, v9, :cond_1

    .line 53
    .line 54
    move v5, v9

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const/4 v5, 0x0

    .line 57
    :goto_1
    const-string v14, "text"

    .line 58
    .line 59
    if-nez v5, :cond_6

    .line 60
    .line 61
    invoke-virtual {v0}, Landroidx/slice/widget/h;->getMode()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-ne v2, v9, :cond_6

    .line 66
    .line 67
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    :cond_2
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v15

    .line 80
    if-eqz v15, :cond_3

    .line 81
    .line 82
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v15

    .line 86
    check-cast v15, Landroidx/slice/SliceItem;

    .line 87
    .line 88
    invoke-virtual {v15}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v14, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_2

    .line 97
    .line 98
    invoke-interface {v2, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :cond_4
    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-le v4, v10, :cond_5

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    check-cast v4, Landroidx/slice/SliceItem;

    .line 117
    .line 118
    const-string v15, "title"

    .line 119
    .line 120
    const-string v8, "large"

    .line 121
    .line 122
    filled-new-array {v15, v8}, [Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    invoke-virtual {v4, v8}, Landroidx/slice/SliceItem;->q([Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    if-nez v4, :cond_4

    .line 131
    .line 132
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_5
    move-object v8, v2

    .line 137
    goto :goto_4

    .line 138
    :cond_6
    const/4 v8, 0x0

    .line 139
    :goto_4
    const/4 v1, 0x0

    .line 140
    const/4 v2, 0x0

    .line 141
    const/4 v4, 0x0

    .line 142
    const/4 v15, 0x0

    .line 143
    const/16 v16, 0x0

    .line 144
    .line 145
    :goto_5
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result v13

    .line 149
    if-ge v1, v13, :cond_c

    .line 150
    .line 151
    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v13

    .line 155
    check-cast v13, Landroidx/slice/SliceItem;

    .line 156
    .line 157
    invoke-virtual {v13}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v9

    .line 161
    move/from16 v17, v4

    .line 162
    .line 163
    invoke-direct {v0, v15}, Landroidx/slice/widget/GridRowView;->f(Landroidx/slice/SliceItem;)I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-ge v2, v10, :cond_a

    .line 168
    .line 169
    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v18

    .line 173
    if-nez v18, :cond_8

    .line 174
    .line 175
    move/from16 v18, v1

    .line 176
    .line 177
    const-string v1, "long"

    .line 178
    .line 179
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_7

    .line 184
    .line 185
    goto :goto_7

    .line 186
    :cond_7
    :goto_6
    move-object v1, v13

    .line 187
    move/from16 v9, v17

    .line 188
    .line 189
    move v13, v2

    .line 190
    const/4 v2, 0x1

    .line 191
    goto :goto_9

    .line 192
    :cond_8
    move/from16 v18, v1

    .line 193
    .line 194
    :goto_7
    if-eqz v8, :cond_9

    .line 195
    .line 196
    invoke-interface {v8, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    if-nez v1, :cond_9

    .line 201
    .line 202
    move v13, v2

    .line 203
    move/from16 v9, v17

    .line 204
    .line 205
    goto :goto_a

    .line 206
    :cond_9
    move v1, v2

    .line 207
    iget v2, v0, Landroidx/slice/widget/h;->g:I

    .line 208
    .line 209
    move-object v9, v13

    .line 210
    move v13, v1

    .line 211
    move-object v1, v9

    .line 212
    move/from16 v9, v17

    .line 213
    .line 214
    invoke-direct/range {v0 .. v5}, Landroidx/slice/widget/GridRowView;->d(Landroidx/slice/SliceItem;ILandroid/view/ViewGroup;IZ)Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_b

    .line 219
    .line 220
    add-int/lit8 v2, v13, 0x1

    .line 221
    .line 222
    move-object v15, v1

    .line 223
    move v4, v9

    .line 224
    :goto_8
    const/16 v16, 0x1

    .line 225
    .line 226
    goto :goto_b

    .line 227
    :cond_a
    move/from16 v18, v1

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :goto_9
    if-ge v9, v2, :cond_b

    .line 231
    .line 232
    const-string v2, "image"

    .line 233
    .line 234
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    if-eqz v2, :cond_b

    .line 243
    .line 244
    iget v2, v0, Landroidx/slice/widget/h;->g:I

    .line 245
    .line 246
    const/4 v4, 0x0

    .line 247
    invoke-direct/range {v0 .. v5}, Landroidx/slice/widget/GridRowView;->d(Landroidx/slice/SliceItem;ILandroid/view/ViewGroup;IZ)Z

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    if-eqz v2, :cond_b

    .line 252
    .line 253
    add-int/lit8 v4, v9, 0x1

    .line 254
    .line 255
    move-object v15, v1

    .line 256
    move v2, v13

    .line 257
    goto :goto_8

    .line 258
    :cond_b
    :goto_a
    move v4, v9

    .line 259
    move v2, v13

    .line 260
    :goto_b
    add-int/lit8 v1, v18, 0x1

    .line 261
    .line 262
    const/4 v9, 0x1

    .line 263
    goto :goto_5

    .line 264
    :cond_c
    if-eqz v16, :cond_f

    .line 265
    .line 266
    invoke-virtual/range {p1 .. p1}, Landroidx/slice/widget/c$a;->b()Ljava/lang/CharSequence;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    if-eqz v1, :cond_d

    .line 271
    .line 272
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 273
    .line 274
    .line 275
    :cond_d
    iget-object v1, v0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 276
    .line 277
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 278
    .line 279
    const/4 v4, -0x2

    .line 280
    const/high16 v5, 0x3f800000    # 1.0f

    .line 281
    .line 282
    const/4 v8, 0x0

    .line 283
    invoke-direct {v2, v8, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
    .line 288
    .line 289
    add-int/lit8 v1, v7, -0x1

    .line 290
    .line 291
    if-eq v6, v1, :cond_e

    .line 292
    .line 293
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 298
    .line 299
    iget v2, v0, Landroidx/slice/widget/GridRowView;->u:I

    .line 300
    .line 301
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    .line 306
    .line 307
    :cond_e
    if-eqz v12, :cond_f

    .line 308
    .line 309
    new-instance v1, Landroidx/slice/widget/b;

    .line 310
    .line 311
    invoke-virtual {v0}, Landroidx/slice/widget/h;->getMode()I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    iget v4, v0, Landroidx/slice/widget/GridRowView;->o:I

    .line 316
    .line 317
    const/4 v5, 0x1

    .line 318
    invoke-direct {v1, v2, v5, v5, v4}, Landroidx/slice/widget/b;-><init>(IIII)V

    .line 319
    .line 320
    .line 321
    const/4 v2, 0x2

    .line 322
    invoke-virtual {v1, v2, v6, v7}, Landroidx/slice/widget/b;->d(III)V

    .line 323
    .line 324
    .line 325
    new-instance v2, Landroid/util/Pair;

    .line 326
    .line 327
    invoke-direct {v2, v12, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 328
    .line 329
    .line 330
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 331
    .line 332
    .line 333
    invoke-direct {v0, v3, v5}, Landroidx/slice/widget/GridRowView;->g(Landroid/view/View;Z)V

    .line 334
    .line 335
    .line 336
    :cond_f
    return-void
.end method

.method private d(Landroidx/slice/SliceItem;ILandroid/view/ViewGroup;IZ)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "text"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "large"

    .line 12
    .line 13
    const-string v3, "long"

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    const/4 v5, 0x0

    .line 17
    if-nez v1, :cond_7

    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto/16 :goto_5

    .line 26
    .line 27
    :cond_0
    const-string p4, "image"

    .line 28
    .line 29
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    if-eqz p4, :cond_a

    .line 34
    .line 35
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    if-eqz p4, :cond_a

    .line 40
    .line 41
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p4, v0}, Landroidx/core/graphics/drawable/IconCompat;->j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    if-eqz p4, :cond_a

    .line 54
    .line 55
    new-instance v5, Landroid/widget/ImageView;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, p4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    const-string p4, "raw"

    .line 68
    .line 69
    invoke-virtual {p1, p4}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p4

    .line 73
    const-string v0, "no_tint"

    .line 74
    .line 75
    const/4 v1, -0x1

    .line 76
    if-eqz p4, :cond_1

    .line 77
    .line 78
    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 79
    .line 80
    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 81
    .line 82
    .line 83
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 84
    .line 85
    const/4 p4, -0x2

    .line 86
    invoke-direct {p0, v1, p4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 87
    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_1
    invoke-virtual {p1, v2}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result p4

    .line 94
    if-eqz p4, :cond_3

    .line 95
    .line 96
    sget-object p4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 97
    .line 98
    invoke-virtual {v5, p4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 99
    .line 100
    .line 101
    if-eqz p5, :cond_2

    .line 102
    .line 103
    move p0, v1

    .line 104
    goto :goto_0

    .line 105
    :cond_2
    iget p0, p0, Landroidx/slice/widget/GridRowView;->q:I

    .line 106
    .line 107
    :goto_0
    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    .line 108
    .line 109
    invoke-direct {p4, v1, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 110
    .line 111
    .line 112
    :goto_1
    move-object p0, p4

    .line 113
    goto :goto_4

    .line 114
    :cond_3
    invoke-virtual {p1, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result p4

    .line 118
    if-eqz p4, :cond_4

    .line 119
    .line 120
    iget p0, p0, Landroidx/slice/widget/GridRowView;->r:I

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    iget p0, p0, Landroidx/slice/widget/GridRowView;->t:I

    .line 124
    .line 125
    :goto_2
    if-nez p4, :cond_5

    .line 126
    .line 127
    sget-object p4, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    sget-object p4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 131
    .line 132
    :goto_3
    invoke-virtual {v5, p4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 133
    .line 134
    .line 135
    new-instance p4, Landroid/widget/LinearLayout$LayoutParams;

    .line 136
    .line 137
    invoke-direct {p4, p0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :goto_4
    if-eq p2, v1, :cond_6

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_6

    .line 148
    .line 149
    invoke-virtual {v5, p2}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 150
    .line 151
    .line 152
    :cond_6
    invoke-virtual {p3, v5, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    .line 154
    .line 155
    goto :goto_8

    .line 156
    :cond_7
    :goto_5
    const-string p2, "title"

    .line 157
    .line 158
    filled-new-array {v2, p2}, [Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-static {p1, p2}, Lh0/f;->p(Landroidx/slice/SliceItem;[Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 167
    .line 168
    .line 169
    move-result-object p5

    .line 170
    invoke-static {p5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 171
    .line 172
    .line 173
    move-result-object p5

    .line 174
    if-eqz p2, :cond_8

    .line 175
    .line 176
    sget p2, Landroidx/slice/widget/GridRowView;->D:I

    .line 177
    .line 178
    goto :goto_6

    .line 179
    :cond_8
    sget p2, Landroidx/slice/widget/GridRowView;->E:I

    .line 180
    .line 181
    :goto_6
    invoke-virtual {p5, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    move-object v5, p2

    .line 186
    check-cast v5, Landroid/widget/TextView;

    .line 187
    .line 188
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    if-eqz p2, :cond_9

    .line 193
    .line 194
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->k()J

    .line 199
    .line 200
    .line 201
    move-result-wide p1

    .line 202
    invoke-static {p0, p1, p2}, Landroidx/slice/widget/o;->e(Landroid/content/Context;J)Ljava/lang/CharSequence;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    goto :goto_7

    .line 207
    :cond_9
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->m()Ljava/lang/CharSequence;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    :goto_7
    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v5, v4, p4, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 218
    .line 219
    .line 220
    :cond_a
    :goto_8
    if-eqz v5, :cond_b

    .line 221
    .line 222
    const/4 p0, 0x1

    .line 223
    return p0

    .line 224
    :cond_b
    return v4
.end method

.method private e(I)V
    .locals 11

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/slice/widget/c;->m()Landroidx/slice/SliceItem;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iget v4, p0, Landroidx/slice/widget/GridRowView;->z:I

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v6, "slice"

    .line 37
    .line 38
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-nez v5, :cond_0

    .line 43
    .line 44
    const-string v5, "action"

    .line 45
    .line 46
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_1

    .line 55
    .line 56
    :cond_0
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v5}, Landroidx/slice/Slice;->d()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-lez v5, :cond_1

    .line 69
    .line 70
    new-instance p1, Landroidx/slice/widget/c$a;

    .line 71
    .line 72
    invoke-direct {p1, v1}, Landroidx/slice/widget/c$a;-><init>(Landroidx/slice/SliceItem;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, p1, v3, v4}, Landroidx/slice/widget/GridRowView;->c(Landroidx/slice/widget/c$a;II)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 88
    .line 89
    invoke-virtual {v6}, Landroidx/slice/widget/c;->o()Z

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    const/4 v7, -0x1

    .line 94
    const/4 v8, 0x0

    .line 95
    if-eqz v6, :cond_2

    .line 96
    .line 97
    sget v6, Li0/c;->b:I

    .line 98
    .line 99
    iget-object v9, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {v5, v6, v9, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    check-cast v5, Landroid/widget/FrameLayout;

    .line 106
    .line 107
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 108
    .line 109
    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v5, v0, v8, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 113
    .line 114
    .line 115
    sget v0, Li0/b;->d:I

    .line 116
    .line 117
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Landroid/widget/TextView;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    sget v0, Li0/c;->a:I

    .line 125
    .line 126
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-virtual {v5, v0, v6, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    move-object v5, v0

    .line 133
    check-cast v5, Landroid/widget/LinearLayout;

    .line 134
    .line 135
    sget v0, Li0/b;->d:I

    .line 136
    .line 137
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Landroid/widget/TextView;

    .line 142
    .line 143
    sget v6, Li0/b;->c:I

    .line 144
    .line 145
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    check-cast v6, Landroid/widget/TextView;

    .line 150
    .line 151
    :goto_0
    iget-object v6, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 152
    .line 153
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 154
    .line 155
    const/high16 v10, 0x3f800000    # 1.0f

    .line 156
    .line 157
    invoke-direct {v9, v8, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v6, v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    sget v7, Li0/d;->a:I

    .line 168
    .line 169
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {v6, v7, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    new-instance p1, Landroidx/slice/widget/b;

    .line 185
    .line 186
    invoke-virtual {p0}, Landroidx/slice/widget/h;->getMode()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    const/4 v6, 0x4

    .line 191
    iget v7, p0, Landroidx/slice/widget/GridRowView;->o:I

    .line 192
    .line 193
    invoke-direct {p1, v0, v6, v2, v7}, Landroidx/slice/widget/b;-><init>(IIII)V

    .line 194
    .line 195
    .line 196
    const/4 v0, 0x2

    .line 197
    invoke-virtual {p1, v0, v3, v4}, Landroidx/slice/widget/b;->d(III)V

    .line 198
    .line 199
    .line 200
    new-instance v0, Landroid/util/Pair;

    .line 201
    .line 202
    invoke-direct {v0, v1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    invoke-direct {p0, v5, v2}, Landroidx/slice/widget/GridRowView;->g(Landroid/view/View;Z)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method private f(Landroidx/slice/SliceItem;)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "image"

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget p0, p0, Landroidx/slice/widget/GridRowView;->v:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_1
    const-string p0, "text"

    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    const-string p0, "long"

    .line 33
    .line 34
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->h()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_2
    return v0
.end method

.method private g(Landroid/view/View;Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    move-object v1, p0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    move-object v1, v0

    .line 7
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const v0, 0x101045c

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Landroidx/slice/widget/o;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private getExtraBottomPadding()I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/slice/widget/c;->o()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget v0, p0, Landroidx/slice/widget/GridRowView;->o:I

    .line 13
    .line 14
    iget v2, p0, Landroidx/slice/widget/GridRowView;->p:I

    .line 15
    .line 16
    add-int/lit8 v2, v2, -0x1

    .line 17
    .line 18
    if-eq v0, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/slice/widget/h;->getMode()I

    .line 21
    .line 22
    .line 23
    :cond_0
    return v1
.end method

.method private getExtraTopPadding()I
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/slice/widget/c;->o()Z

    .line 7
    .line 8
    .line 9
    :cond_0
    return v0
.end method

.method private h(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move-object v2, p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    move-object v2, p0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    move-object v2, v1

    .line 19
    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const v2, 0x101030e

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Landroidx/slice/widget/o;->d(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    :cond_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private i(Landroid/view/MotionEvent;)V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->A:[I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->A:[I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aget v1, v1, v2

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    sub-float/2addr v0, v1

    .line 19
    float-to-int v0, v0

    .line 20
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->A:[I

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    aget v3, v3, v4

    .line 28
    .line 29
    int-to-float v3, v3

    .line 30
    sub-float/2addr v1, v3

    .line 31
    float-to-int v1, v1

    .line 32
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    int-to-float v0, v0

    .line 39
    int-to-float v1, v1

    .line 40
    invoke-virtual {v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {p0, v4}, Landroid/view/View;->setPressed(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x3

    .line 56
    if-eq p1, v0, :cond_2

    .line 57
    .line 58
    if-eq p1, v4, :cond_2

    .line 59
    .line 60
    const/4 v0, 0x2

    .line 61
    if-ne p1, v0, :cond_1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-void

    .line 65
    :cond_2
    :goto_0
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->y:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private k()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/slice/widget/c;->g()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iput-boolean v1, p0, Landroidx/slice/widget/GridRowView;->B:Z

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Landroidx/slice/widget/GridRowView;->C:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 28
    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->getMaxCells()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Landroidx/slice/widget/GridRowView;->z:I

    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0

    .line 39
    :cond_2
    :goto_0
    return v1
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Landroidx/slice/widget/GridRowView;->B:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Landroidx/slice/widget/GridRowView;->B:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->C:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v1}, Landroidx/slice/widget/GridRowView;->h(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public b(IIII)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/slice/widget/h;->b(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-direct {p0}, Landroidx/slice/widget/GridRowView;->getExtraTopPadding()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    add-int/2addr p2, v1

    .line 11
    invoke-direct {p0}, Landroidx/slice/widget/GridRowView;->getExtraBottomPadding()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr p4, p0

    .line 16
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method getMaxCells()I
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/slice/widget/c;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroidx/slice/widget/c;->j()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-le v0, v1, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 32
    .line 33
    invoke-virtual {v0}, Landroidx/slice/widget/c;->l()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x2

    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    iget v0, p0, Landroidx/slice/widget/GridRowView;->q:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget v0, p0, Landroidx/slice/widget/GridRowView;->s:I

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget p0, p0, Landroidx/slice/widget/GridRowView;->u:I

    .line 50
    .line 51
    add-int/2addr v0, p0

    .line 52
    div-int/2addr v1, v0

    .line 53
    :cond_2
    return v1

    .line 54
    :cond_3
    :goto_1
    const/4 p0, -0x1

    .line 55
    return p0
.end method

.method j()V
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    if-eqz v0, :cond_9

    .line 4
    .line 5
    invoke-virtual {v0}, Landroidx/slice/widget/c;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_3

    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Landroidx/slice/widget/GridRowView;->k()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroidx/slice/widget/i;->c()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, -0x1

    .line 28
    if-eq v0, v1, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroidx/slice/widget/i;->c()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setLayoutDirection(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroidx/slice/widget/c;->i()Landroidx/slice/SliceItem;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    new-instance v0, Landroidx/slice/widget/b;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroidx/slice/widget/h;->getMode()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    const/4 v3, 0x3

    .line 55
    iget v4, p0, Landroidx/slice/widget/GridRowView;->o:I

    .line 56
    .line 57
    invoke-direct {v0, v2, v3, v1, v4}, Landroidx/slice/widget/b;-><init>(IIII)V

    .line 58
    .line 59
    .line 60
    new-instance v2, Landroid/util/Pair;

    .line 61
    .line 62
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 63
    .line 64
    invoke-virtual {v3}, Landroidx/slice/widget/c;->i()Landroidx/slice/SliceItem;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-direct {v2, v3, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-direct {p0, v1}, Landroidx/slice/widget/GridRowView;->h(Z)V

    .line 77
    .line 78
    .line 79
    :cond_3
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroidx/slice/widget/i;->b()Ljava/lang/CharSequence;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    iget-object v0, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroidx/slice/widget/c;->j()Ljava/util/ArrayList;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 99
    .line 100
    invoke-virtual {v2}, Landroidx/slice/widget/c;->l()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    const/4 v3, 0x2

    .line 105
    if-ne v2, v3, :cond_5

    .line 106
    .line 107
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 108
    .line 109
    const/16 v3, 0x30

    .line 110
    .line 111
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    iget-object v2, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 116
    .line 117
    const/16 v3, 0x10

    .line 118
    .line 119
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 120
    .line 121
    .line 122
    :goto_0
    iget v2, p0, Landroidx/slice/widget/GridRowView;->z:I

    .line 123
    .line 124
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 125
    .line 126
    invoke-virtual {v3}, Landroidx/slice/widget/c;->m()Landroidx/slice/SliceItem;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    const/4 v4, 0x0

    .line 131
    if-eqz v3, :cond_6

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_6
    move v1, v4

    .line 135
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    if-ge v4, v3, :cond_8

    .line 140
    .line 141
    iget-object v3, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 142
    .line 143
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-lt v3, v2, :cond_7

    .line 148
    .line 149
    if-eqz v1, :cond_8

    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    sub-int/2addr v0, v2

    .line 156
    invoke-direct {p0, v0}, Landroidx/slice/widget/GridRowView;->e(I)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_7
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    check-cast v3, Landroidx/slice/widget/c$a;

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    invoke-static {v5, v2}, Ljava/lang/Math;->min(II)I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    invoke-direct {p0, v3, v4, v5}, Landroidx/slice/widget/GridRowView;->c(Landroidx/slice/widget/c$a;II)V

    .line 175
    .line 176
    .line 177
    add-int/lit8 v4, v4, 0x1

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_8
    :goto_2
    return-void

    .line 181
    :cond_9
    :goto_3
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->a()V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/util/Pair;

    .line 6
    .line 7
    iget-object p1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Landroidx/slice/SliceItem;

    .line 10
    .line 11
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Landroidx/slice/widget/b;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p0, "action"

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, p0, v0, v0}, Lh0/f;->g(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    :try_start_0
    invoke-virtual {p0, v0, v0}, Landroidx/slice/SliceItem;->c(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    move-exception p0

    .line 31
    const-string p1, "GridRowView"

    .line 32
    .line 33
    const-string v0, "PendingIntent for slice cannot be sent"

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    .line 1
    iget-object p2, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p2, v0, v0}, Landroidx/slice/widget/c;->k(Landroidx/slice/widget/l;Landroidx/slice/widget/n;)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget v0, p0, Landroidx/slice/widget/h;->k:I

    .line 9
    .line 10
    add-int/2addr p2, v0

    .line 11
    iget v0, p0, Landroidx/slice/widget/h;->m:I

    .line 12
    .line 13
    add-int/2addr p2, v0

    .line 14
    const/high16 v0, 0x40000000    # 2.0f

    .line 15
    .line 16
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Landroidx/slice/widget/GridRowView;->x:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput p2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    .line 28
    invoke-super {p0, p1, v0}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Landroidx/slice/widget/GridRowView;->i(Landroid/view/MotionEvent;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public setTint(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/slice/widget/h;->setTint(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Landroidx/slice/widget/GridRowView;->w:Landroidx/slice/widget/c;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->a()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/slice/widget/GridRowView;->j()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
