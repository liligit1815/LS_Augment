.class public Lcom/android/quickstep/util/StaggeredWorkspaceAnim;
.super Ljava/lang/Object;
.source "StaggeredWorkspaceAnim.java"


# static fields
.field private static final APP_CLOSE_ROW_START_DELAY_MS:I = 0xa

.field public static final DURATION_MS:I = 0xfa

.field private static final MAX_VELOCITY_PX_PER_S:F = 22.0f


# instance fields
.field private final mAnimators:Landroid/animation/AnimatorSet;

.field private final mIgnoredView:Landroid/view/View;

.field private final mSpringTransY:F

.field private final mTaskbarDurationInMs:I

.field private final mVelocity:F


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;FZLandroid/view/View;)V
    .locals 6

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;FZLandroid/view/View;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;FZLandroid/view/View;Z)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    move/from16 v9, p3

    .line 2
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v1, Landroid/animation/AnimatorSet;

    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v1, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 4
    invoke-static {v8}, Lcom/android/launcher3/util/Z;->C(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v6, 0x1

    if-eqz v1, :cond_0

    .line 5
    invoke-static {v8}, Lcom/android/launcher3/util/Z;->B(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v6

    goto :goto_0

    :cond_0
    move v1, v2

    .line 6
    :goto_0
    invoke-static {v1}, Lcom/android/launcher3/q5;->y0(Z)I

    move-result v1

    iput v1, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mTaskbarDurationInMs:I

    .line 7
    invoke-direct {v0, v8, v9}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->prepareToAnimate(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Z)V

    move-object/from16 v3, p4

    .line 8
    iput-object v3, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mIgnoredView:Landroid/view/View;

    move/from16 v3, p2

    .line 9
    iput v3, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mVelocity:F

    const v4, 0x3f666666    # 0.9f

    .line 10
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float/2addr v3, v4

    const/high16 v4, 0x41b00000    # 22.0f

    div-float/2addr v3, v4

    const v4, 0x3e4ccccd    # 0.2f

    add-float/2addr v3, v4

    .line 11
    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070ac2

    .line 12
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    iput v3, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mSpringTransY:F

    .line 13
    invoke-virtual {v8}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v3

    .line 14
    iget-boolean v4, v3, Lcom/android/launcher3/h0;->p3:Z

    if-eqz v4, :cond_1

    int-to-long v4, v1

    goto :goto_1

    :cond_1
    const-wide/16 v4, 0xfa

    :goto_1
    if-eqz p5, :cond_a

    .line 15
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v7

    .line 16
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    move-result-object v10

    .line 17
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    move-result v1

    if-nez v1, :cond_2

    iget-boolean v1, v3, Lcom/android/launcher3/h0;->p3:Z

    if-nez v1, :cond_2

    move v1, v6

    goto :goto_2

    :cond_2
    move v1, v2

    .line 18
    :goto_2
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    move-result v11

    if-nez v11, :cond_4

    iget-boolean v11, v3, Lcom/android/launcher3/h0;->p3:Z

    if-eqz v11, :cond_3

    iget-boolean v11, v3, Lcom/android/launcher3/h0;->M0:Z

    if-nez v11, :cond_4

    :cond_3
    move v11, v6

    goto :goto_3

    :cond_4
    move v11, v2

    .line 19
    :goto_3
    iget-object v12, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v12, v12, Lcom/android/launcher3/F1;->G0:I

    add-int/2addr v12, v1

    add-int/2addr v12, v11

    .line 20
    new-instance v13, Lcom/android/quickstep/util/l1;

    invoke-direct {v13, v0, v12, v4, v5}, Lcom/android/quickstep/util/l1;-><init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;IJ)V

    invoke-virtual {v7, v13}, Lcom/android/launcher3/V4;->forEachVisiblePage(Ljava/util/function/Consumer;)V

    .line 21
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getClipChildren()Z

    move-result v13

    .line 22
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getClipToPadding()Z

    move-result v14

    move v15, v6

    .line 23
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getClipChildren()Z

    move-result v6

    .line 24
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getClipToPadding()Z

    move-result v16

    .line 25
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 26
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 27
    invoke-virtual {v10, v2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 28
    invoke-virtual {v10, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 29
    invoke-virtual {v10}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    move-result-object v2

    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/h0;->T0()Z

    move-result v17

    if-eqz v17, :cond_6

    .line 31
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    sub-int/2addr v1, v15

    move v11, v1

    :goto_4
    if-ltz v11, :cond_5

    .line 32
    invoke-virtual {v2, v11}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lc1/b;

    .line 34
    invoke-virtual {v3}, Lc1/b;->b()I

    move-result v3

    add-int/2addr v3, v15

    move/from16 v18, v12

    move-object v12, v2

    move v2, v3

    move/from16 v3, v18

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addStaggeredAnimationForView(Landroid/view/View;IIJ)V

    move v0, v3

    add-int/lit8 v11, v11, -0x1

    move-object v2, v12

    move v12, v0

    move-object/from16 v0, p0

    goto :goto_4

    :cond_5
    move-object/from16 v0, p0

    :goto_5
    move-wide v11, v4

    goto :goto_9

    :cond_6
    move v0, v12

    move-object v12, v2

    .line 35
    iget-boolean v2, v3, Lcom/android/launcher3/h0;->p3:Z

    if-eqz v2, :cond_8

    .line 36
    iget-boolean v2, v3, Lcom/android/launcher3/h0;->M0:Z

    if-eqz v2, :cond_7

    .line 37
    iget-object v2, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    add-int/lit8 v3, v2, 0x1

    add-int/2addr v2, v15

    :goto_6
    move/from16 v17, v3

    goto :goto_7

    .line 38
    :cond_7
    iget-object v2, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v2, v2, 0x2

    goto :goto_6

    .line 39
    :cond_8
    iget-object v2, v3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    iget v2, v2, Lcom/android/launcher3/F1;->G0:I

    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v2, v2, 0x2

    move/from16 v17, v2

    move v2, v3

    :goto_7
    if-eqz v1, :cond_9

    .line 40
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    sub-int/2addr v1, v15

    move v15, v1

    :goto_8
    if-ltz v15, :cond_9

    .line 41
    invoke-virtual {v12, v15}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    move v3, v0

    move-object/from16 v0, p0

    .line 42
    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addStaggeredAnimationForView(Landroid/view/View;IIJ)V

    add-int/lit8 v15, v15, -0x1

    move v0, v3

    goto :goto_8

    :cond_9
    move v3, v0

    if-eqz v11, :cond_5

    .line 43
    invoke-virtual {v10}, Lcom/android/launcher3/Hotseat;->getQsb()Landroid/view/View;

    move-result-object v1

    move-object/from16 v0, p0

    move/from16 v2, v17

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addStaggeredAnimationForView(Landroid/view/View;IIJ)V

    goto :goto_5

    .line 44
    :goto_9
    iget-object v15, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    new-instance v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;

    move-object/from16 v1, p0

    move-object v2, v7

    move-object v5, v10

    move v3, v13

    move v4, v14

    move/from16 v7, v16

    invoke-direct/range {v0 .. v7}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$1;-><init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Lcom/android/launcher3/Workspace;ZZLcom/android/launcher3/Hotseat;ZZ)V

    move-object/from16 v18, v1

    move-object v1, v0

    move-object/from16 v0, v18

    invoke-virtual {v15, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_a

    :cond_a
    move-wide v11, v4

    .line 45
    :goto_a
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->i4()V

    .line 46
    iget-object v1, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    new-instance v2, Lcom/android/quickstep/util/m1;

    invoke-direct {v2, v8}, Lcom/android/quickstep/util/m1;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    invoke-static {v2}, Lcom/android/launcher3/anim/h;->a(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    if-eqz v9, :cond_b

    .line 47
    new-instance v1, Lcom/android/launcher3/anim/V;

    invoke-direct {v1, v11, v12}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 48
    invoke-virtual {v8}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    move-result-object v2

    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    new-instance v4, LQ1/f;

    invoke-direct {v4}, LQ1/f;-><init>()V

    .line 49
    invoke-virtual {v2, v1, v3, v4}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 50
    iget-object v2, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 51
    :cond_b
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    invoke-direct {v0, v8, v1, v11, v12}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addDepthAnimationForState(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/V3;J)V

    .line 52
    iget-object v0, v0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    invoke-virtual {v8}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/LauncherRootView;->getSysUiScrim()Ln1/x;

    move-result-object v1

    invoke-virtual {v1}, Ln1/x;->e()Lcom/android/launcher3/anim/d;

    move-result-object v1

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 53
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/anim/d;->g(FF)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v1, v11, v12}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;IJLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->lambda$new$0(IJLandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addAnimationForPage(Lcom/android/launcher3/CellLayout;IJ)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    add-int/lit8 v3, v3, -0x1

    .line 25
    .line 26
    :goto_0
    if-ltz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    check-cast v4, Lc1/b;

    .line 37
    .line 38
    invoke-virtual {v4}, Lc1/b;->b()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    iget v4, v4, Lc1/b;->g:I

    .line 43
    .line 44
    add-int/2addr v6, v4

    .line 45
    move-object v4, p0

    .line 46
    move v7, p2

    .line 47
    move-wide v8, p3

    .line 48
    invoke-direct/range {v4 .. v9}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addStaggeredAnimationForView(Landroid/view/View;IIJ)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v3, v3, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move-object v4, p0

    .line 55
    iget-object p0, v4, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    new-instance p2, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;

    .line 58
    .line 59
    invoke-direct {p2, v4, p1, v1, v2}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$2;-><init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Lcom/android/launcher3/CellLayout;ZZ)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private addDepthAnimationForState(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/V3;J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    invoke-direct {v0, p3, p4}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p3, LQ1/f;

    .line 11
    .line 12
    invoke-direct {p3}, LQ1/f;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2, p3, v0}, LP1/h;->N(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private addStaggeredAnimationForView(Landroid/view/View;IIJ)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mIgnoredView:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sub-int/2addr p3, p2

    .line 9
    add-int/lit8 p3, p3, 0x1

    .line 10
    .line 11
    mul-int/lit8 p3, p3, 0xa

    .line 12
    .line 13
    int-to-long p2, p3

    .line 14
    iget v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mSpringTransY:F

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const v1, 0x7f070a9a

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Lx2/h;->getFloat(I)F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const v2, 0x7f070a99

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2}, Lx2/h;->getFloat(I)F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v2, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mVelocity:F

    .line 42
    .line 43
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    iget v3, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mSpringTransY:F

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    sub-float v3, v4, v3

    .line 51
    .line 52
    invoke-static {v3}, Ljava/lang/Math;->signum(F)F

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    mul-float/2addr v2, v3

    .line 57
    new-instance v3, Lcom/android/launcher3/anim/f0;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-direct {v3, v5}, Lcom/android/launcher3/anim/f0;-><init>(Landroid/content/Context;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v1}, Lcom/android/launcher3/anim/f0;->s(F)Lcom/android/launcher3/anim/f0;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1, v0}, Lcom/android/launcher3/anim/f0;->n(F)Lcom/android/launcher3/anim/f0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/high16 v1, 0x3f800000    # 1.0f

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->p(F)Lcom/android/launcher3/anim/f0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mSpringTransY:F

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f0;->q(F)Lcom/android/launcher3/anim/f0;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v4}, Lcom/android/launcher3/anim/f0;->o(F)Lcom/android/launcher3/anim/f0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, v2}, Lcom/android/launcher3/anim/f0;->r(F)Lcom/android/launcher3/anim/f0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v1, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 95
    .line 96
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0, p2, p3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 101
    .line 102
    .line 103
    new-instance v1, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$3;

    .line 104
    .line 105
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$3;-><init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    .line 117
    .line 118
    .line 119
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 120
    .line 121
    const/4 v1, 0x2

    .line 122
    new-array v1, v1, [F

    .line 123
    .line 124
    fill-array-data v1, :array_0

    .line 125
    .line 126
    .line 127
    invoke-static {p1, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p4, p5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0, p2, p3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 140
    .line 141
    .line 142
    new-instance p2, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$4;

    .line 143
    .line 144
    invoke-direct {p2, p0, p1}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim$4;-><init>(Lcom/android/quickstep/util/StaggeredWorkspaceAnim;Landroid/view/View;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    nop

    .line 157
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private synthetic lambda$new$0(IJLandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p4, Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-direct {p0, p4, p1, p2, p3}, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->addAnimationForPage(Lcom/android/launcher3/CellLayout;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private prepareToAnimate(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Z)V
    .locals 3

    .line 1
    new-instance p0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {p0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xe

    .line 7
    .line 8
    iput v0, p0, LQ1/f;->i:I

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, LQ1/f;->g:J

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v2}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 37
    .line 38
    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget-object p2, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 50
    .line 51
    invoke-virtual {p1, p2, v1, p0}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method


# virtual methods
.method public addAnimatorListener(Landroid/animation/Animator$AnimatorListener;)Lcom/android/quickstep/util/StaggeredWorkspaceAnim;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public getAnimators()Landroid/animation/AnimatorSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public start()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/StaggeredWorkspaceAnim;->mAnimators:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
