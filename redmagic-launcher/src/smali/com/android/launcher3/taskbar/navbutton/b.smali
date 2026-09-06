.class public final Lcom/android/launcher3/taskbar/navbutton/b;
.super Lcom/android/launcher3/taskbar/navbutton/a;
.source "KidsNavLayoutter.kt"


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
    .locals 10

    .line 1
    const-string p2, "context"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const p2, 0x7f070b9b

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const v0, 0x7f070ba3

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const v1, 0x7f070ba1

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const v2, 0x7f070ba0

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    sub-int v2, p2, p1

    .line 51
    .line 52
    div-int/lit8 v2, v2, 0x2

    .line 53
    .line 54
    sub-int p1, v0, p1

    .line 55
    .line 56
    div-int/lit8 p1, p1, 0x2

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    const v5, 0x7f080d7c

    .line 74
    .line 75
    .line 76
    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 88
    .line 89
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v3, v2, p1, v2, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v5}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    const v6, 0x7f080d7e

    .line 115
    .line 116
    .line 117
    invoke-virtual {v5, v6}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v3, v2, p1, v2, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 136
    .line 137
    .line 138
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 139
    .line 140
    invoke-direct {p1, p2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const v3, 0x7f070b94

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    const/4 v3, 0x0

    .line 155
    invoke-virtual {p1, v2, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 166
    .line 167
    invoke-direct {p1, p2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    const v0, 0x7f070b6d

    .line 175
    .line 176
    .line 177
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 178
    .line 179
    .line 180
    move-result p2

    .line 181
    invoke-virtual {p1, p2, v3, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    .line 190
    .line 191
    const p1, 0x3dcccccd    # 0.1f

    .line 192
    .line 193
    .line 194
    const/high16 p2, 0x3f800000    # 1.0f

    .line 195
    .line 196
    invoke-static {p1, p2, p2, p2}, Landroid/graphics/Color;->argb(FFFF)I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    new-instance p2, Landroid/graphics/drawable/PaintDrawable;

    .line 201
    .line 202
    invoke-direct {p2, p1}, Landroid/graphics/drawable/PaintDrawable;-><init>(I)V

    .line 203
    .line 204
    .line 205
    int-to-float p1, v1

    .line 206
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/PaintDrawable;->setCornerRadius(F)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    const-string p2, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 232
    .line 233
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 237
    .line 238
    invoke-virtual {p1}, Landroid/widget/FrameLayout$LayoutParams;->getMarginEnd()I

    .line 239
    .line 240
    .line 241
    move-result p2

    .line 242
    div-int/lit8 p2, p2, 0x2

    .line 243
    .line 244
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p1}, Landroid/widget/FrameLayout$LayoutParams;->getMarginStart()I

    .line 248
    .line 249
    .line 250
    move-result p2

    .line 251
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 252
    .line 253
    .line 254
    const/16 p2, 0x11

    .line 255
    .line 256
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 257
    .line 258
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->requestLayout()V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    const/4 p2, 0x0

    .line 270
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    const p2, 0x7f070b78

    .line 292
    .line 293
    .line 294
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    const/4 v8, 0x0

    .line 303
    const v9, 0x800005

    .line 304
    .line 305
    .line 306
    const/4 v6, -0x2

    .line 307
    const/4 v7, 0x0

    .line 308
    move-object v4, p0

    .line 309
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 310
    .line 311
    .line 312
    move-object v0, v4

    .line 313
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    const/4 v2, -0x2

    .line 318
    const v5, 0x800003

    .line 319
    .line 320
    .line 321
    move v4, v3

    .line 322
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/navbutton/a;->n(Landroid/view/ViewGroup;IIII)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    if-eqz p0, :cond_0

    .line 330
    .line 331
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    .line 352
    .line 353
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    if-eqz p0, :cond_1

    .line 358
    .line 359
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 379
    .line 380
    .line 381
    :cond_1
    return-void
.end method
