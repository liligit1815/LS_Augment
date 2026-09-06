.class Lcom/android/launcher3/q5$g;
.super Lcom/android/launcher3/q5$I;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->k0(Landroid/animation/AnimatorSet;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/View;Landroid/graphics/PointF;Landroid/graphics/RectF;F)Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic v:F

.field final synthetic w:Lcom/android/quickstep/views/FloatingWidgetView;

.field final synthetic x:F

.field final synthetic y:Landroid/view/View;

.field final synthetic z:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIFFLcom/android/quickstep/views/FloatingWidgetView;FLandroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$g;->z:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    iput p10, p0, Lcom/android/launcher3/q5$g;->v:F

    .line 4
    .line 5
    iput-object p11, p0, Lcom/android/launcher3/q5$g;->w:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 6
    .line 7
    iput p12, p0, Lcom/android/launcher3/q5$g;->x:F

    .line 8
    .line 9
    iput-object p13, p0, Lcom/android/launcher3/q5$g;->y:Landroid/view/View;

    .line 10
    .line 11
    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/q5$I;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 12

    .line 1
    iget v0, p0, Lcom/android/launcher3/q5$g;->v:F

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5$g;->z:Lcom/android/launcher3/q5;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    sub-float/2addr v0, v1

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/q5$g;->z:Lcom/android/launcher3/q5;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-float/2addr v0, v1

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lx1/O;->Y2()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    move v5, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const v0, 0x3f4ccccd    # 0.8f

    .line 39
    .line 40
    .line 41
    move v5, v0

    .line 42
    :goto_0
    sget-object v9, LJ0/h;->e:Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    const/high16 v6, 0x3f800000    # 1.0f

    .line 45
    .line 46
    const/4 v7, 0x0

    .line 47
    const/high16 v8, 0x3f800000    # 1.0f

    .line 48
    .line 49
    move v4, p2

    .line 50
    invoke-static/range {v4 .. v9}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/high16 v2, 0x3f800000    # 1.0f

    .line 55
    .line 56
    sub-float v0, v2, v0

    .line 57
    .line 58
    move-object v11, v9

    .line 59
    const/4 v9, 0x0

    .line 60
    const/high16 v10, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const/high16 v8, 0x3f000000    # 0.5f

    .line 63
    .line 64
    move v6, p2

    .line 65
    invoke-static/range {v6 .. v11}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    move v4, v2

    .line 70
    iget-object v2, p0, Lcom/android/launcher3/q5$g;->w:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 71
    .line 72
    move v6, v4

    .line 73
    iget v4, p0, Lcom/android/launcher3/q5$g;->x:F

    .line 74
    .line 75
    sget v7, Lcom/android/launcher3/anim/C;->W:F

    .line 76
    .line 77
    cmpl-float v7, p2, v7

    .line 78
    .line 79
    if-lez v7, :cond_1

    .line 80
    .line 81
    move v1, v0

    .line 82
    :cond_1
    sub-float v7, v6, p2

    .line 83
    .line 84
    move-object v3, p1

    .line 85
    move v6, v1

    .line 86
    invoke-virtual/range {v2 .. v7}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/launcher3/q5$g;->y:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p0, Lcom/android/launcher3/q5$g;->w:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 98
    .line 99
    const/4 v1, 0x0

    .line 100
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/FloatingWidgetView;->setForegroundOverlayViewVisibility(I)V

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-super/range {p0 .. p2}, Lcom/android/launcher3/q5$I;->onUpdate(Landroid/graphics/RectF;F)V

    .line 104
    .line 105
    .line 106
    return-void
.end method
