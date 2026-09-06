.class Lcom/android/quickstep/views/FloatingTaskView$2;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "FloatingTaskView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/FloatingTaskView;->addAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZLcom/android/quickstep/util/SplitAnimationTimings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final mTaskViewScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final mTaskViewScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic this$0:Lcom/android/quickstep/views/FloatingTaskView;

.field final synthetic val$floatingTaskViewBounds:Landroid/graphics/RectF;

.field final synthetic val$prop:Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;

.field final synthetic val$startingBounds:Landroid/graphics/RectF;

.field final synthetic val$timings:Lcom/android/quickstep/util/SplitAnimationTimings;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/FloatingTaskView;Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->this$0:Lcom/android/quickstep/views/FloatingTaskView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$prop:Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$timings:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$floatingTaskViewBounds:Landroid/graphics/RectF;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$startingBounds:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 15
    .line 16
    invoke-static {p2}, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->a(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectXInterpolator()Landroid/view/animation/Interpolator;

    .line 21
    .line 22
    .line 23
    move-result-object p5

    .line 24
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {p5, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    .line 35
    move-result-object p5

    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-direct {p1, p0, v0, p4, p5}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 41
    .line 42
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 43
    .line 44
    invoke-static {p2}, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->b(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F

    .line 45
    .line 46
    .line 47
    move-result p4

    .line 48
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectYInterpolator()Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    .line 51
    move-result-object p5

    .line 52
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-static {p5, v1, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 61
    .line 62
    .line 63
    move-result-object p5

    .line 64
    invoke-direct {p1, p0, v0, p4, p5}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 68
    .line 69
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 70
    .line 71
    invoke-static {p2}, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->c(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F

    .line 72
    .line 73
    .line 74
    move-result p4

    .line 75
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectScaleXInterpolator()Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    .line 78
    move-result-object p5

    .line 79
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-static {p5, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 88
    .line 89
    .line 90
    move-result-object p5

    .line 91
    const/high16 v0, 0x3f800000    # 1.0f

    .line 92
    .line 93
    invoke-direct {p1, p0, v0, p4, p5}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mTaskViewScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 97
    .line 98
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 99
    .line 100
    invoke-static {p2}, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;->d(Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;)F

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectScaleYInterpolator()Landroid/view/animation/Interpolator;

    .line 105
    .line 106
    .line 107
    move-result-object p4

    .line 108
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideStartOffset()F

    .line 109
    .line 110
    .line 111
    move-result p5

    .line 112
    invoke-interface {p3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getStagedRectSlideEndOffset()F

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    invoke-static {p4, p5, p3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 117
    .line 118
    .line 119
    move-result-object p3

    .line 120
    invoke-direct {p1, p0, v0, p2, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 121
    .line 122
    .line 123
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mTaskViewScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 124
    .line 125
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$floatingTaskViewBounds:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$startingBounds:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$floatingTaskViewBounds:Landroid/graphics/RectF;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mDx:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 11
    .line 12
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mDy:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 15
    .line 16
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 17
    .line 18
    invoke-virtual {p2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$floatingTaskViewBounds:Landroid/graphics/RectF;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mTaskViewScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 24
    .line 25
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->mTaskViewScaleY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 28
    .line 29
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 30
    .line 31
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/N5;->b0(Landroid/graphics/RectF;FF)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->this$0:Lcom/android/quickstep/views/FloatingTaskView;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView$2;->val$floatingTaskViewBounds:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {p2, p0, p1}, Lcom/android/quickstep/views/FloatingTaskView;->update(Landroid/graphics/RectF;F)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
