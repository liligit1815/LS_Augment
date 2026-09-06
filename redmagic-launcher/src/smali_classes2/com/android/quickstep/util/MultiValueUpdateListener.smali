.class public abstract Lcom/android/quickstep/util/MultiValueUpdateListener;
.super Ljava/lang/Object;
.source "MultiValueUpdateListener.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;
    }
.end annotation


# instance fields
.field private final mAllProperties:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;",
            ">;"
        }
    .end annotation
.end field

.field public mSpringCurAlpha:F

.field public mSpringCurProgress:F

.field public mSpringCurRadio:F

.field public mSpringCurRectF:Landroid/graphics/RectF;

.field public mSpringCurRectRadius:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectF:Landroid/graphics/RectF;

    .line 17
    .line 18
    return-void
.end method

.method static bridge synthetic a(Lcom/android/quickstep/util/MultiValueUpdateListener;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    .line 3
    iget-object v2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->b(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v3

    const/high16 v4, -0x40800000    # -1.0f

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_0

    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->a(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v3

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_0

    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getDuration()J

    move-result-wide v3

    long-to-float v3, v3

    mul-float/2addr v3, v0

    .line 6
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->a(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v4

    sub-float/2addr v3, v4

    const/4 v4, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 7
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->b(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v4

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 8
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->d(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)Landroid/view/animation/Interpolator;

    move-result-object v5

    invoke-interface {v5, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 9
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->c(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v5

    mul-float/2addr v5, v3

    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->e(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v6

    sub-float/2addr v4, v3

    mul-float/2addr v6, v4

    add-float/2addr v5, v6

    iput v5, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    goto :goto_1

    .line 10
    :cond_0
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->d(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)Landroid/view/animation/Interpolator;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v3

    .line 11
    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->e(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v4

    invoke-static {v2}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->c(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/android/launcher3/N5;->L(FFF)F

    move-result v3

    iput v3, v2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onUpdate(FZ)V

    return-void
.end method

.method public final onAnimationUpdate(Landroid/graphics/RectF;FFFF)V
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 14
    iput p2, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurProgress:F

    .line 15
    iput p3, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRadio:F

    .line 16
    iput p4, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurRectRadius:F

    .line 17
    iput p5, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mSpringCurAlpha:F

    .line 18
    iget-object p1, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :goto_0
    if-ltz p1, :cond_0

    .line 19
    iget-object p3, p0, Lcom/android/quickstep/util/MultiValueUpdateListener;->mAllProperties:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 20
    invoke-static {p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->e(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result p4

    invoke-static {p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->c(Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;)F

    move-result p5

    invoke-static {p2, p4, p5}, Lcom/android/launcher3/N5;->L(FFF)F

    move-result p4

    iput p4, p3, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/util/MultiValueUpdateListener;->onUpdate(FZ)V

    return-void
.end method

.method public abstract onUpdate(FZ)V
.end method
