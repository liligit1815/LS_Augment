.class public Lcom/android/launcher3/iconarrange/IconArrangeTopBar;
.super Landroid/widget/LinearLayout;
.source "IconArrangeTopBar.java"

# interfaces
.implements Lcom/android/launcher3/g1;


# instance fields
.field private g:Z

.field private h:Lcom/android/launcher3/C2;

.field public i:Landroid/view/View$OnClickListener;

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->g:Z

    .line 4
    new-instance p2, Lcom/android/launcher3/iconarrange/d;

    invoke-direct {p2, p0}, Lcom/android/launcher3/iconarrange/d;-><init>(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;)V

    iput-object p2, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->i:Landroid/view/View$OnClickListener;

    .line 5
    check-cast p1, Lcom/android/launcher3/C2;

    iput-object p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;Lcom/android/launcher3/views/k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->k(Lcom/android/launcher3/views/k;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->l(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;Lcom/android/launcher3/views/k;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->j(Lcom/android/launcher3/views/k;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(Lcom/android/launcher3/views/k;)V
    .locals 8

    .line 1
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->D()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->q()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/X3;->q()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object v0, v0, Lcom/android/launcher3/h0;->l3:Landroid/graphics/Rect;

    .line 46
    .line 47
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    div-int/lit8 v0, v0, 0x3

    .line 50
    .line 51
    sub-int/2addr v2, v0

    .line 52
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 59
    .line 60
    iget v0, v0, Lcom/android/launcher3/r4;->Q:I

    .line 61
    .line 62
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/android/launcher3/H5$g;->a()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const v2, 0x7f0704b2

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconBgColor()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconColor()I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {v4}, Lcom/android/launcher3/resource/B;->s()Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_2

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const v4, 0x7f0704b3

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    const v5, 0x7f080da0

    .line 130
    .line 131
    .line 132
    invoke-static {v4, v5}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    const/4 v5, 0x0

    .line 137
    if-eqz v4, :cond_3

    .line 138
    .line 139
    invoke-virtual {v4, v5, v5, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v4, v2, v3}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 143
    .line 144
    .line 145
    :cond_3
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    const v7, 0x7f080d9f

    .line 150
    .line 151
    .line 152
    invoke-static {v6, v7}, Lz/a;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    if-eqz v6, :cond_4

    .line 157
    .line 158
    invoke-virtual {v6, v5, v5, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, v6, v2, v3}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 162
    .line 163
    .line 164
    :cond_4
    const v1, 0x7f0b0312

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    check-cast v1, Landroid/widget/TextView;

    .line 172
    .line 173
    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 174
    .line 175
    .line 176
    const/4 v2, 0x0

    .line 177
    invoke-virtual {v1, v2, v4, v2, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v5, v5}, Landroid/widget/TextView;->measure(II)V

    .line 181
    .line 182
    .line 183
    new-instance v3, Lcom/android/launcher3/iconarrange/e;

    .line 184
    .line 185
    invoke-direct {v3, p0, p1}, Lcom/android/launcher3/iconarrange/e;-><init>(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;Lcom/android/launcher3/views/k;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    const v3, 0x7f0b0305

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    check-cast v3, Landroid/widget/TextView;

    .line 199
    .line 200
    invoke-virtual {v3, v5, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3, v2, v6, v2, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v3, v5, v5}, Landroid/widget/TextView;->measure(II)V

    .line 207
    .line 208
    .line 209
    new-instance v2, Lcom/android/launcher3/iconarrange/f;

    .line 210
    .line 211
    invoke-direct {v2, p0, p1}, Lcom/android/launcher3/iconarrange/f;-><init>(Lcom/android/launcher3/iconarrange/IconArrangeTopBar;Lcom/android/launcher3/views/k;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 221
    .line 222
    .line 223
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_5

    .line 228
    .line 229
    const-string p1, "sans-serif-medium"

    .line 230
    .line 231
    invoke-static {p1, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 236
    .line 237
    .line 238
    invoke-static {p1, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 243
    .line 244
    .line 245
    :cond_5
    const/4 p1, 0x1

    .line 246
    const/4 v2, -0x1

    .line 247
    if-ne v2, v0, :cond_6

    .line 248
    .line 249
    move v4, p1

    .line 250
    goto :goto_1

    .line 251
    :cond_6
    move v4, v5

    .line 252
    :goto_1
    invoke-static {v1, v4}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 253
    .line 254
    .line 255
    if-ne v2, v0, :cond_7

    .line 256
    .line 257
    goto :goto_2

    .line 258
    :cond_7
    move p1, v5

    .line 259
    :goto_2
    invoke-static {v3, p1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 260
    .line 261
    .line 262
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-eqz p1, :cond_8

    .line 271
    .line 272
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    const v0, 0x7f0704af

    .line 277
    .line 278
    .line 279
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    invoke-virtual {v1, v5, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    invoke-virtual {v3, v5, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 295
    .line 296
    .line 297
    :cond_8
    return-void
.end method

.method private i(Lcom/android/launcher3/views/k;)Z
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 21
    .line 22
    .line 23
    return p1

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2, v0}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 41
    .line 42
    const-string v2, "IconArrangeTopBar"

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    const-string p0, "isNeedAlign--layout == null"

    .line 47
    .line 48
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    int-to-long v3, p0

    .line 61
    const-wide/16 v5, -0xc9

    .line 62
    .line 63
    cmp-long p0, v3, v5

    .line 64
    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    const-string p0, "isNeedAlign--screenId is EXTRA_EMPTY_SCREEN_ID"

    .line 68
    .line 69
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    return p1

    .line 73
    :cond_3
    return v1
.end method

.method private synthetic j(Lcom/android/launcher3/views/k;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->u2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    sget-wide v0, Lcom/android/launcher3/touch/A;->c:J

    .line 16
    .line 17
    sub-long v0, p0, v0

    .line 18
    .line 19
    const-wide/16 v2, 0x7d0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    sput-wide p0, Lcom/android/launcher3/touch/A;->c:J

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->g0()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->i(Lcom/android/launcher3/views/k;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v3, "initTextViewLayout "

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v3, "//"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const-string v3, "IconArrangeTopBar"

    .line 73
    .line 74
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    if-eqz v1, :cond_1

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->e(Lcom/android/launcher3/views/k;Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object p1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_1

    .line 96
    .line 97
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->u()V

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method

.method private synthetic k(Lcom/android/launcher3/views/k;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->u2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    sget-wide v0, Lcom/android/launcher3/touch/A;->c:J

    .line 16
    .line 17
    sub-long v0, p0, v0

    .line 18
    .line 19
    const-wide/16 v2, 0x7d0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-lez v0, :cond_1

    .line 24
    .line 25
    sput-wide p0, Lcom/android/launcher3/touch/A;->c:J

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/q4;->g0()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-direct {p0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->i(Lcom/android/launcher3/views/k;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->e(Lcom/android/launcher3/views/k;Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget-object p1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->u()V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string v0, "IconArrangeTopBar"

    .line 12
    .line 13
    if-gez p1, :cond_0

    .line 14
    .line 15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "mListener--currentPage="

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const v1, 0x7f0b0125

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/widget/ImageView;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/widget/ImageView;->getAlpha()F

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/high16 v3, 0x3f800000    # 1.0f

    .line 50
    .line 51
    cmpl-float v2, v2, v3

    .line 52
    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    const-string p0, "mListener--id == R.id.btn_home_on"

    .line 56
    .line 57
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {v1}, Landroid/widget/ImageView;->getAlpha()F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v2, 0x0

    .line 66
    cmpl-float v1, v1, v2

    .line 67
    .line 68
    if-nez v1, :cond_3

    .line 69
    .line 70
    const-string v1, "mListener--id == R.id.btn_home_off"

    .line 71
    .line 72
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1, p1}, Lx1/Z;->w(Lcom/android/launcher3/Workspace;I)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_2

    .line 92
    .line 93
    const/4 p1, 0x1

    .line 94
    invoke-virtual {p0, p1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->d(Z)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 98
    .line 99
    invoke-static {p0}, Lcom/android/launcher3/widget/suggest/v;->o(Lcom/android/launcher3/C2;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    return-void

    .line 103
    :cond_3
    const-string p0, "mListener--other"

    .line 104
    .line 105
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    return-void
.end method


# virtual methods
.method d(Z)V
    .locals 5

    .line 1
    const v0, 0x7f0b0125

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    const v1, 0x7f0b0124

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/high16 v3, 0x3f800000    # 1.0f

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-wide/16 v3, 0xfa

    .line 68
    .line 69
    invoke-virtual {p1, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 89
    .line 90
    .line 91
    :goto_0
    const p1, 0x7f0b0508

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Landroid/widget/TextView;

    .line 99
    .line 100
    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    const/4 p1, 0x1

    .line 111
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->g:Z

    .line 112
    .line 113
    return-void
.end method

.method public e(Lcom/android/launcher3/views/k;Z)V
    .locals 16

    .line 1
    invoke-static/range {p1 .. p1}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v1}, Lcom/android/launcher3/Workspace;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3, v2}, Lcom/android/launcher3/Workspace;->f(Lcom/android/launcher3/CellLayout;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    int-to-long v3, v3

    .line 35
    if-eqz v2, :cond_13

    .line 36
    .line 37
    const-wide/16 v5, -0xc9

    .line 38
    .line 39
    cmp-long v5, v3, v5

    .line 40
    .line 41
    if-nez v5, :cond_1

    .line 42
    .line 43
    goto/16 :goto_b

    .line 44
    .line 45
    :cond_1
    if-eqz p2, :cond_2

    .line 46
    .line 47
    invoke-static {v1}, Lh1/a;->x(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-static {v1}, Lh1/a;->w(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/android/launcher3/K5;->getCountX()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/K5;->getCountY()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    new-instance v7, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    new-instance v8, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    const/4 v10, 0x0

    .line 77
    :goto_1
    const/4 v11, 0x1

    .line 78
    if-ge v10, v6, :cond_8

    .line 79
    .line 80
    const/4 v12, 0x0

    .line 81
    :goto_2
    if-ge v12, v5, :cond_7

    .line 82
    .line 83
    invoke-virtual {v1, v12, v10}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v13

    .line 87
    if-nez v13, :cond_3

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_3
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v14

    .line 94
    check-cast v14, Lcom/android/launcher3/model/data/y;

    .line 95
    .line 96
    iget v15, v14, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 97
    .line 98
    if-eq v15, v11, :cond_5

    .line 99
    .line 100
    const/4 v9, 0x6

    .line 101
    if-eq v15, v9, :cond_5

    .line 102
    .line 103
    if-nez v15, :cond_4

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    const/4 v9, 0x2

    .line 107
    if-ne v15, v9, :cond_6

    .line 108
    .line 109
    iget v9, v14, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 110
    .line 111
    if-ne v9, v11, :cond_6

    .line 112
    .line 113
    iget v9, v14, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 114
    .line 115
    if-ne v9, v11, :cond_6

    .line 116
    .line 117
    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    instance-of v9, v13, Lcom/android/launcher3/folder/FolderIcon;

    .line 121
    .line 122
    if-eqz v9, :cond_6

    .line 123
    .line 124
    check-cast v13, Lcom/android/launcher3/folder/FolderIcon;

    .line 125
    .line 126
    invoke-virtual {v13}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    invoke-virtual {v9}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    invoke-virtual {v9}, Lcom/android/launcher3/model/data/p;->E()V

    .line 135
    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_5
    :goto_3
    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_6
    :goto_4
    add-int/lit8 v12, v12, 0x1

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_7
    add-int/lit8 v10, v10, 0x1

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_8
    if-nez p2, :cond_9

    .line 148
    .line 149
    invoke-static {v7}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 150
    .line 151
    .line 152
    :cond_9
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 157
    .line 158
    .line 159
    move-result v9

    .line 160
    if-eqz v9, :cond_a

    .line 161
    .line 162
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v9

    .line 166
    check-cast v9, Landroid/view/View;

    .line 167
    .line 168
    invoke-virtual {v2, v9}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 169
    .line 170
    .line 171
    goto :goto_5

    .line 172
    :cond_a
    const/4 v1, 0x0

    .line 173
    :goto_6
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    if-ge v1, v9, :cond_b

    .line 178
    .line 179
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v9

    .line 183
    check-cast v9, Landroid/view/View;

    .line 184
    .line 185
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    check-cast v9, Lcom/android/launcher3/model/data/y;

    .line 190
    .line 191
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    add-int/lit8 v1, v1, 0x1

    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_b
    if-eqz p2, :cond_e

    .line 198
    .line 199
    const/4 v1, 0x0

    .line 200
    const/4 v7, 0x0

    .line 201
    :goto_7
    if-ge v1, v6, :cond_12

    .line 202
    .line 203
    const/4 v9, 0x0

    .line 204
    :goto_8
    if-ge v9, v5, :cond_d

    .line 205
    .line 206
    invoke-virtual {v2, v9, v1}, Lcom/android/launcher3/CellLayout;->b0(II)Z

    .line 207
    .line 208
    .line 209
    move-result v10

    .line 210
    if-nez v10, :cond_c

    .line 211
    .line 212
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 213
    .line 214
    .line 215
    move-result v10

    .line 216
    if-le v10, v7, :cond_c

    .line 217
    .line 218
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v10

    .line 222
    check-cast v10, Lcom/android/launcher3/model/data/y;

    .line 223
    .line 224
    iput v9, v10, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 225
    .line 226
    iput v1, v10, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 227
    .line 228
    add-int/lit8 v7, v7, 0x1

    .line 229
    .line 230
    :cond_c
    add-int/lit8 v9, v9, 0x1

    .line 231
    .line 232
    goto :goto_8

    .line 233
    :cond_d
    add-int/lit8 v1, v1, 0x1

    .line 234
    .line 235
    goto :goto_7

    .line 236
    :cond_e
    sub-int/2addr v6, v11

    .line 237
    const/4 v1, 0x0

    .line 238
    :goto_9
    if-ltz v6, :cond_11

    .line 239
    .line 240
    add-int/lit8 v7, v5, -0x1

    .line 241
    .line 242
    :goto_a
    if-ltz v7, :cond_10

    .line 243
    .line 244
    invoke-virtual {v2, v7, v6}, Lcom/android/launcher3/CellLayout;->b0(II)Z

    .line 245
    .line 246
    .line 247
    move-result v9

    .line 248
    if-nez v9, :cond_f

    .line 249
    .line 250
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 251
    .line 252
    .line 253
    move-result v9

    .line 254
    if-le v9, v1, :cond_f

    .line 255
    .line 256
    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    move-result-object v9

    .line 260
    check-cast v9, Lcom/android/launcher3/model/data/y;

    .line 261
    .line 262
    iput v7, v9, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 263
    .line 264
    iput v6, v9, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 265
    .line 266
    add-int/lit8 v1, v1, 0x1

    .line 267
    .line 268
    :cond_f
    add-int/lit8 v7, v7, -0x1

    .line 269
    .line 270
    goto :goto_a

    .line 271
    :cond_10
    add-int/lit8 v6, v6, -0x1

    .line 272
    .line 273
    goto :goto_9

    .line 274
    :cond_11
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 275
    .line 276
    .line 277
    :cond_12
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    const/16 v2, -0x64

    .line 282
    .line 283
    long-to-int v3, v3

    .line 284
    invoke-virtual {v1, v8, v2, v3}, Lz1/J3;->U(Ljava/util/ArrayList;II)V

    .line 285
    .line 286
    .line 287
    const/4 v1, 0x0

    .line 288
    invoke-virtual {v0, v8, v1}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-virtual {v0, v11}, Lcom/android/launcher3/G4;->g(Z)V

    .line 296
    .line 297
    .line 298
    return-void

    .line 299
    :cond_13
    :goto_b
    new-instance v0, Ljava/lang/StringBuilder;

    .line 300
    .line 301
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 302
    .line 303
    .line 304
    const-string v1, "doAlignTopArrange--screenId="

    .line 305
    .line 306
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    const-string v1, "IconArrangeTopBar"

    .line 317
    .line 318
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    .line 320
    .line 321
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    const v0, 0x7f0b0125

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v2, 0xfa

    .line 20
    .line 21
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 26
    .line 27
    .line 28
    const v0, 0x7f0b0124

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 50
    .line 51
    .line 52
    const v0, 0x7f0b0508

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const/high16 v0, 0x3f800000    # 1.0f

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method g(Z)V
    .locals 5

    .line 1
    const v0, 0x7f0b0125

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/ImageView;

    .line 9
    .line 10
    const v1, 0x7f0b0124

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    const v4, 0x3dcccccd    # 0.1f

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {v1}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-wide/16 v1, 0xfa

    .line 63
    .line 64
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 92
    .line 93
    .line 94
    :goto_0
    const p1, 0x7f0b0508

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Landroid/widget/TextView;

    .line 102
    .line 103
    invoke-virtual {p1}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setAlpha(F)V

    .line 111
    .line 112
    .line 113
    const/4 p1, 0x0

    .line 114
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->g:Z

    .line 115
    .line 116
    return-void
.end method

.method getAlignButtonIconBgColor()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const v0, 0x7f0601d9

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const v0, 0x7f0601da

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {p0, v0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method getAlignButtonIconColor()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const v0, 0x7f0601db

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const v0, 0x7f0601dc

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {p0, v0}, Lz/a;->c(Landroid/content/Context;I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public m(I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconBgColor()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconColor()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const v2, 0x7f0b0125

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroid/widget/ImageView;

    .line 17
    .line 18
    const v3, 0x7f0b0124

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Landroid/widget/ImageView;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p0, v2, v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 39
    .line 40
    .line 41
    const v2, 0x7f0b0508

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 51
    .line 52
    .line 53
    const v2, 0x7f0b0312

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/4 v4, 0x1

    .line 70
    aget-object v3, v3, v4

    .line 71
    .line 72
    if-eqz v3, :cond_0

    .line 73
    .line 74
    invoke-virtual {p0, v3, v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 75
    .line 76
    .line 77
    :cond_0
    const v3, 0x7f0b0305

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    aget-object v5, v5, v4

    .line 94
    .line 95
    if-eqz v5, :cond_1

    .line 96
    .line 97
    invoke-virtual {p0, v5, v0, v1}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 98
    .line 99
    .line 100
    :cond_1
    const/4 p0, 0x0

    .line 101
    const/4 v0, -0x1

    .line 102
    if-ne v0, p1, :cond_2

    .line 103
    .line 104
    move v1, v4

    .line 105
    goto :goto_0

    .line 106
    :cond_2
    move v1, p0

    .line 107
    :goto_0
    invoke-static {v2, v1}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 108
    .line 109
    .line 110
    if-ne v0, p1, :cond_3

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    move v4, p0

    .line 114
    :goto_1
    invoke-static {v3, v4}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method n(Landroid/graphics/drawable/Drawable;II)V
    .locals 1

    .line 1
    instance-of p0, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 6
    .line 7
    const p0, 0x7f0b0307

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const p0, 0x7f0b0308

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p3}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    invoke-virtual {p1, p3}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public o(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "updateHomeScreenEditor stackTrace: "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    new-instance v1, Ljava/lang/Throwable;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "IconArrangeTopBar"

    .line 47
    .line 48
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast v0, Ljava/lang/Integer;

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v1, 0x1

    .line 70
    const/4 v2, 0x0

    .line 71
    if-ne p1, v0, :cond_2

    .line 72
    .line 73
    move v0, v1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    move v0, v2

    .line 76
    :goto_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0, p1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v0, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-ne p1, v0, :cond_3

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    move v1, v2

    .line 114
    :goto_1
    move v0, v1

    .line 115
    :cond_4
    if-eqz v0, :cond_5

    .line 116
    .line 117
    invoke-virtual {p0, v2}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->d(Z)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->g(Z)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0125

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->i:Landroid/view/View$OnClickListener;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    const v1, 0x7f0b0124

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Landroid/widget/ImageView;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->i:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    const v5, 0x7f0704b3

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 66
    .line 67
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 68
    .line 69
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 70
    .line 71
    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 72
    .line 73
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->Y()Lcom/android/launcher3/H5$g;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2}, Lcom/android/launcher3/H5$g;->a()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconBgColor()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->getAlignButtonIconColor()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0, v3, v4}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0, v3, v4}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->n(Landroid/graphics/drawable/Drawable;II)V

    .line 111
    .line 112
    .line 113
    const v0, 0x7f0b0508

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Landroid/widget/TextView;

    .line 121
    .line 122
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 126
    .line 127
    invoke-direct {p0, v0}, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h(Lcom/android/launcher3/views/k;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public p(ZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->j:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->k:Z

    .line 4
    .line 5
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/IconArrangeTopBar;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->D()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->q()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-boolean v1, p1, Lcom/android/launcher3/h0;->N0:Z

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->q()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const v1, 0x7f0c0091

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    int-to-float p0, p0

    .line 65
    invoke-static {p0}, Lcom/android/launcher3/N5;->T(F)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    add-int/2addr p1, p0

    .line 70
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/X3;->q()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const v1, 0x7f0c0090

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    int-to-float p0, p0

    .line 89
    invoke-static {p0}, Lcom/android/launcher3/N5;->T(F)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    add-int/2addr p1, p0

    .line 94
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 98
    .line 99
    iget p1, p1, Lcom/android/launcher3/r4;->Q:I

    .line 100
    .line 101
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public setTopBarVisible(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/16 p1, 0x8

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
