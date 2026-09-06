.class public Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;
.super Lcom/android/launcher3/anim/g;
.source "SwipeUpAnimationLogic.java"

# interfaces
.implements Lcom/android/quickstep/util/RectFSpringAnim$OnUpdateListener;
.implements Lcom/android/quickstep/util/TransformParams$BuilderProxy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/SwipeUpAnimationLogic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SpringAnimationRunner"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SpringAnimationRunner"


# instance fields
.field final mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

.field final mCropRect:Landroid/graphics/Rect;

.field final mCropRectF:Landroid/graphics/RectF;

.field mCurrentIconRectTmp:Landroid/graphics/RectF;

.field mCurrentRectTmp:Landroid/graphics/RectF;

.field mEndRadisuRatio:F

.field mEndRadius:F

.field private mFinalTargetAspectRatio:F

.field final mHomeAnim:Lcom/android/launcher3/anim/q;

.field final mHomeToWindowPositionMap:Landroid/graphics/Matrix;

.field final mIsPortrait:Z

.field private final mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

.field final mMatrix:Landroid/graphics/Matrix;

.field final mRunningTaskViewScrollOffset:F

.field final mRunningTaskViewStartRectF:Landroid/graphics/RectF;

.field private mStartAspectRatio:F

.field mStartRadisuRatio:F

.field mStartRadius:F

.field mTargetRect:Landroid/graphics/RectF;

.field final mTargetTaskView:Lcom/android/quickstep/views/TaskView;

.field mTaskViewAlpha:F

.field final mTaskViewHeight:F

.field mTaskViewScaleX:F

.field mTaskViewScaleY:F

.field mTaskViewTranslationX:F

.field mTaskViewTranslationY:F

.field final mTaskViewWidth:F

.field final mThumbnailStartBounds:Landroid/graphics/Rect;

.field final mWindowCurrentRect:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;


# direct methods
.method constructor <init>(Lcom/android/quickstep/SwipeUpAnimationLogic;Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;Landroid/graphics/RectF;Landroid/graphics/Matrix;Lcom/android/quickstep/util/TransformParams;Lcom/android/quickstep/util/TaskViewSimulator;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    new-instance v1, Landroid/graphics/Matrix;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mMatrix:Landroid/graphics/Matrix;

    .line 19
    .line 20
    new-instance v1, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 26
    .line 27
    new-instance v1, Landroid/graphics/Rect;

    .line 28
    .line 29
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 33
    .line 34
    new-instance v1, Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentRectTmp:Landroid/graphics/RectF;

    .line 40
    .line 41
    new-instance v1, Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentIconRectTmp:Landroid/graphics/RectF;

    .line 47
    .line 48
    new-instance v1, Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 54
    .line 55
    iput-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->createActivityAnimationToHome()Lcom/android/launcher3/anim/q;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeAnim:Lcom/android/launcher3/anim/q;

    .line 62
    .line 63
    iput-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 64
    .line 65
    iput-object p4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 66
    .line 67
    iput-object p5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 68
    .line 69
    invoke-virtual {p3, v0}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p6}, Lcom/android/quickstep/util/TaskViewSimulator;->getCurrentCornerRadius()F

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    iput p4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadius:F

    .line 77
    .line 78
    invoke-virtual {p2, p3}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getEndRadius(Landroid/graphics/RectF;)F

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    iput p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mEndRadius:F

    .line 83
    .line 84
    iput-object p7, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mRunningTaskViewStartRectF:Landroid/graphics/RectF;

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getTargetTaskView()Lcom/android/quickstep/views/TaskView;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    iput-object p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 91
    .line 92
    const/4 p4, 0x0

    .line 93
    if-nez p3, :cond_0

    .line 94
    .line 95
    move p5, p4

    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getWidth()I

    .line 98
    .line 99
    .line 100
    move-result p5

    .line 101
    int-to-float p5, p5

    .line 102
    :goto_0
    iput p5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewWidth:F

    .line 103
    .line 104
    if-nez p3, :cond_1

    .line 105
    .line 106
    move p3, p4

    .line 107
    goto :goto_1

    .line 108
    :cond_1
    invoke-virtual {p3}, Landroid/widget/FrameLayout;->getHeight()I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    int-to-float p3, p3

    .line 113
    :goto_1
    iput p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewHeight:F

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isPortrait()Z

    .line 116
    .line 117
    .line 118
    move-result p3

    .line 119
    iput-boolean p3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mIsPortrait:Z

    .line 120
    .line 121
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isRtl()Z

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    if-eqz p2, :cond_2

    .line 126
    .line 127
    iget p1, p7, Landroid/graphics/RectF;->right:F

    .line 128
    .line 129
    neg-float p1, p1

    .line 130
    invoke-static {p4, p1}, Ljava/lang/Math;->min(FF)F

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    goto :goto_2

    .line 135
    :cond_2
    iget-object p1, p1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 136
    .line 137
    iget p1, p1, Lcom/android/launcher3/h0;->T0:I

    .line 138
    .line 139
    int-to-float p1, p1

    .line 140
    iget p2, p7, Landroid/graphics/RectF;->left:F

    .line 141
    .line 142
    sub-float/2addr p1, p2

    .line 143
    invoke-static {p4, p1}, Ljava/lang/Math;->max(FF)F

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    :goto_2
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mRunningTaskViewScrollOffset:F

    .line 148
    .line 149
    return-void
.end method

.method private cleanUp()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, -0x2

    .line 19
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setOffsetMidpointIndexOverride(I)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 23
    .line 24
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewAlpha:F

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isAnimatingIntoIcon()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 38
    .line 39
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewTranslationX:F

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 45
    .line 46
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewTranslationY:F

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 52
    .line 53
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewScaleX:F

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 59
    .line 60
    iget p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewScaleY:F

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    :goto_0
    return-void
.end method

.method private setUp()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setOffsetMidpointIndexOverride(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v0, v1, v2}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewAlpha:F

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isAnimatingIntoIcon()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewTranslationX:F

    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getTranslationY()F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewTranslationY:F

    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewScaleX:F

    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 77
    .line 78
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewScaleY:F

    .line 83
    .line 84
    :cond_3
    :goto_0
    return-void
.end method

.method private updateCropRectAndCornerRadius(FF)F
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    div-float/2addr v0, v1

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    div-float/2addr v1, v2

    .line 27
    cmpl-float v1, v0, v1

    .line 28
    .line 29
    if-lez v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    div-float/2addr v1, v0

    .line 38
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 39
    .line 40
    iget v3, v2, Landroid/graphics/RectF;->left:F

    .line 41
    .line 42
    add-float/2addr v3, v1

    .line 43
    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    mul-float/2addr v1, v0

    .line 53
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 54
    .line 55
    iget v2, v2, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 56
    .line 57
    const/4 v3, 0x5

    .line 58
    if-ne v2, v3, :cond_1

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 61
    .line 62
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 63
    .line 64
    sub-float/2addr v3, v1

    .line 65
    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 69
    .line 70
    iget v3, v2, Landroid/graphics/RectF;->top:F

    .line 71
    .line 72
    add-float/2addr v3, v1

    .line 73
    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 74
    .line 75
    :goto_0
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRect:Landroid/graphics/Rect;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mTargetWorkspaceView:Landroid/view/View;

    .line 85
    .line 86
    if-eqz v1, :cond_3

    .line 87
    .line 88
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 89
    .line 90
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 95
    .line 96
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    div-float/2addr p2, v1

    .line 101
    cmpl-float p2, v0, p2

    .line 102
    .line 103
    if-lez p2, :cond_2

    .line 104
    .line 105
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 106
    .line 107
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->getCurrentCornerRadiusRatio(F)F

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    :goto_1
    mul-float/2addr p2, p0

    .line 116
    return p2

    .line 117
    :cond_2
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->getCurrentCornerRadiusRatio(F)F

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    goto :goto_1

    .line 128
    :cond_3
    return p2
.end method


# virtual methods
.method public getCurrentCornerRadiusRatio(F)F
    .locals 7

    .line 1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mHomeAnimTargetViewType:I

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/anim/C;->i0(I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    :goto_0
    move v3, v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    sget v0, Lcom/android/launcher3/anim/C;->W:F

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :goto_1
    iget v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadisuRatio:F

    .line 25
    .line 26
    iget v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mEndRadisuRatio:F

    .line 27
    .line 28
    sget-object v6, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    move v1, p1

    .line 32
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->this$0:Lcom/android/quickstep/SwipeUpAnimationLogic;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/quickstep/SwipeUpAnimationLogic;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lu2/e;->h()V

    .line 18
    .line 19
    .line 20
    invoke-super {p0, p1}, Lcom/android/launcher3/anim/g;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->setUp()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeAnim:Lcom/android/launcher3/anim/q;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->k()Lcom/android/launcher3/anim/q;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p1, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskView;->getThumbnailBounds(Landroid/graphics/Rect;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 31
    .line 32
    new-instance v1, Lcom/android/launcher3/views/ClipIconView$b;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 35
    .line 36
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-object v3, v2

    .line 40
    new-instance v2, Lcom/android/quickstep/J4;

    .line 41
    .line 42
    invoke-direct {v2, v3}, Lcom/android/quickstep/J4;-><init>(Lcom/android/quickstep/views/TaskView;)V

    .line 43
    .line 44
    .line 45
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    neg-int p1, p1

    .line 48
    int-to-float v4, p1

    .line 49
    iget p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewHeight:F

    .line 50
    .line 51
    iget v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTaskViewWidth:F

    .line 52
    .line 53
    invoke-static {p1, v3}, Ljava/lang/Math;->min(FF)F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    iget-boolean v6, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mIsPortrait:Z

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/views/ClipIconView$b;-><init>(LI/a;FFFZ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setTaskViewArtist(Lcom/android/launcher3/views/ClipIconView$b;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    return-void
.end method

.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->cleanUp()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeAnim:Lcom/android/launcher3/anim/q;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onBuildTargetParams(Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;Landroid/view/RemoteAnimationTarget;Lcom/android/quickstep/util/TransformParams;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setMatrix(Landroid/graphics/Matrix;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRect:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setWindowCrop(Landroid/graphics/Rect;)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p3}, Lcom/android/quickstep/util/TransformParams;->getCornerRadius()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;->setCornerRadius(F)Lcom/android/quickstep/util/SurfaceTransaction$SurfaceProperties;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onCancel()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->cleanUp()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->onCancel()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeAnim:Lcom/android/launcher3/anim/q;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/anim/q;->n()Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentRectTmp:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentIconRectTmp:Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 12
    .line 13
    iget-boolean v1, v0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIsNeedUpdateCurrentRectF:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v3, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentIconRectTmp:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartAspectRatio:F

    .line 20
    .line 21
    iget v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mFinalTargetAspectRatio:F

    .line 22
    .line 23
    iget-object v6, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 24
    .line 25
    iget v7, v0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mIconScaleForNormal:F

    .line 26
    .line 27
    move-object v2, p1

    .line 28
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/anim/C;->y0(Landroid/graphics/RectF;Landroid/graphics/RectF;FFLandroid/graphics/RectF;F)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move-object v2, p1

    .line 33
    :goto_0
    iget p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadius:F

    .line 34
    .line 35
    iget v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mEndRadius:F

    .line 36
    .line 37
    invoke-static {p2, p1, v0}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 42
    .line 43
    invoke-virtual {v0, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowAlpha(F)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeAnim:Lcom/android/launcher3/anim/q;

    .line 48
    .line 49
    invoke-virtual {v1, p2}, Lcom/android/launcher3/anim/q;->w(F)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v3, 0x0

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 60
    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 65
    .line 66
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 67
    .line 68
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mRunningTaskViewStartRectF:Landroid/graphics/RectF;

    .line 69
    .line 70
    invoke-virtual {v1, v4, v5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->updateCropRectAndCornerRadius(FF)F

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 78
    .line 79
    iget v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mRunningTaskViewScrollOffset:F

    .line 80
    .line 81
    mul-float/2addr v4, p2

    .line 82
    invoke-virtual {v1, v4, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mMatrix:Landroid/graphics/Matrix;

    .line 86
    .line 87
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 88
    .line 89
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 90
    .line 91
    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 92
    .line 93
    invoke-virtual {v1, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 97
    .line 98
    iget v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadius:F

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Lcom/android/quickstep/util/TransformParams;->setCornerRadius(F)Lcom/android/quickstep/util/TransformParams;

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 105
    .line 106
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 107
    .line 108
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentRectTmp:Landroid/graphics/RectF;

    .line 109
    .line 110
    invoke-virtual {v1, v4, v5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 111
    .line 112
    .line 113
    invoke-direct {p0, p2, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->updateCropRectAndCornerRadius(FF)F

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mMatrix:Landroid/graphics/Matrix;

    .line 118
    .line 119
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 120
    .line 121
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mWindowCurrentRect:Landroid/graphics/RectF;

    .line 122
    .line 123
    sget-object v6, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    .line 124
    .line 125
    invoke-virtual {v1, v4, v5, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/TransformParams;->setTargetAlpha(F)Lcom/android/quickstep/util/TransformParams;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, p1}, Lcom/android/quickstep/util/TransformParams;->setCornerRadius(F)Lcom/android/quickstep/util/TransformParams;

    .line 135
    .line 136
    .line 137
    :goto_2
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 138
    .line 139
    invoke-virtual {v1, p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowBlurRadius(F)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    const/4 v4, -0x1

    .line 144
    if-eq v1, v4, :cond_3

    .line 145
    .line 146
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 147
    .line 148
    invoke-virtual {v4, v1}, Lcom/android/quickstep/util/TransformParams;->setWindowBlurRadius(I)Lcom/android/quickstep/util/TransformParams;

    .line 149
    .line 150
    .line 151
    :cond_3
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mLocalTransformParams:Lcom/android/quickstep/util/TransformParams;

    .line 152
    .line 153
    invoke-virtual {v1, p0}, Lcom/android/quickstep/util/TransformParams;->createSurfaceParams(Lcom/android/quickstep/util/TransformParams$BuilderProxy;)Lcom/android/quickstep/util/SurfaceTransaction;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-virtual {v1, v4}, Lcom/android/quickstep/util/TransformParams;->applySurfaceParams(Lcom/android/quickstep/util/SurfaceTransaction;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 161
    .line 162
    iget-object v4, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCurrentIconRectTmp:Landroid/graphics/RectF;

    .line 163
    .line 164
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mMatrix:Landroid/graphics/Matrix;

    .line 165
    .line 166
    invoke-virtual {v5, p1}, Landroid/graphics/Matrix;->mapRadius(F)F

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    const/4 v6, 0x0

    .line 175
    if-eqz v5, :cond_5

    .line 176
    .line 177
    iget-object v5, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 178
    .line 179
    if-nez v5, :cond_4

    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_4
    const/high16 v5, 0x437f0000    # 255.0f

    .line 183
    .line 184
    mul-float/2addr v5, v0

    .line 185
    float-to-int v5, v5

    .line 186
    goto :goto_4

    .line 187
    :cond_5
    :goto_3
    move v5, v6

    .line 188
    :goto_4
    invoke-virtual {v1, v4, p2, p1, v5}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->update(Landroid/graphics/RectF;FFI)V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/android/launcher3/y0;->f()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_11

    .line 196
    .line 197
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 198
    .line 199
    if-nez p1, :cond_6

    .line 200
    .line 201
    goto/16 :goto_9

    .line 202
    .line 203
    :cond_6
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 204
    .line 205
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isAnimatingIntoIcon()Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_7

    .line 210
    .line 211
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isAnimationReady()Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-eqz p1, :cond_7

    .line 218
    .line 219
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 220
    .line 221
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 226
    .line 227
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 228
    .line 229
    invoke-virtual {p2}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->isAnimatingIntoIcon()Z

    .line 230
    .line 231
    .line 232
    move-result p2

    .line 233
    const/high16 v1, 0x3f800000    # 1.0f

    .line 234
    .line 235
    if-eqz p2, :cond_8

    .line 236
    .line 237
    move v0, v1

    .line 238
    :cond_8
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 239
    .line 240
    .line 241
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 242
    .line 243
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    int-to-float p1, p1

    .line 248
    iget-object p2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 249
    .line 250
    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    .line 251
    .line 252
    .line 253
    move-result p2

    .line 254
    int-to-float p2, p2

    .line 255
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    .line 260
    .line 261
    .line 262
    move-result v4

    .line 263
    invoke-static {p1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 264
    .line 265
    .line 266
    move-result v5

    .line 267
    const/4 v7, 0x1

    .line 268
    if-lez v5, :cond_9

    .line 269
    .line 270
    move v5, v7

    .line 271
    goto :goto_5

    .line 272
    :cond_9
    move v5, v6

    .line 273
    :goto_5
    invoke-static {p2, v3}, Ljava/lang/Float;->compare(FF)I

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-lez v3, :cond_a

    .line 278
    .line 279
    move v6, v7

    .line 280
    :cond_a
    const-string v3, "SpringAnimationRunner"

    .line 281
    .line 282
    if-eqz v5, :cond_b

    .line 283
    .line 284
    if-eqz v6, :cond_b

    .line 285
    .line 286
    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    div-float/2addr v1, v5

    .line 295
    goto :goto_6

    .line 296
    :cond_b
    new-instance v7, Ljava/lang/StringBuilder;

    .line 297
    .line 298
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 299
    .line 300
    .line 301
    const-string v8, "TaskView starting bounds are invalid: "

    .line 302
    .line 303
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v8, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 307
    .line 308
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v7

    .line 315
    invoke-static {v3, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    .line 317
    .line 318
    if-eqz v5, :cond_c

    .line 319
    .line 320
    div-float v1, v0, p1

    .line 321
    .line 322
    goto :goto_6

    .line 323
    :cond_c
    if-eqz v6, :cond_d

    .line 324
    .line 325
    div-float v1, v4, p2

    .line 326
    .line 327
    :cond_d
    :goto_6
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    .line 328
    .line 329
    .line 330
    move-result v5

    .line 331
    if-eqz v5, :cond_e

    .line 332
    .line 333
    new-instance v5, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 336
    .line 337
    .line 338
    const-string v6, "Scale is NaN: starting dimensions=["

    .line 339
    .line 340
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    const-string p1, ", "

    .line 347
    .line 348
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    const-string p2, "], current dimensions=["

    .line 355
    .line 356
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string p1, "]"

    .line 369
    .line 370
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p1

    .line 377
    invoke-static {v3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    .line 379
    .line 380
    :cond_e
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    .line 381
    .line 382
    .line 383
    move-result p1

    .line 384
    if-nez p1, :cond_10

    .line 385
    .line 386
    invoke-static {v1}, Ljava/lang/Float;->isInfinite(F)Z

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    if-eqz p1, :cond_f

    .line 391
    .line 392
    goto :goto_7

    .line 393
    :cond_f
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 394
    .line 395
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 396
    .line 397
    .line 398
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 399
    .line 400
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 401
    .line 402
    .line 403
    goto :goto_8

    .line 404
    :cond_10
    :goto_7
    const-string p1, "scale is invalid"

    .line 405
    .line 406
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    .line 408
    .line 409
    :goto_8
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 410
    .line 411
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 412
    .line 413
    .line 414
    move-result p2

    .line 415
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 416
    .line 417
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    int-to-float v0, v0

    .line 422
    sub-float/2addr p2, v0

    .line 423
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 424
    .line 425
    .line 426
    iget-object p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetTaskView:Lcom/android/quickstep/views/TaskView;

    .line 427
    .line 428
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    .line 429
    .line 430
    .line 431
    move-result p2

    .line 432
    iget-object p0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mThumbnailStartBounds:Landroid/graphics/Rect;

    .line 433
    .line 434
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 435
    .line 436
    .line 437
    move-result p0

    .line 438
    int-to-float p0, p0

    .line 439
    sub-float/2addr p2, p0

    .line 440
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 441
    .line 442
    .line 443
    :cond_11
    :goto_9
    return-void
.end method

.method public setInitPara(Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mHomeToWindowPositionMap:Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-virtual {v1, v0, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/graphics/RectF;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->getWindowTargetRect()Landroid/graphics/RectF;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mAnimationFactory:Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mTargetWorkspaceView:Landroid/view/View;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/anim/C;->P(Landroid/view/View;Z)F

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mEndRadisuRatio:F

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-boolean v1, v1, Lu2/e;->m:Z

    .line 68
    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lu2/e;->f()F

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadius:F

    .line 80
    .line 81
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 82
    .line 83
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iget-object v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mTargetRect:Landroid/graphics/RectF;

    .line 88
    .line 89
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    div-float/2addr v0, v1

    .line 94
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mFinalTargetAspectRatio:F

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    div-float/2addr v0, p1

    .line 105
    iput v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartAspectRatio:F

    .line 106
    .line 107
    iget p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadius:F

    .line 108
    .line 109
    iget v1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mFinalTargetAspectRatio:F

    .line 110
    .line 111
    cmpg-float v0, v1, v0

    .line 112
    .line 113
    if-gez v0, :cond_1

    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRect:Landroid/graphics/Rect;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    int-to-float v0, v0

    .line 122
    goto :goto_0

    .line 123
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mCropRectF:Landroid/graphics/RectF;

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    :goto_0
    div-float/2addr p1, v0

    .line 130
    iput p1, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$SpringAnimationRunner;->mStartRadisuRatio:F

    .line 131
    .line 132
    return-void
.end method
