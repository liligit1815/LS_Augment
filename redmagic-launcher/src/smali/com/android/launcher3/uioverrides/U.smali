.class public final Lcom/android/launcher3/uioverrides/U;
.super Ljava/lang/Object;
.source "RecentsViewStateController.kt"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final h:Lcom/android/quickstep/views/RecentsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/RecentsView<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 2

    .line 1
    const-string v0, "launcher"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "getOverviewPanel(...)"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getRecentProxy()Lcom/android/launcher3/u4;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Lcom/android/launcher3/u4;->n(Lcom/android/launcher3/u4$a;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/uioverrides/U;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/U;->k(Lcom/android/launcher3/uioverrides/U;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/uioverrides/U;->m(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/uioverrides/U;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/uioverrides/U;->j(Lcom/android/launcher3/uioverrides/U;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/uioverrides/U;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/uioverrides/U;->l(Lcom/android/launcher3/uioverrides/U;Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final e(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)Landroid/view/animation/Interpolator;
    .locals 0

    .line 1
    sget-object p0, Lcom/android/launcher3/V3;->x:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, LJ0/h;->H:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-boolean p0, p2, Lcom/android/launcher3/V3;->c:Z

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    sget-object p0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object p0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 20
    .line 21
    return-object p0
.end method

.method private final f(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/V;Z)V
    .locals 7

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->isSplitSelectionActive()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    sget-object v2, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    sget-object v3, Lcom/android/quickstep/views/RecentsView;->TASK_PRIMARY_SPLIT_TRANSLATION:Landroid/util/FloatProperty;

    .line 39
    .line 40
    const-string v4, "TASK_PRIMARY_SPLIT_TRANSLATION"

    .line 41
    .line 42
    invoke-static {v3, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object v4, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_SPLIT_TRANSLATION:Landroid/util/FloatProperty;

    .line 46
    .line 47
    const-string v5, "TASK_SECONDARY_SPLIT_TRANSLATION"

    .line 48
    .line 49
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 53
    .line 54
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    const-string v6, "getDeviceProfile(...)"

    .line 59
    .line 60
    invoke-static {v5, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v2, v3, v4, v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSplitSelectTaskOffset(Landroid/util/FloatProperty;Landroid/util/FloatProperty;Lcom/android/launcher3/h0;)Landroid/util/Pair;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 68
    .line 69
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 74
    .line 75
    invoke-static {v3}, Lcom/android/quickstep/util/AnimUtils;->getDeviceOverviewToSplitTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    if-nez v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 82
    .line 83
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 84
    .line 85
    invoke-interface {p1, v4, v1}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, p2, v1}, Lcom/android/quickstep/views/RecentsView;->createSplitSelectInitAnimation(Lcom/android/launcher3/anim/V;I)V

    .line 90
    .line 91
    .line 92
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 93
    .line 94
    iget-object v1, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 95
    .line 96
    check-cast v1, Landroid/util/FloatProperty;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 99
    .line 100
    invoke-virtual {p1, v4}, Lcom/android/launcher3/V3;->q(Lcom/android/launcher3/C2;)F

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    invoke-interface {v3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getGridSlidePrimaryInterpolator()Landroid/view/animation/Interpolator;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {p2, v0, v1, p1, v4}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 112
    .line 113
    iget-object v0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 114
    .line 115
    check-cast v0, Landroid/util/FloatProperty;

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-interface {v3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getGridSlideSecondaryInterpolator()Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {p2, p1, v0, v1, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 126
    .line 127
    invoke-interface {v3}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDesktopTaskFadeInterpolator()Landroid/view/animation/Interpolator;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p2, p1}, Lcom/android/quickstep/views/RecentsView;->handleDesktopTaskInSplitSelectState(Lcom/android/launcher3/anim/V;Landroid/view/animation/Interpolator;)V

    .line 132
    .line 133
    .line 134
    if-nez p3, :cond_3

    .line 135
    .line 136
    invoke-virtual {p2}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 144
    .line 145
    .line 146
    :cond_3
    :goto_1
    return-void
.end method

.method private final g(Lcom/android/launcher3/anim/Y;LQ1/f;Lcom/android/launcher3/V3;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    invoke-virtual {p3, v0, v1}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v2, 0x0

    .line 10
    const/high16 v3, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move v0, v3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 18
    .line 19
    invoke-virtual {v4}, Lcom/android/quickstep/views/RecentsView;->getClearAllButton()Lcom/android/quickstep/views/ClearAllButton;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    sget-object v5, Lcom/android/quickstep/views/ClearAllButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 24
    .line 25
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    invoke-virtual {p1, v4, v5, v0, v6}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, v1}, LQ1/f;->c(I)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 37
    .line 38
    const/16 v1, 0x8

    .line 39
    .line 40
    invoke-virtual {p3, v0, v1}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    move v0, v3

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    move v0, v2

    .line 49
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->getActionsView()Lcom/android/quickstep/views/OverviewActionsView;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/android/quickstep/views/OverviewActionsView;->getVisibilityAlpha()Lcom/android/launcher3/anim/d;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget-object v4, Lcom/android/launcher3/anim/d;->e:Landroid/util/FloatProperty;

    .line 60
    .line 61
    const/16 v5, 0xe

    .line 62
    .line 63
    invoke-virtual {p2, v5, v6}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p1, v1, v4, v0, p2}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getAddDeskButton()Lcom/android/quickstep/views/AddDesktopButton;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    if-eqz p2, :cond_3

    .line 77
    .line 78
    sget-object v0, Lcom/android/quickstep/views/AddDesktopButton;->VISIBILITY_ALPHA:Landroid/util/FloatProperty;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 81
    .line 82
    const/16 v1, 0x100

    .line 83
    .line 84
    invoke-virtual {p3, p0, v1}, Lcom/android/launcher3/V3;->c(Lcom/android/launcher3/C2;I)Z

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    if-eqz p0, :cond_2

    .line 89
    .line 90
    move v2, v3

    .line 91
    :cond_2
    invoke-virtual {p1, p2, v0, v2, v6}, Lcom/android/launcher3/anim/Y;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    :cond_3
    return-void
.end method

.method private static final j(Lcom/android/launcher3/uioverrides/U;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->loadVisibleTaskData(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private static final k(Lcom/android/launcher3/uioverrides/U;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static final l(Lcom/android/launcher3/uioverrides/U;Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p1, p1, Lcom/android/launcher3/V3;->c:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/BaseDepthController;->setHasContentBehindLauncher(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static final m(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;Z)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/launcher3/V3;->c:Z

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->reset()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public h(Lcom/android/launcher3/V3;)V
    .locals 7

    .line 1
    const-string v0, "state"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aget v4, v0, v3

    .line 18
    .line 19
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v1, v2, v4}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    aget v0, v0, v4

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v2, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 55
    .line 56
    iget-boolean v5, p1, Lcom/android/launcher3/V3;->c:Z

    .line 57
    .line 58
    const/high16 v6, 0x3f800000    # 1.0f

    .line 59
    .line 60
    if-eqz v5, :cond_0

    .line 61
    .line 62
    move v5, v6

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    move v5, v2

    .line 65
    :goto_0
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->TASK_MODALNESS:Landroid/util/FloatProperty;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->o()F

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->RECENTS_GRID_PROGRESS:Landroid/util/FloatProperty;

    .line 88
    .line 89
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 90
    .line 91
    iget-object v5, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 92
    .line 93
    invoke-virtual {v5}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-interface {p1, v5}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    .line 98
    .line 99
    .line 100
    move-result v5

    .line 101
    if-eqz v5, :cond_1

    .line 102
    .line 103
    move v5, v6

    .line 104
    goto :goto_1

    .line 105
    :cond_1
    move v5, v2

    .line 106
    :goto_1
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_3

    .line 118
    .line 119
    sget-object v0, Lcom/android/quickstep/views/RecentsViewUtils;->DESK_EXPLODE_PROGRESS:Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 122
    .line 123
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->showExplodedDesktopView()Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-eqz v5, :cond_2

    .line 128
    .line 129
    move v5, v6

    .line 130
    goto :goto_2

    .line 131
    :cond_2
    move v5, v2

    .line 132
    :goto_2
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 137
    .line 138
    .line 139
    :cond_3
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->TASK_THUMBNAIL_SPLASH_ALPHA:Landroid/util/FloatProperty;

    .line 140
    .line 141
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 142
    .line 143
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->showTaskThumbnailSplash()Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-eqz v5, :cond_4

    .line 148
    .line 149
    move v5, v6

    .line 150
    goto :goto_3

    .line 151
    :cond_4
    move v5, v2

    .line 152
    :goto_3
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    invoke-virtual {v0, v1, v5}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_6

    .line 164
    .line 165
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->DESKTOP_CAROUSEL_DETACH_PROGRESS:Landroid/util/FloatProperty;

    .line 166
    .line 167
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 168
    .line 169
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->detachDesktopCarousel()Z

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-eqz v5, :cond_5

    .line 174
    .line 175
    move v2, v6

    .line 176
    :cond_5
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v0, v1, v2}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 181
    .line 182
    .line 183
    :cond_6
    iget-boolean v0, p1, Lcom/android/launcher3/V3;->c:Z

    .line 184
    .line 185
    if-eqz v0, :cond_7

    .line 186
    .line 187
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 188
    .line 189
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->updateEmptyMessage()V

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->resetTaskVisuals()V

    .line 196
    .line 197
    .line 198
    :goto_4
    sget-object v0, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 199
    .line 200
    const-string v1, "NO_ANIM_PROPERTY_SETTER"

    .line 201
    .line 202
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    new-instance v1, LQ1/f;

    .line 206
    .line 207
    invoke-direct {v1}, LQ1/f;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-direct {p0, v0, v1, p1}, Lcom/android/launcher3/uioverrides/U;->g(Lcom/android/launcher3/anim/Y;LQ1/f;Lcom/android/launcher3/V3;)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->n()F

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->setFullscreenProgress(F)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 223
    .line 224
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iget-boolean v1, p1, Lcom/android/launcher3/V3;->c:Z

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/BaseDepthController;->setHasContentBehindLauncher(Z)V

    .line 231
    .line 232
    .line 233
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 234
    .line 235
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 236
    .line 237
    invoke-interface {p1, v1, v4}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    int-to-long v1, v1

    .line 242
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 243
    .line 244
    .line 245
    invoke-direct {p0, p1, v0, v3}, Lcom/android/launcher3/uioverrides/U;->f(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/V;Z)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public i(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 10

    .line 1
    const-string v0, "toState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "config"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "builder"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    invoke-virtual {p2, v0}, LQ1/f;->c(I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->p(Lcom/android/launcher3/C2;)[F

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/android/launcher3/V3;

    .line 41
    .line 42
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_SCALE_PROPERTY:Landroid/util/FloatProperty;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Ljava/lang/Float;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    aget v5, v0, v4

    .line 54
    .line 55
    sget-object v6, Lcom/android/quickstep/views/RecentsView;->ADJACENT_PAGE_HORIZONTAL_OFFSET:Landroid/util/FloatProperty;

    .line 56
    .line 57
    iget-object v7, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 58
    .line 59
    invoke-virtual {v6, v7}, Landroid/util/FloatProperty;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    check-cast v7, Ljava/lang/Float;

    .line 64
    .line 65
    const/4 v8, 0x1

    .line 66
    aget v9, v0, v8

    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    sub-float/2addr v3, v5

    .line 73
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const v5, 0x3a83126f    # 0.001f

    .line 78
    .line 79
    .line 80
    cmpg-float v3, v3, v5

    .line 81
    .line 82
    if-gez v3, :cond_1

    .line 83
    .line 84
    move v3, v8

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    move v3, v4

    .line 87
    :goto_0
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    sub-float/2addr v7, v9

    .line 92
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    cmpg-float v5, v7, v5

    .line 97
    .line 98
    if-gez v5, :cond_2

    .line 99
    .line 100
    move v5, v8

    .line 101
    goto :goto_1

    .line 102
    :cond_2
    move v5, v4

    .line 103
    :goto_1
    if-nez v3, :cond_4

    .line 104
    .line 105
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 106
    .line 107
    aget v4, v0, v4

    .line 108
    .line 109
    invoke-static {}, Lx1/O;->Y2()Z

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    if-eqz v7, :cond_3

    .line 114
    .line 115
    sget-object v7, Lcom/android/launcher3/anim/L;->H:Landroid/view/animation/Interpolator;

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_3
    sget-object v7, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    :goto_2
    const/4 v9, 0x6

    .line 121
    invoke-virtual {p2, v9, v7}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    invoke-virtual {p3, v3, v2, v4, v7}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    :cond_4
    if-nez v5, :cond_6

    .line 129
    .line 130
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 131
    .line 132
    aget v0, v0, v8

    .line 133
    .line 134
    invoke-static {}, Lx1/O;->Y2()Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_5

    .line 139
    .line 140
    sget-object v3, Lcom/android/launcher3/anim/L;->H:Landroid/view/animation/Interpolator;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_5
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 144
    .line 145
    :goto_3
    const/4 v4, 0x7

    .line 146
    invoke-virtual {p2, v4, v3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {p3, v2, v6, v0, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 154
    .line 155
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->TASK_SECONDARY_TRANSLATION:Landroid/util/FloatProperty;

    .line 156
    .line 157
    invoke-static {}, Lx1/O;->Y2()Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    if-eqz v3, :cond_7

    .line 162
    .line 163
    sget-object v3, Lcom/android/launcher3/anim/L;->H:Landroid/view/animation/Interpolator;

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_7
    sget-object v3, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 167
    .line 168
    :goto_4
    const/16 v4, 0x8

    .line 169
    .line 170
    invoke-virtual {p2, v4, v3}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    const/4 v4, 0x0

    .line 175
    invoke-virtual {p3, v0, v2, v4, v3}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 179
    .line 180
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->CONTENT_ALPHA:Landroid/util/FloatProperty;

    .line 181
    .line 182
    iget-boolean v3, p1, Lcom/android/launcher3/V3;->c:Z

    .line 183
    .line 184
    const/high16 v5, 0x3f800000    # 1.0f

    .line 185
    .line 186
    if-eqz v3, :cond_8

    .line 187
    .line 188
    move v3, v5

    .line 189
    goto :goto_5

    .line 190
    :cond_8
    move v3, v4

    .line 191
    :goto_5
    const/16 v6, 0x9

    .line 192
    .line 193
    sget-object v7, LJ0/h;->x:Landroid/view/animation/Interpolator;

    .line 194
    .line 195
    invoke-virtual {p2, v6, v7}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    invoke-virtual {p3, v0, v2, v3, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 203
    .line 204
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->TASK_MODALNESS:Landroid/util/FloatProperty;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->o()F

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    invoke-static {}, Lcom/android/launcher3/y0;->x()Z

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    if-eqz v6, :cond_9

    .line 215
    .line 216
    iget-boolean v6, p1, Lcom/android/launcher3/V3;->c:Z

    .line 217
    .line 218
    if-nez v6, :cond_9

    .line 219
    .line 220
    sget-object v6, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_9
    sget-object v6, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 224
    .line 225
    :goto_6
    const/16 v7, 0xc

    .line 226
    .line 227
    invoke-virtual {p2, v7, v6}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 228
    .line 229
    .line 230
    move-result-object v6

    .line 231
    invoke-virtual {p3, v0, v2, v3, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 235
    .line 236
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->TASK_THUMBNAIL_SPLASH_ALPHA:Landroid/util/FloatProperty;

    .line 237
    .line 238
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->showTaskThumbnailSplash()Z

    .line 239
    .line 240
    .line 241
    move-result v3

    .line 242
    if-eqz v3, :cond_a

    .line 243
    .line 244
    move v3, v5

    .line 245
    goto :goto_7

    .line 246
    :cond_a
    move v3, v4

    .line 247
    :goto_7
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/uioverrides/U;->e(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)Landroid/view/animation/Interpolator;

    .line 251
    .line 252
    .line 253
    move-result-object v6

    .line 254
    invoke-virtual {p3, v0, v2, v3, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 258
    .line 259
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->RECENTS_GRID_PROGRESS:Landroid/util/FloatProperty;

    .line 260
    .line 261
    iget-object v3, p0, Lcom/android/launcher3/uioverrides/U;->g:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 262
    .line 263
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    invoke-interface {p1, v3}, Lcom/android/launcher3/statemanager/a;->displayOverviewTasksAsGrid(Lcom/android/launcher3/h0;)Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    if-eqz v3, :cond_b

    .line 272
    .line 273
    move v3, v5

    .line 274
    goto :goto_8

    .line 275
    :cond_b
    move v3, v4

    .line 276
    :goto_8
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/uioverrides/U;->e(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)Landroid/view/animation/Interpolator;

    .line 277
    .line 278
    .line 279
    move-result-object v6

    .line 280
    invoke-virtual {p3, v0, v2, v3, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 281
    .line 282
    .line 283
    invoke-static {}, Lcom/android/launcher3/y0;->l()Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_d

    .line 288
    .line 289
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 290
    .line 291
    sget-object v2, Lcom/android/quickstep/views/RecentsViewUtils;->DESK_EXPLODE_PROGRESS:Lcom/android/quickstep/views/RecentsViewUtils$Companion$RecentsViewFloatProperty;

    .line 292
    .line 293
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->showExplodedDesktopView()Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    if-eqz v3, :cond_c

    .line 298
    .line 299
    move v3, v5

    .line 300
    goto :goto_9

    .line 301
    :cond_c
    move v3, v4

    .line 302
    :goto_9
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/uioverrides/U;->e(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)Landroid/view/animation/Interpolator;

    .line 303
    .line 304
    .line 305
    move-result-object v6

    .line 306
    invoke-virtual {p3, v0, v2, v3, v6}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 307
    .line 308
    .line 309
    :cond_d
    invoke-static {}, Lcom/android/launcher3/y0;->C()Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-eqz v0, :cond_f

    .line 314
    .line 315
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 316
    .line 317
    sget-object v2, Lcom/android/quickstep/views/RecentsView;->DESKTOP_CAROUSEL_DETACH_PROGRESS:Landroid/util/FloatProperty;

    .line 318
    .line 319
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->detachDesktopCarousel()Z

    .line 320
    .line 321
    .line 322
    move-result v3

    .line 323
    if-eqz v3, :cond_e

    .line 324
    .line 325
    move v4, v5

    .line 326
    :cond_e
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/uioverrides/U;->e(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)Landroid/view/animation/Interpolator;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-virtual {p3, v0, v2, v4, v1}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 331
    .line 332
    .line 333
    :cond_f
    iget-boolean v0, p1, Lcom/android/launcher3/V3;->c:Z

    .line 334
    .line 335
    if-eqz v0, :cond_10

    .line 336
    .line 337
    new-instance v0, Lcom/android/launcher3/uioverrides/P;

    .line 338
    .line 339
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/P;-><init>(Lcom/android/launcher3/uioverrides/U;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->h(Ljava/lang/Runnable;)V

    .line 343
    .line 344
    .line 345
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 346
    .line 347
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->updateEmptyMessage()V

    .line 348
    .line 349
    .line 350
    goto :goto_a

    .line 351
    :cond_10
    new-instance v0, Lcom/android/launcher3/uioverrides/Q;

    .line 352
    .line 353
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/Q;-><init>(Lcom/android/launcher3/uioverrides/U;)V

    .line 354
    .line 355
    .line 356
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 361
    .line 362
    .line 363
    :goto_a
    new-instance v0, Lcom/android/launcher3/uioverrides/S;

    .line 364
    .line 365
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/uioverrides/S;-><init>(Lcom/android/launcher3/uioverrides/U;Lcom/android/launcher3/V3;)V

    .line 366
    .line 367
    .line 368
    invoke-static {v0}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    invoke-virtual {p3, v0}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 373
    .line 374
    .line 375
    invoke-direct {p0, p1, p3, v8}, Lcom/android/launcher3/uioverrides/U;->f(Lcom/android/launcher3/V3;Lcom/android/launcher3/anim/V;Z)V

    .line 376
    .line 377
    .line 378
    invoke-direct {p0, p3, p2, p1}, Lcom/android/launcher3/uioverrides/U;->g(Lcom/android/launcher3/anim/Y;LQ1/f;Lcom/android/launcher3/V3;)V

    .line 379
    .line 380
    .line 381
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/U;->h:Lcom/android/quickstep/views/RecentsView;

    .line 382
    .line 383
    sget-object v0, Lcom/android/quickstep/views/RecentsView;->FULLSCREEN_PROGRESS:Landroid/util/FloatProperty;

    .line 384
    .line 385
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->n()F

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    sget-object v2, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 390
    .line 391
    invoke-virtual {p3, p2, v0, v1, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 392
    .line 393
    .line 394
    new-instance p2, Lcom/android/launcher3/uioverrides/T;

    .line 395
    .line 396
    invoke-direct {p2, p1, p0}, Lcom/android/launcher3/uioverrides/T;-><init>(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {p3, p2}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 400
    .line 401
    .line 402
    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/U;->h(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/U;->i(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
