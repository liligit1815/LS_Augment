.class public Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;
.super Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;
.source "PrimaryGroupTitleBehavior.java"


# instance fields
.field private D:Z

.field private E:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZZZLjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    move-object v0, p0

    .line 2
    move-object v1, p1

    .line 3
    move v2, p2

    .line 4
    move v3, p4

    .line 5
    move v4, p5

    .line 6
    move-object v5, p6

    .line 7
    move-object v6, p7

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;-><init>(Landroid/content/Context;ZZZLjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-boolean p3, v0, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;->D:Z

    .line 12
    .line 13
    iput-boolean v4, v0, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;->E:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method protected L()F
    .locals 2

    .line 1
    iget v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->n:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    sub-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->r:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    sub-float/2addr v0, v1

    .line 12
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 13
    .line 14
    int-to-float v1, v1

    .line 15
    sub-float/2addr v0, v1

    .line 16
    const/high16 v1, 0x40000000    # 2.0f

    .line 17
    .line 18
    div-float/2addr v0, v1

    .line 19
    iget p0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->w:F

    .line 20
    .line 21
    sub-float/2addr v0, p0

    .line 22
    return v0
.end method

.method protected M(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FIIFI)Z
    .locals 5

    .line 1
    check-cast p2, Landroid/widget/TextView;

    .line 2
    .line 3
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 4
    .line 5
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-ne p3, p7, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    .line 15
    .line 16
    .line 17
    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 23
    .line 24
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->g:I

    .line 25
    .line 26
    sub-int/2addr p1, p3

    .line 27
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/widget/TextView;->isSingleLine()Z

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    if-eqz p3, :cond_1

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 39
    .line 40
    .line 41
    const/4 p3, 0x2

    .line 42
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 43
    .line 44
    .line 45
    sget-object p3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 46
    .line 47
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 55
    .line 56
    if-ne p3, p7, :cond_2

    .line 57
    .line 58
    sget p3, LR3/l;->h:I

    .line 59
    .line 60
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 61
    .line 62
    .line 63
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->h:I

    .line 64
    .line 65
    if-eqz p3, :cond_3

    .line 66
    .line 67
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    if-nez p5, :cond_3

    .line 72
    .line 73
    sget p3, LR3/l;->j:I

    .line 74
    .line 75
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 76
    .line 77
    .line 78
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->h:I

    .line 79
    .line 80
    if-eqz p3, :cond_3

    .line 81
    .line 82
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    :cond_3
    :goto_1
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->p:I

    .line 86
    .line 87
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->o:I

    .line 88
    .line 89
    sub-int/2addr p3, p7

    .line 90
    int-to-float p3, p3

    .line 91
    mul-float/2addr p3, p4

    .line 92
    int-to-float p7, p7

    .line 93
    add-float/2addr p3, p7

    .line 94
    invoke-virtual {p2, v0, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 98
    .line 99
    .line 100
    move-result-object p7

    .line 101
    check-cast p7, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 102
    .line 103
    iget v1, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 104
    .line 105
    const/4 v2, 0x1

    .line 106
    if-eq v1, p8, :cond_4

    .line 107
    .line 108
    iput p8, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 109
    .line 110
    move v1, v2

    .line 111
    goto :goto_2

    .line 112
    :cond_4
    move v1, v0

    .line 113
    :goto_2
    iget v3, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 114
    .line 115
    if-eq v3, p1, :cond_5

    .line 116
    .line 117
    iput p1, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 118
    .line 119
    move p1, v2

    .line 120
    goto :goto_3

    .line 121
    :cond_5
    move p1, v0

    .line 122
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    const-string v4, "onCustomDependentViewChanged, setLayoutParams height="

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget v4, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 133
    .line 134
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v4, ", width="

    .line 138
    .line 139
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget v4, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 143
    .line 144
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v4, ", widthChanged="

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v4, ", heightChanged="

    .line 156
    .line 157
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v4, ", fontSize="

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p3

    .line 175
    const-string v3, "BS#PGroupTitleBehavior"

    .line 176
    .line 177
    invoke-static {v3, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    if-nez v1, :cond_6

    .line 181
    .line 182
    if-eqz p1, :cond_7

    .line 183
    .line 184
    :cond_6
    invoke-virtual {p2, p7}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    .line 186
    .line 187
    :cond_7
    invoke-static {p2}, LJ/I;->v(Landroid/view/View;)I

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-ne p1, v2, :cond_8

    .line 192
    .line 193
    move p1, v2

    .line 194
    goto :goto_4

    .line 195
    :cond_8
    move p1, v0

    .line 196
    :goto_4
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->v:F

    .line 197
    .line 198
    mul-float/2addr p3, p4

    .line 199
    if-nez p1, :cond_9

    .line 200
    .line 201
    neg-float p3, p3

    .line 202
    :cond_9
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 203
    .line 204
    .line 205
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 206
    .line 207
    add-int/2addr p1, p5

    .line 208
    int-to-float p1, p1

    .line 209
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 214
    .line 215
    if-ne p3, p7, :cond_a

    .line 216
    .line 217
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->w:F

    .line 218
    .line 219
    goto :goto_5

    .line 220
    :cond_a
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 221
    .line 222
    int-to-float p3, p3

    .line 223
    add-float/2addr p1, p3

    .line 224
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 225
    .line 226
    int-to-float p3, p3

    .line 227
    sub-float/2addr p1, p3

    .line 228
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 229
    .line 230
    add-int/2addr p8, p3

    .line 231
    int-to-float p3, p8

    .line 232
    sub-float/2addr p1, p3

    .line 233
    const/high16 p3, 0x40000000    # 2.0f

    .line 234
    .line 235
    div-float/2addr p1, p3

    .line 236
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->w:F

    .line 237
    .line 238
    cmpl-float p7, p1, p3

    .line 239
    .line 240
    if-lez p7, :cond_b

    .line 241
    .line 242
    goto :goto_5

    .line 243
    :cond_b
    move p1, p3

    .line 244
    :goto_5
    const p3, 0x3e4ccccd    # 0.2f

    .line 245
    .line 246
    .line 247
    if-nez p5, :cond_c

    .line 248
    .line 249
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->A:I

    .line 250
    .line 251
    if-le p6, p7, :cond_c

    .line 252
    .line 253
    sub-int/2addr p6, p7

    .line 254
    int-to-float p6, p6

    .line 255
    mul-float/2addr p6, p3

    .line 256
    add-float/2addr p1, p6

    .line 257
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 258
    .line 259
    .line 260
    goto :goto_6

    .line 261
    :cond_c
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 262
    .line 263
    .line 264
    :goto_6
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;->E:Z

    .line 265
    .line 266
    if-eqz p1, :cond_e

    .line 267
    .line 268
    cmpg-float p0, p4, p3

    .line 269
    .line 270
    if-gez p0, :cond_d

    .line 271
    .line 272
    const/4 p4, 0x0

    .line 273
    :cond_d
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 274
    .line 275
    .line 276
    goto :goto_7

    .line 277
    :cond_e
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/PrimaryGroupTitleBehavior;->D:Z

    .line 278
    .line 279
    if-nez p1, :cond_10

    .line 280
    .line 281
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    iget p0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 286
    .line 287
    if-ne p1, p0, :cond_f

    .line 288
    .line 289
    const/4 p0, 0x4

    .line 290
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 291
    .line 292
    .line 293
    goto :goto_7

    .line 294
    :cond_f
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 295
    .line 296
    .line 297
    :cond_10
    :goto_7
    invoke-static {p2}, LJ/I;->Z(Landroid/view/View;)V

    .line 298
    .line 299
    .line 300
    return v2
.end method
