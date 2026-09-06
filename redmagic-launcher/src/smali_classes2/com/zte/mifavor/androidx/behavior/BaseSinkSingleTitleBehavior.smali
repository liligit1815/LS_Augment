.class public Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;
.super Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;
.source "BaseSinkSingleTitleBehavior.java"


# instance fields
.field private A:Ljava/lang/String;

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:I

.field private r:I

.field private s:F

.field private t:F

.field private u:F

.field private v:I

.field private w:I

.field private x:Z

.field private y:I

.field private z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZZZLjava/lang/String;)V
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
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 7
    .line 8
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->l:I

    .line 9
    .line 10
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->m:I

    .line 11
    .line 12
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->n:I

    .line 13
    .line 14
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->o:I

    .line 15
    .line 16
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->p:I

    .line 17
    .line 18
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->q:I

    .line 19
    .line 20
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->r:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->s:F

    .line 24
    .line 25
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->t:F

    .line 26
    .line 27
    iput v0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->u:F

    .line 28
    .line 29
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->y:I

    .line 30
    .line 31
    iput-object p5, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->A:Ljava/lang/String;

    .line 32
    .line 33
    iput-boolean p3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->x:Z

    .line 34
    .line 35
    iput-boolean p4, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->z:Z

    .line 36
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->K(Landroid/content/Context;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private K(Landroid/content/Context;Z)V
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
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->m:I

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
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->l:I

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
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->n:I

    .line 40
    .line 41
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->l:I

    .line 42
    .line 43
    iget v3, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->m:I

    .line 44
    .line 45
    add-int/2addr v2, v3

    .line 46
    if-gt v1, v2, :cond_1

    .line 47
    .line 48
    goto/16 :goto_1

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
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->o:I

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
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->p:I

    .line 65
    .line 66
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->o:I

    .line 67
    .line 68
    if-lez v2, :cond_7

    .line 69
    .line 70
    if-lez v1, :cond_7

    .line 71
    .line 72
    if-ge v1, v2, :cond_2

    .line 73
    .line 74
    goto/16 :goto_1

    .line 75
    .line 76
    :cond_2
    int-to-float v1, v2

    .line 77
    invoke-static {v1}, Lb4/d;->b(F)I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->q:I

    .line 82
    .line 83
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->p:I

    .line 84
    .line 85
    int-to-float v1, v1

    .line 86
    invoke-static {v1}, Lb4/d;->b(F)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->r:I

    .line 91
    .line 92
    iget-object v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->A:Ljava/lang/String;

    .line 93
    .line 94
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->p:I

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    invoke-static {v1, v2}, Lb4/d;->a(Ljava/lang/String;F)I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 102
    .line 103
    if-nez v2, :cond_3

    .line 104
    .line 105
    invoke-static {p1}, Lb4/d;->c(Landroid/content/Context;)I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 110
    .line 111
    :cond_3
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 112
    .line 113
    if-le v1, p1, :cond_4

    .line 114
    .line 115
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->r:I

    .line 116
    .line 117
    mul-int/lit8 p1, p1, 0x2

    .line 118
    .line 119
    add-int/lit8 p1, p1, 0x6

    .line 120
    .line 121
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->r:I

    .line 122
    .line 123
    :cond_4
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->z:Z

    .line 124
    .line 125
    if-eqz p1, :cond_5

    .line 126
    .line 127
    sget p1, LR3/e;->d0:I

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    goto :goto_0

    .line 134
    :cond_5
    if-eqz p2, :cond_6

    .line 135
    .line 136
    sget p1, LR3/e;->P:I

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    goto :goto_0

    .line 143
    :cond_6
    sget p1, LR3/e;->d0:I

    .line 144
    .line 145
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    :goto_0
    sget p2, LR3/e;->Y:I

    .line 150
    .line 151
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    sub-int/2addr p1, p2

    .line 156
    int-to-float p1, p1

    .line 157
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->t:F

    .line 158
    .line 159
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->l:I

    .line 160
    .line 161
    int-to-float p1, p1

    .line 162
    iget p2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->q:I

    .line 163
    .line 164
    int-to-float p2, p2

    .line 165
    sub-float/2addr p1, p2

    .line 166
    const/high16 p2, 0x40000000    # 2.0f

    .line 167
    .line 168
    div-float/2addr p1, p2

    .line 169
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->u:F

    .line 170
    .line 171
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->n:I

    .line 172
    .line 173
    int-to-float v1, v1

    .line 174
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->m:I

    .line 175
    .line 176
    int-to-float v2, v2

    .line 177
    sub-float/2addr v1, v2

    .line 178
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->r:I

    .line 179
    .line 180
    int-to-float v2, v2

    .line 181
    sub-float/2addr v1, v2

    .line 182
    div-float/2addr v1, p2

    .line 183
    sub-float/2addr v1, p1

    .line 184
    iput v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->s:F

    .line 185
    .line 186
    sget p1, LR3/d;->f:I

    .line 187
    .line 188
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->v:I

    .line 193
    .line 194
    sget p1, LR3/d;->e:I

    .line 195
    .line 196
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->w:I

    .line 201
    .line 202
    :cond_7
    :goto_1
    return-void
.end method


# virtual methods
.method public l(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 8

    .line 1
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->s:F

    .line 2
    .line 3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpg-float p1, p1, v0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-gtz p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    check-cast p3, Lcom/google/android/material/appbar/AppBarLayout;

    .line 12
    .line 13
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 14
    .line 15
    if-gtz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p3}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 22
    .line 23
    iget v1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->l:I

    .line 24
    .line 25
    add-int/2addr p1, v1

    .line 26
    iput p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->y:I

    .line 27
    .line 28
    :cond_1
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    if-lez p1, :cond_2

    .line 32
    .line 33
    move p1, v1

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    move p1, v0

    .line 36
    :goto_0
    const/4 v2, 0x2

    .line 37
    if-nez p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lcom/google/android/material/appbar/AppBarLayout$e;

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 50
    .line 51
    .line 52
    iget v5, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    invoke-virtual {v4}, Lcom/google/android/material/appbar/AppBarLayout$e;->c()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-static {v3}, LJ/I;->s(Landroid/view/View;)Z

    .line 59
    .line 60
    .line 61
    and-int/2addr v4, v2

    .line 62
    if-eqz v4, :cond_3

    .line 63
    .line 64
    invoke-static {v3}, LJ/I;->w(Landroid/view/View;)I

    .line 65
    .line 66
    .line 67
    :cond_3
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getTop()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    const/4 v4, 0x0

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 75
    .line 76
    add-int v5, p1, v3

    .line 77
    .line 78
    int-to-float v5, v5

    .line 79
    int-to-float p1, p1

    .line 80
    div-float/2addr v5, p1

    .line 81
    goto :goto_1

    .line 82
    :cond_4
    move v5, v4

    .line 83
    :goto_1
    check-cast p2, Landroid/widget/TextView;

    .line 84
    .line 85
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 86
    .line 87
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    iget v7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 92
    .line 93
    if-ne v6, v7, :cond_5

    .line 94
    .line 95
    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    .line 96
    .line 97
    .line 98
    sget-object p1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 99
    .line 100
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 101
    .line 102
    .line 103
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 104
    .line 105
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->g:I

    .line 106
    .line 107
    sub-int/2addr p1, v2

    .line 108
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    goto :goto_2

    .line 113
    :cond_5
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    iget v7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 118
    .line 119
    if-ge v6, v7, :cond_6

    .line 120
    .line 121
    invoke-virtual {p2}, Landroid/widget/TextView;->isSingleLine()Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_6

    .line 126
    .line 127
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 131
    .line 132
    .line 133
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 134
    .line 135
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 136
    .line 137
    .line 138
    :cond_6
    :goto_2
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    iget v6, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 143
    .line 144
    if-ne v2, v6, :cond_7

    .line 145
    .line 146
    sget v2, LR3/l;->h:I

    .line 147
    .line 148
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 149
    .line 150
    .line 151
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->h:I

    .line 152
    .line 153
    if-eqz v2, :cond_8

    .line 154
    .line 155
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_7
    if-nez v3, :cond_8

    .line 160
    .line 161
    sget v2, LR3/l;->j:I

    .line 162
    .line 163
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextAppearance(I)V

    .line 164
    .line 165
    .line 166
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->h:I

    .line 167
    .line 168
    if-eqz v2, :cond_8

    .line 169
    .line 170
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    .line 172
    .line 173
    :cond_8
    :goto_3
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->p:I

    .line 174
    .line 175
    iget v6, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->o:I

    .line 176
    .line 177
    sub-int/2addr v2, v6

    .line 178
    int-to-float v2, v2

    .line 179
    mul-float/2addr v2, v5

    .line 180
    int-to-float v6, v6

    .line 181
    add-float/2addr v2, v6

    .line 182
    invoke-virtual {p2, v0, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 183
    .line 184
    .line 185
    invoke-static {v2}, Lb4/d;->b(F)I

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    iget-object v7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->A:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v7, v2}, Lb4/d;->a(Ljava/lang/String;F)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    iget v7, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkTitleBehavior;->i:I

    .line 196
    .line 197
    if-le v2, v7, :cond_9

    .line 198
    .line 199
    mul-int/lit8 v6, v6, 0x2

    .line 200
    .line 201
    add-int/lit8 v6, v6, 0x6

    .line 202
    .line 203
    :cond_9
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 208
    .line 209
    iget v7, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 210
    .line 211
    if-eq v7, v6, :cond_a

    .line 212
    .line 213
    iput v6, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 214
    .line 215
    move v6, v1

    .line 216
    goto :goto_4

    .line 217
    :cond_a
    move v6, v0

    .line 218
    :goto_4
    iget v7, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 219
    .line 220
    if-eq v7, p1, :cond_b

    .line 221
    .line 222
    iput p1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 223
    .line 224
    move p1, v1

    .line 225
    goto :goto_5

    .line 226
    :cond_b
    move p1, v0

    .line 227
    :goto_5
    if-nez v6, :cond_c

    .line 228
    .line 229
    if-eqz p1, :cond_d

    .line 230
    .line 231
    :cond_c
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {p2}, Landroid/widget/TextView;->invalidate()V

    .line 235
    .line 236
    .line 237
    :cond_d
    invoke-static {p2}, LJ/I;->v(Landroid/view/View;)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-ne p1, v1, :cond_e

    .line 242
    .line 243
    move p1, v1

    .line 244
    goto :goto_6

    .line 245
    :cond_e
    move p1, v0

    .line 246
    :goto_6
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->t:F

    .line 247
    .line 248
    mul-float/2addr v2, v5

    .line 249
    if-nez p1, :cond_f

    .line 250
    .line 251
    neg-float v2, v2

    .line 252
    :cond_f
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 253
    .line 254
    .line 255
    iget p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->s:F

    .line 256
    .line 257
    mul-float/2addr p1, v5

    .line 258
    iget v2, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->u:F

    .line 259
    .line 260
    add-float/2addr p1, v2

    .line 261
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getBottom()I

    .line 262
    .line 263
    .line 264
    move-result p3

    .line 265
    const v2, 0x3e4ccccd    # 0.2f

    .line 266
    .line 267
    .line 268
    if-nez v3, :cond_10

    .line 269
    .line 270
    iget v6, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->y:I

    .line 271
    .line 272
    if-le p3, v6, :cond_10

    .line 273
    .line 274
    sub-int/2addr p3, v6

    .line 275
    int-to-float p3, p3

    .line 276
    mul-float/2addr p3, v2

    .line 277
    add-float/2addr p1, p3

    .line 278
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 279
    .line 280
    .line 281
    goto :goto_7

    .line 282
    :cond_10
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 283
    .line 284
    .line 285
    :goto_7
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->z:Z

    .line 286
    .line 287
    if-eqz p1, :cond_12

    .line 288
    .line 289
    cmpg-float p0, v5, v2

    .line 290
    .line 291
    if-gez p0, :cond_11

    .line 292
    .line 293
    goto :goto_8

    .line 294
    :cond_11
    move v4, v5

    .line 295
    :goto_8
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 296
    .line 297
    .line 298
    goto :goto_9

    .line 299
    :cond_12
    iget-boolean p1, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->x:Z

    .line 300
    .line 301
    if-nez p1, :cond_14

    .line 302
    .line 303
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    iget p0, p0, Lcom/zte/mifavor/androidx/behavior/BaseSinkSingleTitleBehavior;->k:I

    .line 308
    .line 309
    if-ne p1, p0, :cond_13

    .line 310
    .line 311
    const/4 p0, 0x4

    .line 312
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 313
    .line 314
    .line 315
    goto :goto_9

    .line 316
    :cond_13
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 317
    .line 318
    .line 319
    :cond_14
    :goto_9
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    check-cast p0, Landroidx/coordinatorlayout/widget/CoordinatorLayout$f;

    .line 324
    .line 325
    invoke-static {p2}, LJ/I;->Z(Landroid/view/View;)V

    .line 326
    .line 327
    .line 328
    return v1
.end method
