.class public Lcom/android/quickstep/views/AllAppsEduView;
.super Lcom/android/launcher3/a;
.source "AllAppsEduView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;
    }
.end annotation


# instance fields
.field private mAnimation:Landroid/animation/AnimatorSet;

.field private mCanInterceptTouch:Z

.field private mCircle:Landroid/graphics/drawable/GradientDrawable;

.field private mCircleSizePx:I

.field private mGradient:Landroid/graphics/drawable/GradientDrawable;

.field private mLauncher:Lcom/android/launcher3/C2;

.field private mMaxHeightPx:I

.field private mPaddingPx:I

.field private mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

.field private mWidthPx:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const p2, 0x7f08079d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircle:Landroid/graphics/drawable/GradientDrawable;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const p2, 0x7f070ab8

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircleSizePx:I

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const p2, 0x7f070aba

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iput p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mPaddingPx:I

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const p2, 0x7f070abb

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mWidthPx:I

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const p2, 0x7f070ab9

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/anim/q;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method static bridge synthetic O(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircle:Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic Q(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mGradient:Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic R(Lcom/android/quickstep/views/AllAppsEduView;)Lcom/android/launcher3/C2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic S(Lcom/android/quickstep/views/AllAppsEduView;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method private init(Lcom/android/launcher3/C2;)V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mLauncher:Lcom/android/launcher3/C2;

    .line 3
    .line 4
    new-instance v1, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-direct {v1, p1, v2}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;-><init>(Lcom/android/launcher3/C2;Lcom/android/quickstep/views/c;)V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->h(Landroid/content/Context;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 17
    .line 18
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 19
    .line 20
    const v4, 0x7f040386

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v4}, Lcom/android/launcher3/util/F2;->c(Landroid/content/Context;I)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x2

    .line 29
    const/4 v7, 0x0

    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    new-array v1, v6, [I

    .line 33
    .line 34
    const v4, -0x4c000001

    .line 35
    .line 36
    .line 37
    aput v4, v1, v7

    .line 38
    .line 39
    const v4, 0xffffff

    .line 40
    .line 41
    .line 42
    aput v4, v1, v5

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-array v4, v6, [I

    .line 46
    .line 47
    const/16 v8, 0x7f

    .line 48
    .line 49
    invoke-static {v1, v8}, LB/a;->r(II)I

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    aput v8, v4, v7

    .line 54
    .line 55
    invoke-static {v1, v7}, LB/a;->r(II)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    aput v1, v4, v5

    .line 60
    .line 61
    move-object v1, v4

    .line 62
    :goto_0
    invoke-direct {v2, v3, v1}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mGradient:Landroid/graphics/drawable/GradientDrawable;

    .line 66
    .line 67
    iget v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mWidthPx:I

    .line 68
    .line 69
    int-to-float v1, v1

    .line 70
    const/high16 v3, 0x40000000    # 2.0f

    .line 71
    .line 72
    div-float/2addr v1, v3

    .line 73
    const/16 v3, 0x8

    .line 74
    .line 75
    new-array v3, v3, [F

    .line 76
    .line 77
    aput v1, v3, v7

    .line 78
    .line 79
    aput v1, v3, v5

    .line 80
    .line 81
    aput v1, v3, v6

    .line 82
    .line 83
    const/4 v4, 0x3

    .line 84
    aput v1, v3, v4

    .line 85
    .line 86
    const/4 v1, 0x4

    .line 87
    aput v0, v3, v1

    .line 88
    .line 89
    const/4 v1, 0x5

    .line 90
    aput v0, v3, v1

    .line 91
    .line 92
    const/4 v1, 0x6

    .line 93
    aput v0, v3, v1

    .line 94
    .line 95
    const/4 v1, 0x7

    .line 96
    aput v0, v3, v1

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 99
    .line 100
    .line 101
    iget v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 102
    .line 103
    iget v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircleSizePx:I

    .line 104
    .line 105
    sub-int/2addr v0, v1

    .line 106
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mPaddingPx:I

    .line 107
    .line 108
    add-int/2addr v0, v2

    .line 109
    iget-object v3, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircle:Landroid/graphics/drawable/GradientDrawable;

    .line 110
    .line 111
    add-int v4, v2, v1

    .line 112
    .line 113
    add-int/2addr v1, v0

    .line 114
    invoke-virtual {v3, v2, v0, v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mGradient:Landroid/graphics/drawable/GradientDrawable;

    .line 118
    .line 119
    iget v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 120
    .line 121
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircleSizePx:I

    .line 122
    .line 123
    sub-int v2, v1, v2

    .line 124
    .line 125
    iget v3, p0, Lcom/android/quickstep/views/AllAppsEduView;->mWidthPx:I

    .line 126
    .line 127
    invoke-virtual {v0, v7, v2, v3, v1}, Landroid/graphics/drawable/GradientDrawable;->setBounds(IIII)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    new-instance v0, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 135
    .line 136
    iget v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mWidthPx:I

    .line 137
    .line 138
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 139
    .line 140
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 141
    .line 142
    .line 143
    iput-boolean v5, v0, Lcom/android/launcher3/h1$a;->a:Z

    .line 144
    .line 145
    iget v1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 146
    .line 147
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mWidthPx:I

    .line 148
    .line 149
    sub-int/2addr v1, v2

    .line 150
    div-int/2addr v1, v6

    .line 151
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 152
    .line 153
    iget v1, p1, Lcom/android/launcher3/h0;->U0:I

    .line 154
    .line 155
    iget p1, p1, Lcom/android/launcher3/h0;->f2:I

    .line 156
    .line 157
    sub-int/2addr v1, p1

    .line 158
    iget p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 159
    .line 160
    sub-int/2addr v1, p1

    .line 161
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method private playAnimation()V
    .locals 15

    .line 1
    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    new-instance v9, Landroid/graphics/Rect;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircle:Landroid/graphics/drawable/GradientDrawable;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getBounds()Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v9, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    new-instance v10, Landroid/graphics/Rect;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mGradient:Landroid/graphics/drawable/GradientDrawable;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getBounds()Landroid/graphics/Rect;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v10, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 34
    .line 35
    .line 36
    new-instance v8, Landroid/graphics/Rect;

    .line 37
    .line 38
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mMaxHeightPx:I

    .line 42
    .line 43
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircleSizePx:I

    .line 44
    .line 45
    sub-int/2addr v1, v2

    .line 46
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView;->mPaddingPx:I

    .line 47
    .line 48
    sub-int/2addr v1, v2

    .line 49
    int-to-float v6, v1

    .line 50
    iget-object v1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;->c(Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;)Lcom/android/launcher3/anim/q;

    .line 53
    .line 54
    .line 55
    move-result-object v12

    .line 56
    new-array v1, v0, [F

    .line 57
    .line 58
    fill-array-data v1, :array_0

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 68
    .line 69
    .line 70
    const/16 v5, 0x708

    .line 71
    .line 72
    int-to-long v13, v5

    .line 73
    invoke-virtual {v1, v13, v14}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    new-instance v2, Lcom/android/quickstep/views/AllAppsEduView$1;

    .line 77
    .line 78
    const/16 v4, 0x258

    .line 79
    .line 80
    const/16 v7, 0x4b0

    .line 81
    .line 82
    const/high16 v11, 0x3f400000    # 0.75f

    .line 83
    .line 84
    move-object v3, p0

    .line 85
    invoke-direct/range {v2 .. v12}, Lcom/android/quickstep/views/AllAppsEduView$1;-><init>(Lcom/android/quickstep/views/AllAppsEduView;IIFILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;FLcom/android/launcher3/anim/q;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Lcom/android/quickstep/views/AllAppsEduView$2;

    .line 92
    .line 93
    invoke-direct {p0, v3}, Lcom/android/quickstep/views/AllAppsEduView$2;-><init>(Lcom/android/quickstep/views/AllAppsEduView;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, v3, Lcom/android/quickstep/views/AllAppsEduView;->mLauncher:Lcom/android/launcher3/C2;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const/4 v2, 0x0

    .line 106
    invoke-virtual {p0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 107
    .line 108
    .line 109
    iget-object p0, v3, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 112
    .line 113
    .line 114
    new-array p0, v0, [F

    .line 115
    .line 116
    fill-array-data p0, :array_1

    .line 117
    .line 118
    .line 119
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    new-instance v0, Lcom/android/quickstep/views/b;

    .line 124
    .line 125
    invoke-direct {v0, v12}, Lcom/android/quickstep/views/b;-><init>(Lcom/android/launcher3/anim/q;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 129
    .line 130
    .line 131
    sget-object v0, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v13, v14}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 137
    .line 138
    .line 139
    const-wide/16 v0, 0xfa

    .line 140
    .line 141
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 142
    .line 143
    .line 144
    iget-object v0, v3, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 145
    .line 146
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 147
    .line 148
    .line 149
    iget-object p0, v3, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 150
    .line 151
    new-instance v0, Lcom/android/quickstep/views/AllAppsEduView$3;

    .line 152
    .line 153
    invoke-direct {v0, v3}, Lcom/android/quickstep/views/AllAppsEduView$3;-><init>(Lcom/android/quickstep/views/AllAppsEduView;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, v3, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 160
    .line 161
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_1
    .array-data 4
        0x3f400000    # 0.75f
        0x0
    .end array-data
.end method

.method private shouldInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    and-int/lit16 p1, p1, 0x100

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :goto_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCanInterceptTouch:Z

    .line 19
    .line 20
    :cond_1
    iget-boolean p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCanInterceptTouch:Z

    .line 21
    .line 22
    return p0
.end method

.method public static show(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    return-void
.end method

.method private updateAnimationOnTouchEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p1, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;->d(Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView;->handleClose(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void

    .line 34
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->resume()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mAnimation:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->pause()V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public canInterceptEventsInSystemGestureRegion()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic clearLastStatus()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/util/G2;->clearLastStatus()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/util/G2;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected handleClose(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    and-int/lit16 p0, p1, 0x200

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

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 6
    .line 7
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView;->shouldInterceptTouch(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;->onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView;->updateAnimationOnTouchEvent(Landroid/view/MotionEvent;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView;->shouldInterceptTouch(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mTouchController:Lcom/android/quickstep/views/AllAppsEduView$AllAppsEduTouchController;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/touch/d;->onControllerTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AllAppsEduView;->updateAnimationOnTouchEvent(Landroid/view/MotionEvent;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/a;->mIsOpen:Z

    .line 6
    .line 7
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mGradient:Landroid/graphics/drawable/GradientDrawable;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView;->mCircle:Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
