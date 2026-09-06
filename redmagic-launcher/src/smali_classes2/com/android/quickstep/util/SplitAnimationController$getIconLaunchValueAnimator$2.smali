.class public final Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "SplitAnimationController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/util/SplitAnimationController;->getIconLaunchValueAnimator(Landroid/view/SurfaceControl$Transaction;Lcom/android/launcher3/h0;Ljava/lang/Runnable;Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingAppPairView;Landroid/window/TransitionInfo$Change;)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

.field private mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field private mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field private mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field private mScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/FloatingAppPairView;Lcom/android/launcher3/h0;Lcom/android/quickstep/util/SplitAnimationTimings;)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 13
    .line 14
    iget v2, p2, Lcom/android/launcher3/h0;->T0:I

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    const/high16 v3, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v2, v3

    .line 20
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    div-float/2addr v4, v3

    .line 29
    sub-float/2addr v2, v4

    .line 30
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectXInterpolator()Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    invoke-static {v4, v5, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {v0, p0, v1, v2, v4}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 50
    .line 51
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 58
    .line 59
    iget v2, p2, Lcom/android/launcher3/h0;->U0:I

    .line 60
    .line 61
    int-to-float v2, v2

    .line 62
    div-float/2addr v2, v3

    .line 63
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    div-float/2addr v4, v3

    .line 72
    sub-float/2addr v2, v4

    .line 73
    sget-object v3, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 74
    .line 75
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    invoke-static {v3, v4, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-direct {v0, p0, v1, v2, v4}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 91
    .line 92
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 93
    .line 94
    iget v1, p2, Lcom/android/launcher3/h0;->T0:I

    .line 95
    .line 96
    int-to-float v1, v1

    .line 97
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    div-float/2addr v1, v2

    .line 106
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    invoke-static {v3, v2, v4}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    const/high16 v4, 0x3f800000    # 1.0f

    .line 119
    .line 120
    invoke-direct {v0, p0, v4, v1, v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 121
    .line 122
    .line 123
    iput-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 124
    .line 125
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 126
    .line 127
    iget p2, p2, Lcom/android/launcher3/h0;->U0:I

    .line 128
    .line 129
    int-to-float p2, p2

    .line 130
    invoke-virtual {p1}, Lcom/android/quickstep/views/FloatingAppPairView;->getStartingPosition()Landroid/graphics/RectF;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    div-float/2addr p2, p1

    .line 139
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    invoke-static {v3, p1, p3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-direct {v0, p0, v4, p2, p1}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 155
    .line 156
    return-void
.end method


# virtual methods
.method public final getMDx()Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMDy()Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMScaleX()Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMScaleY()Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 2
    .line 3
    return-object p0
.end method

.method public onUpdate(FZ)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lcom/android/quickstep/views/FloatingAppPairView;->setProgress(F)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 9
    .line 10
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setX(F)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 16
    .line 17
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 18
    .line 19
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setY(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 27
    .line 28
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 34
    .line 35
    iget-object p2, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 36
    .line 37
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->$floatingView:Lcom/android/quickstep/views/FloatingAppPairView;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final setMDx(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    .line 8
    return-void
.end method

.method public final setMDy(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    .line 8
    return-void
.end method

.method public final setMScaleX(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    .line 8
    return-void
.end method

.method public final setMScaleY(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/android/quickstep/util/SplitAnimationController$getIconLaunchValueAnimator$2;->mScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 7
    .line 8
    return-void
.end method
