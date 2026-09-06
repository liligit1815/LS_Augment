.class Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;
.super Ljava/lang/Object;
.source "SplitSelectStateController.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DesktopSplitRecentsAnimationListener"
.end annotation


# instance fields
.field private final mSplitPosition:I

.field private final mTaskBounds:Landroid/graphics/RectF;

.field private final mTempRect:Landroid/graphics/Rect;

.field final synthetic this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;ILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mTaskBounds:Landroid/graphics/RectF;

    .line 19
    .line 20
    iput p2, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mSplitPosition:I

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->lambda$onRecentsAnimationStart$1(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->lambda$onRecentsAnimationStart$0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onRecentsAnimationStart$0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic lambda$onRecentsAnimationStart$1(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->c(Lcom/android/quickstep/util/SplitSelectStateController;)Lcom/android/quickstep/views/RecentsViewContainer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Lcom/android/quickstep/util/Z0;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Lcom/android/quickstep/util/Z0;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v2}, Ljava/util/Optional;->of(Ljava/lang/Object;)Ljava/util/Optional;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, v1, p1, p0}, Lcom/android/quickstep/util/SplitAnimationController;->playAnimPlaceholderToFullscreen(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Ljava/util/Optional;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mSplitPosition:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->P2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->Q2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 12
    .line 13
    :goto_0
    iget-object v2, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 14
    .line 15
    iget-object v3, v2, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->f(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Landroid/app/ActivityManager$RunningTaskInfo;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget v4, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mSplitPosition:I

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-virtual {v3, v2, v4, v5, v1}, Lcom/android/quickstep/util/SplitSelectStateController;->setInitialTaskSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->e(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->d(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 70
    .line 71
    .line 72
    move-result v10

    .line 73
    iget-object v11, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 74
    .line 75
    invoke-interface/range {v6 .. v11}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V

    .line 76
    .line 77
    .line 78
    new-instance v13, Lcom/android/launcher3/anim/V;

    .line 79
    .line 80
    sget-object v1, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 81
    .line 82
    invoke-interface {v1}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    int-to-long v1, v1

    .line 87
    invoke-direct {v13, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 88
    .line 89
    .line 90
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v2, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 97
    .line 98
    invoke-static {v2}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-object v3, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 107
    .line 108
    invoke-static {v3}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->b(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    new-instance v4, Landroid/graphics/RectF;

    .line 113
    .line 114
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-static {v1, v2, v5, v3, v4}, Lcom/android/quickstep/views/FloatingTaskView;->getFloatingTaskView(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)Lcom/android/quickstep/views/FloatingTaskView;

    .line 118
    .line 119
    .line 120
    move-result-object v12

    .line 121
    new-instance v1, Lcom/android/quickstep/util/a1;

    .line 122
    .line 123
    invoke-direct {v1, v0}, Lcom/android/quickstep/util/a1;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v12, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    const/high16 v1, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-virtual {v12, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 132
    .line 133
    .line 134
    iget-object v14, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mTaskBounds:Landroid/graphics/RectF;

    .line 135
    .line 136
    iget-object v15, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 137
    .line 138
    const/16 v16, 0x0

    .line 139
    .line 140
    const/16 v17, 0x1

    .line 141
    .line 142
    invoke-virtual/range {v12 .. v17}, Lcom/android/quickstep/views/FloatingTaskView;->addStagingAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 143
    .line 144
    .line 145
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 148
    .line 149
    invoke-virtual {v1, v12}, Lcom/android/quickstep/util/SplitSelectStateController;->setFirstFloatingTaskView(Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 150
    .line 151
    .line 152
    new-instance v1, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener$1;

    .line 153
    .line 154
    move-object/from16 v2, p1

    .line 155
    .line 156
    invoke-direct {v1, v0, v2, v12}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener$1;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v13, v1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 160
    .line 161
    .line 162
    iget-object v1, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 163
    .line 164
    iget-object v1, v1, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->this$0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 165
    .line 166
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget-object v0, v0, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController$DesktopSplitRecentsAnimationListener;->this$1:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 171
    .line 172
    invoke-static {v0}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->c(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/SplitAnimationController;->getShowSplitInstructionsAnim(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/anim/V;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v13, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v13}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 192
    .line 193
    .line 194
    return-void
.end method
