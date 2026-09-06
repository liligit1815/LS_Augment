.class Lcom/android/quickstep/LauncherSwipeHandlerV2$6;
.super Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;->createWidgetHomeAnimationFactory(Lcom/android/launcher3/widget/T;ZLandroid/view/RemoteAnimationTarget;)Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mTargetRect:Landroid/graphics/RectF;

.field final synthetic val$backgroundLocation:Landroid/graphics/RectF;

.field final synthetic val$floatingWidgetAlpha:F

.field final synthetic val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

.field final synthetic val$hostView:Lcom/android/launcher3/widget/T;

.field final synthetic val$startCornerRadius:F


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/J;Lcom/android/launcher3/widget/T;Landroid/graphics/RectF;Lcom/android/quickstep/views/FloatingWidgetView;FF)V
    .locals 0

    .line 1
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$hostView:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$backgroundLocation:Landroid/graphics/RectF;

    .line 4
    .line 5
    iput-object p5, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 6
    .line 7
    iput p6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$startCornerRadius:F

    .line 8
    .line 9
    iput p7, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetAlpha:F

    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/launcher3/views/J;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getEndRadius(Landroid/graphics/RectF;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/FloatingWidgetView;->getInitialCornerRadius()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected getViewIgnoredInWorkspaceRevealAnimation()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$hostView:Lcom/android/launcher3/widget/T;

    .line 2
    .line 3
    return-object p0
.end method

.method protected getWindowAlpha(F)F
    .locals 6

    .line 1
    sget v1, Lcom/android/launcher3/anim/C;->W:F

    .line 2
    .line 3
    sget v2, Lcom/android/launcher3/anim/C;->X:F

    .line 4
    .line 5
    const/high16 v4, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sget-object v5, Lcom/android/launcher3/anim/L;->A:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    move v0, p1

    .line 11
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 p1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    sub-float/2addr p1, p0

    .line 18
    return p1
.end method

.method public getWindowTargetRect()Landroid/graphics/RectF;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->mTargetRect:Landroid/graphics/RectF;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$backgroundLocation:Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->mTargetRect:Landroid/graphics/RectF;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->mTargetRect:Landroid/graphics/RectF;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$backgroundLocation:Landroid/graphics/RectF;

    .line 24
    .line 25
    return-object p0
.end method

.method public setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 14
    .line 15
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance v2, Lcom/android/launcher3/j5;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Lcom/android/launcher3/j5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/FloatingWidgetView;->setOnTargetChangeListener(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$FloatingViewHomeAnimationFactory;->mSiblingAnimation:Lcom/android/quickstep/util/RectFSpringAnim;

    .line 29
    .line 30
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    new-instance v2, Lcom/android/launcher3/k5;

    .line 34
    .line 35
    invoke-direct {v2, v1}, Lcom/android/launcher3/k5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lcom/android/quickstep/views/FloatingWidgetView;->setFastFinishRunnable(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$hostView:Lcom/android/launcher3/widget/T;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->mTargetWorkspaceView:Landroid/view/View;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/quickstep/views/FloatingWidgetView;->isAlreadySetDelayedFinishRunnable()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/android/quickstep/util/RectFSpringAnim;->addDelayedAnimatorListener(Lcom/android/quickstep/util/RectFSpringAnim$OnDelayedAnimatorListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 59
    .line 60
    new-instance v0, Lcom/android/launcher3/n5;

    .line 61
    .line 62
    invoke-direct {v0, p1}, Lcom/android/launcher3/n5;-><init>(Lcom/android/quickstep/util/RectFSpringAnim;)V

    .line 63
    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    invoke-virtual {p0, v0, p1}, Lcom/android/quickstep/views/FloatingWidgetView;->setDelayedFinishRunnable(Ljava/lang/Runnable;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public update(Landroid/graphics/RectF;FFI)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p4}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;->update(Landroid/graphics/RectF;FFI)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lx1/O;->Y2()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    move v4, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const v1, 0x3f4ccccd    # 0.8f

    .line 16
    .line 17
    .line 18
    move v4, v1

    .line 19
    :goto_0
    sget-object v8, LJ0/h;->e:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    const/high16 v5, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/4 v6, 0x0

    .line 24
    const/high16 v7, 0x3f800000    # 1.0f

    .line 25
    .line 26
    move/from16 v3, p2

    .line 27
    .line 28
    invoke-static/range {v3 .. v8}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/high16 v3, 0x3f800000    # 1.0f

    .line 33
    .line 34
    sub-float v1, v3, v1

    .line 35
    .line 36
    move-object v10, v8

    .line 37
    const/4 v8, 0x0

    .line 38
    const/high16 v9, 0x3f800000    # 1.0f

    .line 39
    .line 40
    const/high16 v7, 0x3f000000    # 0.5f

    .line 41
    .line 42
    move/from16 v5, p2

    .line 43
    .line 44
    invoke-static/range {v5 .. v10}, Lcom/android/launcher3/N5;->J(FFFFFLandroid/view/animation/Interpolator;)F

    .line 45
    .line 46
    .line 47
    move-result v14

    .line 48
    iget-object v4, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 49
    .line 50
    cmpl-float v5, p2, v3

    .line 51
    .line 52
    if-nez v5, :cond_1

    .line 53
    .line 54
    cmpl-float v5, p3, v2

    .line 55
    .line 56
    if-nez v5, :cond_1

    .line 57
    .line 58
    iget v5, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$startCornerRadius:F

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move/from16 v5, p3

    .line 62
    .line 63
    :goto_1
    invoke-virtual {v4, v5}, Lcom/android/quickstep/views/FloatingWidgetView;->setCornerRadius(F)V

    .line 64
    .line 65
    .line 66
    iget-object v11, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 67
    .line 68
    iget v13, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetAlpha:F

    .line 69
    .line 70
    sget v4, Lcom/android/launcher3/anim/C;->W:F

    .line 71
    .line 72
    cmpl-float v4, p2, v4

    .line 73
    .line 74
    if-lez v4, :cond_2

    .line 75
    .line 76
    move v15, v1

    .line 77
    goto :goto_2

    .line 78
    :cond_2
    move v15, v2

    .line 79
    :goto_2
    sub-float v16, v3, p2

    .line 80
    .line 81
    move-object/from16 v12, p1

    .line 82
    .line 83
    invoke-virtual/range {v11 .. v16}, Lcom/android/quickstep/views/FloatingWidgetView;->update(Landroid/graphics/RectF;FFFF)V

    .line 84
    .line 85
    .line 86
    iget-object v1, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$hostView:Lcom/android/launcher3/widget/T;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/appwidget/AppWidgetHostView;->getVisibility()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_3

    .line 93
    .line 94
    iget-object v0, v0, Lcom/android/quickstep/LauncherSwipeHandlerV2$6;->val$floatingWidgetView:Lcom/android/quickstep/views/FloatingWidgetView;

    .line 95
    .line 96
    const/4 v1, 0x0

    .line 97
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/FloatingWidgetView;->setForegroundOverlayViewVisibility(I)V

    .line 98
    .line 99
    .line 100
    :cond_3
    return-void
.end method
