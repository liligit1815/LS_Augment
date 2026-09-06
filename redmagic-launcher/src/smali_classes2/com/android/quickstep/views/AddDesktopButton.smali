.class public final Lcom/android/quickstep/views/AddDesktopButton;
.super Landroid/widget/ImageButton;
.source "AddDesktopButton.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/AddDesktopButton$Companion;
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

.field public static final Companion:Lcom/android/quickstep/views/AddDesktopButton$Companion;

.field public static final VISIBILITY_ALPHA:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/quickstep/views/AddDesktopButton;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final addDeskButtonAlpha:Lcom/android/launcher3/util/B1;

.field private borderEnabled:Z

.field private final contentAlpha$delegate:Lcom/android/launcher3/util/u1;

.field private final focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

.field private final gridTranslationX$delegate:Lcom/android/launcher3/util/u1;

.field private final multiTranslationX:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final offsetTranslationX$delegate:Lcom/android/launcher3/util/u1;

.field private final visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lkotlin/jvm/internal/r;

    .line 2
    .line 3
    const-class v1, Lcom/android/quickstep/views/AddDesktopButton;

    .line 4
    .line 5
    const-string v2, "contentAlpha"

    .line 6
    .line 7
    const-string v3, "getContentAlpha()F"

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
    const-string v3, "visibilityAlpha"

    .line 20
    .line 21
    const-string v5, "getVisibilityAlpha()F"

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
    const-string v5, "gridTranslationX"

    .line 33
    .line 34
    const-string v6, "getGridTranslationX()F"

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
    const-string v6, "offsetTranslationX"

    .line 46
    .line 47
    const-string v7, "getOffsetTranslationX()F"

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
    sput-object v5, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

    .line 71
    .line 72
    new-instance v0, Lcom/android/quickstep/views/AddDesktopButton$Companion;

    .line 73
    .line 74
    const/4 v1, 0x0

    .line 75
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/AddDesktopButton$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 76
    .line 77
    .line 78
    sput-object v0, Lcom/android/quickstep/views/AddDesktopButton;->Companion:Lcom/android/quickstep/views/AddDesktopButton$Companion;

    .line 79
    .line 80
    new-instance v0, Lcom/android/launcher3/util/Q0;

    .line 81
    .line 82
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton$Companion$VISIBILITY_ALPHA$1;->INSTANCE:Lcom/android/quickstep/views/AddDesktopButton$Companion$VISIBILITY_ALPHA$1;

    .line 83
    .line 84
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/Q0;-><init>(LB4/h;)V

    .line 85
    .line 86
    .line 87
    sput-object v0, Lcom/android/quickstep/views/AddDesktopButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 88
    .line 89
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/android/quickstep/views/AddDesktopButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 13

    const-string v1, "context"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 3
    invoke-direct/range {p0 .. p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    new-instance v1, Lcom/android/launcher3/util/B1;

    invoke-static {}, Lcom/android/quickstep/views/AddDesktopButton$Companion$Alpha;->getEntries()Ln4/a;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;I)V

    iput-object v1, p0, Lcom/android/quickstep/views/AddDesktopButton;->addDeskButtonAlpha:Lcom/android/launcher3/util/B1;

    .line 5
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/AddDesktopButton$Companion$Alpha;->CONTENT:Lcom/android/quickstep/views/AddDesktopButton$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, p0, Lcom/android/quickstep/views/AddDesktopButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 6
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/AddDesktopButton$Companion$Alpha;->VISIBILITY:Lcom/android/quickstep/views/AddDesktopButton$Companion$Alpha;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, p0, Lcom/android/quickstep/views/AddDesktopButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 7
    new-instance v1, Lcom/android/launcher3/util/v1;

    sget-object v2, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    invoke-static {}, Lcom/android/quickstep/views/AddDesktopButton$Companion$TranslationX;->getEntries()Ln4/a;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-instance v5, Lcom/android/quickstep/views/a;

    invoke-direct {v5}, Lcom/android/quickstep/views/a;-><init>()V

    invoke-direct {v1, p0, v2, v3, v5}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object v1, p0, Lcom/android/quickstep/views/AddDesktopButton;->multiTranslationX:Lcom/android/launcher3/util/v1;

    .line 8
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/AddDesktopButton$Companion$TranslationX;->GRID:Lcom/android/quickstep/views/AddDesktopButton$Companion$TranslationX;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, p0, Lcom/android/quickstep/views/AddDesktopButton;->gridTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 9
    new-instance v2, Lcom/android/launcher3/util/u1;

    sget-object v3, Lcom/android/quickstep/views/AddDesktopButton$Companion$TranslationX;->OFFSET:Lcom/android/quickstep/views/AddDesktopButton$Companion$TranslationX;

    invoke-direct {v2, v1, v3}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V

    iput-object v2, p0, Lcom/android/quickstep/views/AddDesktopButton;->offsetTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 10
    sget-object v1, Lcom/android/quickstep/util/BorderAnimator;->Companion:Lcom/android/quickstep/util/BorderAnimator$Companion;

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07007c

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0704eb

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    move-object v5, v1

    move v1, v2

    move v2, v3

    .line 13
    new-instance v3, Lcom/android/quickstep/views/AddDesktopButton$focusBorderAnimator$1;

    invoke-direct {v3, p0}, Lcom/android/quickstep/views/AddDesktopButton$focusBorderAnimator$1;-><init>(Ljava/lang/Object;)V

    .line 14
    sget-object v6, Lcom/android/launcher3/x5;->i:[I

    move-object v7, p2

    invoke-virtual {p1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    const/4 v6, 0x0

    const/4 v7, -0x1

    .line 15
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

    .line 16
    invoke-static/range {v0 .. v12}, Lcom/android/quickstep/util/BorderAnimator$Companion;->createSimpleBorderAnimator$default(Lcom/android/quickstep/util/BorderAnimator$Companion;IILu4/l;Landroid/view/View;IJJLandroid/view/animation/Interpolator;ILjava/lang/Object;)Lcom/android/quickstep/util/BorderAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/j;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 2
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/AddDesktopButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(FF)F
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/views/AddDesktopButton;->multiTranslationX$lambda$0(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static final synthetic access$getBorderBounds(Lcom/android/quickstep/views/AddDesktopButton;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/AddDesktopButton;->getBorderBounds(Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getBorderBounds(Landroid/graphics/Rect;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getHeight()I

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
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

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
    const v0, 0x7f07007b

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

.method private static final multiTranslationX$lambda$0(FF)F
    .locals 0

    .line 1
    add-float/2addr p0, p1

    .line 2
    return p0
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
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/BorderAnimator;->drawBorder(Landroid/graphics/Canvas;)V

    .line 9
    .line 10
    .line 11
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->draw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final getBorderEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/AddDesktopButton;->borderEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getContentAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final getGridTranslationX()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->gridTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final getOffsetTranslationX()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->offsetTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final getVisibilityAlpha()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ImageButton;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/android/quickstep/views/AddDesktopButton;->borderEnabled:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/views/AddDesktopButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final setBorderEnabled(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->borderEnabled:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Lcom/android/quickstep/views/AddDesktopButton;->borderEnabled:Z

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->focusBorderAnimator:Lcom/android/quickstep/util/BorderAnimator;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageButton;->isFocused()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    move p0, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/util/BorderAnimator;->setBorderVisibility(ZZ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final setContentAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->contentAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final setGridTranslationX(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->gridTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final setOffsetTranslationX(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->offsetTranslationX$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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

.method public final setVisibilityAlpha(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/AddDesktopButton;->visibilityAlpha$delegate:Lcom/android/launcher3/util/u1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/views/AddDesktopButton;->$$delegatedProperties:[LB4/i;

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
