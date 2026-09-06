.class public Lcom/android/launcher3/q5$K;
.super Ljava/lang/Object;
.source "QuickstepTransitionManager.java"

# interfaces
.implements Lcom/android/launcher3/M2$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "K"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/q5;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/q5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    check-cast p5, Lcom/android/launcher3/M2$a;

    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/q5$K;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 12

    .line 2
    iget-object v1, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v1, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v1, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/q4;->S()Lcom/android/launcher3/W3;

    move-result-object v1

    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v1, v3}, Lcom/android/launcher3/W3;->G(Lcom/android/launcher3/C2;)V

    .line 4
    :cond_0
    sget-object v1, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    move-result-object v3

    invoke-virtual {v3}, Lu2/e;->b()Landroid/animation/AnimatorSet;

    move-result-object v3

    .line 6
    invoke-virtual {v1}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    move-result-object v1

    iget-boolean v1, v1, Lu2/e;->m:Z

    if-eqz v1, :cond_1

    if-eqz v3, :cond_1

    .line 7
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->cancel()V

    .line 8
    :cond_1
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v1

    .line 9
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 10
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    invoke-virtual {v3}, Lcom/android/launcher3/q5;->d0()V

    .line 11
    :cond_2
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    const/4 v10, 0x0

    const/4 v4, 0x1

    const/4 v11, 0x0

    if-nez v3, :cond_3

    invoke-static {}, Lx1/O;->Y2()Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    sget-object v5, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 12
    invoke-interface {v3, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    sget-object v5, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    invoke-interface {v3, v5}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_3
    move-object/from16 v8, p5

    goto/16 :goto_3

    .line 13
    :cond_4
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Lcom/android/launcher3/v;->hasSomeInvisibleFlag(I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 14
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Lcom/android/launcher3/v;->addForceInvisibleFlag(I)V

    .line 15
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v3, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 16
    :cond_5
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    invoke-static {v3, p2}, Lcom/android/launcher3/q5;->F(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;)V

    if-nez v1, :cond_6

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    invoke-static {p2}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v2

    move-object v4, v2

    .line 18
    invoke-static {p3}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v3

    .line 19
    invoke-static/range {p4 .. p4}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v4

    iget-object v6, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    .line 20
    invoke-static {p2}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v7

    invoke-static {p2}, Lcom/android/launcher3/q5;->J([Landroid/view/RemoteAnimationTarget;)I

    move-result v5

    invoke-virtual {v6, v7, v5}, Lcom/android/launcher3/q5;->j0([Lu2/s;I)Landroid/graphics/RectF;

    move-result-object v6

    iget-object v5, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v5, v5, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 21
    invoke-static {v5}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    move-result v7

    const/4 v9, 0x0

    const/4 v5, 0x0

    move-object/from16 v8, p5

    .line 22
    invoke-virtual/range {v1 .. v9}, Lcom/android/launcher3/q5;->V([Lu2/s;[Lu2/s;[Lu2/s;ZLandroid/graphics/RectF;FLcom/android/launcher3/M2$a;Z)Lcom/android/quickstep/util/BackAnimState;

    move-result-object v1

    move-object/from16 v4, p4

    goto :goto_2

    :cond_6
    move-object/from16 v8, p5

    .line 23
    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    .line 24
    invoke-static {p2}, Lcom/android/launcher3/q5;->J([Landroid/view/RemoteAnimationTarget;)I

    move-result v3

    invoke-static {v2, p2, v3}, Lcom/android/launcher3/q5;->G(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;I)Landroid/graphics/Rect;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 25
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 26
    array-length v3, p2

    move v6, v11

    :goto_0
    if-ge v6, v3, :cond_8

    aget-object v7, p2, v6

    .line 27
    iget v9, v7, Landroid/view/RemoteAnimationTarget;->mode:I

    if-ne v9, v4, :cond_7

    .line 28
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    invoke-virtual {v3, v7, v1, v4, v2}, Lcom/android/launcher3/q5;->d1(Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;ZLandroid/graphics/RectF;)V

    goto :goto_1

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 29
    :cond_8
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v3, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 30
    invoke-static {v3}, Lcom/android/systemui/shared/system/QuickStepContract;->getWindowCornerRadius(Landroid/content/Context;)F

    move-result v6

    const/4 v7, 0x0

    move-object v3, p3

    move-object/from16 v4, p4

    move-object v5, v2

    move-object v2, p2

    .line 31
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/q5;->U([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;FZ)Lcom/android/quickstep/util/BackAnimState;

    move-result-object v1

    .line 32
    :goto_2
    invoke-static {v4, v11, v10}, Lcom/android/quickstep/TaskViewUtils;->createSplitAuxiliarySurfacesAnimator([Landroid/view/RemoteAnimationTarget;ZLjava/util/function/Consumer;)Landroid/animation/ValueAnimator;

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    const/16 v3, 0xf

    invoke-virtual {v2, v3}, Lcom/android/launcher3/v;->clearForceInvisibleFlag(I)V

    .line 34
    iget-object v2, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-interface {v1, v8, v2}, Lcom/android/quickstep/util/BackAnimState;->applyToAnimationResult(Lcom/android/launcher3/M2$a;Landroid/content/Context;)V

    .line 35
    sget-object v1, Lx1/r;->H:Lcom/android/launcher3/util/I;

    iget-object v0, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v0, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx1/r;

    if-eqz v0, :cond_9

    .line 36
    invoke-virtual {v0, v10, v11}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    .line 37
    :cond_9
    sget v0, Lcom/android/launcher3/anim/C;->T:I

    invoke-static {v0}, Lx1/O;->q(I)V

    return-void

    :goto_3
    if-nez v1, :cond_a

    .line 38
    new-instance v1, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    sget-object v3, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->REMOTE_CLOSE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    invoke-direct {v1, v3}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 39
    invoke-static {p2}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v2

    iget-object v0, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v0, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/android/launcher3/widget/I0;->b(Landroid/content/Context;)F

    move-result v3

    invoke-static {v2, v11, v0, v3, v11}, Lcom/android/launcher3/anim/y;->b([Lu2/s;ZLcom/android/launcher3/C2;FZ)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->play(Landroid/animation/Animator;)V

    .line 40
    invoke-virtual {v8, v1, v10, v4}, Lcom/android/launcher3/M2$a;->v2(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Runnable;Z)V

    return-void

    .line 41
    :cond_a
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 42
    iget-object v3, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    invoke-static {v3, p2}, Lcom/android/launcher3/q5;->D(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 43
    iget-object v0, p0, Lcom/android/launcher3/q5$K;->a:Lcom/android/launcher3/q5;

    iget-object v0, v0, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v8, v1, v0}, Lcom/android/launcher3/M2$a;->t2(Landroid/animation/AnimatorSet;Landroid/content/Context;)V

    return-void
.end method
