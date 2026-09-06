.class public final Lcom/android/quickstep/views/ClearAllButton;
.super Landroid/widget/Button;
.source "ClearAllButton.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/ClearAllButton$Companion;
    }
.end annotation


# static fields
.field static final synthetic $$delegatedProperties:[LB4/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "LB4/i<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final Companion:Lcom/android/quickstep/views/ClearAllButton$Companion;

.field public static final DISMISS_ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/ClearAllButton;",
            ">;"
        }
    .end annotation
.end field

.field public static final VISIBILITY_ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/ClearAllButton;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private borderEnabled:Z

.field private final clearAllButtonAlpha:Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;

.field private final contentAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private final dismissAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private final focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

.field private fullscreenProgress:F

.field private fullscreenTranslationPrimary:F

.field private gridProgress:F

.field private gridScrollOffset:F

.field private gridTranslationPrimary:F

.field private normalTranslationPrimary:F

.field private final scrollAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private scrollOffsetPrimary:F

.field private sidePadding:I

.field private taskAlignmentTranslationY:F

.field private final visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lkotlin/jvm/internal/r;

    .line 2
    .line 3
    const-class v1, Lcom/android/quickstep/views/ClearAllButton;

    .line 4
    .line 5
    const-string v2, "scrollAlpha"

    .line 6
    .line 7
    const-string v3, "getScrollAlpha()F"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v1, v2, v3, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Lkotlin/jvm/internal/r;

    .line 18
    .line 19
    const-string v3, "contentAlpha"

    .line 20
    .line 21
    const-string v5, "getContentAlpha()F"

    .line 22
    .line 23
    invoke-direct {v2, v1, v3, v5, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Lkotlin/jvm/internal/r;

    .line 31
    .line 32
    const-string v5, "visibilityAlpha"

    .line 33
    .line 34
    const-string v6, "getVisibilityAlpha()F"

    .line 35
    .line 36
    invoke-direct {v3, v1, v5, v6, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {v3}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    new-instance v5, Lkotlin/jvm/internal/r;

    .line 44
    .line 45
    const-string v6, "dismissAlpha"

    .line 46
    .line 47
    const-string v7, "getDismissAlpha()F"

    .line 48
    .line 49
    invoke-direct {v5, v1, v6, v7, v4}, Lkotlin/jvm/internal/r;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v5}, Lkotlin/jvm/internal/D;->d(Lkotlin/jvm/internal/q;)LB4/h;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v5, 0x4

    .line 57
    new-array v5, v5, [LB4/i;

    .line 58
    .line 59
    aput-object v0, v5, v4

    .line 60
    .line 61
    const/4 v0, 0x1

    .line 62
    aput-object v2, v5, v0

    .line 63
    .line 64
    const/4 v0, 0x2

    .line 65
    aput-object v3, v5, v0

    .line 66
    .line 67
    const/4 v0, 0x3

    .line 68
    aput-object v1, v5, v0

    .line 69
    .line 70
    sput-object v5, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 71
    .line 72
    new-instance v0, Lcom/android/quickstep/views/ClearAllButton$Companion;

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/ClearAllButton$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 76
    .line 77
    .line 78
    sput-object v0, Lcom/android/quickstep/views/ClearAllButton;->Companion:Lcom/android/quickstep/views/ClearAllButton$Companion;

    .line 79
    .line 80
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 81
    .line 82
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton$Companion$VISIBILITY_ALPHA$1;->INSTANCE:Lcom/android/quickstep/views/ClearAllButton$Companion$VISIBILITY_ALPHA$1;

    .line 83
    .line 84
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 85
    .line 86
    .line 87
    sput-object v0, Lcom/android/quickstep/views/ClearAllButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 88
    .line 89
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 90
    .line 91
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton$Companion$DISMISS_ALPHA$1;->INSTANCE:Lcom/android/quickstep/views/ClearAllButton$Companion$DISMISS_ALPHA$1;

    .line 92
    .line 93
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 94
    .line 95
    .line 96
    sput-object v0, Lcom/android/quickstep/views/ClearAllButton;->DISMISS_ALPHA:Landroid/util/FloatProperty;

    .line 97
    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/ClearAllButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 13

    const-string v1, "context"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct/range {p0 .. p2}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    invoke-static {}, Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;->getEntries()Ln4/a;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-instance v2, Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;

    invoke-direct {v2, p0, v1}, Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;-><init>(Lcom/android/quickstep/views/ClearAllButton;I)V

    iput-object v2, p0, Lcom/android/quickstep/views/ClearAllButton;->clearAllButtonAlpha:Lcom/android/quickstep/views/ClearAllButton$clearAllButtonAlpha$1;

    .line 5
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;->SCROLL:Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;

    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 6
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;->CONTENT:Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;

    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, p0, Lcom/android/quickstep/views/ClearAllButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 7
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;->VISIBILITY:Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;

    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, p0, Lcom/android/quickstep/views/ClearAllButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 8
    new-instance v1, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;->DISMISS:Lcom/android/quickstep/views/ClearAllButton$Companion$Alpha;

    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v1, p0, Lcom/android/quickstep/views/ClearAllButton;->dismissAlpha$delegate:Lcom/android/launcher3/util/u1;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 9
    iput v1, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenProgress:F

    .line 10
    iput v1, p0, Lcom/android/quickstep/views/ClearAllButton;->gridProgress:F

    .line 11
    invoke-static {}, Lcom/android/launcher3/y0;->t()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 12
    sget-object v1, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070a28

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 14
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0704eb

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    move-object v5, v1

    move v1, v2

    move v2, v3

    .line 15
    new-instance v3, Lcom/android/quickstep/views/ClearAllButton$focusBorderAnimator$1;

    invoke-direct {v3, p0}, Lcom/android/quickstep/views/ClearAllButton$focusBorderAnimator$1;-><init>(Ljava/lang/Object;)V

    .line 16
    sget-object v6, Lcom/android/launcher3/x5;->Y:[I

    move-object v7, p2

    invoke-virtual {p1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v6, 0x0

    const/4 v7, -0x1

    .line 17
    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    const/16 v11, 0xe0

    const/4 v12, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    move-object v4, v5

    move v5, v0

    move-object v0, v4

    move-object v4, p0

    .line 18
    invoke-static/range {v0 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    iput-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/ClearAllButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static final synthetic access$getBorderBounds(Lcom/android/quickstep/views/ClearAllButton;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/ClearAllButton;->getBorderBounds(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final applyPrimaryTranslation()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryViewTranslate()Landroid/util/FloatProperty;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    iget v3, p0, Lcom/android/quickstep/views/ClearAllButton;->taskAlignmentTranslationY:F

    .line 18
    .line 19
    invoke-interface {v0, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(FF)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget v2, p0, Lcom/android/quickstep/views/ClearAllButton;->normalTranslationPrimary:F

    .line 24
    .line 25
    add-float/2addr v0, v2

    .line 26
    iget v2, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenTranslationPrimary:F

    .line 27
    .line 28
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/ClearAllButton;->getFullscreenTrans(F)F

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-float/2addr v0, v2

    .line 33
    iget v2, p0, Lcom/android/quickstep/views/ClearAllButton;->gridTranslationPrimary:F

    .line 34
    .line 35
    invoke-direct {p0, v2}, Lcom/android/quickstep/views/ClearAllButton;->getGridTrans(F)F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-float/2addr v0, v2

    .line 40
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, p0, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private final applySecondaryTranslation()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryViewTranslate()Landroid/util/FloatProperty;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    iget v3, p0, Lcom/android/quickstep/views/ClearAllButton;->taskAlignmentTranslationY:F

    .line 18
    .line 19
    invoke-interface {v0, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSecondaryValue(FF)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v1, p0, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private final getBorderBounds(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/Button;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const v0, 0x7f070a27

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    neg-int p0, p0

    .line 29
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private final getFullscreenTrans(F)F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenProgress:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float p0, p0, v0

    .line 5
    .line 6
    if-lez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    return v0
.end method

.method private final getGridTrans(F)F
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridProgress:F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    cmpl-float p0, p0, v0

    .line 5
    .line 6
    if-lez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    return v0
.end method

.method private final getRecentsView()Lcom/android/quickstep/views/RecentsView;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    const-string v0, "canvas"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/BorderAnimator;->drawBorder(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/Button;->draw(Landroid/graphics/Canvas;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final getBorderEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/ClearAllButton;->borderEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getContentAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getDismissAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->dismissAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getFullscreenProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getFullscreenTranslationPrimary()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenTranslationPrimary:F

    .line 2
    .line 3
    return p0
.end method

.method public final getGridProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getGridScrollOffset()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridScrollOffset:F

    .line 2
    .line 3
    return p0
.end method

.method public final getGridTranslationPrimary()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridTranslationPrimary:F

    .line 2
    .line 3
    return p0
.end method

.method public final getOffsetAdjustment(ZZ)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/ClearAllButton;->getScrollAdjustment(ZZ)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final getScrollAdjustment(ZZ)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget p1, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenTranslationPrimary:F

    .line 5
    .line 6
    add-float/2addr v0, p1

    .line 7
    :cond_0
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iget p1, p0, Lcom/android/quickstep/views/ClearAllButton;->gridTranslationPrimary:F

    .line 10
    .line 11
    iget p2, p0, Lcom/android/quickstep/views/ClearAllButton;->gridScrollOffset:F

    .line 12
    .line 13
    add-float/2addr p1, p2

    .line 14
    add-float/2addr v0, p1

    .line 15
    :cond_1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollOffsetPrimary:F

    .line 16
    .line 17
    add-float/2addr v0, p0

    .line 18
    return v0
.end method

.method public final getScrollAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final getScrollOffsetPrimary()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollOffsetPrimary:F

    .line 2
    .line 3
    return p0
.end method

.method public final getTaskAlignmentTranslationY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/ClearAllButton;->taskAlignmentTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public final getVisibilityAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Lcom/android/launcher3/util/u1;->a(Ljava/lang/Object;LB4/i;)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/Button;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/android/quickstep/views/ClearAllButton;->borderEnabled:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/ClearAllButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/Button;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/Button;->isLayoutRtl()Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    invoke-interface {p2, p1, p3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getClearAllSidePadding(Landroid/view/View;Z)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p1, 0x0

    .line 30
    :goto_0
    if-eqz p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    const/4 p1, 0x0

    .line 38
    :goto_1
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->sidePadding:I

    .line 39
    .line 40
    return-void
.end method

.method public final onRecentsViewScroll(IZ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0}, Landroid/widget/Button;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0}, Landroid/widget/Button;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-interface {v1, v2, v3}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getPrimaryValue(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-float v1, v1

    .line 25
    const/4 v2, 0x0

    .line 26
    cmpg-float v3, v1, v2

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getClearAllScroll()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    sub-int v4, p1, v3

    .line 36
    .line 37
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    int-to-float v4, v4

    .line 42
    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0}, Landroid/widget/Button;->isLayoutRtl()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    neg-float v1, v1

    .line 53
    :cond_2
    iput v1, p0, Lcom/android/quickstep/views/ClearAllButton;->normalTranslationPrimary:F

    .line 54
    .line 55
    if-nez p2, :cond_3

    .line 56
    .line 57
    iget p2, p0, Lcom/android/quickstep/views/ClearAllButton;->sidePadding:I

    .line 58
    .line 59
    int-to-float p2, p2

    .line 60
    add-float/2addr v1, p2

    .line 61
    iput v1, p0, Lcom/android/quickstep/views/ClearAllButton;->normalTranslationPrimary:F

    .line 62
    .line 63
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applyPrimaryTranslation()V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applySecondaryTranslation()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageSpacing()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getClearAllExtraPageSpacing()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p2, v0

    .line 78
    invoke-virtual {p0}, Landroid/widget/Button;->isLayoutRtl()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_4

    .line 83
    .line 84
    neg-int p2, p2

    .line 85
    :cond_4
    add-int/2addr v3, p2

    .line 86
    sub-int/2addr v3, p1

    .line 87
    int-to-float p1, v3

    .line 88
    int-to-float p2, p2

    .line 89
    div-float/2addr p1, p2

    .line 90
    invoke-static {p1, v2}, LA4/d;->b(FF)F

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/ClearAllButton;->setScrollAlpha(F)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final setBorderEnabled(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/ClearAllButton;->borderEnabled:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/ClearAllButton;->borderEnabled:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/Button;->isFocused()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    move p0, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 25
    .line 26
    .line 27
    :cond_2
    :goto_1
    return-void
.end method

.method public final setContentAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setDismissAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->dismissAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setFullscreenProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenProgress:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenProgress:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applyPrimaryTranslation()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setFullscreenTranslationPrimary(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenTranslationPrimary:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->fullscreenTranslationPrimary:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applyPrimaryTranslation()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setGridProgress(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridProgress:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->gridProgress:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applyPrimaryTranslation()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setGridScrollOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->gridScrollOffset:F

    .line 2
    .line 3
    return-void
.end method

.method public final setGridTranslationPrimary(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/ClearAllButton;->gridTranslationPrimary:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->gridTranslationPrimary:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applyPrimaryTranslation()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setScrollAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setScrollOffsetPrimary(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->scrollOffsetPrimary:F

    .line 2
    .line 3
    return-void
.end method

.method public final setTaskAlignmentTranslationY(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/ClearAllButton;->taskAlignmentTranslationY:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/ClearAllButton;->taskAlignmentTranslationY:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/ClearAllButton;->applySecondaryTranslation()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setVisibilityAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/ClearAllButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/ClearAllButton;->$$delegatedProperties:[LB4/i;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    aget-object v1, v1, v2

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1, p1}, Lcom/android/launcher3/util/u1;->b(Ljava/lang/Object;LB4/i;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
