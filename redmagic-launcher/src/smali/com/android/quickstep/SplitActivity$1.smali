.class Lcom/android/quickstep/SplitActivity$1;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "SplitActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/SplitActivity;->getOpeningWindowAnimatorsWithOutIcon([Landroid/view/RemoteAnimationTarget;F)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isFirstFrame:Z

.field mAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic val$matrix:Landroid/graphics/Matrix;

.field final synthetic val$targets:[Landroid/view/RemoteAnimationTarget;


# direct methods
.method constructor <init>(Lcom/android/quickstep/SplitActivity;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/Matrix;)V
    .locals 8

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/SplitActivity$1;->val$targets:[Landroid/view/RemoteAnimationTarget;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/SplitActivity$1;->val$matrix:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 9
    .line 10
    sget v7, Lcom/android/launcher3/anim/C;->Q:I

    .line 11
    .line 12
    int-to-float v5, v7

    .line 13
    sget-object v6, Lcom/android/launcher3/anim/L;->q:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    const v2, 0x3e051eb8    # 0.13f

    .line 16
    .line 17
    .line 18
    const/high16 v3, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    move-object v1, p0

    .line 22
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity$1;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 26
    .line 27
    new-instance v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 28
    .line 29
    int-to-float v5, v7

    .line 30
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFFFLandroid/view/animation/Interpolator;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/quickstep/SplitActivity$1;->mAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Lcom/android/quickstep/SplitActivity$1;->isFirstFrame:Z

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 7

    .line 1
    new-instance p1, Landroid/view/SurfaceControl$Transaction;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/view/SurfaceControl$Transaction;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p0, Lcom/android/quickstep/SplitActivity$1;->isFirstFrame:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/android/quickstep/SplitActivity$1;->isFirstFrame:Z

    .line 12
    .line 13
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/SplitActivity$1;->val$targets:[Landroid/view/RemoteAnimationTarget;

    .line 14
    .line 15
    array-length v1, p2

    .line 16
    move v2, v0

    .line 17
    :goto_0
    if-ge v2, v1, :cond_3

    .line 18
    .line 19
    aget-object v3, p2, v2

    .line 20
    .line 21
    iget v4, v3, Landroid/view/RemoteAnimationTarget;->mode:I

    .line 22
    .line 23
    if-nez v4, :cond_1

    .line 24
    .line 25
    iget-object v4, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 26
    .line 27
    iget-object v5, p0, Lcom/android/quickstep/SplitActivity$1;->mAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 28
    .line 29
    iget v5, v5, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 30
    .line 31
    invoke-virtual {p1, v4, v5}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 32
    .line 33
    .line 34
    iget-object v4, p0, Lcom/android/quickstep/SplitActivity$1;->val$matrix:Landroid/graphics/Matrix;

    .line 35
    .line 36
    iget-object v5, p0, Lcom/android/quickstep/SplitActivity$1;->mScaleX:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 37
    .line 38
    iget v5, v5, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 39
    .line 40
    iget-object v6, v3, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    .line 43
    .line 44
    .line 45
    move-result v6

    .line 46
    int-to-float v6, v6

    .line 47
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->sourceContainerBounds:Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    int-to-float v3, v3

    .line 54
    invoke-virtual {v4, v5, v5, v6, v3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    new-instance v4, Landroid/graphics/Point;

    .line 59
    .line 60
    invoke-direct {v4}, Landroid/graphics/Point;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v5, v3, Landroid/view/RemoteAnimationTarget;->position:Landroid/graphics/Point;

    .line 64
    .line 65
    iget v6, v5, Landroid/graphics/Point;->x:I

    .line 66
    .line 67
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 68
    .line 69
    invoke-virtual {v4, v6, v5}, Landroid/graphics/Point;->set(II)V

    .line 70
    .line 71
    .line 72
    iget-object v5, v3, Landroid/view/RemoteAnimationTarget;->localBounds:Landroid/graphics/Rect;

    .line 73
    .line 74
    if-eqz v5, :cond_2

    .line 75
    .line 76
    iget v6, v5, Landroid/graphics/Rect;->left:I

    .line 77
    .line 78
    iget v5, v5, Landroid/graphics/Rect;->top:I

    .line 79
    .line 80
    invoke-virtual {v4, v6, v5}, Landroid/graphics/Point;->set(II)V

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object v5, p0, Lcom/android/quickstep/SplitActivity$1;->val$matrix:Landroid/graphics/Matrix;

    .line 84
    .line 85
    iget v6, v4, Landroid/graphics/Point;->x:I

    .line 86
    .line 87
    int-to-float v6, v6

    .line 88
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 89
    .line 90
    int-to-float v4, v4

    .line 91
    invoke-virtual {v5, v6, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 92
    .line 93
    .line 94
    new-instance v4, Landroid/graphics/Rect;

    .line 95
    .line 96
    iget-object v5, v3, Landroid/view/RemoteAnimationTarget;->screenSpaceBounds:Landroid/graphics/Rect;

    .line 97
    .line 98
    invoke-direct {v4, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4, v0, v0}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 102
    .line 103
    .line 104
    iget-object v3, v3, Landroid/view/RemoteAnimationTarget;->leash:Landroid/view/SurfaceControl;

    .line 105
    .line 106
    iget-object v4, p0, Lcom/android/quickstep/SplitActivity$1;->mAlpha:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 107
    .line 108
    iget v4, v4, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 109
    .line 110
    const/high16 v5, 0x3f800000    # 1.0f

    .line 111
    .line 112
    sub-float/2addr v5, v4

    .line 113
    invoke-virtual {p1, v3, v5}, Landroid/view/SurfaceControl$Transaction;->setAlpha(Landroid/view/SurfaceControl;F)Landroid/view/SurfaceControl$Transaction;

    .line 114
    .line 115
    .line 116
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    invoke-virtual {p1}, Landroid/view/SurfaceControl$Transaction;->apply()V

    .line 120
    .line 121
    .line 122
    return-void
.end method
