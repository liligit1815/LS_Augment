.class Lcom/android/launcher3/q5$u;
.super Lcom/android/launcher3/q5$I;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->l0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/q5$I;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(F)F
    .locals 6

    .line 1
    iget v3, p0, Lcom/android/launcher3/q5$I;->r:F

    .line 2
    .line 3
    iget v4, p0, Lcom/android/launcher3/q5$I;->s:F

    .line 4
    .line 5
    sget-object v5, Lcom/android/launcher3/anim/L;->b:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    move v0, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method protected c(F)F
    .locals 7

    .line 1
    const/4 p0, 0x0

    .line 2
    cmpg-float v0, p1, p0

    .line 3
    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    const/high16 p0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const v0, 0x3f59999a    # 0.85f

    .line 10
    .line 11
    .line 12
    cmpl-float v0, p1, v0

    .line 13
    .line 14
    if-ltz v0, :cond_1

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    const/4 v5, 0x0

    .line 18
    sget-object v6, Lcom/android/launcher3/anim/L;->S:Landroid/view/animation/Interpolator;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const v3, 0x3f59999a    # 0.85f

    .line 22
    .line 23
    .line 24
    const/high16 v4, 0x3f800000    # 1.0f

    .line 25
    .line 26
    move v1, p1

    .line 27
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method
