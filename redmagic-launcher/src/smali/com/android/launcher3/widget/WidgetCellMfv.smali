.class public Lcom/android/launcher3/widget/WidgetCellMfv;
.super Lcom/android/launcher3/widget/WidgetCell;
.source "WidgetCellMfv.java"


# instance fields
.field private H:Landroid/view/View;

.field private I:I

.field private J:I

.field private K:I

.field protected L:I

.field protected M:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/WidgetCellMfv;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/WidgetCell;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->I:I

    const/4 p1, 0x0

    .line 4
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCell;->x:F

    return-void
.end method

.method private D()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->H:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, v0, Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const v1, 0x7f070c61

    .line 6
    .line 7
    .line 8
    const v2, 0x7f070c63

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v2, v2

    .line 35
    invoke-virtual {v0, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    int-to-float p0, p0

    .line 49
    invoke-virtual {v0, v3, p0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 54
    .line 55
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const v2, 0x7f070c64

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    int-to-float v1, v1

    .line 79
    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    int-to-float v1, v1

    .line 93
    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->H:Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const v2, 0x7f070ca6

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 116
    .line 117
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const v1, 0x7f070c67

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 129
    .line 130
    return-void

    .line 131
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 132
    .line 133
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    const v5, 0x7f070c62

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    int-to-float v4, v4

    .line 145
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    const v5, 0x7f070c60

    .line 155
    .line 156
    .line 157
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    int-to-float v4, v4

    .line 162
    invoke-virtual {v0, v3, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 163
    .line 164
    .line 165
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_2

    .line 174
    .line 175
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 176
    .line 177
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    int-to-float v2, v2

    .line 186
    invoke-virtual {v0, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 190
    .line 191
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    int-to-float v1, v1

    .line 200
    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 201
    .line 202
    .line 203
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->H:Landroid/view/View;

    .line 204
    .line 205
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 210
    .line 211
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    const v1, 0x7f070c5c

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 223
    .line 224
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    if-nez p0, :cond_4

    .line 229
    .line 230
    invoke-static {}, Lm1/a;->a()Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-eqz p0, :cond_3

    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_3
    return-void

    .line 238
    :cond_4
    :goto_0
    const/4 p0, -0x2

    .line 239
    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 240
    .line 241
    return-void
.end method

.method private G(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/android/launcher3/widget/WidgetImageView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method private H()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/widget/WidgetCell;->u:Z

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x5a

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/android/launcher3/util/w;->e()V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 43
    .line 44
    :cond_1
    return-void
.end method


# virtual methods
.method public B(Lz1/Z4;ZZ)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const v1, 0x7f0701ea

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const v2, 0x7f0701f2

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    mul-int/lit8 v2, v0, 0x4

    .line 32
    .line 33
    sub-int/2addr v2, v1

    .line 34
    const/4 v3, 0x1

    .line 35
    const/4 v4, 0x2

    .line 36
    if-eqz p2, :cond_2

    .line 37
    .line 38
    if-eqz p3, :cond_1

    .line 39
    .line 40
    iput v2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 41
    .line 42
    sub-int p2, v2, v1

    .line 43
    .line 44
    div-int/lit8 p2, p2, 0x4

    .line 45
    .line 46
    iget p3, p1, Lz1/Z4;->j:I

    .line 47
    .line 48
    if-le p3, v3, :cond_0

    .line 49
    .line 50
    mul-int/2addr p3, p2

    .line 51
    add-int/2addr p3, v1

    .line 52
    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    mul-int/2addr v0, v4

    .line 58
    sub-int p3, v0, v1

    .line 59
    .line 60
    :goto_0
    iput p3, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_1
    mul-int/2addr v0, v4

    .line 64
    sub-int/2addr v0, v1

    .line 65
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 66
    .line 67
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 68
    .line 69
    sub-int/2addr v0, v1

    .line 70
    div-int/lit8 p2, v0, 0x2

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    iget p2, p1, Lz1/Z4;->i:I

    .line 74
    .line 75
    if-gt p2, v4, :cond_3

    .line 76
    .line 77
    iget p2, p1, Lz1/Z4;->j:I

    .line 78
    .line 79
    if-gt p2, v4, :cond_3

    .line 80
    .line 81
    mul-int/2addr v0, v4

    .line 82
    sub-int/2addr v0, v1

    .line 83
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 84
    .line 85
    iput v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 86
    .line 87
    sub-int/2addr v0, v1

    .line 88
    div-int/lit8 p2, v0, 0x2

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_3
    invoke-static {v2, v2}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    iput p2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 96
    .line 97
    sub-int/2addr p2, v1

    .line 98
    div-int/lit8 p2, p2, 0x4

    .line 99
    .line 100
    iget p3, p1, Lz1/Z4;->j:I

    .line 101
    .line 102
    if-le p3, v3, :cond_4

    .line 103
    .line 104
    mul-int/2addr p3, p2

    .line 105
    add-int/2addr p3, v1

    .line 106
    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    .line 107
    .line 108
    .line 109
    move-result p3

    .line 110
    goto :goto_1

    .line 111
    :cond_4
    mul-int/lit8 p3, p2, 0x2

    .line 112
    .line 113
    add-int/2addr p3, v1

    .line 114
    :goto_1
    iput p3, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 115
    .line 116
    :goto_2
    iget p3, p1, Lz1/Z4;->i:I

    .line 117
    .line 118
    mul-int/2addr p3, p2

    .line 119
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 120
    .line 121
    sub-int/2addr v0, v1

    .line 122
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    iput p3, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->L:I

    .line 127
    .line 128
    iget p3, p1, Lz1/Z4;->j:I

    .line 129
    .line 130
    mul-int/2addr p2, p3

    .line 131
    iget p3, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 132
    .line 133
    sub-int/2addr p3, v1

    .line 134
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    iput p2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->M:I

    .line 139
    .line 140
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 141
    .line 142
    const/4 p3, -0x2

    .line 143
    if-eqz p2, :cond_5

    .line 144
    .line 145
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-nez p2, :cond_5

    .line 150
    .line 151
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 152
    .line 153
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 154
    .line 155
    invoke-direct {v0, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 162
    .line 163
    new-instance p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 164
    .line 165
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 166
    .line 167
    iget v1, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 168
    .line 169
    invoke-direct {p3, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 177
    .line 178
    if-eqz p2, :cond_6

    .line 179
    .line 180
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->i:Landroid/widget/FrameLayout;

    .line 181
    .line 182
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 183
    .line 184
    iget v1, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->J:I

    .line 185
    .line 186
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->K:I

    .line 187
    .line 188
    const/high16 v3, 0x41880000    # 17.0f

    .line 189
    .line 190
    invoke-direct {v0, v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    .line 195
    .line 196
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 197
    .line 198
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 199
    .line 200
    invoke-direct {v0, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    .line 205
    .line 206
    :cond_6
    :goto_3
    iget-object p2, p1, Lz1/Z4;->e:LD1/i;

    .line 207
    .line 208
    if-eqz p2, :cond_7

    .line 209
    .line 210
    new-instance p2, Lcom/android/launcher3/widget/y0;

    .line 211
    .line 212
    iget-object p1, p1, Lz1/Z4;->e:LD1/i;

    .line 213
    .line 214
    invoke-direct {p2, p1}, Lcom/android/launcher3/widget/y0;-><init>(LD1/i;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_7
    new-instance p2, Lcom/android/launcher3/widget/z0;

    .line 222
    .line 223
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 224
    .line 225
    iget p3, p0, Lcom/android/launcher3/widget/WidgetCell;->B:I

    .line 226
    .line 227
    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 231
    .line 232
    .line 233
    return-void
.end method

.method public C(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    .line 1
    new-instance v0, Ls1/k0;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/widget/WidgetCell;->x:F

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Ls1/k0;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/widget/WidgetCellMfv;->G(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCellMfv;->H()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCellMfv;->D()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public E(Lz1/Z4;Ljava/lang/String;ILandroid/graphics/drawable/Drawable;)V
    .locals 7

    .line 1
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v6, 0x0

    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    move-object v4, p4

    .line 11
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/widget/WidgetCellMfv;->F(Lz1/Z4;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZZ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public F(Lz1/Z4;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZZ)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 2
    .line 3
    iput-boolean p5, p0, Lcom/android/launcher3/widget/WidgetCell;->G:Z

    .line 4
    .line 5
    iget-object p4, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-static {p2}, Lx1/O;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    if-eqz p3, :cond_0

    .line 15
    .line 16
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    iget-object p4, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 29
    .line 30
    iget p4, p4, Lz1/Z4;->i:I

    .line 31
    .line 32
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 37
    .line 38
    iget v0, v0, Lz1/Z4;->j:I

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {p4, v0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    const v0, 0x7f140481

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3, v0, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    :goto_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const p3, 0x7f06085c

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, p3}, Landroid/content/Context;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iget-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object p3, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1, p5, p6}, Lcom/android/launcher3/widget/WidgetCellMfv;->B(Lz1/Z4;ZZ)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public I(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-static {p2}, Lx1/O;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public J(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    const/4 v2, 0x0

    .line 14
    cmpl-float v3, v0, v2

    .line 15
    .line 16
    if-lez v3, :cond_0

    .line 17
    .line 18
    cmpl-float v2, v1, v2

    .line 19
    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->L:I

    .line 23
    .line 24
    int-to-float v2, v2

    .line 25
    div-float/2addr v2, v0

    .line 26
    iget p0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->M:I

    .line 27
    .line 28
    int-to-float p0, p0

    .line 29
    div-float/2addr p0, v1

    .line 30
    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    mul-float/2addr v0, p0

    .line 35
    float-to-int v0, v0

    .line 36
    mul-float/2addr v1, p0

    .line 37
    float-to-int p0, v1

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-static {p1, v0, p0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_0
    return-object p1
.end method

.method protected f(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->J(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ls1/k0;

    .line 8
    .line 9
    new-instance v1, Ls1/o;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ls1/o;-><init>(Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/android/launcher3/widget/WidgetCell;->x:F

    .line 15
    .line 16
    invoke-direct {p1, v1, v0}, Ls1/k0;-><init>(Landroid/graphics/drawable/Drawable;F)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->G(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCellMfv;->H()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public g(Lz1/Z4;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/WidgetCell;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->v:Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 21
    .line 22
    invoke-static {v1, v2, v3}, Lr2/b;->c(Landroid/content/Context;Lcom/android/launcher3/h0;Lz1/Z4;)Landroid/util/Size;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 29
    .line 30
    iget-object v1, v1, Lz1/Z4;->g:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Lx1/i0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-static {v1}, Lx1/O;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 48
    .line 49
    iget-object v2, v2, Lz1/Z4;->g:Ljava/lang/String;

    .line 50
    .line 51
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const v3, 0x7f140489

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 66
    .line 67
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 68
    .line 69
    iget v2, v2, Lz1/Z4;->i:I

    .line 70
    .line 71
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 76
    .line 77
    iget v3, v3, Lz1/Z4;->j:I

    .line 78
    .line 79
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    const v3, 0x7f140481

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 98
    .line 99
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 100
    .line 101
    iget v2, v2, Lz1/Z4;->i:I

    .line 102
    .line 103
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 108
    .line 109
    iget v3, v3, Lz1/Z4;->j:I

    .line 110
    .line 111
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    const v3, 0x7f140478

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p1, Lz1/Z4;->e:LD1/i;

    .line 130
    .line 131
    if-eqz v1, :cond_0

    .line 132
    .line 133
    new-instance v1, Lcom/android/launcher3/widget/y0;

    .line 134
    .line 135
    iget-object v2, p1, Lz1/Z4;->e:LD1/i;

    .line 136
    .line 137
    invoke-direct {v1, v2}, Lcom/android/launcher3/widget/y0;-><init>(LD1/i;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_0
    new-instance v1, Lcom/android/launcher3/widget/z0;

    .line 145
    .line 146
    iget-object v2, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 147
    .line 148
    iget v3, p0, Lcom/android/launcher3/widget/WidgetCell;->B:I

    .line 149
    .line 150
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/widget/z0;-><init>(Lcom/android/launcher3/widget/U;I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 157
    .line 158
    if-eqz v1, :cond_1

    .line 159
    .line 160
    invoke-static {v0}, Lcom/android/launcher3/widget/WidgetCell;->k(Landroid/content/Context;)Lcom/android/launcher3/widget/T;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 165
    .line 166
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 167
    .line 168
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->y:Landroid/widget/RemoteViews;

    .line 169
    .line 170
    invoke-virtual {p0, v0, p1, v1}, Lcom/android/launcher3/widget/WidgetCell;->u(Lcom/android/launcher3/widget/x0;Landroid/appwidget/AppWidgetProviderInfo;Landroid/widget/RemoteViews;)V

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 175
    .line 176
    if-nez p1, :cond_2

    .line 177
    .line 178
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->r:Lcom/android/launcher3/widget/P;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 181
    .line 182
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->q:Landroid/util/Size;

    .line 183
    .line 184
    new-instance v2, Lcom/android/launcher3/widget/S0;

    .line 185
    .line 186
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/S0;-><init>(Lcom/android/launcher3/widget/WidgetCellMfv;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v0, v1, v2}, Lcom/android/launcher3/widget/P;->n(Lz1/Z4;Landroid/util/Size;Ljava/util/function/Consumer;)Lcom/android/launcher3/util/w;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iput-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->t:Lcom/android/launcher3/util/w;

    .line 194
    .line 195
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/android/launcher3/widget/WidgetCellMfv;->D()V

    .line 196
    .line 197
    .line 198
    return-void
.end method

.method public getWidgetItem()Lz1/Z4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidgetNameText()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->p:Lz1/Z4;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, ""

    .line 22
    .line 23
    return-object p0
.end method

.method protected h(Lcom/android/launcher3/widget/P$a;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/WidgetCell;->k(Landroid/content/Context;)Lcom/android/launcher3/widget/T;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/android/launcher3/widget/P$a;->a:Landroid/appwidget/AppWidgetProviderInfo;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/android/launcher3/widget/P$a;->b:Landroid/widget/RemoteViews;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher3/widget/WidgetCell;->u(Lcom/android/launcher3/widget/x0;Landroid/appwidget/AppWidgetProviderInfo;Landroid/widget/RemoteViews;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/android/launcher3/widget/P$a;->b:Landroid/widget/RemoteViews;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCell;->setRemoteViewsPreview(Landroid/widget/RemoteViews;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p1, Lcom/android/launcher3/widget/P$a;->c:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/WidgetCellMfv;->f(Landroid/graphics/Bitmap;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/WidgetCell;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b069c

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->H:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const v2, 0x7f040781

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v2, v1}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v3}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    const v4, 0x7f04049d

    .line 52
    .line 53
    .line 54
    invoke-static {v2, v4, v3}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->j:Lcom/android/launcher3/widget/WidgetImageView;

    .line 62
    .line 63
    instance-of v2, v1, Lcom/android/launcher3/widget/WidgetImageViewMfv;

    .line 64
    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    check-cast v1, Lcom/android/launcher3/widget/WidgetImageViewMfv;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/WidgetImageViewMfv;->b(I)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    instance-of v0, v0, Landroid/widget/RelativeLayout;

    .line 89
    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 99
    .line 100
    const/16 v1, 0x9

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 103
    .line 104
    .line 105
    const/16 v1, 0xe

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 108
    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    .line 117
    .line 118
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 119
    .line 120
    if-eqz v0, :cond_2

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    instance-of v0, v0, Landroid/widget/RelativeLayout;

    .line 135
    .line 136
    if-eqz v0, :cond_2

    .line 137
    .line 138
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 139
    .line 140
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 145
    .line 146
    const/16 v1, 0xb

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->k:Landroid/widget/TextView;

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/widget/TextView;->getId()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    const/4 v2, 0x1

    .line 158
    invoke-virtual {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const v2, 0x7f0701e8

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 173
    .line 174
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 175
    .line 176
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/android/launcher3/widget/WidgetCell;->l:Landroid/widget/TextView;

    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    const v1, 0x7f0701f8

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    int-to-float p0, p0

    .line 193
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 194
    .line 195
    .line 196
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/widget/WidgetCell;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_1

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getVisibility()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/16 p2, 0x8

    .line 15
    .line 16
    if-ne p1, p2, :cond_1

    .line 17
    .line 18
    goto/16 :goto_1

    .line 19
    .line 20
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetHostView;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-lez p1, :cond_5

    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getPaddingLeft()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getPaddingRight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int/2addr v1, v2

    .line 56
    iget v2, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->L:I

    .line 57
    .line 58
    add-int/2addr v1, v2

    .line 59
    iget-object v2, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/appwidget/AppWidgetHostView;->getPaddingTop()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    iget-object v3, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 66
    .line 67
    invoke-virtual {v3}, Landroid/appwidget/AppWidgetHostView;->getPaddingBottom()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    add-int/2addr v2, v3

    .line 72
    iget v3, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->M:I

    .line 73
    .line 74
    add-int/2addr v2, v3

    .line 75
    sget-object v3, Lcom/android/launcher3/widget/x0;->m:[Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    iget-object v4, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 82
    .line 83
    invoke-virtual {v4}, Landroid/appwidget/AppWidgetHostView;->getAppWidgetInfo()Landroid/appwidget/AppWidgetProviderInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-object v4, v4, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 88
    .line 89
    invoke-virtual {v4}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_2

    .line 98
    .line 99
    const/high16 p2, -0x80000000

    .line 100
    .line 101
    invoke-static {v1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-static {v2, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    invoke-virtual {p1, v0, p2}, Landroid/view/View;->measure(II)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    .line 121
    .line 122
    if-eqz p2, :cond_4

    .line 123
    .line 124
    if-eqz v0, :cond_4

    .line 125
    .line 126
    if-gt p2, v1, :cond_3

    .line 127
    .line 128
    if-le v0, v2, :cond_4

    .line 129
    .line 130
    :cond_3
    int-to-float v1, v1

    .line 131
    int-to-float p2, p2

    .line 132
    div-float/2addr v1, p2

    .line 133
    int-to-float p2, v2

    .line 134
    int-to-float v0, v0

    .line 135
    div-float/2addr p2, v0

    .line 136
    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    goto :goto_0

    .line 141
    :cond_4
    move p2, p1

    .line 142
    :goto_0
    cmpg-float p1, p2, p1

    .line 143
    .line 144
    if-gez p1, :cond_5

    .line 145
    .line 146
    iput p2, p0, Lcom/android/launcher3/widget/WidgetCell;->A:F

    .line 147
    .line 148
    iget-object p0, p0, Lcom/android/launcher3/widget/WidgetCell;->z:Lcom/android/launcher3/widget/x0;

    .line 149
    .line 150
    invoke-virtual {p0, p2}, Lcom/android/launcher3/widget/x0;->setScaleToFit(F)V

    .line 151
    .line 152
    .line 153
    :cond_5
    :goto_1
    return-void
.end method

.method public setPreviewHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->M:I

    .line 2
    .line 3
    return-void
.end method

.method public setPreviewWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/widget/WidgetCellMfv;->L:I

    .line 2
    .line 3
    return-void
.end method
