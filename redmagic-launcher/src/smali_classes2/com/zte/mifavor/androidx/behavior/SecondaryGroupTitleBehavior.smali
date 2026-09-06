.class public Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;
.super Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;
.source "SecondaryGroupTitleBehavior.java"


# instance fields
.field private D:Z

.field private E:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;-><init>(Landroid/content/Context;ZZZLjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;->D:Z

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;->E:Z

    .line 7
    .line 8
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
    add-float/2addr v0, v1

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
    iget p0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->x:F

    .line 20
    .line 21
    sub-float/2addr v0, p0

    .line 22
    return v0
.end method

.method protected M(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FIIFI)Z
    .locals 4

    .line 1
    check-cast p2, Landroid/widget/TextView;

    .line 2
    .line 3
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->j:I

    .line 4
    .line 5
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 6
    .line 7
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 8
    .line 9
    .line 10
    move-result p7

    .line 11
    iget v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-ne p7, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    .line 17
    .line 18
    .line 19
    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->j:I

    .line 25
    .line 26
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->g:I

    .line 27
    .line 28
    sub-int/2addr p1, p3

    .line 29
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->s:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p2}, Landroid/widget/TextView;->isSingleLine()Z

    .line 37
    .line 38
    .line 39
    move-result p7

    .line 40
    if-eqz p7, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 43
    .line 44
    .line 45
    const/4 p7, 0x2

    .line 46
    invoke-virtual {p2, p7}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 47
    .line 48
    .line 49
    sget-object p7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 50
    .line 51
    invoke-virtual {p2, p7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 55
    .line 56
    .line 57
    move-result-object p7

    .line 58
    check-cast p7, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 59
    .line 60
    iget v0, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    if-eq v0, p3, :cond_2

    .line 64
    .line 65
    iput p3, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 66
    .line 67
    move p3, v2

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move p3, v1

    .line 70
    :goto_1
    iget v0, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 71
    .line 72
    if-eq v0, p1, :cond_3

    .line 73
    .line 74
    iput p1, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 75
    .line 76
    move p1, v2

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    move p1, v1

    .line 79
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v3, "onCustomDependentViewChanged, setLayoutParams height="

    .line 85
    .line 86
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget v3, p7, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 90
    .line 91
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v3, ", width="

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v3, p7, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 100
    .line 101
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v3, ", widthChanged="

    .line 105
    .line 106
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v3, ", heightChanged="

    .line 113
    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v3, "BS#SGroupTitleBehavior"

    .line 125
    .line 126
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    if-nez p3, :cond_4

    .line 130
    .line 131
    if-eqz p1, :cond_5

    .line 132
    .line 133
    :cond_4
    invoke-virtual {p2, p7}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    invoke-static {p2}, LJ/I;->v(Landroid/view/View;)I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-ne p1, v2, :cond_6

    .line 141
    .line 142
    move p1, v2

    .line 143
    goto :goto_3

    .line 144
    :cond_6
    move p1, v1

    .line 145
    :goto_3
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->v:F

    .line 146
    .line 147
    mul-float/2addr p3, p4

    .line 148
    if-nez p1, :cond_7

    .line 149
    .line 150
    neg-float p3, p3

    .line 151
    :cond_7
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 152
    .line 153
    .line 154
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 155
    .line 156
    add-int/2addr p1, p5

    .line 157
    int-to-float p1, p1

    .line 158
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    iget p7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->k:I

    .line 163
    .line 164
    const/high16 v0, 0x40000000    # 2.0f

    .line 165
    .line 166
    if-ne p3, p7, :cond_8

    .line 167
    .line 168
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->x:F

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_8
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->l:I

    .line 172
    .line 173
    int-to-float p3, p3

    .line 174
    add-float/2addr p1, p3

    .line 175
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->m:I

    .line 176
    .line 177
    int-to-float p3, p3

    .line 178
    sub-float/2addr p1, p3

    .line 179
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->t:I

    .line 180
    .line 181
    sub-int/2addr p8, p3

    .line 182
    int-to-float p3, p8

    .line 183
    add-float/2addr p1, p3

    .line 184
    div-float/2addr p1, v0

    .line 185
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->x:F

    .line 186
    .line 187
    cmpl-float p7, p1, p3

    .line 188
    .line 189
    if-lez p7, :cond_9

    .line 190
    .line 191
    goto :goto_4

    .line 192
    :cond_9
    move p1, p3

    .line 193
    :goto_4
    if-nez p5, :cond_a

    .line 194
    .line 195
    iget p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkGroupTitleBehavior;->A:I

    .line 196
    .line 197
    if-le p6, p3, :cond_a

    .line 198
    .line 199
    sub-int/2addr p6, p3

    .line 200
    int-to-float p3, p6

    .line 201
    const p5, 0x3e4ccccd    # 0.2f

    .line 202
    .line 203
    .line 204
    mul-float/2addr p3, p5

    .line 205
    add-float/2addr p1, p3

    .line 206
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 207
    .line 208
    .line 209
    goto :goto_5

    .line 210
    :cond_a
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 211
    .line 212
    .line 213
    :goto_5
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;->E:Z

    .line 214
    .line 215
    if-nez p1, :cond_b

    .line 216
    .line 217
    iget-boolean p0, p0, Lcom/zte/mifavor/androidx/behavior/SecondaryGroupTitleBehavior;->D:Z

    .line 218
    .line 219
    if-eqz p0, :cond_b

    .line 220
    .line 221
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 222
    .line 223
    .line 224
    goto :goto_6

    .line 225
    :cond_b
    const/high16 p0, 0x3f000000    # 0.5f

    .line 226
    .line 227
    cmpg-float p1, p4, p0

    .line 228
    .line 229
    if-gez p1, :cond_c

    .line 230
    .line 231
    const/4 p0, 0x4

    .line 232
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 233
    .line 234
    .line 235
    goto :goto_6

    .line 236
    :cond_c
    sub-float/2addr p4, p0

    .line 237
    mul-float/2addr p4, v0

    .line 238
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 242
    .line 243
    .line 244
    :goto_6
    invoke-static {p2}, LJ/I;->Z(Landroid/view/View;)V

    .line 245
    .line 246
    .line 247
    return v2
.end method
