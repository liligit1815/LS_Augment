.class public Lcom/android/launcher3/taskbar/navbutton/j;
.super Lcom/android/launcher3/taskbar/navbutton/a;
.source "PhoneLandscapeNavLayoutter.kt"


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
    .locals 9

    .line 1
    const-string p2, "context"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const v0, 0x7f070ba6

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const v1, 0x7f070ba7

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const v2, 0x7f070ba5

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    mul-int/lit8 v2, v0, 0x2

    .line 46
    .line 47
    sub-int/2addr p1, v2

    .line 48
    mul-int/lit8 v2, v1, 0x2

    .line 49
    .line 50
    sub-int/2addr p1, v2

    .line 51
    int-to-float p1, p1

    .line 52
    const/high16 v2, 0x40200000    # 2.5f

    .line 53
    .line 54
    div-float v2, p1, v2

    .line 55
    .line 56
    const/high16 v3, 0x3e800000    # 0.25f

    .line 57
    .line 58
    mul-float/2addr v2, v3

    .line 59
    const/4 v3, 0x2

    .line 60
    int-to-float v3, v3

    .line 61
    mul-float v4, v2, v3

    .line 62
    .line 63
    sub-float/2addr p1, v4

    .line 64
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 65
    .line 66
    const/4 v6, -0x1

    .line 67
    float-to-int v7, p1

    .line 68
    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 69
    .line 70
    .line 71
    int-to-float v1, v1

    .line 72
    add-float/2addr v1, v2

    .line 73
    int-to-float v0, v0

    .line 74
    add-float/2addr v1, v0

    .line 75
    float-to-int v0, v1

    .line 76
    iput v0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 77
    .line 78
    iput v0, v5, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {v5, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    const/4 v6, 0x1

    .line 99
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/j;->o()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/16 v5, 0x11

    .line 117
    .line 118
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 119
    .line 120
    .line 121
    int-to-float v1, p2

    .line 122
    sub-float/2addr p1, v1

    .line 123
    mul-float v1, v4, v3

    .line 124
    .line 125
    sub-float/2addr p1, v1

    .line 126
    const/high16 v1, 0x40000000    # 2.0f

    .line 127
    .line 128
    div-float/2addr p1, v1

    .line 129
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    :goto_0
    if-ge v0, v1, :cond_2

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {v5, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    const-string v7, "null cannot be cast to non-null type android.widget.LinearLayout.LayoutParams"

    .line 152
    .line 153
    invoke-static {v5, v7}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 157
    .line 158
    div-float v7, p1, v3

    .line 159
    .line 160
    float-to-int v7, v7

    .line 161
    if-nez v0, :cond_0

    .line 162
    .line 163
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 164
    .line 165
    float-to-int v7, v4

    .line 166
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 174
    .line 175
    .line 176
    move-result v8

    .line 177
    sub-int/2addr v8, v6

    .line 178
    if-ne v0, v8, :cond_1

    .line 179
    .line 180
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 181
    .line 182
    float-to-int v7, v4

    .line 183
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_1
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 187
    .line 188
    iput v7, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 189
    .line 190
    iput p2, v5, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 191
    .line 192
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_2
    float-to-int p1, v2

    .line 196
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/navbutton/j;->p(I)V

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public n(Landroid/view/ViewGroup;IIII)V
    .locals 1

    .line 1
    const-string p0, "contextualContainer"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    invoke-direct {p0, v0, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 17
    .line 18
    .line 19
    iput p3, p0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    .line 21
    iput p4, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 22
    .line 23
    or-int/lit8 p2, p5, 0x1

    .line 24
    .line 25
    iput p2, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->j()Landroid/widget/ImageView;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->f()Landroid/widget/ImageView;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->h()Landroid/widget/LinearLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->d()Landroid/widget/ImageView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public p(I)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f070ba7

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->k()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const v2, 0x7f070ba5

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    add-int v5, v0, v1

    .line 42
    .line 43
    const/4 v6, 0x0

    .line 44
    const/16 v7, 0x30

    .line 45
    .line 46
    move-object v2, p0

    .line 47
    move v4, p1

    .line 48
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/taskbar/navbutton/j;->n(Landroid/view/ViewGroup;IIII)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 v7, 0x0

    .line 56
    const/16 v9, 0x50

    .line 57
    .line 58
    move v6, v4

    .line 59
    move v8, v5

    .line 60
    move-object v5, p0

    .line 61
    move-object v4, v2

    .line 62
    invoke-virtual/range {v4 .. v9}, Lcom/android/launcher3/taskbar/navbutton/j;->n(Landroid/view/ViewGroup;IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->g()Landroid/widget/ImageView;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    :cond_0
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    if-eqz p0, :cond_1

    .line 98
    .line 99
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->m()Landroid/view/ViewGroup;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->c()Landroid/widget/ImageView;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->i()Landroid/widget/FrameLayout$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    :cond_1
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->e()Landroid/view/ViewGroup;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/navbutton/a;->l()Landroid/widget/Space;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    const/4 v0, -0x1

    .line 130
    invoke-virtual {p0, p1, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 131
    .line 132
    .line 133
    return-void
.end method
