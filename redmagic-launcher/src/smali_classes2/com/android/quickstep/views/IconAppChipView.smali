.class public final Lcom/android/quickstep/views/IconAppChipView;
.super Landroid/widget/FrameLayout;
.source "IconAppChipView.kt"

# interfaces
.implements Lcom/android/quickstep/views/TaskViewIcon;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;,
        Lcom/android/quickstep/views/IconAppChipView$Companion;
    }
.end annotation


# static fields
.field private static final Companion:Lcom/android/quickstep/views/IconAppChipView$Companion;

.field private static final INDEX_COLOR_FILTER_ALPHA:I = 0x1

.field private static final INDEX_CONTENT_ALPHA:I = 0x0

.field private static final INDEX_COUNT_TRANSLATION:I = 0x2

.field private static final INDEX_MENU_TRANSLATION:I = 0x1

.field private static final INDEX_MINIMUM_RATIO_ALPHA:I = 0x3

.field private static final INDEX_MODAL_ALPHA:I = 0x2

.field private static final INDEX_SPLIT_TRANSLATION:I = 0x0

.field private static final MENU_BACKGROUND_HIDE_DURATION:I = 0x14d

.field private static final MENU_BACKGROUND_REVEAL_DURATION:I = 0x1a1

.field private static final NUM_ALPHA_CHANNELS:I = 0x4

.field private static final SUM_AGGREGATOR:Lcom/android/launcher3/util/v1$b;


# instance fields
.field private animator:Landroid/animation/AnimatorSet;

.field private final appIconSize:I

.field private final appNameHorizontalMargin:I

.field private final arrowMarginEnd:I

.field private final arrowSize:I

.field private final backgroundAnimationRectEvaluator:Landroid/animation/RectEvaluator;

.field private final backgroundMarginTopStart:I

.field private final backgroundRelativeLtrLocation:Landroid/graphics/Rect;

.field private final collapsedMenuDefaultHeight:I

.field private final collapsedMenuDefaultWidth:I

.field private final expandedMenuDefaultHeight:I

.field private final expandedMenuDefaultWidth:I

.field private iconArrowView:Landroid/widget/ImageView;

.field private final iconMenuMarginTopStart:I

.field private iconTextCollapsedView:Landroid/widget/TextView;

.field private iconTextExpandedView:Landroid/widget/TextView;

.field private iconView:Lcom/android/quickstep/views/IconView;

.field private final iconViewDrawableExpandedSize:I

.field private final iconViewMarginStart:I

.field private maxWidth:I

.field private menuAnchorView:Landroid/view/View;

.field private final menuToChipGap:I

.field private final multiValueAlpha:Lcom/android/launcher3/util/B1;

.field private status:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

.field private final viewTranslationX:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final viewTranslationY:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/IconAppChipView$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/IconAppChipView$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView;->Companion:Lcom/android/quickstep/views/IconAppChipView$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/views/p;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/quickstep/views/p;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/views/IconAppChipView;->SUM_AGGREGATOR:Lcom/android/launcher3/util/v1$b;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xe

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/IconAppChipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/IconAppChipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

    .line 3
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/IconAppChipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 6
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundRelativeLtrLocation:Landroid/graphics/Rect;

    .line 7
    new-instance p2, Landroid/animation/RectEvaluator;

    invoke-direct {p2, p1}, Landroid/animation/RectEvaluator;-><init>(Landroid/graphics/Rect;)V

    iput-object p2, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundAnimationRectEvaluator:Landroid/animation/RectEvaluator;

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b47

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->collapsedMenuDefaultWidth:I

    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b4d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultWidth:I

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b46

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->collapsedMenuDefaultHeight:I

    .line 11
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b4b

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultHeight:I

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b4c

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconMenuMarginTopStart:I

    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b4a

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->menuToChipGap:I

    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b45

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundMarginTopStart:I

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b42

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->appNameHorizontalMargin:I

    .line 16
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b43

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowMarginEnd:I

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b56

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconViewMarginStart:I

    .line 18
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b40

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b44

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowSize:I

    .line 20
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070b41

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconViewDrawableExpandedSize:I

    .line 21
    new-instance p1, Lcom/android/launcher3/util/B1;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 22
    new-instance p1, Lcom/android/launcher3/util/v1;

    sget-object p2, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    sget-object p3, Lcom/android/quickstep/views/IconAppChipView;->SUM_AGGREGATOR:Lcom/android/launcher3/util/v1$b;

    const/4 p4, 0x2

    invoke-direct {p1, p0, p2, p4, p3}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationX:Lcom/android/launcher3/util/v1;

    .line 23
    new-instance p1, Lcom/android/launcher3/util/v1;

    sget-object p2, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    invoke-direct {p1, p0, p2, p4, p3}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationY:Lcom/android/launcher3/util/v1;

    const p1, 0x7fffffff

    .line 24
    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->maxWidth:I

    .line 25
    sget-object p1, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Collapsed:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    iput-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->status:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 4
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/IconAppChipView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private static final SUM_AGGREGATOR$lambda$3(FF)F
    .locals 0

    .line 1
    add-float/2addr p0, p1

    .line 2
    return p0
.end method

.method public static synthetic a(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/IconAppChipView;->revealAnim$lambda$2(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getBackgroundRelativeLtrLocation$p(Lcom/android/quickstep/views/IconAppChipView;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundRelativeLtrLocation:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/IconAppChipView;->revealAnim$lambda$1(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(FF)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/IconAppChipView;->SUM_AGGREGATOR$lambda$3(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final cancelInProgressAnimations()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private final getCollapsedBackgroundLtrBounds()Landroid/graphics/Rect;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->maxWidth:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/views/IconAppChipView;->collapsedMenuDefaultWidth:I

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Lcom/android/quickstep/views/IconAppChipView;->collapsedMenuDefaultHeight:I

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 15
    .line 16
    .line 17
    iget p0, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundMarginTopStart:I

    .line 18
    .line 19
    invoke-virtual {v0, p0, p0}, Landroid/graphics/Rect;->offset(II)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method private final getExpandedBackgroundLtrBounds()Landroid/graphics/Rect;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultWidth:I

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultHeight:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v2, v2, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic revealAnim$Launcher_aospWithQuickstepInternalMiFavorRelease$default(Lcom/android/quickstep/views/IconAppChipView;ZZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/IconAppChipView;->revealAnim$Launcher_aospWithQuickstepInternalMiFavorRelease(ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final revealAnim$lambda$1(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final revealAnim$lambda$2(Lcom/android/quickstep/views/IconAppChipView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidateOutline()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public asView()Landroid/view/View;
    .locals 0

    .line 1
    return-object p0
.end method

.method public focusSearch(I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Landroid/widget/FrameLayout;->mParent:Landroid/view/ViewParent;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    const/16 v1, 0x11

    .line 8
    .line 9
    if-eq p1, v1, :cond_2

    .line 10
    .line 11
    const/16 v1, 0x21

    .line 12
    .line 13
    if-eq p1, v1, :cond_2

    .line 14
    .line 15
    const/16 v1, 0x42

    .line 16
    .line 17
    if-eq p1, v1, :cond_1

    .line 18
    .line 19
    const/16 v1, 0x82

    .line 20
    .line 21
    if-eq p1, v1, :cond_1

    .line 22
    .line 23
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->focusSearch(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    const/4 p1, 0x2

    .line 29
    invoke-interface {v0, p0, p1}, Landroid/view/ViewParent;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_2
    const/4 p1, 0x1

    .line 35
    invoke-interface {v0, p0, p1}, Landroid/view/ViewParent;->focusSearch(Landroid/view/View;I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getDrawableHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconView;->getDrawableHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getDrawableWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconView;->getDrawableWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final getMaxWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/IconAppChipView;->maxWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public final getMenuTranslationX()Lcom/android/launcher3/util/v1$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationX:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "get(...)"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final getMenuTranslationY()Lcom/android/launcher3/util/v1$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationY:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "get(...)"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final getSplitTranslationX()Lcom/android/launcher3/util/v1$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationX:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "get(...)"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final getSplitTranslationY()Lcom/android/launcher3/util/v1$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">.c;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->viewTranslationY:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "get(...)"

    .line 9
    .line 10
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final getStatus()Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->status:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0313

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/quickstep/views/IconView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 14
    .line 15
    const v0, 0x7f0b0310

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/TextView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 25
    .line 26
    const v0, 0x7f0b0311

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 36
    .line 37
    const v0, 0x7f0b0304

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/ImageView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    .line 47
    .line 48
    const v0, 0x7f0b0314

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->menuAnchorView:Landroid/view/View;

    .line 56
    .line 57
    return-void
.end method

.method public final reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/IconAppChipView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/IconAppChipView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final revealAnim$Launcher_aospWithQuickstepInternalMiFavorRelease(ZZ)V
    .locals 27

    move-object/from16 v0, p0

    const/4 v8, 0x1

    .line 1
    invoke-direct {v0}, Lcom/android/quickstep/views/IconAppChipView;->cancelInProgressAnimations()V

    .line 2
    invoke-direct {v0}, Lcom/android/quickstep/views/IconAppChipView;->getCollapsedBackgroundLtrBounds()Landroid/graphics/Rect;

    move-result-object v9

    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/views/IconAppChipView;->getExpandedBackgroundLtrBounds()Landroid/graphics/Rect;

    move-result-object v10

    .line 4
    new-instance v11, Landroid/graphics/Rect;

    iget-object v12, v0, Lcom/android/quickstep/views/IconAppChipView;->backgroundRelativeLtrLocation:Landroid/graphics/Rect;

    invoke-direct {v11, v12}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 5
    new-instance v12, Landroid/animation/AnimatorSet;

    invoke-direct {v12}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v12, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    const/4 v12, 0x2

    const/4 v13, 0x0

    if-eqz p1, :cond_2

    .line 6
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    move-result v16

    .line 7
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->bringToFront()V

    const/16 v17, 0x8

    .line 8
    iget-object v2, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 9
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/widget/TextView;->getHeight()I

    move-result v18

    const/16 v19, 0x7

    div-int/lit8 v3, v18, 0x2

    const/16 v18, 0x6

    .line 10
    iget-object v4, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroid/widget/TextView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/16 v20, 0x5

    .line 11
    iget-object v5, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    invoke-static {v5}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v5}, Landroid/widget/TextView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    .line 12
    invoke-static {v2, v13, v3, v4, v5}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v2

    .line 13
    iget-object v3, v0, Lcom/android/quickstep/views/IconAppChipView;->backgroundAnimationRectEvaluator:Landroid/animation/RectEvaluator;

    .line 14
    filled-new-array {v11, v10}, [Ljava/lang/Object;

    move-result-object v4

    .line 15
    invoke-static {v3, v4}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v3

    .line 16
    new-instance v4, Lcom/android/quickstep/views/q;

    invoke-direct {v4, v0}, Lcom/android/quickstep/views/q;-><init>(Lcom/android/quickstep/views/IconAppChipView;)V

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    iget v4, v0, Lcom/android/quickstep/views/IconAppChipView;->iconViewDrawableExpandedSize:I

    int-to-float v5, v4

    iget v11, v0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    const/16 v21, 0x4

    int-to-float v6, v11

    div-float/2addr v5, v6

    .line 18
    iget v6, v10, Landroid/graphics/Rect;->right:I

    iget v9, v9, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v9

    int-to-float v6, v6

    int-to-float v9, v11

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    .line 19
    iget v11, v0, Lcom/android/quickstep/views/IconAppChipView;->appNameHorizontalMargin:I

    const/16 v22, 0x3

    int-to-float v7, v11

    add-float/2addr v9, v7

    int-to-float v4, v4

    div-float/2addr v4, v10

    int-to-float v7, v11

    add-float/2addr v4, v7

    sub-float/2addr v4, v9

    if-eqz v16, :cond_0

    neg-float v4, v4

    :cond_0
    if-eqz v16, :cond_1

    neg-float v6, v6

    .line 20
    :cond_1
    iget-object v7, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v7}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 21
    iget-object v9, v0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    sget-object v10, Landroid/widget/FrameLayout;->SCALE_X:Landroid/util/Property;

    new-array v11, v8, [F

    aput v5, v11, v13

    invoke-static {v9, v10, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v9

    .line 22
    iget-object v10, v0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    sget-object v11, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    move/from16 v16, v12

    new-array v12, v8, [F

    aput v5, v12, v13

    invoke-static {v10, v11, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 23
    iget-object v10, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 24
    sget-object v12, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    const/high16 v23, 0x3f800000    # 1.0f

    .line 25
    new-array v14, v8, [F

    aput v4, v14, v13

    .line 26
    invoke-static {v10, v12, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 27
    iget-object v14, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    const/16 v24, 0x0

    .line 28
    new-array v15, v8, [F

    aput v4, v15, v13

    .line 29
    invoke-static {v14, v12, v15}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 30
    iget-object v14, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    sget-object v15, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    const/16 v25, 0x9

    new-array v1, v8, [F

    aput v24, v1, v13

    invoke-static {v14, v15, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 31
    iget-object v14, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    move/from16 v26, v13

    new-array v13, v8, [F

    aput v23, v13, v26

    invoke-static {v14, v15, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v13

    .line 32
    iget-object v14, v0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    new-array v15, v8, [F

    aput v6, v15, v26

    invoke-static {v14, v12, v15}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 33
    iget-object v12, v0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    new-array v14, v8, [F

    const/high16 v15, -0x40800000    # -1.0f

    aput v15, v14, v26

    invoke-static {v12, v11, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    const/16 v12, 0xa

    new-array v12, v12, [Landroid/animation/Animator;

    aput-object v2, v12, v26

    aput-object v3, v12, v8

    aput-object v9, v12, v16

    aput-object v5, v12, v22

    aput-object v10, v12, v21

    aput-object v4, v12, v20

    aput-object v1, v12, v18

    aput-object v13, v12, v19

    aput-object v6, v12, v17

    aput-object v11, v12, v25

    .line 34
    invoke-virtual {v7, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 35
    iget-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    const-wide/16 v2, 0x1a1

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 36
    sget-object v1, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Expanded:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    iput-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->status:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    goto/16 :goto_0

    :cond_2
    move/from16 v16, v12

    move/from16 v26, v13

    const/16 v17, 0x8

    const/16 v18, 0x6

    const/16 v19, 0x7

    const/16 v20, 0x5

    const/16 v21, 0x4

    const/16 v22, 0x3

    const/high16 v23, 0x3f800000    # 1.0f

    const/16 v24, 0x0

    const/16 v25, 0x9

    .line 37
    iget-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 38
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    .line 39
    iget-object v3, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    .line 40
    iget-object v4, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroid/widget/TextView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    move/from16 v5, v26

    .line 41
    invoke-static {v1, v5, v2, v3, v4}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v1

    .line 42
    iget-object v2, v0, Lcom/android/quickstep/views/IconAppChipView;->backgroundAnimationRectEvaluator:Landroid/animation/RectEvaluator;

    .line 43
    filled-new-array {v11, v9}, [Ljava/lang/Object;

    move-result-object v3

    .line 44
    invoke-static {v2, v3}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v2

    .line 45
    new-instance v3, Lcom/android/quickstep/views/r;

    invoke-direct {v3, v0}, Lcom/android/quickstep/views/r;-><init>(Lcom/android/quickstep/views/IconAppChipView;)V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 46
    iget-object v3, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 47
    iget-object v4, v0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    sget-object v5, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    new-array v6, v8, [F

    const/16 v26, 0x0

    aput v23, v6, v26

    invoke-static {v4, v5, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 48
    iget-object v5, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    sget-object v6, Landroid/widget/FrameLayout;->TRANSLATION_X:Landroid/util/Property;

    new-array v7, v8, [F

    aput v24, v7, v26

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v5

    .line 49
    iget-object v7, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    new-array v9, v8, [F

    aput v24, v9, v26

    invoke-static {v7, v6, v9}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v7

    .line 50
    iget-object v9, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    sget-object v10, Landroid/widget/FrameLayout;->ALPHA:Landroid/util/Property;

    new-array v11, v8, [F

    aput v23, v11, v26

    invoke-static {v9, v10, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v9

    .line 51
    iget-object v11, v0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    new-array v12, v8, [F

    aput v24, v12, v26

    invoke-static {v11, v10, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 52
    iget-object v11, v0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    new-array v12, v8, [F

    aput v24, v12, v26

    invoke-static {v11, v6, v12}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 53
    iget-object v11, v0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    sget-object v12, Landroid/widget/FrameLayout;->SCALE_Y:Landroid/util/Property;

    new-array v13, v8, [F

    aput v23, v13, v26

    invoke-static {v11, v12, v13}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v11

    move/from16 v12, v25

    new-array v12, v12, [Landroid/animation/Animator;

    aput-object v1, v12, v26

    aput-object v2, v12, v8

    aput-object v4, v12, v16

    aput-object v5, v12, v22

    aput-object v7, v12, v21

    aput-object v9, v12, v20

    aput-object v10, v12, v18

    aput-object v6, v12, v19

    aput-object v11, v12, v17

    .line 54
    invoke-virtual {v3, v12}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 55
    iget-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    const-wide/16 v2, 0x14d

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 56
    sget-object v1, Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;->Collapsed:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    iput-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->status:Lcom/android/quickstep/views/IconAppChipView$AppChipStatus;

    :goto_0
    if-nez p2, :cond_3

    .line 57
    iget-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 58
    :cond_3
    iget-object v1, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    sget-object v2, LJ0/h;->a:Landroid/view/animation/Interpolator;

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 59
    iget-object v0, v0, Lcom/android/quickstep/views/IconAppChipView;->animator:Landroid/animation/AnimatorSet;

    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public setContentAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/IconView;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setDrawableSize(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/IconView;->setDrawableSize(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFlexSplitAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setIconColorTint(IF)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    sget-object v5, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/high16 v2, 0x3f000000    # 0.5f

    .line 6
    .line 7
    const/high16 v3, 0x3f800000    # 1.0f

    .line 8
    .line 9
    move v0, p2

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setIconOrientation(Lcom/android/quickstep/util/RecentsOrientedState;Z)V
    .locals 7

    .line 1
    const-string p2, "orientationState"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/quickstep/util/RecentsOrientedState;->getOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p2, p0, Lcom/android/quickstep/views/IconAppChipView;->menuAnchorView:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams"

    .line 20
    .line 21
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultHeight:I

    .line 27
    .line 28
    iget v2, p0, Lcom/android/quickstep/views/IconAppChipView;->menuToChipGap:I

    .line 29
    .line 30
    add-int/2addr v1, v2

    .line 31
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->menuAnchorView:Landroid/view/View;

    .line 34
    .line 35
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 49
    .line 50
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultWidth:I

    .line 51
    .line 52
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 53
    .line 54
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->expandedMenuDefaultHeight:I

    .line 55
    .line 56
    iput v1, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 57
    .line 58
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconMenuMarginTopStart:I

    .line 59
    .line 60
    invoke-interface {p1, p0, p2, v1, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setIconAppChipMenuParams(Lcom/android/quickstep/views/IconAppChipView;Landroid/widget/FrameLayout$LayoutParams;II)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/quickstep/views/IconAppChipView;->getCollapsedBackgroundLtrBounds()Landroid/graphics/Rect;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundRelativeLtrLocation:Landroid/graphics/Rect;

    .line 71
    .line 72
    invoke-virtual {v1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/IconAppChipView$setIconOrientation$1;-><init>(Lcom/android/quickstep/views/IconAppChipView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 84
    .line 85
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 96
    .line 97
    iget v2, p0, Lcom/android/quickstep/views/IconAppChipView;->iconViewMarginStart:I

    .line 98
    .line 99
    iget v3, p0, Lcom/android/quickstep/views/IconAppChipView;->backgroundMarginTopStart:I

    .line 100
    .line 101
    add-int/2addr v2, v3

    .line 102
    invoke-interface {p1, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 106
    .line 107
    invoke-static {v3}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconView:Lcom/android/quickstep/views/IconView;

    .line 114
    .line 115
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    iget v3, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 119
    .line 120
    invoke-virtual {v1, v3, v3}, Lcom/android/quickstep/views/IconView;->setDrawableSize(II)V

    .line 121
    .line 122
    .line 123
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 124
    .line 125
    add-int/2addr v2, v1

    .line 126
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->appNameHorizontalMargin:I

    .line 127
    .line 128
    add-int/2addr v2, v1

    .line 129
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 130
    .line 131
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 142
    .line 143
    invoke-interface {p1, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->iconViewMarginStart:I

    .line 151
    .line 152
    sub-int/2addr v3, v4

    .line 153
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 154
    .line 155
    sub-int/2addr v3, v4

    .line 156
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowSize:I

    .line 157
    .line 158
    sub-int/2addr v3, v4

    .line 159
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->appNameHorizontalMargin:I

    .line 160
    .line 161
    sub-int/2addr v3, v4

    .line 162
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowMarginEnd:I

    .line 163
    .line 164
    sub-int/2addr v3, v4

    .line 165
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 166
    .line 167
    iget-object v4, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-static {v4}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 176
    .line 177
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    const/high16 v4, 0x3f800000    # 1.0f

    .line 181
    .line 182
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setAlpha(F)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 186
    .line 187
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 198
    .line 199
    invoke-interface {p1, v1, v2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V

    .line 200
    .line 201
    .line 202
    iget-object v2, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 203
    .line 204
    invoke-static {v2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 211
    .line 212
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    const/4 v2, 0x0

    .line 216
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setAlpha(F)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    iget v4, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 225
    .line 226
    int-to-float v4, v4

    .line 227
    const/high16 v5, 0x40000000    # 2.0f

    .line 228
    .line 229
    div-float/2addr v4, v5

    .line 230
    int-to-float v3, v3

    .line 231
    const/4 v6, 0x1

    .line 232
    invoke-virtual {v1, v6, v2, v4, v3}, Landroid/widget/TextView;->setRevealClip(ZFFF)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    .line 236
    .line 237
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 248
    .line 249
    iget p2, p2, Landroid/graphics/Rect;->right:I

    .line 250
    .line 251
    iget v0, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowMarginEnd:I

    .line 252
    .line 253
    sub-int/2addr p2, v0

    .line 254
    iget v0, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowSize:I

    .line 255
    .line 256
    sub-int/2addr p2, v0

    .line 257
    invoke-interface {p1, v1, p2}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->setIconAppChipChildrenParams(Landroid/widget/FrameLayout$LayoutParams;I)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    .line 261
    .line 262
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    iget p2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 266
    .line 267
    int-to-float p2, p2

    .line 268
    div-float/2addr p2, v5

    .line 269
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setPivotY(F)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Lcom/android/quickstep/views/IconAppChipView;->iconArrowView:Landroid/widget/ImageView;

    .line 273
    .line 274
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 275
    .line 276
    .line 277
    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 285
    .line 286
    const/high16 p2, 0x40000000    # 2.0f

    .line 287
    .line 288
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 297
    .line 298
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->measure(II)V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public final setMaxWidth(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconViewMarginStart:I

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->appIconSize:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowSize:I

    .line 7
    .line 8
    add-int/2addr v0, v1

    .line 9
    iget v1, p0, Lcom/android/quickstep/views/IconAppChipView;->arrowMarginEnd:I

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/android/quickstep/views/IconAppChipView;->maxWidth:I

    .line 17
    .line 18
    return-void
.end method

.method public setModalAlpha(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->multiValueAlpha:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setSplitTranslationX(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconAppChipView;->getSplitTranslationX()Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final setSplitTranslationY(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/views/IconAppChipView;->getSplitTranslationY()Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextCollapsedView:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/views/IconAppChipView;->iconTextExpandedView:Landroid/widget/TextView;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
