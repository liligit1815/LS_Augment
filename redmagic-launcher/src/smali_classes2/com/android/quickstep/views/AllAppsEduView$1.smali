.class Lcom/android/quickstep/views/AllAppsEduView$1;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "AllAppsEduView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/AllAppsEduView;->playAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mCircleAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field mCircleScale:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field mDeltaY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field mGradientAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic this$0:Lcom/android/quickstep/views/AllAppsEduView;

.field final synthetic val$circleBoundsOg:Landroid/graphics/Rect;

.field final synthetic val$firstPart:I

.field final synthetic val$gradientBoundsOg:Landroid/graphics/Rect;

.field final synthetic val$introDuration:I

.field final synthetic val$maxAllAppsProgress:F

.field final synthetic val$secondPart:I

.field final synthetic val$stateAnimationController:Lcom/android/launcher3/anim/q;

.field final synthetic val$temp:Landroid/graphics/Rect;

.field final synthetic val$transY:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/AllAppsEduView;IIFILandroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;FLcom/android/launcher3/anim/q;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$firstPart:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$introDuration:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$transY:F

    .line 8
    .line 9
    iput p5, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$secondPart:I

    .line 10
    .line 11
    iput-object p6, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$circleBoundsOg:Landroid/graphics/Rect;

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$gradientBoundsOg:Landroid/graphics/Rect;

    .line 16
    .line 17
    iput p9, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$maxAllAppsProgress:F

    .line 18
    .line 19
    iput-object p10, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$stateAnimationController:Lcom/android/launcher3/anim/q;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 25
    .line 26
    sget-object p6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 27
    .line 28
    int-to-float p7, p2

    .line 29
    int-to-float p8, p3

    .line 30
    const/4 p9, 0x0

    .line 31
    invoke-static {p6, p9, p7, p8}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 32
    .line 33
    .line 34
    move-result-object p7

    .line 35
    const/high16 p8, 0x437f0000    # 255.0f

    .line 36
    .line 37
    invoke-direct {p1, p0, p9, p8, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mCircleAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 41
    .line 42
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 43
    .line 44
    sget-object p7, LJ0/h;->j:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    int-to-float p10, p2

    .line 47
    int-to-float v0, p3

    .line 48
    invoke-static {p7, p9, p10, v0}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    .line 51
    move-result-object p7

    .line 52
    const/high16 p10, 0x40000000    # 2.0f

    .line 53
    .line 54
    const/high16 v0, 0x3f800000    # 1.0f

    .line 55
    .line 56
    invoke-direct {p1, p0, p10, v0, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mCircleScale:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 60
    .line 61
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 62
    .line 63
    sget-object p7, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    int-to-float p10, p2

    .line 66
    int-to-float v0, p5

    .line 67
    int-to-float v1, p3

    .line 68
    invoke-static {p7, p10, v0, v1}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    .line 71
    move-result-object p7

    .line 72
    invoke-direct {p1, p0, p9, p4, p7}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mDeltaY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 76
    .line 77
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 78
    .line 79
    int-to-float p2, p2

    .line 80
    int-to-float p4, p5

    .line 81
    const p5, 0x3e99999a    # 0.3f

    .line 82
    .line 83
    .line 84
    mul-float/2addr p4, p5

    .line 85
    int-to-float p3, p3

    .line 86
    invoke-static {p6, p2, p4, p3}, Lcom/android/quickstep/util/AnimUtils;->clampToDuration(Landroid/view/animation/Interpolator;FFF)Landroid/view/animation/Interpolator;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-direct {p1, p0, p9, p8, p2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mGradientAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$circleBoundsOg:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mDeltaY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 11
    .line 12
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 13
    .line 14
    neg-float p2, p2

    .line 15
    float-to-int p2, p2

    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Rect;->offset(II)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 21
    .line 22
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mCircleScale:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 23
    .line 24
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 25
    .line 26
    invoke-static {p1, p2}, Lcom/android/launcher3/N5;->Z(Landroid/graphics/Rect;F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->O(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->O(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mCircleAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 47
    .line 48
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 49
    .line 50
    float-to-int p2, p2

    .line 51
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->Q(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mGradientAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 61
    .line 62
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 63
    .line 64
    float-to-int p2, p2

    .line 65
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 69
    .line 70
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$gradientBoundsOg:Landroid/graphics/Rect;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 76
    .line 77
    iget p2, p1, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    int-to-float p2, p2

    .line 80
    iget-object v0, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mDeltaY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 81
    .line 82
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 83
    .line 84
    sub-float/2addr p2, v0

    .line 85
    float-to-int p2, p2

    .line 86
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 89
    .line 90
    invoke-static {p1}, Lcom/android/quickstep/views/AllAppsEduView;->Q(Lcom/android/quickstep/views/AllAppsEduView;)Landroid/graphics/drawable/GradientDrawable;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$temp:Landroid/graphics/Rect;

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->this$0:Lcom/android/quickstep/views/AllAppsEduView;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->invalidate()V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->mDeltaY:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 105
    .line 106
    iget v0, p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 107
    .line 108
    iget v2, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$transY:F

    .line 109
    .line 110
    iget v4, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$maxAllAppsProgress:F

    .line 111
    .line 112
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 113
    .line 114
    const/4 v1, 0x0

    .line 115
    const/4 v3, 0x0

    .line 116
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iget-object p0, p0, Lcom/android/quickstep/views/AllAppsEduView$1;->val$stateAnimationController:Lcom/android/launcher3/anim/q;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
