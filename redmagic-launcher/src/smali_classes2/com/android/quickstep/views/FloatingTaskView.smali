.class public Lcom/android/quickstep/views/FloatingTaskView;
.super Landroid/widget/FrameLayout;
.source "FloatingTaskView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;,
        Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;
    }
.end annotation


# static fields
.field public static final PRIMARY_TRANSLATE_OFFSCREEN:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/FloatingTaskView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private final mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

.field private final mIsRtl:Z

.field private mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

.field private mSplitHolderSize:I

.field private mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

.field private mStagePosition:I

.field private mStartingPosition:Landroid/graphics/RectF;

.field private mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

.field private final mTmpRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/FloatingTaskView$1;

    .line 2
    .line 3
    const-string v1, "floatingTaskPrimaryTranslateOffscreen"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/FloatingTaskView$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/views/FloatingTaskView;->PRIMARY_TRANSLATE_OFFSCREEN:Landroid/util/FloatProperty;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/FloatingTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/FloatingTaskView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mTmpRect:Landroid/graphics/Rect;

    .line 5
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p2}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mIsRtl:Z

    .line 7
    new-instance p2, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    invoke-direct {p2, p1}, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070a8e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitHolderSize:I

    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/views/FloatingTaskView;)Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getFloatingTaskView(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)Lcom/android/quickstep/views/FloatingTaskView;
    .locals 8

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x7f0e00d8

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    move-object v2, v1

    .line 18
    check-cast v2, Lcom/android/quickstep/views/FloatingTaskView;

    .line 19
    .line 20
    move-object v3, p0

    .line 21
    move-object v4, p1

    .line 22
    move-object v5, p2

    .line 23
    move-object v6, p3

    .line 24
    move-object v7, p4

    .line 25
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/views/FloatingTaskView;->init(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)V

    .line 26
    .line 27
    .line 28
    const/16 p0, 0x800

    .line 29
    .line 30
    invoke-static {v3, p0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const/4 p1, -0x1

    .line 39
    if-ne p0, p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    :cond_0
    invoke-virtual {v0, v2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    return-object v2
.end method

.method private init(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iput-object p5, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/android/quickstep/views/FloatingTaskView;->updateInitialPositionForView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/android/launcher3/h1$a;

    .line 11
    .line 12
    iget-object p5, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 13
    .line 14
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 15
    .line 16
    iget v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 17
    .line 18
    iget p2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 19
    .line 20
    invoke-direct {v0, v1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p5, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 34
    .line 35
    invoke-virtual {p2, p3}, Lcom/android/quickstep/views/FloatingTaskThumbnailView;->setThumbnail(Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 39
    .line 40
    const/4 p3, 0x0

    .line 41
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    iput-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStagePosition:I

    .line 65
    .line 66
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 67
    .line 68
    iget p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitHolderSize:I

    .line 69
    .line 70
    invoke-virtual {p1, p4, p2}, Lcom/android/quickstep/views/SplitPlaceholderView;->setIcon(Landroid/graphics/drawable/Drawable;I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 80
    .line 81
    invoke-interface {p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public addAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZLcom/android/quickstep/util/SplitAnimationTimings;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 2
    .line 3
    invoke-virtual {v0, p5}, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->setIsStagedTask(Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x2

    .line 13
    new-array v2, v1, [I

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 16
    .line 17
    .line 18
    move v0, p5

    .line 19
    move-object p5, p2

    .line 20
    new-instance p2, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    aget v3, v2, v3

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    aget v2, v2, v4

    .line 27
    .line 28
    invoke-direct {p2, p3, p5, v3, v2}, Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;-><init>(Landroid/graphics/Rect;Landroid/graphics/RectF;II)V

    .line 29
    .line 30
    .line 31
    const/4 p3, 0x0

    .line 32
    new-array v1, v1, [F

    .line 33
    .line 34
    fill-array-data v1, :array_0

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v1}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 42
    .line 43
    .line 44
    move v2, p4

    .line 45
    new-instance p4, Landroid/graphics/RectF;

    .line 46
    .line 47
    invoke-direct {p4}, Landroid/graphics/RectF;-><init>()V

    .line 48
    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 53
    .line 54
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 55
    .line 56
    invoke-interface {p6}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInStartOffset()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-interface {p6}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInEndOffset()F

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-static {v2, v3, v4}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p1, v0, p3, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1, p6}, Lcom/android/quickstep/views/FloatingTaskView;->fadeInSplitPlaceholder(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/util/SplitAnimationTimings;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    :goto_0
    move-object p1, p0

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    if-eqz v0, :cond_0

    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getAlpha()F

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    cmpl-float v0, v0, p3

    .line 85
    .line 86
    if-nez v0, :cond_0

    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0, p3}, Lcom/android/quickstep/views/IconView;->setContentAlpha(F)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, p1, p6}, Lcom/android/quickstep/views/FloatingTaskView;->fadeInSplitPlaceholder(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/util/SplitAnimationTimings;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :goto_1
    new-instance p0, Lcom/android/quickstep/views/FloatingTaskView$2;

    .line 102
    .line 103
    move-object p3, p6

    .line 104
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/views/FloatingTaskView$2;-><init>(Lcom/android/quickstep/views/FloatingTaskView;Lcom/android/quickstep/views/FloatingTaskView$SplitOverlayProperties;Lcom/android/quickstep/util/SplitAnimationTimings;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public addConfirmAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/quickstep/util/AnimUtils;->getDeviceSplitToConfirmTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p2

    .line 16
    move-object v4, p3

    .line 17
    move v5, p4

    .line 18
    move v6, p5

    .line 19
    invoke-virtual/range {v1 .. v7}, Lcom/android/quickstep/views/FloatingTaskView;->addAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZLcom/android/quickstep/util/SplitAnimationTimings;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public addStagingAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 14
    .line 15
    :goto_0
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v3, p2

    .line 18
    move-object v4, p3

    .line 19
    move v5, p4

    .line 20
    move v6, p5

    .line 21
    move-object v7, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    if-nez v0, :cond_1

    .line 24
    .line 25
    if-eqz p4, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->PHONE_OVERVIEW_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-virtual/range {v1 .. v7}, Lcom/android/quickstep/views/FloatingTaskView;->addAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZLcom/android/quickstep/util/SplitAnimationTimings;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method centerIconView(Lcom/android/quickstep/views/IconView;FF)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 4
    .line 5
    iget v4, v1, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleX:F

    .line 6
    .line 7
    iget v5, v1, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleY:F

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/views/IconView;->getDrawableWidth()I

    .line 10
    .line 11
    .line 12
    move-result v6

    .line 13
    invoke-virtual {p1}, Lcom/android/quickstep/views/IconView;->getDrawableHeight()I

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    iget v9, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStagePosition:I

    .line 24
    .line 25
    move-object v1, p1

    .line 26
    move v2, p2

    .line 27
    move v3, p3

    .line 28
    invoke-interface/range {v0 .. v9}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->updateSplitIconParams(Landroid/view/View;FFFFIILcom/android/launcher3/h0;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method drawRoundedRect(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v4, v0

    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v5, v0

    .line 16
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 17
    .line 18
    iget v0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mCurrentDrawnCornerRadius:F

    .line 19
    .line 20
    iget v1, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleX:F

    .line 21
    .line 22
    div-float v6, v0, v1

    .line 23
    .line 24
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->mScaleY:F

    .line 25
    .line 26
    div-float v7, v0, p0

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    move-object v1, p1

    .line 31
    move-object v8, p2

    .line 32
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method fadeInSplitPlaceholder(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/util/SplitAnimationTimings;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 2
    .line 3
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 4
    .line 5
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInStartOffset()F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderFadeInEndOffset()F

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-static {v1, v2, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p1, v0, v3, v2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderIconFadeInStartOffset()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-interface {p2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getPlaceholderIconFadeInEndOffset()F

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-static {v1, v0, p2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p1, p0, v3, p2}, Lcom/android/launcher3/anim/f;->c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public getStagePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStagePosition:I

    .line 2
    .line 3
    return p0
.end method

.method protected initPosition(Landroid/graphics/RectF;Lcom/android/launcher3/h1$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p2, Lcom/android/launcher3/h1$a;->a:Z

    .line 8
    .line 9
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 16
    .line 17
    iget-boolean v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mIsRtl:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v0, v0, Lcom/android/launcher3/h0;->T0:I

    .line 28
    .line 29
    iget v1, p1, Landroid/graphics/RectF;->right:F

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr v0, v1

    .line 36
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget v0, p1, Landroid/graphics/RectF;->left:F

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p2, v0}, Landroid/widget/FrameLayout$LayoutParams;->setMarginStart(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget p1, p1, Landroid/graphics/RectF;->left:F

    .line 50
    .line 51
    float-to-int p1, p1

    .line 52
    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    iget v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 55
    .line 56
    add-int/2addr v1, p1

    .line 57
    iget p2, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 58
    .line 59
    add-int/2addr p2, v0

    .line 60
    invoke-virtual {p0, p1, v0, v1, p2}, Landroid/widget/FrameLayout;->layout(IIII)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0603

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 14
    .line 15
    const v0, 0x7f0b057b

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitHolderSize:I

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/android/quickstep/views/SplitPlaceholderView;->setIcon(Landroid/graphics/drawable/Drawable;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public update(Landroid/graphics/RectF;F)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    iget v1, p1, Landroid/graphics/RectF;->left:F

    .line 8
    .line 9
    iget-object v2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 10
    .line 11
    iget v2, v2, Landroid/graphics/RectF;->left:F

    .line 12
    .line 13
    sub-float/2addr v1, v2

    .line 14
    iget v2, p1, Landroid/graphics/RectF;->top:F

    .line 15
    .line 16
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 17
    .line 18
    int-to-float v3, v3

    .line 19
    sub-float/2addr v2, v3

    .line 20
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 25
    .line 26
    int-to-float v4, v4

    .line 27
    div-float/2addr v3, v4

    .line 28
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    div-float/2addr v4, v0

    .line 36
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mFullscreenParams:Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;

    .line 37
    .line 38
    invoke-virtual {v0, p1, p2, v3, v4}, Lcom/android/quickstep/views/FloatingTaskView$FullscreenDrawParams;->updateParams(Landroid/graphics/RectF;FFF)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setTranslationX(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->setTranslationY(F)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->setScaleX(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v4}, Landroid/widget/FrameLayout;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->invalidate()V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mThumbnailView:Lcom/android/quickstep/views/FloatingTaskThumbnailView;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 61
    .line 62
    .line 63
    const/high16 p1, 0x3f800000    # 1.0f

    .line 64
    .line 65
    div-float p2, p1, v3

    .line 66
    .line 67
    div-float/2addr p1, v4

    .line 68
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v0, v1, p2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setPrimaryScale(Landroid/view/View;F)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-interface {p2, p0, p1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setSecondaryScale(Landroid/view/View;F)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public updateInitialPositionForView(Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mTmpRect:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mTmpRect:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 23
    .line 24
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLocationOnScreen()[I

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 33
    .line 34
    aget v1, p1, v1

    .line 35
    .line 36
    neg-int v1, v1

    .line 37
    int-to-float v1, v1

    .line 38
    const/4 v2, 0x1

    .line 39
    aget p1, p1, v2

    .line 40
    .line 41
    neg-int p1, p1

    .line 42
    int-to-float p1, p1

    .line 43
    invoke-virtual {v0, v1, p1}, Landroid/graphics/RectF;->offset(FF)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance v4, Landroid/graphics/Rect;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-direct {v4, v1, v1, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 61
    .line 62
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const/4 v6, 0x0

    .line 67
    iget-object v7, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    move-object v3, p1

    .line 71
    invoke-static/range {v2 .. v7}, Lcom/android/launcher3/N5;->l(Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/View;Landroid/graphics/Rect;Z[FLandroid/graphics/RectF;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    const/high16 v1, 0x3f800000    # 1.0f

    .line 86
    .line 87
    invoke-virtual {p1, v0, v0, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 88
    .line 89
    .line 90
    :cond_1
    new-instance p1, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;

    .line 91
    .line 92
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iget-object v1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 103
    .line 104
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-direct {p1, v0, v1}, Lcom/android/launcher3/views/BaseDragLayer$LayoutParams;-><init>(II)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mStartingPosition:Landroid/graphics/RectF;

    .line 116
    .line 117
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/views/FloatingTaskView;->initPosition(Landroid/graphics/RectF;Lcom/android/launcher3/h1$a;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public updateOrientationHandler(Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/android/quickstep/views/FloatingTaskView;->mSplitPlaceholderView:Lcom/android/quickstep/views/SplitPlaceholderView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/quickstep/views/SplitPlaceholderView;->getIconView()Lcom/android/quickstep/views/IconView;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Lcom/android/quickstep/views/FloatingTaskView;->mOrientationHandler:Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDegreesRotated()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setRotation(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
