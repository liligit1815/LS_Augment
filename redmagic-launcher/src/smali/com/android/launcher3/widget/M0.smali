.class public Lcom/android/launcher3/widget/M0;
.super Lcom/android/launcher3/widget/i;
.source "ThirdPartyViewHolder.java"


# instance fields
.field private b:Landroid/widget/TextView;

.field private c:Landroid/widget/TextView;

.field private final d:Landroid/content/Context;

.field private e:Lcom/android/launcher3/util/w;

.field private f:Lcom/android/launcher3/model/data/B;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/i;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/widget/M0;->d:Landroid/content/Context;

    .line 9
    .line 10
    const v0, 0x7f0b0181

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 20
    .line 21
    const v0, 0x7f0b0600

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/launcher3/widget/M0;->b:Landroid/widget/TextView;

    .line 31
    .line 32
    const v0, 0x7f0b0601

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Landroid/widget/TextView;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/android/launcher3/widget/M0;->c:Landroid/widget/TextView;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/widget/C;Lm2/g;Lz1/Z4;Lcom/android/launcher3/widget/v;Ljava/lang/CharSequence;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p5, p0, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p5}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-virtual {p5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p5}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 12
    .line 13
    .line 14
    move-result-object p5

    .line 15
    const/4 v1, 0x0

    .line 16
    const v2, 0x7f0e0089

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v2, p5, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p5

    .line 23
    check-cast p5, Lcom/android/launcher3/widget/ComponentDetailSheet;

    .line 24
    .line 25
    iget p3, p3, Lcom/android/launcher3/widget/v;->b:I

    .line 26
    .line 27
    invoke-virtual {p5, p1, p2, p3}, Lcom/android/launcher3/widget/ComponentDetailSheet;->i1(Lm2/g;Lz1/Z4;I)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 p3, 0x1

    .line 35
    iget-object p0, p0, Lcom/android/launcher3/widget/C;->j:Lcom/android/launcher3/widget/ComponentsFullSheet;

    .line 36
    .line 37
    invoke-virtual {p5, p2, p1, p3, p0}, Lcom/android/launcher3/widget/ComponentDetailSheet;->g1(Lz1/Z4;Ljava/lang/String;ZLcom/android/launcher3/widget/o;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/M0;Lcom/android/launcher3/model/data/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/M0;->g(Lcom/android/launcher3/model/data/z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/M0;->e:Lcom/android/launcher3/util/w;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/util/w;->e()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/M0;->e:Lcom/android/launcher3/util/w;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private g(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 6
    .line 7
    invoke-virtual {v0}, Ls1/d;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 17
    .line 18
    iput-object p1, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/M0;->h(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/M0;->h(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private h(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/M0;->f()V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/widget/M0;->e()V

    .line 12
    .line 13
    .line 14
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    iget-object p1, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/widget/M0;->d:Landroid/content/Context;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {p1, v1, v2}, Ls1/d;->n(Landroid/content/Context;I)Ls1/o;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/widget/M0;->d:Landroid/content/Context;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const v2, 0x7f070210

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {p1, v2, v2, v1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/widget/M0;->b:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/widget/M0;->b:Landroid/widget/TextView;

    .line 52
    .line 53
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public b(Lcom/android/launcher3/widget/v;Lcom/android/launcher3/widget/C;Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    iget-object p3, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    const v2, 0x7f0701fc

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    float-to-int p3, p3

    .line 26
    iget-object v2, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    const v3, 0x7f0701ed

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    float-to-int v2, v2

    .line 40
    sub-int/2addr p3, v2

    .line 41
    iget-object v2, p2, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    const v3, 0x7f070215

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    float-to-int v2, v2

    .line 55
    sub-int/2addr p3, v2

    .line 56
    iput p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 60
    .line 61
    :goto_0
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 62
    .line 63
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-static {p3}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-virtual {p3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    iget-boolean p3, p3, Lcom/android/launcher3/h0;->G0:Z

    .line 76
    .line 77
    if-eqz p3, :cond_1

    .line 78
    .line 79
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 80
    .line 81
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    const v2, 0x7f070214

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    float-to-int p3, p3

    .line 97
    iput p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 98
    .line 99
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p3

    .line 109
    const v2, 0x7f07020e

    .line 110
    .line 111
    .line 112
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    float-to-int p3, p3

    .line 117
    iput p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 118
    .line 119
    iput p3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 120
    .line 121
    :cond_1
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 122
    .line 123
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 127
    .line 128
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const v2, 0x7f0702b7

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    iget-object v2, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 144
    .line 145
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    iget-object v3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 150
    .line 151
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    const v4, 0x7f0702b8

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iget-object v4, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    invoke-virtual {p3, v0, v2, v3, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 173
    .line 174
    .line 175
    iget-object p3, p1, Lcom/android/launcher3/widget/v;->a:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    move-object v4, p3

    .line 182
    check-cast v4, Lm2/g;

    .line 183
    .line 184
    iget-object p3, v4, Lm2/g;->c:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p3

    .line 190
    move-object v5, p3

    .line 191
    check-cast v5, Lz1/Z4;

    .line 192
    .line 193
    iget-object p3, v4, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 194
    .line 195
    iput-object p3, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 196
    .line 197
    const/4 p3, 0x1

    .line 198
    invoke-direct {p0, p3}, Lcom/android/launcher3/widget/M0;->h(Z)V

    .line 199
    .line 200
    .line 201
    iget-object p3, v4, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 202
    .line 203
    iget-object v7, p3, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 204
    .line 205
    iget-object p3, p0, Lcom/android/launcher3/widget/M0;->b:Landroid/widget/TextView;

    .line 206
    .line 207
    invoke-virtual {p3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    .line 209
    .line 210
    instance-of p3, v4, Lm2/o;

    .line 211
    .line 212
    if-eqz p3, :cond_3

    .line 213
    .line 214
    move-object p3, v4

    .line 215
    check-cast p3, Lm2/o;

    .line 216
    .line 217
    invoke-virtual {p3}, Lm2/o;->t()Z

    .line 218
    .line 219
    .line 220
    move-result p3

    .line 221
    if-nez p3, :cond_2

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_2
    iget-object p3, v4, Lm2/g;->c:Ljava/util/List;

    .line 225
    .line 226
    :goto_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 227
    .line 228
    .line 229
    move-result p3

    .line 230
    goto :goto_3

    .line 231
    :cond_3
    :goto_2
    iget p3, p1, Lcom/android/launcher3/widget/v;->b:I

    .line 232
    .line 233
    const/4 v0, 0x2

    .line 234
    if-ne p3, v0, :cond_4

    .line 235
    .line 236
    iget-object p3, v4, Lm2/g;->e:Ljava/util/List;

    .line 237
    .line 238
    goto :goto_1

    .line 239
    :cond_4
    iget-object p3, v4, Lm2/g;->f:Ljava/util/List;

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :goto_3
    iget-object v0, p0, Lcom/android/launcher3/widget/M0;->c:Landroid/widget/TextView;

    .line 243
    .line 244
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p3

    .line 248
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 249
    .line 250
    .line 251
    iget-object p3, p0, Lcom/android/launcher3/widget/M0;->c:Landroid/widget/TextView;

    .line 252
    .line 253
    iget-object v0, p2, Lcom/android/launcher3/widget/C;->g:Landroid/graphics/drawable/Drawable;

    .line 254
    .line 255
    const/4 v2, 0x0

    .line 256
    invoke-virtual {p3, v2, v2, v0, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 257
    .line 258
    .line 259
    iget-object p3, p0, Lcom/android/launcher3/widget/i;->a:Landroid/view/ViewGroup;

    .line 260
    .line 261
    new-instance v2, Lcom/android/launcher3/widget/K0;

    .line 262
    .line 263
    move-object v6, p1

    .line 264
    move-object v3, p2

    .line 265
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/widget/K0;-><init>(Lcom/android/launcher3/widget/C;Lm2/g;Lz1/Z4;Lcom/android/launcher3/widget/v;Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p3, v2}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->s()Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    if-eqz p1, :cond_5

    .line 280
    .line 281
    iget-object p1, p0, Lcom/android/launcher3/widget/M0;->b:Landroid/widget/TextView;

    .line 282
    .line 283
    iget-object p2, v3, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 284
    .line 285
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 286
    .line 287
    .line 288
    move-result-object p2

    .line 289
    const p3, 0x7f0701f9

    .line 290
    .line 291
    .line 292
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    invoke-virtual {p1, v1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 297
    .line 298
    .line 299
    iget-object p0, p0, Lcom/android/launcher3/widget/M0;->c:Landroid/widget/TextView;

    .line 300
    .line 301
    iget-object p1, v3, Lcom/android/launcher3/widget/C;->d:Landroid/content/Context;

    .line 302
    .line 303
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    const p2, 0x7f0701fb

    .line 308
    .line 309
    .line 310
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    invoke-virtual {p0, v1, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 315
    .line 316
    .line 317
    :cond_5
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/M0;->e()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 7
    .line 8
    invoke-virtual {v0}, Ls1/d;->k()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/model/data/B;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/widget/M0;->f:Lcom/android/launcher3/model/data/B;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 21
    .line 22
    invoke-direct {v0, v2, v1}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/android/launcher3/widget/M0;->d:Landroid/content/Context;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Lcom/android/launcher3/widget/L0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Lcom/android/launcher3/widget/L0;-><init>(Lcom/android/launcher3/widget/M0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2, v0}, Ls1/P;->W0(Ls1/P$a;Lcom/android/launcher3/model/data/z;)Lcom/android/launcher3/util/w;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/android/launcher3/widget/M0;->e:Lcom/android/launcher3/util/w;

    .line 45
    .line 46
    :cond_0
    return-void
.end method
