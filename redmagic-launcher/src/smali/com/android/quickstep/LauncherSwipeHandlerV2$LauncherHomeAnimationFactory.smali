.class Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;
.super Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;
.source "LauncherSwipeHandlerV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LauncherHomeAnimationFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    invoke-direct {p0, p1}, Lcom/android/quickstep/SwipeUpAnimationLogic$HomeAnimationFactory;-><init>(Lcom/android/quickstep/SwipeUpAnimationLogic;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;Lcom/android/quickstep/B1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;-><init>(Lcom/android/quickstep/LauncherSwipeHandlerV2;)V

    return-void
.end method


# virtual methods
.method public createActivityAnimationToHome()Lcom/android/launcher3/anim/q;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/SwipeUpAnimationLogic;->mDp:Lcom/android/launcher3/h0;

    .line 4
    .line 5
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 6
    .line 7
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 8
    .line 9
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    int-to-long v0, v0

    .line 16
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 19
    .line 20
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    invoke-virtual {p0, v2, v0, v1, v3}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method protected getViewIgnoredInWorkspaceRevealAnimation()Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public playAtomicAnimation(FLandroid/animation/AnimatorSet;)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/O;->Y2()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p1}, Lcom/android/launcher3/anim/C;->h0(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Lcom/android/quickstep/util/WorkspaceRevealAnim;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 17
    .line 18
    check-cast p0, Lcom/android/launcher3/C2;

    .line 19
    .line 20
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/util/WorkspaceRevealAnim;-><init>(Lcom/android/launcher3/C2;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/quickstep/util/WorkspaceRevealAnim;->getAnimators()Landroid/animation/AnimatorSet;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget v0, Lcom/android/launcher3/anim/C;->T:I

    .line 28
    .line 29
    int-to-long v0, v0

    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 41
    .line 42
    iget-object p2, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    check-cast p2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object p1, p1, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainerInterface:Lcom/android/quickstep/BaseContainerInterface;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    move-object p2, p1

    .line 56
    check-cast p2, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 57
    .line 58
    :goto_0
    if-nez p2, :cond_2

    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    new-instance p1, Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 62
    .line 63
    sget-object v1, Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;->SWIPE_TO_HOME:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;

    .line 64
    .line 65
    invoke-direct {p1, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;-><init>(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim$AnimType;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 71
    .line 72
    check-cast p0, Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-instance v1, LQ1/f;

    .line 79
    .line 80
    invoke-direct {v1}, LQ1/f;-><init>()V

    .line 81
    .line 82
    .line 83
    const/16 v2, 0xe

    .line 84
    .line 85
    iput v2, v1, LQ1/f;->i:I

    .line 86
    .line 87
    const-wide/16 v2, 0x0

    .line 88
    .line 89
    iput-wide v2, v1, LQ1/f;->g:J

    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    sget-object v3, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 96
    .line 97
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 98
    .line 99
    invoke-virtual {v2, v3, v4, v1}, Lcom/android/launcher3/statemanager/d;->r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Lcom/android/quickstep/views/RecentsView;

    .line 111
    .line 112
    invoke-virtual {v2, v0}, Lcom/android/launcher3/V4;->forceFinishScroller(Z)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->forceOnPageTransitionEndCallback()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Lcom/android/launcher3/Workspace;->getStateTransitionAnimation()Lcom/android/launcher3/N6;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    sget-object v0, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 133
    .line 134
    invoke-virtual {p2, v0, v3, v1}, Lcom/android/launcher3/N6;->h(Lcom/android/launcher3/anim/Y;Lcom/android/launcher3/V3;LQ1/f;)V

    .line 135
    .line 136
    .line 137
    if-eqz p0, :cond_3

    .line 138
    .line 139
    const/4 p2, 0x0

    .line 140
    invoke-virtual {p0, p1, p2, p2}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V

    .line 141
    .line 142
    .line 143
    :cond_3
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->start()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method protected playScalingRevealAnimation()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$LauncherHomeAnimationFactory;->this$0:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/AbsSwipeUpHandler;->mContainer:Landroid/content/Context;

    .line 12
    .line 13
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-direct {v0, p0, v2, v2, v1}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/RectFSpringAnim;Landroid/graphics/RectF;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/util/ScalingWorkspaceRevealAnim;->start()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
