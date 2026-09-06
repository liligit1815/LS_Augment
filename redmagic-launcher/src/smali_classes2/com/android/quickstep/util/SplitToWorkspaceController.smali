.class public Lcom/android/quickstep/util/SplitToWorkspaceController;
.super Ljava/lang/Object;
.source "SplitToWorkspaceController.java"


# instance fields
.field private final mController:Lcom/android/quickstep/util/SplitSelectStateController;

.field private final mHalfDividerSize:I

.field private final mIconCache:Ls1/P;

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/SplitSelectStateController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mIconCache:Ls1/P;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const p2, 0x7f070922

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    div-int/lit8 p1, p1, 0x2

    .line 30
    .line 31
    iput p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mHalfDividerSize:I

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/util/SplitToWorkspaceController;->lambda$handleSecondWidgetSelectionForSplit$1(Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/SplitToWorkspaceController;Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/android/quickstep/util/SplitToWorkspaceController;->lambda$handleSecondAppSelectionForSplit$2(Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/quickstep/util/SplitToWorkspaceController;->lambda$handleSecondWidgetSelectionForSplit$0(Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/quickstep/util/SplitSelectStateController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/SplitToWorkspaceController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic lambda$handleSecondAppSelectionForSplit$2(Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p6, p6, v0

    .line 3
    .line 4
    if-eqz p6, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 7
    .line 8
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 9
    .line 10
    invoke-virtual {p2, p6, p1}, Lcom/android/quickstep/util/SplitSelectStateController;->setSecondTask(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/launcher3/model/data/y;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p6, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 15
    .line 16
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 17
    .line 18
    invoke-virtual {p6, p2, p3, p1}, Lcom/android/quickstep/util/SplitSelectStateController;->setSecondTask(Landroid/content/Intent;Landroid/os/UserHandle;Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 22
    .line 23
    invoke-virtual {p5, p1}, Ls1/d;->m(Landroid/content/Context;)Ls1/o;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-direct {p0, p4, p2, p1}, Lcom/android/quickstep/util/SplitToWorkspaceController;->startWorkspaceAnimation(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic lambda$handleSecondWidgetSelectionForSplit$0(Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/android/quickstep/util/SplitSelectStateController;->setSecondWidget(Landroid/app/PendingIntent;Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Canvas;

    .line 7
    .line 8
    invoke-direct {p1, p3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p4, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 15
    .line 16
    iget-object p2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget-object p5, p5, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 23
    .line 24
    iget-object p5, p5, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-direct {p1, p2, p5}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p4, p3, p1}, Lcom/android/quickstep/util/SplitToWorkspaceController;->startWorkspaceAnimation(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic lambda$handleSecondWidgetSelectionForSplit$1(Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V
    .locals 7

    .line 1
    new-instance v6, Lcom/android/launcher3/model/data/B;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getCreatorPackage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getCreatorUserHandle()Landroid/os/UserHandle;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v6, v0, v1}, Lcom/android/launcher3/model/data/B;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mIconCache:Ls1/P;

    .line 15
    .line 16
    sget-object v1, Lt1/g;->d:Lt1/g;

    .line 17
    .line 18
    invoke-virtual {v0, v6, v1}, Ls1/P;->I0(Lcom/android/launcher3/model/data/B;Lt1/g;)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 22
    .line 23
    invoke-static {p2, p3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    new-instance v0, Lcom/android/quickstep/util/c1;

    .line 28
    .line 29
    move-object v1, p0

    .line 30
    move-object v2, p1

    .line 31
    move-object v5, p4

    .line 32
    move-object v3, p5

    .line 33
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/c1;-><init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/graphics/Bitmap;Landroid/view/View;Lcom/android/launcher3/model/data/B;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private shouldIgnoreSecondSplitLaunch()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method private startWorkspaceAnimation(Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V
    .locals 13
    .param p1    # Landroid/view/View;
        .annotation build Landroid/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/Bitmap;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    iget-boolean v0, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/quickstep/util/AnimUtils;->getDeviceSplitToConfirmTimings(Z)Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v7, Lcom/android/launcher3/anim/V;

    .line 14
    .line 15
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-long v0, v0

    .line 20
    invoke-direct {v7, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 21
    .line 22
    .line 23
    new-instance v0, Landroid/graphics/Rect;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v5, Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 31
    .line 32
    .line 33
    new-instance v10, Landroid/graphics/RectF;

    .line 34
    .line 35
    invoke-direct {v10}, Landroid/graphics/RectF;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v6, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    move-object v11, v1

    .line 50
    check-cast v11, Lcom/android/quickstep/views/RecentsView;

    .line 51
    .line 52
    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget v2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mHalfDividerSize:I

    .line 57
    .line 58
    iget-object v4, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-interface/range {v1 .. v6}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getFinalSplitPlaceholderBounds(ILcom/android/launcher3/h0;ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 65
    .line 66
    .line 67
    move-object v1, v6

    .line 68
    iget-object v2, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getFirstFloatingTaskView()Lcom/android/quickstep/views/FloatingTaskView;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->getBoundsOnScreen(Landroid/graphics/Rect;)V

    .line 75
    .line 76
    .line 77
    new-instance v6, Landroid/graphics/RectF;

    .line 78
    .line 79
    invoke-direct {v6, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 80
    .line 81
    .line 82
    const/4 v8, 0x0

    .line 83
    const/4 v9, 0x1

    .line 84
    move-object v12, v7

    .line 85
    move-object v7, v5

    .line 86
    move-object v5, v12

    .line 87
    invoke-virtual/range {v4 .. v9}, Lcom/android/quickstep/views/FloatingTaskView;->addConfirmAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 88
    .line 89
    .line 90
    move-object v0, v4

    .line 91
    invoke-virtual {v11}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v3, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v2, v5, v3, v4}, Lcom/android/quickstep/util/SplitAnimationController;->addScrimBehindAnim(Lcom/android/launcher3/anim/V;Lcom/android/quickstep/views/RecentsViewContainer;Landroid/content/Context;)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-object v3, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 110
    .line 111
    move-object/from16 v6, p3

    .line 112
    .line 113
    invoke-static {v3, p1, p2, v6, v10}, Lcom/android/quickstep/views/FloatingTaskView;->getFloatingTaskView(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)Lcom/android/quickstep/views/FloatingTaskView;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    const/high16 p1, 0x3f800000    # 1.0f

    .line 118
    .line 119
    invoke-virtual {v4, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 120
    .line 121
    .line 122
    const/4 v8, 0x1

    .line 123
    const/4 v9, 0x0

    .line 124
    move-object v7, v1

    .line 125
    move-object v6, v10

    .line 126
    invoke-virtual/range {v4 .. v9}, Lcom/android/quickstep/views/FloatingTaskView;->addConfirmAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 127
    .line 128
    .line 129
    new-instance p1, Lcom/android/quickstep/util/SplitToWorkspaceController$1;

    .line 130
    .line 131
    invoke-direct {p1, p0, v0, v4, v2}, Lcom/android/quickstep/util/SplitToWorkspaceController$1;-><init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Lcom/android/quickstep/views/FloatingTaskView;Lcom/android/quickstep/views/FloatingTaskView;Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5, p1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v5}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 142
    .line 143
    .line 144
    return-void
.end method


# virtual methods
.method public handleSecondAppSelectionForSplit(Landroid/view/View;)Z
    .locals 11

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->shouldIgnoreSecondSplitLaunch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    instance-of v0, v4, Lcom/android/launcher3/model/data/I;

    .line 14
    .line 15
    const/4 v9, 0x1

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    move-object v0, v4

    .line 19
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 22
    .line 23
    iget-object v3, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 26
    .line 27
    :goto_0
    move-object v8, v0

    .line 28
    move-object v5, v2

    .line 29
    move-object v6, v3

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    instance-of v0, v4, Lcom/android/launcher3/model/data/d;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    move-object v0, v4

    .line 36
    check-cast v0, Lcom/android/launcher3/model/data/d;

    .line 37
    .line 38
    iget-object v2, v0, Lcom/android/launcher3/model/data/d;->k:Landroid/content/Intent;

    .line 39
    .line 40
    iget-object v3, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 46
    .line 47
    move-object v2, v4

    .line 48
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    new-instance v2, Lcom/android/quickstep/util/e1;

    .line 59
    .line 60
    move-object v3, p0

    .line 61
    move-object v7, p1

    .line 62
    invoke-direct/range {v2 .. v8}, Lcom/android/quickstep/util/e1;-><init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Ljava/lang/Object;Landroid/content/Intent;Landroid/os/UserHandle;Landroid/view/View;Ls1/d;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v10, v1, v2}, Lcom/android/quickstep/util/SplitSelectStateController;->findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V

    .line 66
    .line 67
    .line 68
    return v9

    .line 69
    :cond_2
    move-object v3, p0

    .line 70
    instance-of p0, v4, Lcom/android/launcher3/model/data/l;

    .line 71
    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    iget-object p0, v3, Lcom/android/quickstep/util/SplitToWorkspaceController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/android/quickstep/views/SplitInstructionsView;->goBoing()V

    .line 81
    .line 82
    .line 83
    return v9

    .line 84
    :cond_3
    return v1
.end method

.method public handleSecondWidgetSelectionForSplit(Landroid/view/View;Landroid/app/PendingIntent;Landroid/content/Intent;)Z
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitToWorkspaceController;->shouldIgnoreSecondSplitLaunch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    sget-object v7, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 18
    .line 19
    new-instance v0, Lcom/android/quickstep/util/d1;

    .line 20
    .line 21
    move-object v1, p0

    .line 22
    move-object v5, p1

    .line 23
    move-object v2, p2

    .line 24
    move-object v6, p3

    .line 25
    invoke-direct/range {v0 .. v6}, Lcom/android/quickstep/util/d1;-><init>(Lcom/android/quickstep/util/SplitToWorkspaceController;Landroid/app/PendingIntent;IILandroid/view/View;Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v7, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method
