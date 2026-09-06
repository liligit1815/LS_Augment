.class public Lcom/android/quickstep/views/SplitInstructionsView;
.super Landroid/widget/LinearLayout;
.source "SplitInstructionsView.java"


# static fields
.field private static final BOUNCE_DURATION:I = 0xfa

.field private static final BOUNCE_HEIGHT:F = 20.0f

.field public static final TRANSLATE_Y:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/SplitInstructionsView;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNFOLD:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/SplitInstructionsView;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field public mIsCurrentlyAnimating:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/SplitInstructionsView$1;

    .line 2
    .line 3
    const-string v1, "SplitInstructionsUnfold"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/SplitInstructionsView$1;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/quickstep/views/SplitInstructionsView;->UNFOLD:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/views/SplitInstructionsView$2;

    .line 11
    .line 12
    const-string v1, "SplitInstructionsTranslateY"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/SplitInstructionsView$2;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/quickstep/views/SplitInstructionsView;->TRANSLATE_Y:Landroid/util/FloatProperty;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/views/SplitInstructionsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/quickstep/views/SplitInstructionsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 4
    iput-boolean p2, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mIsCurrentlyAnimating:Z

    .line 5
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object p1, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/SplitInstructionsView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/SplitInstructionsView;->lambda$init$0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/views/SplitInstructionsView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/SplitInstructionsView;->lambda$init$1(Landroid/widget/TextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private exitSplitSelection()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 18
    .line 19
    sget-object v2, Lcom/android/launcher3/logging/StatsLogManager$e;->p3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, p0, v2, v1}, Lcom/android/quickstep/util/AnimUtils;->goToNormalStateWithSplitDismissal(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$e;Lcom/android/quickstep/util/SplitAnimationController;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static getSplitInstructionsView(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/quickstep/views/SplitInstructionsView;
    .locals 3

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
    move-result-object p0

    .line 9
    const v1, 0x7f0e020b

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/quickstep/views/SplitInstructionsView;

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/android/quickstep/views/SplitInstructionsView;->init()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->forceHasOverlappingRendering(Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method private init()V
    .locals 3

    .line 1
    const v0, 0x7f0b057a

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/widget/TextView;

    .line 9
    .line 10
    const v1, 0x7f0b0579

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/TextView;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Lcom/android/quickstep/views/J1;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Lcom/android/quickstep/views/J1;-><init>(Lcom/android/quickstep/views/SplitInstructionsView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    const v2, 0x7f14045b

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    sget-object v2, Lcom/android/wm/shell/shared/o$b;->u:Lcom/android/wm/shell/shared/o$b;

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/android/wm/shell/shared/o;->a(Landroid/widget/TextView;Lcom/android/wm/shell/shared/o$b;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Lcom/android/quickstep/views/K1;

    .line 43
    .line 44
    invoke-direct {v2, p0, v0}, Lcom/android/quickstep/views/K1;-><init>(Lcom/android/quickstep/views/SplitInstructionsView;Landroid/widget/TextView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private synthetic lambda$init$0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/SplitInstructionsView;->exitSplitSelection()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$init$1(Landroid/widget/TextView;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070a69

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    new-instance v1, Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->getHitRect(Landroid/graphics/Rect;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v2, v0, :cond_0

    .line 25
    .line 26
    add-int/lit8 v2, v0, 0x1

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-int/2addr v2, v3

    .line 33
    div-int/lit8 v2, v2, 0x2

    .line 34
    .line 35
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    sub-int/2addr v3, v2

    .line 38
    iput v3, v1, Landroid/graphics/Rect;->left:I

    .line 39
    .line 40
    iget v3, v1, Landroid/graphics/Rect;->right:I

    .line 41
    .line 42
    add-int/2addr v3, v2

    .line 43
    iput v3, v1, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    :cond_0
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v2, v0, :cond_1

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    sub-int/2addr v0, v2

    .line 58
    div-int/lit8 v0, v0, 0x2

    .line 59
    .line 60
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 61
    .line 62
    sub-int/2addr v2, v0

    .line 63
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 64
    .line 65
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 66
    .line 67
    add-int/2addr v2, v0

    .line 68
    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 69
    .line 70
    :cond_1
    new-instance v0, Landroid/view/TouchDelegate;

    .line 71
    .line 72
    invoke-direct {v0, v1, p1}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setTouchDelegate(Landroid/view/TouchDelegate;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method


# virtual methods
.method ensureProperRotation()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-interface {v0, p0, v1, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setSplitInstructionsParams(Landroid/view/View;Lcom/android/launcher3/h0;II)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public goBoing()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/SplitInstructionsView;->mIsCurrentlyAnimating:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getTranslationY()F

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    const/high16 v0, 0x41a00000    # 20.0f

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/N5;->i(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    sub-float v5, v4, v0

    .line 18
    .line 19
    new-instance v1, Lcom/android/launcher3/anim/V;

    .line 20
    .line 21
    const-wide/16 v2, 0xfa

    .line 22
    .line 23
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 24
    .line 25
    .line 26
    sget-object v3, Lcom/android/quickstep/views/SplitInstructionsView;->TRANSLATE_Y:Landroid/util/FloatProperty;

    .line 27
    .line 28
    sget-object v6, LJ0/h;->k:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    move-object v2, p0

    .line 31
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/anim/V;->r(Ljava/lang/Object;Landroid/util/FloatProperty;FFLandroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Lcom/android/quickstep/views/SplitInstructionsView$3;

    .line 35
    .line 36
    invoke-direct {p0, v2, v4, v5}, Lcom/android/quickstep/views/SplitInstructionsView$3;-><init>(Lcom/android/quickstep/views/SplitInstructionsView;FF)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/views/SplitInstructionsView;->ensureProperRotation()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
