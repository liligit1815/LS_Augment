.class public Lcom/android/launcher3/folder/z;
.super Ljava/lang/Object;
.source "FolderAnimationManager.java"


# instance fields
.field protected a:Lcom/android/launcher3/folder/Folder;

.field protected b:Lcom/android/launcher3/folder/FolderPagedView;

.field private c:Landroid/graphics/drawable/GradientDrawable;

.field protected d:Lcom/android/launcher3/folder/FolderIcon;

.field private e:Lcom/android/launcher3/folder/u0;

.field protected f:Landroid/content/Context;

.field protected final g:Z

.field private final h:I

.field private final i:I

.field private final j:Landroid/view/animation/Interpolator;

.field private final k:Landroid/view/animation/Interpolator;

.field private final l:Landroid/view/animation/Interpolator;

.field private final m:Landroid/view/animation/Interpolator;

.field private final n:Lcom/android/launcher3/folder/y0;

.field private final o:Lcom/android/launcher3/folder/A;

.field private p:Landroid/animation/ObjectAnimator;

.field protected q:Lcom/android/launcher3/h0;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/folder/Folder;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/folder/y0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, v1, v1}, Lcom/android/launcher3/folder/y0;-><init>(FFF)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->n:Lcom/android/launcher3/folder/y0;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 25
    .line 26
    iget-object v0, p1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderIcon;->m:Lcom/android/launcher3/folder/u0;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->e:Lcom/android/launcher3/folder/u0;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 41
    .line 42
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/android/launcher3/folder/A;->b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->o:Lcom/android/launcher3/folder/A;

    .line 53
    .line 54
    iput-boolean p2, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 55
    .line 56
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const p2, 0x7f0c0042

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iput p2, p0, Lcom/android/launcher3/folder/z;->h:I

    .line 70
    .line 71
    const p2, 0x7f0c0031

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, p0, Lcom/android/launcher3/folder/z;->i:I

    .line 79
    .line 80
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 81
    .line 82
    const p2, 0x7f0d0034

    .line 83
    .line 84
    .line 85
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->j:Landroid/view/animation/Interpolator;

    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 92
    .line 93
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->k:Landroid/view/animation/Interpolator;

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 100
    .line 101
    const p2, 0x7f0d0024

    .line 102
    .line 103
    .line 104
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->l:Landroid/view/animation/Interpolator;

    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 111
    .line 112
    const p2, 0x7f0d0032

    .line 113
    .line 114
    .line 115
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iput-object p1, p0, Lcom/android/launcher3/folder/z;->m:Landroid/view/animation/Interpolator;

    .line 120
    .line 121
    return-void
.end method

.method private a(Landroid/animation/AnimatorSet;FII)V
    .locals 23

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRule()Lcom/android/launcher3/folder/a;

    .line 8
    .line 9
    .line 10
    move-result-object v7

    .line 11
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v8, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    move v0, v8

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v0, v2

    .line 26
    :goto_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    move v3, v2

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    iget-object v3, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    :goto_1
    invoke-direct {v1, v3}, Lcom/android/launcher3/folder/z;->f(I)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v9

    .line 42
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v10

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    move v11, v10

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    sget v0, Lcom/android/launcher3/folder/i0;->k:I

    .line 51
    .line 52
    move v11, v0

    .line 53
    :goto_2
    invoke-direct {v1}, Lcom/android/launcher3/folder/z;->g()Landroid/view/animation/Interpolator;

    .line 54
    .line 55
    .line 56
    move-result-object v12

    .line 57
    iget-object v0, v1, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 64
    .line 65
    .line 66
    move-result-object v13

    .line 67
    move v14, v2

    .line 68
    :goto_3
    if-ge v14, v10, :cond_7

    .line 69
    .line 70
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    move-object v2, v0

    .line 75
    check-cast v2, Landroid/view/View;

    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lc1/b;

    .line 82
    .line 83
    iput-boolean v8, v0, Lc1/b;->h:Z

    .line 84
    .line 85
    invoke-virtual {v13, v2}, Lcom/android/launcher3/K5;->setupLp(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v7, v11}, Lcom/android/launcher3/folder/a;->g(I)F

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-virtual {v7}, Lcom/android/launcher3/folder/a;->d()F

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    mul-float/2addr v4, v3

    .line 97
    invoke-direct {v1, v2}, Lcom/android/launcher3/folder/z;->e(Landroid/view/View;)Lcom/android/launcher3/BubbleTextView;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    int-to-float v3, v3

    .line 106
    div-float/2addr v4, v3

    .line 107
    div-float v5, v4, p2

    .line 108
    .line 109
    iget-boolean v15, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 110
    .line 111
    if-eqz v15, :cond_3

    .line 112
    .line 113
    move v15, v5

    .line 114
    goto :goto_4

    .line 115
    :cond_3
    const/high16 v15, 0x3f800000    # 1.0f

    .line 116
    .line 117
    :goto_4
    invoke-virtual {v2, v15}, Landroid/view/View;->setScaleX(F)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v15}, Landroid/view/View;->setScaleY(F)V

    .line 121
    .line 122
    .line 123
    iget-object v15, v1, Lcom/android/launcher3/folder/z;->n:Lcom/android/launcher3/folder/y0;

    .line 124
    .line 125
    invoke-virtual {v7, v14, v11, v15}, Lcom/android/launcher3/folder/a;->a(IILcom/android/launcher3/folder/y0;)Lcom/android/launcher3/folder/y0;

    .line 126
    .line 127
    .line 128
    iget v15, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 129
    .line 130
    int-to-float v15, v15

    .line 131
    sub-float/2addr v15, v3

    .line 132
    mul-float/2addr v15, v4

    .line 133
    float-to-int v3, v15

    .line 134
    div-int/lit8 v3, v3, 0x2

    .line 135
    .line 136
    iget-object v15, v1, Lcom/android/launcher3/folder/z;->n:Lcom/android/launcher3/folder/y0;

    .line 137
    .line 138
    iget v15, v15, Lcom/android/launcher3/folder/y0;->b:F

    .line 139
    .line 140
    int-to-float v3, v3

    .line 141
    sub-float/2addr v15, v3

    .line 142
    move/from16 v3, p3

    .line 143
    .line 144
    int-to-float v8, v3

    .line 145
    add-float/2addr v15, v8

    .line 146
    div-float v15, v15, p2

    .line 147
    .line 148
    float-to-int v8, v15

    .line 149
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 150
    .line 151
    .line 152
    move-result v15

    .line 153
    int-to-float v15, v15

    .line 154
    mul-float/2addr v15, v4

    .line 155
    iget-object v4, v1, Lcom/android/launcher3/folder/z;->n:Lcom/android/launcher3/folder/y0;

    .line 156
    .line 157
    iget v4, v4, Lcom/android/launcher3/folder/y0;->c:F

    .line 158
    .line 159
    move-object/from16 v17, v7

    .line 160
    .line 161
    move/from16 v7, p4

    .line 162
    .line 163
    int-to-float v3, v7

    .line 164
    add-float/2addr v4, v3

    .line 165
    sub-float/2addr v4, v15

    .line 166
    div-float v4, v4, p2

    .line 167
    .line 168
    float-to-int v3, v4

    .line 169
    iget v4, v0, Lc1/b;->j:I

    .line 170
    .line 171
    sub-int/2addr v8, v4

    .line 172
    int-to-float v4, v8

    .line 173
    iget v0, v0, Lc1/b;->k:I

    .line 174
    .line 175
    sub-int/2addr v3, v0

    .line 176
    int-to-float v0, v3

    .line 177
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 178
    .line 179
    const/4 v8, 0x0

    .line 180
    invoke-virtual {v1, v2, v3, v4, v8}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v3, v12}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, v6, v3}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 188
    .line 189
    .line 190
    sget-object v15, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 191
    .line 192
    invoke-virtual {v1, v2, v15, v0, v8}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 193
    .line 194
    .line 195
    move-result-object v8

    .line 196
    invoke-virtual {v8, v12}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v6, v8}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 200
    .line 201
    .line 202
    sget-object v15, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 203
    .line 204
    move/from16 v18, v0

    .line 205
    .line 206
    const/high16 v0, 0x3f800000    # 1.0f

    .line 207
    .line 208
    invoke-virtual {v1, v2, v15, v5, v0}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-virtual {v0, v12}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1, v6, v0}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 216
    .line 217
    .line 218
    iget-object v15, v1, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 219
    .line 220
    invoke-virtual {v15}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 221
    .line 222
    .line 223
    move-result v15

    .line 224
    move-object/from16 v16, v2

    .line 225
    .line 226
    sget v2, Lcom/android/launcher3/folder/i0;->k:I

    .line 227
    .line 228
    if-le v15, v2, :cond_6

    .line 229
    .line 230
    iget-boolean v2, v1, Lcom/android/launcher3/folder/z;->g:Z

    .line 231
    .line 232
    iget v15, v1, Lcom/android/launcher3/folder/z;->i:I

    .line 233
    .line 234
    if-eqz v2, :cond_4

    .line 235
    .line 236
    goto :goto_5

    .line 237
    :cond_4
    mul-int/lit8 v15, v15, 0x2

    .line 238
    .line 239
    :goto_5
    if-eqz v2, :cond_5

    .line 240
    .line 241
    int-to-long v1, v15

    .line 242
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v8, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 249
    .line 250
    .line 251
    :cond_5
    invoke-virtual {v3}, Landroid/animation/Animator;->getDuration()J

    .line 252
    .line 253
    .line 254
    move-result-wide v1

    .line 255
    move-wide/from16 v19, v1

    .line 256
    .line 257
    int-to-long v1, v15

    .line 258
    move-wide/from16 v21, v1

    .line 259
    .line 260
    sub-long v1, v19, v21

    .line 261
    .line 262
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v8}, Landroid/animation/Animator;->getDuration()J

    .line 266
    .line 267
    .line 268
    move-result-wide v1

    .line 269
    sub-long v1, v1, v21

    .line 270
    .line 271
    invoke-virtual {v8, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Landroid/animation/Animator;->getDuration()J

    .line 275
    .line 276
    .line 277
    move-result-wide v1

    .line 278
    sub-long v1, v1, v21

    .line 279
    .line 280
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 281
    .line 282
    .line 283
    :cond_6
    new-instance v0, Lcom/android/launcher3/folder/z$b;

    .line 284
    .line 285
    move-object/from16 v1, p0

    .line 286
    .line 287
    move v3, v4

    .line 288
    move-object/from16 v2, v16

    .line 289
    .line 290
    move/from16 v4, v18

    .line 291
    .line 292
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/z$b;-><init>(Lcom/android/launcher3/folder/z;Landroid/view/View;FFF)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v6, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 296
    .line 297
    .line 298
    add-int/lit8 v14, v14, 0x1

    .line 299
    .line 300
    const/4 v8, 0x1

    .line 301
    move-object/from16 v7, v17

    .line 302
    .line 303
    goto/16 :goto_3

    .line 304
    .line 305
    :cond_7
    return-void
.end method

.method private d(Landroid/graphics/drawable/GradientDrawable;Ljava/lang/String;II)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    filled-new-array {p3, p4}, [I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p2, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    filled-new-array {p4, p3}, [I

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1, p2, p0}, Landroid/animation/ObjectAnimator;->ofArgb(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method private e(Landroid/view/View;)Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->getTitleTextView()Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 13
    .line 14
    return-object p1
.end method

.method private f(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/z;->o:Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, v1, p1, p0}, Lcom/android/launcher3/folder/A;->j(Lcom/android/launcher3/h0;ILjava/util/List;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method private g()Landroid/view/animation/Interpolator;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/folder/z;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->l:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->m:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->j:Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->k:Landroid/view/animation/Interpolator;

    .line 25
    .line 26
    return-object p0
.end method

.method private h()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x4

    .line 8
    if-le p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private j(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JI)V
    .locals 0

    .line 1
    invoke-virtual {p2, p3, p4}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 2
    .line 3
    .line 4
    int-to-long p3, p5

    .line 5
    invoke-virtual {p2, p3, p4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    iget-boolean p0, p0, Lcom/android/launcher3/folder/z;->g:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    new-array p0, v2, [F

    .line 9
    .line 10
    aput p3, p0, v1

    .line 11
    .line 12
    aput p4, p0, v0

    .line 13
    .line 14
    invoke-static {p1, p2, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    new-array p0, v2, [F

    .line 20
    .line 21
    aput p4, p0, v1

    .line 22
    .line 23
    aput p3, p0, v0

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public c()Landroid/animation/AnimatorSet;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    move-object v6, v1

    .line 10
    check-cast v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 11
    .line 12
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderIcon;->getPreviewItemManager()Lcom/android/launcher3/folder/A0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/android/launcher3/folder/A0;->w()V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/folder/FolderIcon;->getLayoutRule()Lcom/android/launcher3/folder/a;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v7, 0x0

    .line 28
    invoke-direct {v0, v7}, Lcom/android/launcher3/folder/z;->f(I)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 38
    .line 39
    iget-object v4, v4, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 40
    .line 41
    invoke-interface {v4}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iget-object v5, v0, Lcom/android/launcher3/folder/z;->d:Lcom/android/launcher3/folder/FolderIcon;

    .line 46
    .line 47
    invoke-virtual {v4, v5, v3}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->e:Lcom/android/launcher3/folder/u0;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/android/launcher3/folder/u0;->J0()I

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    mul-int/lit8 v4, v9, 0x2

    .line 58
    .line 59
    int-to-float v4, v4

    .line 60
    mul-float/2addr v4, v8

    .line 61
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {v1, v5}, Lcom/android/launcher3/folder/a;->g(I)F

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    invoke-virtual {v1}, Lcom/android/launcher3/folder/a;->d()F

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    mul-float/2addr v1, v5

    .line 74
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Landroid/view/View;

    .line 79
    .line 80
    invoke-direct {v0, v2}, Lcom/android/launcher3/folder/z;->e(Landroid/view/View;)Lcom/android/launcher3/BubbleTextView;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2}, Lcom/android/launcher3/BubbleTextView;->getIconSize()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    int-to-float v2, v2

    .line 89
    div-float/2addr v1, v2

    .line 90
    mul-float v10, v1, v8

    .line 91
    .line 92
    iget-boolean v1, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 93
    .line 94
    if-eqz v1, :cond_0

    .line 95
    .line 96
    move v1, v10

    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 99
    .line 100
    :goto_0
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 101
    .line 102
    const/4 v12, 0x0

    .line 103
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setPivotX(F)V

    .line 104
    .line 105
    .line 106
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 107
    .line 108
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->setPivotY(F)V

    .line 109
    .line 110
    .line 111
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 114
    .line 115
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->setScaleX(F)V

    .line 116
    .line 117
    .line 118
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 119
    .line 120
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 121
    .line 122
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->setScaleY(F)V

    .line 123
    .line 124
    .line 125
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 126
    .line 127
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 128
    .line 129
    invoke-virtual {v2, v12}, Landroid/view/ViewGroup;->setPivotX(F)V

    .line 130
    .line 131
    .line 132
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 133
    .line 134
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 135
    .line 136
    invoke-virtual {v2, v12}, Landroid/view/ViewGroup;->setPivotY(F)V

    .line 137
    .line 138
    .line 139
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Landroid/view/View;->setScaleX(F)V

    .line 144
    .line 145
    .line 146
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 147
    .line 148
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 149
    .line 150
    invoke-virtual {v2, v1}, Landroid/view/View;->setScaleY(F)V

    .line 151
    .line 152
    .line 153
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 156
    .line 157
    invoke-virtual {v1, v12}, Landroid/view/View;->setPivotX(F)V

    .line 158
    .line 159
    .line 160
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 161
    .line 162
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 163
    .line 164
    invoke-virtual {v1, v12}, Landroid/view/View;->setPivotY(F)V

    .line 165
    .line 166
    .line 167
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 168
    .line 169
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_1

    .line 178
    .line 179
    iget v1, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 180
    .line 181
    int-to-float v1, v1

    .line 182
    mul-float/2addr v1, v10

    .line 183
    sub-float/2addr v1, v4

    .line 184
    float-to-int v1, v1

    .line 185
    move v13, v1

    .line 186
    goto :goto_1

    .line 187
    :cond_1
    move v13, v7

    .line 188
    :goto_1
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 189
    .line 190
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    int-to-float v1, v1

    .line 195
    mul-float/2addr v1, v10

    .line 196
    float-to-int v1, v1

    .line 197
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 198
    .line 199
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    int-to-float v2, v2

    .line 204
    mul-float/2addr v2, v10

    .line 205
    float-to-int v2, v2

    .line 206
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 207
    .line 208
    iget-object v14, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 209
    .line 210
    invoke-virtual {v14}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    .line 211
    .line 212
    .line 213
    move-result v14

    .line 214
    add-int/2addr v5, v14

    .line 215
    iget-object v14, v0, Lcom/android/launcher3/folder/z;->e:Lcom/android/launcher3/folder/u0;

    .line 216
    .line 217
    invoke-virtual {v14}, Lcom/android/launcher3/folder/u0;->F0()I

    .line 218
    .line 219
    .line 220
    move-result v14

    .line 221
    int-to-float v14, v14

    .line 222
    mul-float/2addr v14, v8

    .line 223
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    .line 224
    .line 225
    .line 226
    move-result v14

    .line 227
    add-int/2addr v5, v14

    .line 228
    sub-int/2addr v5, v1

    .line 229
    sub-int/2addr v5, v13

    .line 230
    iget v3, v3, Landroid/graphics/Rect;->top:I

    .line 231
    .line 232
    iget-object v14, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 233
    .line 234
    invoke-virtual {v14}, Landroid/widget/LinearLayout;->getPaddingTop()I

    .line 235
    .line 236
    .line 237
    move-result v14

    .line 238
    add-int/2addr v3, v14

    .line 239
    iget-object v14, v0, Lcom/android/launcher3/folder/z;->e:Lcom/android/launcher3/folder/u0;

    .line 240
    .line 241
    invoke-virtual {v14}, Lcom/android/launcher3/folder/u0;->G0()I

    .line 242
    .line 243
    .line 244
    move-result v14

    .line 245
    int-to-float v14, v14

    .line 246
    mul-float/2addr v14, v8

    .line 247
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    .line 248
    .line 249
    .line 250
    move-result v14

    .line 251
    add-int/2addr v3, v14

    .line 252
    sub-int/2addr v3, v2

    .line 253
    iget v14, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->b:I

    .line 254
    .line 255
    sub-int/2addr v5, v14

    .line 256
    int-to-float v5, v5

    .line 257
    iget v14, v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;->c:I

    .line 258
    .line 259
    sub-int/2addr v3, v14

    .line 260
    int-to-float v3, v3

    .line 261
    iget-object v14, v0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 262
    .line 263
    const v15, 0x7f0402ec

    .line 264
    .line 265
    .line 266
    invoke-static {v14, v15}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 267
    .line 268
    .line 269
    move-result v14

    .line 270
    iget-object v15, v0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 271
    .line 272
    const/high16 v16, 0x3f800000    # 1.0f

    .line 273
    .line 274
    const v11, 0x7f0402e3

    .line 275
    .line 276
    .line 277
    invoke-static {v15, v11}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    .line 278
    .line 279
    .line 280
    move-result v11

    .line 281
    iget-object v15, v0, Lcom/android/launcher3/folder/z;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 282
    .line 283
    if-eqz v15, :cond_3

    .line 284
    .line 285
    invoke-virtual {v15}, Landroid/graphics/drawable/GradientDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 286
    .line 287
    .line 288
    iget-object v15, v0, Lcom/android/launcher3/folder/z;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 289
    .line 290
    iget-boolean v12, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 291
    .line 292
    if-eqz v12, :cond_2

    .line 293
    .line 294
    move v12, v14

    .line 295
    goto :goto_2

    .line 296
    :cond_2
    move v12, v11

    .line 297
    :goto_2
    invoke-virtual {v15, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 298
    .line 299
    .line 300
    :cond_3
    add-int/2addr v1, v13

    .line 301
    new-instance v12, Landroid/graphics/Rect;

    .line 302
    .line 303
    int-to-float v15, v1

    .line 304
    add-float/2addr v15, v4

    .line 305
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    .line 306
    .line 307
    .line 308
    move-result v15

    .line 309
    int-to-float v7, v2

    .line 310
    add-float/2addr v7, v4

    .line 311
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    invoke-direct {v12, v1, v2, v15, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 316
    .line 317
    .line 318
    new-instance v7, Landroid/graphics/Rect;

    .line 319
    .line 320
    iget v1, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 321
    .line 322
    iget v2, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 323
    .line 324
    const/4 v4, 0x0

    .line 325
    invoke-direct {v7, v4, v4, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 326
    .line 327
    .line 328
    iget-object v1, v0, Lcom/android/launcher3/folder/z;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 329
    .line 330
    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    .line 331
    .line 332
    .line 333
    move-result v21

    .line 334
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 335
    .line 336
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 337
    .line 338
    .line 339
    new-instance v2, Lcom/android/launcher3/anim/X;

    .line 340
    .line 341
    sget-object v4, Lcom/android/launcher3/BubbleTextView;->v0:Landroid/util/Property;

    .line 342
    .line 343
    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 344
    .line 345
    .line 346
    move-result-object v15

    .line 347
    invoke-direct {v2, v4, v15}, Lcom/android/launcher3/anim/X;-><init>(Landroid/util/Property;Ljava/lang/Object;)V

    .line 348
    .line 349
    .line 350
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 351
    .line 352
    iget-object v15, v4, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 353
    .line 354
    invoke-virtual {v15}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 355
    .line 356
    .line 357
    move-result v15

    .line 358
    invoke-virtual {v4, v15}, Lcom/android/launcher3/folder/Folder;->h1(I)Ljava/util/List;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 363
    .line 364
    .line 365
    move-result-object v4

    .line 366
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 367
    .line 368
    .line 369
    move-result v15

    .line 370
    if-eqz v15, :cond_5

    .line 371
    .line 372
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v15

    .line 376
    check-cast v15, Landroid/view/View;

    .line 377
    .line 378
    invoke-direct {v0, v15}, Lcom/android/launcher3/folder/z;->e(Landroid/view/View;)Lcom/android/launcher3/BubbleTextView;

    .line 379
    .line 380
    .line 381
    move-result-object v15

    .line 382
    move-object/from16 v17, v4

    .line 383
    .line 384
    iget-boolean v4, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 385
    .line 386
    if-eqz v4, :cond_4

    .line 387
    .line 388
    const/4 v4, 0x0

    .line 389
    invoke-virtual {v15, v4}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 390
    .line 391
    .line 392
    :cond_4
    iget-boolean v4, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 393
    .line 394
    invoke-virtual {v15, v4}, Lcom/android/launcher3/BubbleTextView;->P(Z)Landroid/animation/ObjectAnimator;

    .line 395
    .line 396
    .line 397
    move-result-object v4

    .line 398
    invoke-virtual {v4, v2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {v0, v1, v4}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 402
    .line 403
    .line 404
    move-object/from16 v4, v17

    .line 405
    .line 406
    goto :goto_3

    .line 407
    :cond_5
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 408
    .line 409
    const-string v4, "color"

    .line 410
    .line 411
    invoke-direct {v0, v2, v4, v14, v11}, Lcom/android/launcher3/folder/z;->d(Landroid/graphics/drawable/GradientDrawable;Ljava/lang/String;II)Landroid/animation/ObjectAnimator;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    iput-object v2, v0, Lcom/android/launcher3/folder/z;->p:Landroid/animation/ObjectAnimator;

    .line 416
    .line 417
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 418
    .line 419
    .line 420
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 421
    .line 422
    sget-object v4, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 423
    .line 424
    const/4 v11, 0x0

    .line 425
    invoke-virtual {v0, v2, v4, v5, v11}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 430
    .line 431
    .line 432
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 433
    .line 434
    sget-object v14, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 435
    .line 436
    invoke-virtual {v0, v2, v14, v3, v11}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 441
    .line 442
    .line 443
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 444
    .line 445
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->u:Lcom/android/launcher3/folder/FolderPagedView;

    .line 446
    .line 447
    sget-object v3, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 448
    .line 449
    move/from16 v4, v16

    .line 450
    .line 451
    invoke-virtual {v0, v2, v3, v10, v4}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 452
    .line 453
    .line 454
    move-result-object v2

    .line 455
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 456
    .line 457
    .line 458
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 459
    .line 460
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 461
    .line 462
    invoke-virtual {v0, v2, v3, v10, v4}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 463
    .line 464
    .line 465
    move-result-object v2

    .line 466
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 467
    .line 468
    .line 469
    invoke-direct {v0}, Lcom/android/launcher3/folder/z;->h()Z

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    if-eqz v2, :cond_7

    .line 474
    .line 475
    iget-boolean v2, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 476
    .line 477
    if-eqz v2, :cond_6

    .line 478
    .line 479
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 480
    .line 481
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 482
    .line 483
    const/4 v11, 0x0

    .line 484
    invoke-virtual {v2, v11}, Landroid/view/View;->setAlpha(F)V

    .line 485
    .line 486
    .line 487
    iget v2, v0, Lcom/android/launcher3/folder/z;->h:I

    .line 488
    .line 489
    const/16 v4, 0x80

    .line 490
    .line 491
    sub-int/2addr v2, v4

    .line 492
    move v5, v4

    .line 493
    move v4, v2

    .line 494
    goto :goto_4

    .line 495
    :cond_6
    const/4 v11, 0x0

    .line 496
    const/4 v4, 0x0

    .line 497
    const/4 v5, 0x0

    .line 498
    goto :goto_4

    .line 499
    :cond_7
    const/4 v11, 0x0

    .line 500
    iget v4, v0, Lcom/android/launcher3/folder/z;->h:I

    .line 501
    .line 502
    move v5, v4

    .line 503
    const/4 v4, 0x0

    .line 504
    :goto_4
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 505
    .line 506
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 507
    .line 508
    sget-object v15, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 509
    .line 510
    const/high16 v3, 0x3f800000    # 1.0f

    .line 511
    .line 512
    invoke-virtual {v0, v2, v15, v11, v3}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 513
    .line 514
    .line 515
    move-result-object v2

    .line 516
    int-to-long v3, v4

    .line 517
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/z;->j(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JI)V

    .line 518
    .line 519
    .line 520
    sget-object v2, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 521
    .line 522
    iget-object v3, v0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 523
    .line 524
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    move-result-object v2

    .line 528
    check-cast v2, Ln1/C;

    .line 529
    .line 530
    invoke-virtual {v2}, Ln1/C;->i()Ln1/t;

    .line 531
    .line 532
    .line 533
    move-result-object v17

    .line 534
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 535
    .line 536
    iget-boolean v3, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 537
    .line 538
    xor-int/lit8 v22, v3, 0x1

    .line 539
    .line 540
    move-object/from16 v18, v2

    .line 541
    .line 542
    move-object/from16 v20, v7

    .line 543
    .line 544
    move-object/from16 v19, v12

    .line 545
    .line 546
    invoke-interface/range {v17 .. v22}, Ln1/t;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;

    .line 547
    .line 548
    .line 549
    move-result-object v2

    .line 550
    move-object/from16 v3, v19

    .line 551
    .line 552
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 553
    .line 554
    .line 555
    iget-boolean v2, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 556
    .line 557
    if-eqz v2, :cond_8

    .line 558
    .line 559
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 560
    .line 561
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 562
    .line 563
    .line 564
    move-result v2

    .line 565
    goto :goto_5

    .line 566
    :cond_8
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 567
    .line 568
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getDestinationPage()I

    .line 569
    .line 570
    .line 571
    move-result v2

    .line 572
    :goto_5
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->f:Landroid/content/Context;

    .line 573
    .line 574
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 575
    .line 576
    .line 577
    move-result-object v4

    .line 578
    invoke-static {v4}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 579
    .line 580
    .line 581
    move-result v4

    .line 582
    if-eqz v4, :cond_9

    .line 583
    .line 584
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->b:Lcom/android/launcher3/folder/FolderPagedView;

    .line 585
    .line 586
    invoke-virtual {v4}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 587
    .line 588
    .line 589
    move-result v4

    .line 590
    add-int/lit8 v4, v4, -0x1

    .line 591
    .line 592
    sub-int v2, v4, v2

    .line 593
    .line 594
    :cond_9
    iget v4, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 595
    .line 596
    mul-int/2addr v2, v4

    .line 597
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->q:Lcom/android/launcher3/h0;

    .line 598
    .line 599
    iget v4, v4, Lcom/android/launcher3/h0;->Q1:I

    .line 600
    .line 601
    int-to-float v4, v4

    .line 602
    div-float/2addr v4, v10

    .line 603
    const/high16 v5, 0x3e000000    # 0.125f

    .line 604
    .line 605
    mul-float/2addr v4, v5

    .line 606
    float-to-int v4, v4

    .line 607
    new-instance v5, Landroid/graphics/Rect;

    .line 608
    .line 609
    int-to-float v7, v2

    .line 610
    iget v11, v3, Landroid/graphics/Rect;->left:I

    .line 611
    .line 612
    int-to-float v11, v11

    .line 613
    div-float/2addr v11, v10

    .line 614
    add-float/2addr v11, v7

    .line 615
    float-to-int v11, v11

    .line 616
    sub-int/2addr v11, v4

    .line 617
    iget v12, v3, Landroid/graphics/Rect;->top:I

    .line 618
    .line 619
    int-to-float v12, v12

    .line 620
    div-float/2addr v12, v10

    .line 621
    float-to-int v12, v12

    .line 622
    sub-int/2addr v12, v4

    .line 623
    move/from16 v18, v4

    .line 624
    .line 625
    iget v4, v3, Landroid/graphics/Rect;->right:I

    .line 626
    .line 627
    int-to-float v4, v4

    .line 628
    div-float/2addr v4, v10

    .line 629
    add-float/2addr v7, v4

    .line 630
    float-to-int v4, v7

    .line 631
    add-int v4, v4, v18

    .line 632
    .line 633
    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    .line 634
    .line 635
    int-to-float v3, v3

    .line 636
    div-float/2addr v3, v10

    .line 637
    float-to-int v3, v3

    .line 638
    add-int v3, v3, v18

    .line 639
    .line 640
    invoke-direct {v5, v11, v12, v4, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 641
    .line 642
    .line 643
    new-instance v3, Landroid/graphics/Rect;

    .line 644
    .line 645
    iget v4, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 646
    .line 647
    add-int/2addr v4, v2

    .line 648
    iget v6, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 649
    .line 650
    const/4 v7, 0x0

    .line 651
    invoke-direct {v3, v2, v7, v4, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 652
    .line 653
    .line 654
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 655
    .line 656
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 657
    .line 658
    .line 659
    move-result-object v18

    .line 660
    iget-boolean v2, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 661
    .line 662
    xor-int/lit8 v22, v2, 0x1

    .line 663
    .line 664
    move-object/from16 v20, v3

    .line 665
    .line 666
    move-object/from16 v19, v5

    .line 667
    .line 668
    invoke-interface/range {v17 .. v22}, Ln1/t;->a(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;FZ)Landroid/animation/ValueAnimator;

    .line 669
    .line 670
    .line 671
    move-result-object v2

    .line 672
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 673
    .line 674
    .line 675
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 676
    .line 677
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;

    .line 678
    .line 679
    .line 680
    move-result-object v2

    .line 681
    iget-boolean v3, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 682
    .line 683
    if-eqz v3, :cond_a

    .line 684
    .line 685
    const/4 v3, 0x0

    .line 686
    goto :goto_6

    .line 687
    :cond_a
    const/high16 v3, 0x3f800000    # 1.0f

    .line 688
    .line 689
    :goto_6
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setAlpha(F)V

    .line 690
    .line 691
    .line 692
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 693
    .line 694
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;

    .line 695
    .line 696
    .line 697
    move-result-object v2

    .line 698
    const/high16 v3, 0x3f800000    # 1.0f

    .line 699
    .line 700
    const/4 v11, 0x0

    .line 701
    invoke-virtual {v0, v2, v15, v11, v3}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 702
    .line 703
    .line 704
    move-result-object v2

    .line 705
    iget-boolean v3, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 706
    .line 707
    const-wide/16 v6, 0x0

    .line 708
    .line 709
    if-eqz v3, :cond_b

    .line 710
    .line 711
    const-wide/16 v4, 0x20

    .line 712
    .line 713
    goto :goto_7

    .line 714
    :cond_b
    move-wide v4, v6

    .line 715
    :goto_7
    const/16 v11, 0x20

    .line 716
    .line 717
    if-eqz v3, :cond_c

    .line 718
    .line 719
    iget v3, v0, Lcom/android/launcher3/folder/z;->h:I

    .line 720
    .line 721
    add-int/lit8 v11, v3, -0x20

    .line 722
    .line 723
    :cond_c
    move-wide v3, v4

    .line 724
    move v5, v11

    .line 725
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/z;->j(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JI)V

    .line 726
    .line 727
    .line 728
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 729
    .line 730
    invoke-virtual {v2}, Lcom/android/launcher3/folder/Folder;->getContentAreaHeight()I

    .line 731
    .line 732
    .line 733
    move-result v2

    .line 734
    int-to-float v2, v2

    .line 735
    mul-float v3, v2, v10

    .line 736
    .line 737
    sub-float/2addr v2, v3

    .line 738
    iget-object v3, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 739
    .line 740
    iget-object v3, v3, Lcom/android/launcher3/folder/Folder;->w:Landroid/view/View;

    .line 741
    .line 742
    neg-float v2, v2

    .line 743
    const/4 v11, 0x0

    .line 744
    invoke-virtual {v0, v3, v14, v2, v11}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 745
    .line 746
    .line 747
    move-result-object v2

    .line 748
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/folder/z;->i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V

    .line 749
    .line 750
    .line 751
    iget v2, v0, Lcom/android/launcher3/folder/z;->h:I

    .line 752
    .line 753
    div-int/lit8 v5, v2, 0x2

    .line 754
    .line 755
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->a:Lcom/android/launcher3/folder/Folder;

    .line 756
    .line 757
    sget-object v3, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    .line 758
    .line 759
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getElevation()F

    .line 760
    .line 761
    .line 762
    move-result v4

    .line 763
    neg-float v4, v4

    .line 764
    invoke-virtual {v0, v2, v3, v4, v11}, Lcom/android/launcher3/folder/z;->b(Landroid/view/View;Landroid/util/Property;FF)Landroid/animation/Animator;

    .line 765
    .line 766
    .line 767
    move-result-object v2

    .line 768
    iget-boolean v3, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 769
    .line 770
    if-eqz v3, :cond_d

    .line 771
    .line 772
    int-to-long v6, v5

    .line 773
    :cond_d
    move-wide v3, v6

    .line 774
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/z;->j(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JI)V

    .line 775
    .line 776
    .line 777
    new-instance v2, Lcom/android/launcher3/folder/z$a;

    .line 778
    .line 779
    invoke-direct {v2, v0}, Lcom/android/launcher3/folder/z$a;-><init>(Lcom/android/launcher3/folder/z;)V

    .line 780
    .line 781
    .line 782
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 783
    .line 784
    .line 785
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    .line 786
    .line 787
    .line 788
    move-result-object v2

    .line 789
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 790
    .line 791
    .line 792
    move-result-object v2

    .line 793
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 794
    .line 795
    .line 796
    move-result v3

    .line 797
    if-eqz v3, :cond_f

    .line 798
    .line 799
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 800
    .line 801
    .line 802
    move-result-object v3

    .line 803
    check-cast v3, Landroid/animation/Animator;

    .line 804
    .line 805
    iget-boolean v4, v0, Lcom/android/launcher3/folder/z;->g:Z

    .line 806
    .line 807
    if-eqz v4, :cond_e

    .line 808
    .line 809
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->j:Landroid/view/animation/Interpolator;

    .line 810
    .line 811
    goto :goto_9

    .line 812
    :cond_e
    iget-object v4, v0, Lcom/android/launcher3/folder/z;->k:Landroid/view/animation/Interpolator;

    .line 813
    .line 814
    :goto_9
    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 815
    .line 816
    .line 817
    goto :goto_8

    .line 818
    :cond_f
    iget-object v2, v0, Lcom/android/launcher3/folder/z;->e:Lcom/android/launcher3/folder/u0;

    .line 819
    .line 820
    invoke-virtual {v2}, Lcom/android/launcher3/folder/u0;->I0()I

    .line 821
    .line 822
    .line 823
    move-result v2

    .line 824
    sub-int/2addr v9, v2

    .line 825
    div-float/2addr v10, v8

    .line 826
    int-to-float v2, v13

    .line 827
    div-float/2addr v2, v8

    .line 828
    float-to-int v2, v2

    .line 829
    add-int/2addr v2, v9

    .line 830
    invoke-direct {v0, v1, v10, v2, v9}, Lcom/android/launcher3/folder/z;->a(Landroid/animation/AnimatorSet;FII)V

    .line 831
    .line 832
    .line 833
    return-object v1
.end method

.method protected i(Landroid/animation/AnimatorSet;Landroid/animation/Animator;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Landroid/animation/Animator;->getStartDelay()J

    .line 2
    .line 3
    .line 4
    move-result-wide v3

    .line 5
    iget v5, p0, Lcom/android/launcher3/folder/z;->h:I

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/folder/z;->j(Landroid/animation/AnimatorSet;Landroid/animation/Animator;JI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
