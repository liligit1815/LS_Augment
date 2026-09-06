.class public abstract Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;
.super Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;
.source "BaseSinkGroupTitleBehavior.java"


# instance fields
.field protected A:I

.field protected B:Ljava/lang/String;

.field protected C:Ljava/lang/String;

.field protected k:I

.field protected l:I

.field protected m:I

.field protected n:I

.field protected o:I

.field protected p:I

.field protected q:I

.field protected r:I

.field protected s:I

.field protected t:I

.field protected u:F

.field protected v:F

.field protected w:F

.field protected x:F

.field protected y:I

.field protected z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZZLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 7
    .line 8
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 9
    .line 10
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 11
    .line 12
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->n:I

    .line 13
    .line 14
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 15
    .line 16
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 17
    .line 18
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 19
    .line 20
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->r:I

    .line 21
    .line 22
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->s:I

    .line 23
    .line 24
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->u:F

    .line 28
    .line 29
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->v:F

    .line 30
    .line 31
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->w:F

    .line 32
    .line 33
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->x:F

    .line 34
    .line 35
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->A:I

    .line 36
    .line 37
    iput-object p5, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->B:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p6, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->C:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->K(Landroid/content/Context;ZZZ)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private K(Landroid/content/Context;ZZZ)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "dimen"

    .line 6
    .line 7
    const-string v2, "android"

    .line 8
    .line 9
    const-string v3, "status_bar_height"

    .line 10
    .line 11
    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-gtz v1, :cond_0

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 24
    .line 25
    sget v1, LR3/e;->v:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 32
    .line 33
    sget v1, LR3/e;->z:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->n:I

    .line 40
    .line 41
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 42
    .line 43
    iget v3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 44
    .line 45
    add-int/2addr v2, v3

    .line 46
    if-gt v1, v2, :cond_1

    .line 47
    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :cond_1
    sget v1, LR3/e;->w:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 57
    .line 58
    sget v1, LR3/e;->A:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 65
    .line 66
    sget v1, LR3/e;->V:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 73
    .line 74
    if-lez v2, :cond_a

    .line 75
    .line 76
    iget v3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 77
    .line 78
    if-lez v3, :cond_a

    .line 79
    .line 80
    if-lt v3, v2, :cond_a

    .line 81
    .line 82
    if-gtz v1, :cond_2

    .line 83
    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :cond_2
    int-to-float v2, v2

    .line 87
    invoke-static {v2}, Lb4/d;->b(F)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    iput v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 92
    .line 93
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 94
    .line 95
    int-to-float v2, v2

    .line 96
    invoke-static {v2}, Lb4/d;->b(F)I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    iput v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->r:I

    .line 101
    .line 102
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 103
    .line 104
    if-nez v2, :cond_3

    .line 105
    .line 106
    invoke-static {p1}, Lb4/d;->c(Landroid/content/Context;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 111
    .line 112
    :cond_3
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 113
    .line 114
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->j:I

    .line 115
    .line 116
    iget-object p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->B:Ljava/lang/String;

    .line 117
    .line 118
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 119
    .line 120
    int-to-float v2, v2

    .line 121
    invoke-static {p1, v2}, Lb4/d;->a(Ljava/lang/String;F)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 126
    .line 127
    if-le p1, v2, :cond_4

    .line 128
    .line 129
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->r:I

    .line 130
    .line 131
    mul-int/lit8 p1, p1, 0x2

    .line 132
    .line 133
    add-int/lit8 p1, p1, 0x6

    .line 134
    .line 135
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->r:I

    .line 136
    .line 137
    :cond_4
    int-to-float p1, v1

    .line 138
    invoke-static {p1}, Lb4/d;->b(F)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->s:I

    .line 143
    .line 144
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 145
    .line 146
    iget-object v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->C:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v1, p1}, Lb4/d;->a(Ljava/lang/String;F)I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->j:I

    .line 153
    .line 154
    if-le p1, v1, :cond_5

    .line 155
    .line 156
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 157
    .line 158
    mul-int/lit8 p1, p1, 0x2

    .line 159
    .line 160
    add-int/lit8 p1, p1, 0x6

    .line 161
    .line 162
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 163
    .line 164
    :cond_5
    if-eqz p4, :cond_6

    .line 165
    .line 166
    sget p1, LR3/e;->d0:I

    .line 167
    .line 168
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    goto :goto_0

    .line 173
    :cond_6
    if-eqz p2, :cond_7

    .line 174
    .line 175
    sget p1, LR3/e;->P:I

    .line 176
    .line 177
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    goto :goto_0

    .line 182
    :cond_7
    sget p1, LR3/e;->d0:I

    .line 183
    .line 184
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    :goto_0
    sget p2, LR3/e;->Y:I

    .line 189
    .line 190
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    sub-int/2addr p1, p2

    .line 195
    int-to-float p1, p1

    .line 196
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->v:F

    .line 197
    .line 198
    const/high16 p1, 0x40000000    # 2.0f

    .line 199
    .line 200
    if-eqz p4, :cond_8

    .line 201
    .line 202
    iget p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 203
    .line 204
    int-to-float p2, p2

    .line 205
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 206
    .line 207
    :goto_1
    int-to-float p3, p3

    .line 208
    sub-float/2addr p2, p3

    .line 209
    div-float/2addr p2, p1

    .line 210
    goto :goto_2

    .line 211
    :cond_8
    if-eqz p3, :cond_9

    .line 212
    .line 213
    iget p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 214
    .line 215
    int-to-float p2, p2

    .line 216
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 217
    .line 218
    iget p4, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->s:I

    .line 219
    .line 220
    add-int/2addr p3, p4

    .line 221
    goto :goto_1

    .line 222
    :cond_9
    iget p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 223
    .line 224
    int-to-float p2, p2

    .line 225
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :goto_2
    iput p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->w:F

    .line 229
    .line 230
    iget p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 231
    .line 232
    int-to-float p2, p2

    .line 233
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 234
    .line 235
    int-to-float p3, p3

    .line 236
    add-float/2addr p2, p3

    .line 237
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->s:I

    .line 238
    .line 239
    int-to-float p3, p3

    .line 240
    sub-float/2addr p2, p3

    .line 241
    div-float/2addr p2, p1

    .line 242
    iput p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->x:F

    .line 243
    .line 244
    invoke-virtual {p0}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->L()F

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->u:F

    .line 249
    .line 250
    sget p1, LR3/d;->f:I

    .line 251
    .line 252
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 253
    .line 254
    .line 255
    move-result p1

    .line 256
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->y:I

    .line 257
    .line 258
    sget p1, LR3/d;->e:I

    .line 259
    .line 260
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->z:I

    .line 265
    .line 266
    :cond_a
    :goto_3
    return-void
.end method


# virtual methods
.method protected abstract L()F
.end method

.method protected abstract M(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FIIFI)Z
.end method

.method public l(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 11

    .line 1
    iget v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->u:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpg-float v0, v0, v1

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    move-object v0, p3

    .line 12
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 13
    .line 14
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 15
    .line 16
    if-gtz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 23
    .line 24
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 25
    .line 26
    add-int/2addr v1, v2

    .line 27
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->A:I

    .line 28
    .line 29
    :cond_1
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 30
    .line 31
    if-lez v1, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getTop()I

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 38
    .line 39
    add-int v2, v1, v7

    .line 40
    .line 41
    int-to-float v2, v2

    .line 42
    int-to-float v1, v1

    .line 43
    div-float v6, v2, v1

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    iget v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 50
    .line 51
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 52
    .line 53
    sub-int/2addr v0, v1

    .line 54
    int-to-float v0, v0

    .line 55
    mul-float/2addr v0, v6

    .line 56
    int-to-float v1, v1

    .line 57
    add-float v9, v0, v1

    .line 58
    .line 59
    invoke-static {v9}, Lb4/d;->b(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->B:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v9}, Lb4/d;->a(Ljava/lang/String;F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 70
    .line 71
    if-le v1, v2, :cond_2

    .line 72
    .line 73
    mul-int/lit8 v0, v0, 0x2

    .line 74
    .line 75
    add-int/lit8 v0, v0, 0x6

    .line 76
    .line 77
    :cond_2
    move-object v2, p0

    .line 78
    move-object v3, p1

    .line 79
    move-object v4, p2

    .line 80
    move-object v5, p3

    .line 81
    move v10, v0

    .line 82
    invoke-virtual/range {v2 .. v10}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->M(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FIIFI)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0

    .line 87
    :cond_3
    move-object v0, p0

    .line 88
    move-object v1, p1

    .line 89
    move-object v2, p2

    .line 90
    move-object v3, p3

    .line 91
    iget p0, v0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 92
    .line 93
    int-to-float v7, p0

    .line 94
    iget v8, v0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->q:I

    .line 95
    .line 96
    const/4 v4, 0x0

    .line 97
    const/4 v5, 0x0

    .line 98
    const/4 v6, 0x0

    .line 99
    invoke-virtual/range {v0 .. v8}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->M(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FIIFI)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    return p0
.end method
