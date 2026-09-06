.class abstract Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;
.super Ljava/lang/Object;
.source "BorderAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BorderAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "BorderAnimationParams"
.end annotation


# instance fields
.field private animationProgress:F

.field private final borderBounds:Landroid/graphics/Rect;

.field private final borderStrokePx:I

.field private final borderWidthPx:I

.field private final boundsBuilder:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field private layoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

.field private final targetView:Landroid/view/View;


# direct methods
.method public constructor <init>(IILu4/l;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lu4/l<",
            "-",
            "Landroid/graphics/Rect;",
            "Lh4/t;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "boundsBuilder"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "targetView"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput p1, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderWidthPx:I

    .line 15
    .line 16
    iput p2, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderStrokePx:I

    .line 17
    .line 18
    iput-object p3, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->boundsBuilder:Lu4/l;

    .line 19
    .line 20
    iput-object p4, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->targetView:Landroid/view/View;

    .line 21
    .line 22
    new-instance p1, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderBounds:Landroid/graphics/Rect;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p9}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder$lambda$0(Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;Landroid/view/View;IIIIIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onShowBorder$lambda$0(Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->onShowBorder()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->targetView:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final getAlignmentAdjustment()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getBorderStroke()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-float v0, v0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustmentInset()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-float p0, p0

    .line 14
    add-float/2addr v0, p0

    .line 15
    return v0
.end method

.method public abstract getAlignmentAdjustmentInset()I
.end method

.method public final getAnimationProgress()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->animationProgress:F

    .line 2
    .line 3
    return p0
.end method

.method public final getBorderBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderBounds:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getBorderStroke()F
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderStrokePx:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->animationProgress:F

    .line 5
    .line 6
    mul-float/2addr v0, p0

    .line 7
    return v0
.end method

.method public final getBorderStrokePx()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderStrokePx:I

    .line 2
    .line 3
    return p0
.end method

.method public final getBorderWidthPx()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderWidthPx:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract getRadiusAdjustment()F
.end method

.method public final getTargetView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->targetView:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public onHideBorder()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->layoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->targetView:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->layoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onShowBorder()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->layoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/android/quickstep/util/I;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/I;-><init>(Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->layoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->targetView:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->boundsBuilder:Lu4/l;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->borderBounds:Landroid/graphics/Rect;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final setAnimationProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->animationProgress:F

    .line 2
    .line 3
    return-void
.end method
