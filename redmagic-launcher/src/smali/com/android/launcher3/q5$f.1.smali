.class Lcom/android/launcher3/q5$f;
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
.field final synthetic A:Z

.field final synthetic B:F

.field final synthetic C:F

.field final synthetic D:Landroid/graphics/RectF;

.field final synthetic E:F

.field final synthetic F:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic G:Lcom/android/launcher3/q5;

.field final synthetic v:Z

.field final synthetic w:F

.field final synthetic x:Landroid/graphics/RectF;

.field final synthetic y:Landroid/graphics/RectF;

.field final synthetic z:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIFZFLandroid/graphics/RectF;Landroid/graphics/RectF;Landroid/view/View;ZFFLandroid/graphics/RectF;FLcom/android/launcher3/views/FloatingIconView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$f;->G:Lcom/android/launcher3/q5;

    iput-boolean p10, p0, Lcom/android/launcher3/q5$f;->v:Z

    iput p11, p0, Lcom/android/launcher3/q5$f;->w:F

    iput-object p12, p0, Lcom/android/launcher3/q5$f;->x:Landroid/graphics/RectF;

    iput-object p13, p0, Lcom/android/launcher3/q5$f;->y:Landroid/graphics/RectF;

    iput-object p14, p0, Lcom/android/launcher3/q5$f;->z:Landroid/view/View;

    iput-boolean p15, p0, Lcom/android/launcher3/q5$f;->A:Z

    move/from16 p10, p16

    iput p10, p0, Lcom/android/launcher3/q5$f;->B:F

    move/from16 p10, p17

    iput p10, p0, Lcom/android/launcher3/q5$f;->C:F

    move-object/from16 p10, p18

    iput-object p10, p0, Lcom/android/launcher3/q5$f;->D:Landroid/graphics/RectF;

    move/from16 p10, p19

    iput p10, p0, Lcom/android/launcher3/q5$f;->E:F

    move-object/from16 p10, p20

    iput-object p10, p0, Lcom/android/launcher3/q5$f;->F:Lcom/android/launcher3/views/FloatingIconView;

    invoke-direct/range {p0 .. p9}, Lcom/android/launcher3/q5$I;-><init>(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;Landroid/graphics/Rect;Landroid/graphics/Rect;FFIF)V

    return-void
.end method


# virtual methods
.method public onUpdate(Landroid/graphics/RectF;F)V
    .locals 7

    .line 1
    iget-boolean v1, p0, Lcom/android/launcher3/q5$f;->v:Z

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    move v1, v2

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget v1, p0, Lcom/android/launcher3/q5$f;->w:F

    .line 9
    .line 10
    iget-object v3, p0, Lcom/android/launcher3/q5$f;->G:Lcom/android/launcher3/q5;

    .line 11
    .line 12
    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 13
    .line 14
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScrollX()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    int-to-float v3, v3

    .line 23
    sub-float/2addr v1, v3

    .line 24
    :goto_0
    iget-object v3, p0, Lcom/android/launcher3/q5$f;->G:Lcom/android/launcher3/q5;

    .line 25
    .line 26
    iget-object v3, v3, Lcom/android/launcher3/q5;->h:Lcom/android/launcher3/dragndrop/DragLayer;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    add-float/2addr v1, v3

    .line 33
    invoke-virtual {p1, v1, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/android/launcher3/q5$f;->x:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/q5$f;->y:Landroid/graphics/RectF;

    .line 42
    .line 43
    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/q5$f;->z:Landroid/view/View;

    .line 47
    .line 48
    instance-of v1, v1, Lcom/android/launcher3/BubbleTextView;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-boolean v1, p0, Lcom/android/launcher3/q5$f;->A:Z

    .line 53
    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    iget-object v1, p0, Lcom/android/launcher3/q5$f;->y:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget v2, p0, Lcom/android/launcher3/q5$f;->B:F

    .line 59
    .line 60
    iget v3, p0, Lcom/android/launcher3/q5$f;->C:F

    .line 61
    .line 62
    iget-object v4, p0, Lcom/android/launcher3/q5$f;->D:Landroid/graphics/RectF;

    .line 63
    .line 64
    iget v5, p0, Lcom/android/launcher3/q5$f;->E:F

    .line 65
    .line 66
    move-object v0, p1

    .line 67
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/anim/C;->y0(Landroid/graphics/RectF;Landroid/graphics/RectF;FFLandroid/graphics/RectF;F)Z

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/q5$f;->F:Lcom/android/launcher3/views/FloatingIconView;

    .line 71
    .line 72
    invoke-static {p2}, Lcom/android/launcher3/anim/C;->J(F)F

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iget-object v2, p0, Lcom/android/launcher3/q5$f;->y:Landroid/graphics/RectF;

    .line 77
    .line 78
    invoke-virtual {p0, p2}, Lcom/android/launcher3/q5$I;->a(F)F

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    const/4 v6, 0x0

    .line 83
    const v4, 0x3f666666    # 0.9f

    .line 84
    .line 85
    .line 86
    move v3, p2

    .line 87
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/views/FloatingIconView;->N(FLandroid/graphics/RectF;FFFZ)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/q5$f;->x:Landroid/graphics/RectF;

    .line 91
    .line 92
    invoke-super {p0, v0, p2}, Lcom/android/launcher3/q5$I;->onUpdate(Landroid/graphics/RectF;F)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
