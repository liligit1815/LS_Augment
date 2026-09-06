.class public Lcom/android/launcher3/views/W;
.super Lcom/android/launcher3/a;
.source "Snackbar.java"


# instance fields
.field private final g:Lcom/android/launcher3/views/k;

.field private h:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/views/W;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/launcher3/views/k;

    iput-object p2, p0, Lcom/android/launcher3/views/W;->g:Lcom/android/launcher3/views/k;

    const p2, 0x7f0e0207

    .line 4
    invoke-static {p1, p2, p0}, Landroid/widget/LinearLayout;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method

.method public static synthetic N(Ljava/lang/Runnable;Lcom/android/launcher3/views/W;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    iput-object p0, p1, Lcom/android/launcher3/views/W;->h:Ljava/lang/Runnable;

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {p1, p0}, Lcom/android/launcher3/a;->close(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic O(Lcom/android/launcher3/views/W;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/views/W;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/views/W;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic R(Lcom/android/launcher3/views/W;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static S(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private T()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/views/W;->g:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/views/W;->h:Ljava/lang/Runnable;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static U(Landroid/content/Context;IILjava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;II",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/C2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/android/launcher3/C2;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->D()V

    .line 13
    .line 14
    .line 15
    :cond_0
    move-object v0, p0

    .line 16
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v0, p0, p2, p3, p4}, Lcom/android/launcher3/views/W;->W(Lcom/android/launcher3/views/k;Ljava/lang/CharSequence;ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static V(Lcom/android/launcher3/C2;I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->D()V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x80

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {p0, v1, v0}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/views/W;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/views/W;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 22
    .line 23
    .line 24
    const/16 v3, 0x10

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const v4, 0x7f070a74

    .line 34
    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 41
    .line 42
    .line 43
    const v4, 0x7f081988

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 47
    .line 48
    .line 49
    iput-boolean v1, v0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 63
    .line 64
    const/16 v4, 0x51

    .line 65
    .line 66
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 67
    .line 68
    const v4, 0x7f070a76

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-virtual {v5}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    .line 84
    .line 85
    add-int/2addr v4, v5

    .line 86
    invoke-virtual {v1, v2, v2, v2, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 87
    .line 88
    .line 89
    const v1, 0x7f0b0334

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {v3, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 107
    .line 108
    .line 109
    const p1, 0x3f4ccccd    # 0.8f

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const/high16 v1, 0x3f800000    # 1.0f

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const-wide/16 v1, 0xb4

    .line 141
    .line 142
    invoke-virtual {p1, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    sget-object v1, Lcom/android/launcher3/anim/L;->m:Landroid/view/animation/Interpolator;

    .line 147
    .line 148
    invoke-virtual {p1, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 153
    .line 154
    .line 155
    const/16 p1, 0xfa0

    .line 156
    .line 157
    const/4 v1, 0x6

    .line 158
    invoke-static {p0, p1, v1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->getRecommendedTimeoutMillis(Landroid/content/Context;II)I

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    new-instance p1, Lcom/android/launcher3/views/V;

    .line 163
    .line 164
    invoke-direct {p1, v0}, Lcom/android/launcher3/views/V;-><init>(Lcom/android/launcher3/views/W;)V

    .line 165
    .line 166
    .line 167
    int-to-long v1, p0

    .line 168
    invoke-virtual {v0, p1, v1, v2}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public static W(Lcom/android/launcher3/views/k;Ljava/lang/CharSequence;ILjava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 14

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {p0, v2, v1}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lcom/android/launcher3/views/W;

    .line 10
    .line 11
    move-object v3, p0

    .line 12
    check-cast v3, Landroid/content/Context;

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-direct {v1, v3, v4}, Lcom/android/launcher3/views/W;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 20
    .line 21
    .line 22
    const/16 v4, 0x10

    .line 23
    .line 24
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    const v5, 0x7f070a74

    .line 32
    .line 33
    .line 34
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 39
    .line 40
    .line 41
    const v5, 0x7f070a7c

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-virtual {v1, v5, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 49
    .line 50
    .line 51
    const v6, 0x7f0811a8

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 55
    .line 56
    .line 57
    iput-boolean v2, v1, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 58
    .line 59
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    check-cast v6, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 71
    .line 72
    const/16 v7, 0x51

    .line 73
    .line 74
    iput v7, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 75
    .line 76
    const v7, 0x7f070a75

    .line 77
    .line 78
    .line 79
    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    iput v7, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 84
    .line 85
    const v7, 0x7f070a77

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    const v8, 0x7f070a7a

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 96
    .line 97
    .line 98
    move-result v8

    .line 99
    const v9, 0x7f070a76

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    const v10, 0x7f070a79

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 114
    .line 115
    .line 116
    move-result-object v11

    .line 117
    invoke-virtual {v11}, Lcom/android/launcher3/h0;->y0()Landroid/graphics/Rect;

    .line 118
    .line 119
    .line 120
    move-result-object v11

    .line 121
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    .line 122
    .line 123
    .line 124
    move-result v12

    .line 125
    const/4 v13, 0x2

    .line 126
    mul-int/2addr v8, v13

    .line 127
    sub-int/2addr v12, v8

    .line 128
    iget v8, v11, Landroid/graphics/Rect;->left:I

    .line 129
    .line 130
    sub-int/2addr v12, v8

    .line 131
    iget v8, v11, Landroid/graphics/Rect;->right:I

    .line 132
    .line 133
    sub-int/2addr v12, v8

    .line 134
    invoke-static {v12, v10}, Ljava/lang/Math;->min(II)I

    .line 135
    .line 136
    .line 137
    move-result v8

    .line 138
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getWidth()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    mul-int/2addr v7, v13

    .line 143
    sub-int/2addr v2, v7

    .line 144
    iget v7, v11, Landroid/graphics/Rect;->left:I

    .line 145
    .line 146
    sub-int/2addr v2, v7

    .line 147
    iget v7, v11, Landroid/graphics/Rect;->right:I

    .line 148
    .line 149
    sub-int/2addr v2, v7

    .line 150
    invoke-static {v2, v10}, Ljava/lang/Math;->min(II)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    iput v2, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 155
    .line 156
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iget-boolean v2, p0, Lcom/android/launcher3/h0;->p3:Z

    .line 161
    .line 162
    if-eqz v2, :cond_0

    .line 163
    .line 164
    iget v2, p0, Lcom/android/launcher3/h0;->r3:I

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->J0()I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    add-int/2addr v2, p0

    .line 171
    goto :goto_0

    .line 172
    :cond_0
    iget v2, v11, Landroid/graphics/Rect;->bottom:I

    .line 173
    .line 174
    :goto_0
    add-int/2addr v9, v2

    .line 175
    invoke-virtual {v6, v3, v3, v3, v9}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 176
    .line 177
    .line 178
    const p0, 0x7f0b0334

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    const v7, 0x7f0b0035

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    check-cast v7, Landroid/widget/TextView;

    .line 198
    .line 199
    const/4 v9, -0x1

    .line 200
    const/4 v10, 0x0

    .line 201
    if-eq v0, v9, :cond_1

    .line 202
    .line 203
    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v7}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 208
    .line 209
    .line 210
    move-result-object v9

    .line 211
    invoke-virtual {v9, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 212
    .line 213
    .line 214
    move-result v9

    .line 215
    invoke-virtual {v7}, Landroid/widget/TextView;->getPaddingRight()I

    .line 216
    .line 217
    .line 218
    move-result v11

    .line 219
    int-to-float v11, v11

    .line 220
    add-float/2addr v9, v11

    .line 221
    invoke-virtual {v7}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 222
    .line 223
    .line 224
    move-result v11

    .line 225
    int-to-float v11, v11

    .line 226
    add-float/2addr v9, v11

    .line 227
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    .line 229
    .line 230
    new-instance v0, Lcom/android/launcher3/views/S;

    .line 231
    .line 232
    move-object/from16 v11, p4

    .line 233
    .line 234
    invoke-direct {v0, v11, v1}, Lcom/android/launcher3/views/S;-><init>(Ljava/lang/Runnable;Lcom/android/launcher3/views/W;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_1
    const/16 v0, 0x8

    .line 242
    .line 243
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 244
    .line 245
    .line 246
    move v9, v10

    .line 247
    :goto_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    add-float/2addr v0, v9

    .line 260
    float-to-int v0, v0

    .line 261
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingRight()I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    add-int/2addr v0, v2

    .line 266
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaddingLeft()I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    add-int/2addr v0, v2

    .line 271
    mul-int/2addr v5, v13

    .line 272
    add-int/2addr v0, v5

    .line 273
    iget v2, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 274
    .line 275
    if-le v0, v2, :cond_2

    .line 276
    .line 277
    if-gt v0, v8, :cond_3

    .line 278
    .line 279
    iput v0, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 280
    .line 281
    :cond_2
    :goto_2
    move-object/from16 p0, p3

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_3
    const v0, 0x7f070a73

    .line 285
    .line 286
    .line 287
    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    const v2, 0x7f070a7b

    .line 292
    .line 293
    .line 294
    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    invoke-virtual {p0, v13}, Landroid/widget/TextView;->setLines(I)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    mul-int/lit8 v5, v0, 0x2

    .line 306
    .line 307
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 308
    .line 309
    invoke-virtual {v7}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 314
    .line 315
    invoke-virtual {p0, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v7, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 319
    .line 320
    .line 321
    iget p0, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 322
    .line 323
    add-int/2addr p0, v0

    .line 324
    iput p0, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 325
    .line 326
    iput v8, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 327
    .line 328
    goto :goto_2

    .line 329
    :goto_3
    iput-object p0, v1, Lcom/android/launcher3/views/W;->h:Ljava/lang/Runnable;

    .line 330
    .line 331
    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 332
    .line 333
    .line 334
    const p0, 0x3f4ccccd    # 0.8f

    .line 335
    .line 336
    .line 337
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setScaleX(F)V

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setScaleY(F)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    const/high16 v0, 0x3f800000    # 1.0f

    .line 348
    .line 349
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    const-wide/16 v2, 0xb4

    .line 366
    .line 367
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    sget-object v0, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 372
    .line 373
    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 378
    .line 379
    .line 380
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    const/16 v0, 0xfa0

    .line 385
    .line 386
    const/4 v2, 0x6

    .line 387
    invoke-static {p0, v0, v2}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->getRecommendedTimeoutMillis(Landroid/content/Context;II)I

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    new-instance v0, Lcom/android/launcher3/views/T;

    .line 392
    .line 393
    invoke-direct {v0, v1}, Lcom/android/launcher3/views/T;-><init>(Lcom/android/launcher3/views/W;)V

    .line 394
    .line 395
    .line 396
    int-to-long v2, p0

    .line 397
    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 398
    .line 399
    .line 400
    return-void
.end method

.method public static X(Lcom/android/launcher3/views/k;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, p1, v0, p2, v1}, Lcom/android/launcher3/views/W;->W(Lcom/android/launcher3/views/k;Ljava/lang/CharSequence;ILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected handleClose(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->withLayer()Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-wide/16 v0, 0xb4

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v0, LJ0/h;->C:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Lcom/android/launcher3/views/U;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lcom/android/launcher3/views/U;-><init>(Lcom/android/launcher3/views/W;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->animate()Landroid/view/ViewPropertyAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 56
    .line 57
    .line 58
    invoke-direct {p0}, Lcom/android/launcher3/views/W;->T()V

    .line 59
    .line 60
    .line 61
    :goto_0
    const/4 p1, 0x0

    .line 62
    iput-boolean p1, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x80

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/views/W;->g:Lcom/android/launcher3/views/k;

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method
