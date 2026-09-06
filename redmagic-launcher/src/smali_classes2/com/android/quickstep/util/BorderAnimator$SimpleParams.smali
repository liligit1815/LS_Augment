.class final Lcom/android/quickstep/util/BorderAnimator$SimpleParams;
.super Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;
.source "BorderAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/BorderAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SimpleParams"
.end annotation


# instance fields
.field private final alignmentAdjustmentInset:I


# direct methods
.method public constructor <init>(ILu4/l;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
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
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "targetView"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p1, p2, p3}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;-><init>(IILu4/l;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getAlignmentAdjustmentInset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/BorderAnimator$SimpleParams;->alignmentAdjustmentInset:I

    .line 2
    .line 3
    return p0
.end method

.method public getRadiusAdjustment()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/BorderAnimator$BorderAnimationParams;->getAlignmentAdjustment()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    neg-float p0, p0

    .line 6
    return p0
.end method
