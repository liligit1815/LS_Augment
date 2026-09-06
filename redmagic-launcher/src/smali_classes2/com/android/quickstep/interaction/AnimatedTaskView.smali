.class public Lcom/android/quickstep/interaction/AnimatedTaskView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "AnimatedTaskView.java"


# instance fields
.field private mBottomTaskView:Landroid/view/View;

.field private mFullTaskView:Landroid/view/View;

.field private mTaskViewAnimatedRadius:F

.field private final mTaskViewAnimatedRect:Landroid/graphics/Rect;

.field private mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

.field private mTopTaskView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

    .line 6
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRect:Landroid/graphics/Rect;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;IFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/interaction/AnimatedTaskView;->lambda$createAnimationToMultiRowLayout$0(Landroid/graphics/Rect;IFFLandroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addAnimatedOutlineProvider(Landroid/view/View;Landroid/graphics/Rect;F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    iput p3, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRadius:F

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    invoke-virtual {p1, p2}, Landroid/view/View;->setClipToOutline(Z)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Lcom/android/quickstep/interaction/AnimatedTaskView$3;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Lcom/android/quickstep/interaction/AnimatedTaskView$3;-><init>(Lcom/android/quickstep/interaction/AnimatedTaskView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method static bridge synthetic i(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic j(Lcom/android/quickstep/interaction/AnimatedTaskView;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRadius:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic k(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/quickstep/interaction/AnimatedTaskView;)Landroid/view/ViewOutlineProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$createAnimationToMultiRowLayout$0(Landroid/graphics/Rect;IFFLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    check-cast p5, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    int-to-float v1, p1

    .line 16
    sub-int/2addr p2, p1

    .line 17
    int-to-float p1, p2

    .line 18
    mul-float/2addr p1, p5

    .line 19
    add-float/2addr v1, p1

    .line 20
    float-to-int p1, v1

    .line 21
    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    sub-float/2addr p4, p3

    .line 24
    mul-float/2addr p5, p4

    .line 25
    add-float/2addr p3, p5

    .line 26
    iput p3, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewAnimatedRadius:F

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->invalidateOutline()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method static bridge synthetic m(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/view/View;Landroid/graphics/Rect;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/interaction/AnimatedTaskView;->addAnimatedOutlineProvider(Landroid/view/View;Landroid/graphics/Rect;F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method createAnimationToMultiRowLayout()Landroid/animation/AnimatorSet;
    .locals 9

    .line 1
    const/4 v0, 0x2

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

    .line 3
    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v1, Landroid/graphics/Outline;

    .line 9
    .line 10
    invoke-direct {v1}, Landroid/graphics/Outline;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

    .line 14
    .line 15
    invoke-virtual {v2, p0, v1}, Landroid/view/ViewOutlineProvider;->getOutline(Landroid/view/View;Landroid/graphics/Outline;)V

    .line 16
    .line 17
    .line 18
    new-instance v5, Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v5}, Landroid/graphics/Outline;->getRect(Landroid/graphics/Rect;)Z

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTopTaskView:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    invoke-virtual {v1}, Landroid/graphics/Outline;->getRadius()F

    .line 33
    .line 34
    .line 35
    move-result v7

    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const v2, 0x7f0703bc

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v8, v1

    .line 52
    new-array v1, v0, [F

    .line 53
    .line 54
    fill-array-data v1, :array_0

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v3, Lcom/android/quickstep/interaction/k;

    .line 62
    .line 63
    move-object v4, p0

    .line 64
    invoke-direct/range {v3 .. v8}, Lcom/android/quickstep/interaction/k;-><init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;IFF)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 68
    .line 69
    .line 70
    new-instance p0, Lcom/android/quickstep/interaction/AnimatedTaskView$1;

    .line 71
    .line 72
    invoke-direct {p0, v4, v5, v7}, Lcom/android/quickstep/interaction/AnimatedTaskView$1;-><init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;F)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 76
    .line 77
    .line 78
    new-instance p0, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v2, v4, Lcom/android/quickstep/interaction/AnimatedTaskView;->mBottomTaskView:Landroid/view/View;

    .line 84
    .line 85
    sget-object v3, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 86
    .line 87
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    neg-int v6, v6

    .line 92
    int-to-float v6, v6

    .line 93
    new-array v0, v0, [F

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    aput v6, v0, v7

    .line 97
    .line 98
    const/4 v6, 0x0

    .line 99
    const/4 v7, 0x1

    .line 100
    aput v6, v0, v7

    .line 101
    .line 102
    invoke-static {v2, v3, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 113
    .line 114
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 118
    .line 119
    .line 120
    new-instance p0, Lcom/android/quickstep/interaction/AnimatedTaskView$2;

    .line 121
    .line 122
    invoke-direct {p0, v4, v5}, Lcom/android/quickstep/interaction/AnimatedTaskView$2;-><init>(Lcom/android/quickstep/interaction/AnimatedTaskView;Landroid/graphics/Rect;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 126
    .line 127
    .line 128
    return-object v0

    .line 129
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b028d

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 12
    .line 13
    const v0, 0x7f0b0625

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTopTaskView:Landroid/view/View;

    .line 21
    .line 22
    const v0, 0x7f0b0119

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mBottomTaskView:Landroid/view/View;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, v0}, Lcom/android/quickstep/interaction/AnimatedTaskView;->setToSingleRowLayout(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setClipToOutline(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method setFakeTaskViewFillColor(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTopTaskView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mBottomTaskView:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setOutlineProvider(Landroid/view/ViewOutlineProvider;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTaskViewOutlineProvider:Landroid/view/ViewOutlineProvider;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method setToMultiRowLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTopTaskView:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mBottomTaskView:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method setToSingleRowLayout(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mFullTaskView:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mTopTaskView:Landroid/view/View;

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/interaction/AnimatedTaskView;->mBottomTaskView:Landroid/view/View;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v1, v2

    .line 19
    :goto_0
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
