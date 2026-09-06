.class public Lp1/e;
.super Ljava/lang/Object;
.source "HotseatSwapAnimation.java"


# instance fields
.field private a:Lcom/android/launcher3/dragndrop/v;

.field private b:Lcom/android/launcher3/dragndrop/v;

.field private c:Landroid/view/View;

.field private d:Landroid/view/View;

.field private e:Landroid/graphics/Rect;

.field private f:F

.field private g:F

.field private h:F

.field private i:Landroid/animation/ValueAnimator;

.field private final j:Landroid/animation/TimeInterpolator;

.field private k:I

.field private l:Lcom/android/launcher3/C2;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Lp1/e;->f:F

    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/anim/L;->h:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    iput-object v0, p0, Lp1/e;->j:Landroid/animation/TimeInterpolator;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lp1/e;->k:I

    .line 14
    .line 15
    iput-object p1, p0, Lp1/e;->l:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Lp1/e;Landroid/graphics/Rect;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lp1/e;->d(Landroid/graphics/Rect;FLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic b(Lp1/e;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lp1/e;->d:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lp1/e;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lp1/e;->d:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic d(Landroid/graphics/Rect;FLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    iget-object v0, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lp1/e;->e:Landroid/graphics/Rect;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Lp1/e;->g:F

    .line 20
    .line 21
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    int-to-float v1, v1

    .line 24
    sub-float/2addr v1, v0

    .line 25
    mul-float/2addr v1, p3

    .line 26
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    add-float/2addr v0, v1

    .line 32
    float-to-int v0, v0

    .line 33
    iget v1, p0, Lp1/e;->h:F

    .line 34
    .line 35
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    int-to-float p1, p1

    .line 38
    sub-float/2addr p1, v1

    .line 39
    mul-float/2addr p1, p3

    .line 40
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    int-to-float p1, p1

    .line 45
    add-float/2addr v1, p1

    .line 46
    float-to-int p1, v1

    .line 47
    iget-object v1, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 48
    .line 49
    int-to-float v0, v0

    .line 50
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 54
    .line 55
    int-to-float p1, p1

    .line 56
    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lx1/O;->C3()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    const/high16 p1, 0x3f800000    # 1.0f

    .line 66
    .line 67
    sub-float/2addr p1, p2

    .line 68
    mul-float/2addr p1, p3

    .line 69
    add-float/2addr p2, p1

    .line 70
    iget-object p1, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 78
    .line 79
    .line 80
    :cond_0
    return-void
.end method


# virtual methods
.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lp1/e;->a:Lcom/android/launcher3/dragndrop/v;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lp1/e;->a:Lcom/android/launcher3/dragndrop/v;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lp1/e;->c:Landroid/view/View;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lp1/e;->c:Landroid/view/View;

    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lp1/e;->a:Lcom/android/launcher3/dragndrop/v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lp1/e;->e:Landroid/graphics/Rect;

    .line 7
    .line 8
    iget-object v1, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v1, p0, Lp1/e;->a:Lcom/android/launcher3/dragndrop/v;

    .line 16
    .line 17
    iput-object v1, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 18
    .line 19
    iget-object v2, p0, Lp1/e;->c:Landroid/view/View;

    .line 20
    .line 21
    iput-object v2, p0, Lp1/e;->d:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, p0, Lp1/e;->g:F

    .line 28
    .line 29
    iget-object v1, p0, Lp1/e;->b:Lcom/android/launcher3/dragndrop/v;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, p0, Lp1/e;->h:F

    .line 36
    .line 37
    iget v2, p0, Lp1/e;->f:F

    .line 38
    .line 39
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 40
    .line 41
    int-to-float v3, v3

    .line 42
    iget v4, p0, Lp1/e;->g:F

    .line 43
    .line 44
    sub-float/2addr v3, v4

    .line 45
    float-to-double v3, v3

    .line 46
    iget v5, v0, Landroid/graphics/Rect;->top:I

    .line 47
    .line 48
    int-to-float v5, v5

    .line 49
    sub-float/2addr v5, v1

    .line 50
    float-to-double v5, v5

    .line 51
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    double-to-float v1, v3

    .line 56
    iget-object v3, p0, Lp1/e;->l:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const v4, 0x7f0c002e

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    int-to-float v4, v4

    .line 70
    const v5, 0x7f0c002f

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getInteger(I)I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    cmpg-float v6, v1, v4

    .line 78
    .line 79
    if-gez v6, :cond_2

    .line 80
    .line 81
    int-to-float v5, v5

    .line 82
    iget-object v6, p0, Lp1/e;->j:Landroid/animation/TimeInterpolator;

    .line 83
    .line 84
    div-float/2addr v1, v4

    .line 85
    invoke-interface {v6, v1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    mul-float/2addr v5, v1

    .line 90
    float-to-int v5, v5

    .line 91
    :cond_2
    const v1, 0x7f0c0030

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    new-instance v3, Lp1/d;

    .line 103
    .line 104
    invoke-direct {v3, p0, v0, v2}, Lp1/d;-><init>(Lp1/e;Landroid/graphics/Rect;F)V

    .line 105
    .line 106
    .line 107
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 108
    .line 109
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 113
    .line 114
    iget-object v2, p0, Lp1/e;->j:Landroid/animation/TimeInterpolator;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    int-to-long v1, v1

    .line 122
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 126
    .line 127
    const/4 v1, 0x2

    .line 128
    new-array v1, v1, [F

    .line 129
    .line 130
    fill-array-data v1, :array_0

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 142
    .line 143
    new-instance v1, Lp1/e$a;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Lp1/e$a;-><init>(Lp1/e;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Lp1/e;->i:Landroid/animation/ValueAnimator;

    .line 152
    .line 153
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
