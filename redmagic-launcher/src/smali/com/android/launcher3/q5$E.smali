.class public Lcom/android/launcher3/q5$E;
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
    name = "E"
.end annotation


# instance fields
.field private final a:Landroid/view/View;

.field private final b:Lcom/android/launcher3/util/Y1;

.field private c:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

.field final synthetic d:Lcom/android/launcher3/q5;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Landroid/view/View;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lcom/android/launcher3/q5$E;->c:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/android/launcher3/q5$E;->b:Lcom/android/launcher3/util/Y1;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getAnimation()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->c:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMRectFSpringAnim()Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getAppTransitionParamForInterrupt()Lu2/e;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of p0, p0, Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    invoke-static {}, Lx1/O;->Y2()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/android/launcher3/anim/C;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/anim/C;->A()Lu2/e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    :goto_0
    return-object v0
.end method

.method public handleAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/q5$E;->supportInterruption()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->getAppOpenAnimMergeHelper()Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/quickstep/utils/DefaultAppOpenAnimMergeHelper;->onRemoteAnimationMerged(Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Lu2/s$a;Lcom/android/wm/shell/recents/c;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public onAnimationCancelled()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/anim/C;->Y:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/android/launcher3/anim/C;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iput-boolean v2, v1, Lcom/android/launcher3/anim/C;->D:Z

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/launcher3/anim/C;

    .line 25
    .line 26
    iput-boolean v2, v0, Lcom/android/launcher3/anim/C;->E:Z

    .line 27
    .line 28
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->b:Lcom/android/launcher3/util/Y1;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/view/IRemoteAnimationFinishedCallback;)V
    .locals 0

    .line 1
    check-cast p5, Lcom/android/launcher3/M2$a;

    invoke-virtual/range {p0 .. p5}, Lcom/android/launcher3/q5$E;->onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V

    return-void
.end method

.method public onAnimationStart(I[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Lcom/android/launcher3/M2$a;)V
    .locals 14

    move-object/from16 v3, p2

    .line 2
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    invoke-virtual {v0}, Lcom/android/launcher3/q5;->c0()V

    .line 3
    new-instance v10, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    sget-object v0, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->OPEN_FROM_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    invoke-direct {v10, v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 4
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    const/4 v11, 0x1

    .line 6
    invoke-static {v0, v3, v11}, Lcom/android/launcher3/q5;->H(Lcom/android/launcher3/q5;[Landroid/view/RemoteAnimationTarget;I)Z

    move-result v0

    .line 7
    iget-object v2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    instance-of v4, v2, Lcom/android/launcher3/widget/T;

    .line 8
    iget-object v5, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    invoke-virtual {v5, v2, v3}, Lcom/android/launcher3/q5;->D0(Landroid/view/View;[Landroid/view/RemoteAnimationTarget;)Z

    move-result v2

    const/4 v12, 0x0

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    instance-of v2, v2, Lcom/android/quickstep/views/TaskView;

    if-eqz v2, :cond_0

    move v2, v11

    goto :goto_0

    :cond_0
    move v2, v12

    :goto_0
    if-eqz v4, :cond_2

    .line 9
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v2

    xor-int/lit8 v13, v2, 0x1

    if-nez v2, :cond_1

    .line 10
    iget-object v4, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v5, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    .line 11
    invoke-static {v3}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v6

    .line 12
    invoke-static/range {p3 .. p3}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v7

    .line 13
    invoke-static/range {p4 .. p4}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v8

    move-object/from16 v9, p5

    .line 14
    invoke-virtual/range {v4 .. v10}, Lcom/android/launcher3/q5;->b1(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Lcom/android/launcher3/M2$a;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    move v6, v0

    goto :goto_1

    :cond_1
    move v6, v0

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    check-cast v2, Lcom/android/launcher3/widget/T;

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/q5;->C(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;Lcom/android/launcher3/widget/T;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V

    .line 16
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    const/16 v2, 0x1b

    invoke-static {v0, v1, v2}, Lcom/android/launcher3/q5;->A(Lcom/android/launcher3/q5;Landroid/animation/Animator;I)V

    move-object/from16 v3, p2

    move-object/from16 v9, p5

    move v0, v11

    goto/16 :goto_3

    :cond_2
    move v6, v0

    if-eqz v2, :cond_3

    .line 17
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/q5;->Q(Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V

    move-object v7, v1

    move v8, v6

    .line 18
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    const/4 v1, 0x7

    invoke-static {v0, v7, v1}, Lcom/android/launcher3/q5;->A(Lcom/android/launcher3/q5;Landroid/animation/Animator;I)V

    move-object/from16 v9, p5

    move-object v1, v7

    move v0, v11

    move v13, v12

    goto :goto_3

    :cond_3
    move-object v7, v1

    move v8, v6

    .line 19
    invoke-static {}, Lx1/O;->Y2()Z

    move-result v0

    xor-int/lit8 v13, v0, 0x1

    if-nez v0, :cond_4

    .line 20
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v1, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    .line 21
    invoke-static/range {p2 .. p2}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v2

    .line 22
    invoke-static/range {p3 .. p3}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v3

    .line 23
    invoke-static/range {p4 .. p4}, Lu2/s;->l([Landroid/view/RemoteAnimationTarget;)[Lu2/s;

    move-result-object v4

    move-object/from16 v5, p5

    move-object v6, v10

    .line 24
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/q5;->b1(Landroid/view/View;[Lu2/s;[Lu2/s;[Lu2/s;Lcom/android/launcher3/M2$a;Lcom/android/quickstep/util/animation/MultiAnimatorSet;)V

    move-object v9, v5

    move-object/from16 v3, p2

    move-object v1, v7

    move v6, v8

    goto :goto_2

    :cond_4
    move-object/from16 v9, p5

    .line 25
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v2, p0, Lcom/android/launcher3/q5$E;->a:Landroid/view/View;

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object v1, v7

    move v6, v8

    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/q5;->B(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;Landroid/view/View;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Z)V

    .line 26
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    const/16 v2, 0x8

    invoke-static {v0, v1, v2}, Lcom/android/launcher3/q5;->A(Lcom/android/launcher3/q5;Landroid/animation/Animator;I)V

    move v0, v12

    .line 27
    :goto_3
    sget-object v2, Lx1/r;->H:Lcom/android/launcher3/util/I;

    iget-object v4, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v4, v4, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx1/r;

    if-eqz v3, :cond_6

    if-eqz v2, :cond_6

    .line 28
    array-length v4, v3

    move v5, v12

    :goto_4
    if-ge v5, v4, :cond_6

    aget-object v7, v3, v5

    .line 29
    iget v8, v7, Landroid/view/RemoteAnimationTarget;->mode:I

    if-nez v8, :cond_5

    .line 30
    iget-object v3, v7, Landroid/view/RemoteAnimationTarget;->taskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    invoke-virtual {v2, v3, v12}, Lx1/r;->G0(Landroid/app/TaskInfo;Z)V

    goto :goto_5

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 31
    :cond_6
    :goto_5
    new-instance v2, Lcom/android/launcher3/q5$E$a;

    invoke-direct {v2, p0}, Lcom/android/launcher3/q5$E$a;-><init>(Lcom/android/launcher3/q5$E;)V

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 32
    sget v2, Lcom/android/launcher3/anim/C;->Q:I

    invoke-static {v2}, Lx1/O;->q(I)V

    .line 33
    iget-object v2, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    invoke-static {v2, v1}, Lcom/android/launcher3/q5;->z(Lcom/android/launcher3/q5;Landroid/animation/AnimatorSet;)V

    if-eqz v6, :cond_8

    if-eqz v13, :cond_7

    .line 34
    new-instance v2, Lcom/android/launcher3/q5$E$b;

    invoke-direct {v2, p0}, Lcom/android/launcher3/q5$E$b;-><init>(Lcom/android/launcher3/q5$E;)V

    invoke-virtual {v10, v2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->addListener(Lcom/android/launcher3/anim/T;)V

    goto :goto_6

    .line 35
    :cond_7
    iget-object v2, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    invoke-static {v2}, Lcom/android/launcher3/q5;->p(Lcom/android/launcher3/q5;)Landroid/animation/AnimatorListenerAdapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    :cond_8
    :goto_6
    invoke-static {}, Lcom/android/launcher3/y0;->F0()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-static {}, Lcom/android/launcher3/y0;->U()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 37
    iget-object v2, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    invoke-virtual {v2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 38
    invoke-virtual {v2, v12}, Lcom/android/launcher3/taskbar/V;->u0(Z)V

    if-eqz v6, :cond_9

    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/V;->a0()Landroid/animation/Animator;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 40
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    :cond_9
    if-eqz v13, :cond_a

    .line 41
    iget-object v0, p0, Lcom/android/launcher3/q5$E;->b:Lcom/android/launcher3/util/Y1;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/android/launcher3/t;

    invoke-direct {v1, v0}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    invoke-virtual {v9, v10, v1, v11}, Lcom/android/launcher3/M2$a;->v2(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Runnable;Z)V

    goto :goto_7

    .line 42
    :cond_a
    iget-object v2, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    iget-object v2, v2, Lcom/android/launcher3/q5;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    iget-object v3, p0, Lcom/android/launcher3/q5$E;->b:Lcom/android/launcher3/util/Y1;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lcom/android/launcher3/t;

    invoke-direct {v4, v3}, Lcom/android/launcher3/t;-><init>(Lcom/android/launcher3/util/Y1;)V

    invoke-virtual {v9, v1, v2, v4, v0}, Lcom/android/launcher3/M2$a;->u2(Landroid/animation/AnimatorSet;Landroid/content/Context;Ljava/lang/Runnable;Z)V

    .line 43
    :goto_7
    iget-object p0, p0, Lcom/android/launcher3/q5$E;->d:Lcom/android/launcher3/q5;

    invoke-virtual {p0}, Lcom/android/launcher3/q5;->T0()V

    return-void
.end method

.method public supportInterruption()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/android/quickstep/utils/MFVAnimManager;->INSTANCE:Lcom/android/quickstep/utils/MFVAnimManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/utils/MFVAnimManager;->supportInterruption()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
