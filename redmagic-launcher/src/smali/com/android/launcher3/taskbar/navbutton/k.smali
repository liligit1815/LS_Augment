.class public final Lcom/android/launcher3/taskbar/navbutton/k;
.super Lcom/android/launcher3/taskbar/navbutton/a;
.source "PhonePortraitNavLayoutter.kt"


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V
    .locals 1

    .line 1
    const-string v0, "resources"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "navBarContainer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "endContextualContainer"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "startContextualContainer"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct/range {p0 .. p7}, Lcom/android/launcher3/taskbar/navbutton/a;-><init>(Landroid/content/res/Resources;Landroid/widget/LinearLayout;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/Space;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/taskbar/I1;Z)V
    .locals 18

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 13
    .line 14
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const v2, 0x7f070ba6

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const v3, 0x7f070ba7

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const v4, 0x7f070ba5

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    mul-int/lit8 v4, v2, 0x2

    .line 48
    .line 49
    sub-int/2addr v0, v4

    .line 50
    mul-int/lit8 v4, v3, 0x2

    .line 51
    .line 52
    sub-int/2addr v0, v4

    .line 53
    int-to-float v0, v0

    .line 54
    const/high16 v4, 0x40200000    # 2.5f

    .line 55
    .line 56
    div-float v4, v0, v4

    .line 57
    .line 58
    const/high16 v5, 0x3e800000    # 0.25f

    .line 59
    .line 60
    mul-float/2addr v4, v5

    .line 61
    const/4 v5, 0x2

    .line 62
    int-to-float v5, v5

    .line 63
    mul-float v6, v4, v5

    .line 64
    .line 65
    sub-float/2addr v0, v6

    .line 66
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 67
    .line 68
    float-to-int v8, v0

    .line 69
    const/4 v9, -0x1

    .line 70
    invoke-direct {v7, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 71
    .line 72
    .line 73
    const/4 v8, 0x0

    .line 74
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 75
    .line 76
    iput v8, v7, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 77
    .line 78
    int-to-float v10, v3

    .line 79
    add-float/2addr v10, v4

    .line 80
    int-to-float v11, v2

    .line 81
    add-float/2addr v10, v11

    .line 82
    float-to-int v10, v10

    .line 83
    invoke-virtual {v7, v10}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v7, v10}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 90
    .line 91
    .line 92
    move-result-object v10

    .line 93
    invoke-virtual {v10}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 94
    .line 95
    .line 96
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    invoke-virtual {v10, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 108
    .line 109
    .line 110
    move-result-object v11

    .line 111
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 115
    .line 116
    .line 117
    move-result-object v10

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 119
    .line 120
    .line 121
    move-result-object v11

    .line 122
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 126
    .line 127
    .line 128
    move-result-object v10

    .line 129
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->j()Landroid/widget/ImageView;

    .line 130
    .line 131
    .line 132
    move-result-object v11

    .line 133
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    invoke-virtual {v10, v7}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    const/16 v10, 0x11

    .line 148
    .line 149
    invoke-virtual {v7, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 150
    .line 151
    .line 152
    int-to-float v7, v1

    .line 153
    sub-float/2addr v0, v7

    .line 154
    mul-float v7, v6, v5

    .line 155
    .line 156
    sub-float/2addr v0, v7

    .line 157
    const/high16 v7, 0x40000000    # 2.0f

    .line 158
    .line 159
    div-float/2addr v0, v7

    .line 160
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    :goto_0
    if-ge v8, v7, :cond_2

    .line 169
    .line 170
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 171
    .line 172
    .line 173
    move-result-object v10

    .line 174
    invoke-virtual {v10, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v10

    .line 178
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 179
    .line 180
    .line 181
    move-result-object v10

    .line 182
    const-string v11, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams"

    .line 183
    .line 184
    invoke-static {v10, v11}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    check-cast v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 188
    .line 189
    div-float v11, v0, v5

    .line 190
    .line 191
    float-to-int v11, v11

    .line 192
    if-nez v8, :cond_0

    .line 193
    .line 194
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 195
    .line 196
    .line 197
    float-to-int v11, v6

    .line 198
    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 202
    .line 203
    .line 204
    move-result-object v12

    .line 205
    invoke-virtual {v12}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 206
    .line 207
    .line 208
    move-result v12

    .line 209
    add-int/lit8 v12, v12, -0x1

    .line 210
    .line 211
    if-ne v8, v12, :cond_1

    .line 212
    .line 213
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 214
    .line 215
    .line 216
    float-to-int v11, v6

    .line 217
    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_1
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 224
    .line 225
    .line 226
    iput v1, v10, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 227
    .line 228
    :goto_1
    add-int/lit8 v8, v8, 0x1

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 236
    .line 237
    .line 238
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 243
    .line 244
    .line 245
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 246
    .line 247
    .line 248
    move-result-object v11

    .line 249
    float-to-int v14, v4

    .line 250
    add-int v13, v2, v3

    .line 251
    .line 252
    move v12, v14

    .line 253
    const/4 v14, 0x0

    .line 254
    const v15, 0x800003

    .line 255
    .line 256
    .line 257
    move-object/from16 v10, p0

    .line 258
    .line 259
    invoke-virtual/range {v10 .. v15}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 260
    .line 261
    .line 262
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    const/4 v15, 0x0

    .line 267
    const v17, 0x800005

    .line 268
    .line 269
    .line 270
    move v14, v12

    .line 271
    move/from16 v16, v13

    .line 272
    .line 273
    move-object/from16 v12, p0

    .line 274
    .line 275
    move-object v13, v0

    .line 276
    invoke-virtual/range {v12 .. v17}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 277
    .line 278
    .line 279
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->l()Landroid/widget/Space;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-virtual {v0, v1, v9, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 288
    .line 289
    .line 290
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    if-eqz v0, :cond_3

    .line 295
    .line 296
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 316
    .line 317
    .line 318
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    if-eqz v0, :cond_4

    .line 323
    .line 324
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 333
    .line 334
    .line 335
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 344
    .line 345
    .line 346
    :cond_4
    return-void
.end method
