.class Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;
.super Ljava/lang/Object;
.source "SplitWithKeyboardShortcutController.java"

# interfaces
.implements Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SplitWithKeyboardShortcutRecentsAnimationListener"
.end annotation


# instance fields
.field private final mLeftOrTop:Z

.field private final mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

.field private final mTempRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Z)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 4
    iput-boolean p2, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mLeftOrTop:Z

    .line 5
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getRunningTask()Landroid/app/ActivityManager$RunningTaskInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;ZLcom/android/quickstep/util/k1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;-><init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Z)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/FloatingTaskView;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/FloatingTaskView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onRecentsAnimationStart(Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/RecentsAnimationTargets;Landroid/window/TransitionInfo;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->c(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v3, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 12
    .line 13
    iget-boolean v4, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mLeftOrTop:Z

    .line 14
    .line 15
    xor-int/lit8 v5, v4, 0x1

    .line 16
    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$e;->O2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$e;->N2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 23
    .line 24
    :goto_0
    const/4 v6, 0x0

    .line 25
    invoke-virtual {v2, v3, v5, v6, v4}, Lcom/android/quickstep/util/SplitSelectStateController;->setInitialTaskSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/android/quickstep/views/RecentsView;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->f(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->e(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)I

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 63
    .line 64
    .line 65
    move-result-object v10

    .line 66
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 67
    .line 68
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->c(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 73
    .line 74
    .line 75
    move-result v11

    .line 76
    iget-object v12, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 77
    .line 78
    invoke-interface/range {v7 .. v12}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V

    .line 79
    .line 80
    .line 81
    new-instance v14, Lcom/android/launcher3/anim/V;

    .line 82
    .line 83
    sget-object v2, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 84
    .line 85
    invoke-interface {v2}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    int-to-long v2, v2

    .line 90
    invoke-direct {v14, v2, v3}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 91
    .line 92
    .line 93
    new-instance v15, Landroid/graphics/RectF;

    .line 94
    .line 95
    invoke-direct {v15}, Landroid/graphics/RectF;-><init>()V

    .line 96
    .line 97
    .line 98
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 99
    .line 100
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget-object v3, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 105
    .line 106
    invoke-static {v3}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iget-object v4, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 115
    .line 116
    iget v4, v4, Landroid/app/ActivityManager$RunningTaskInfo;->taskId:I

    .line 117
    .line 118
    invoke-virtual {v1, v4}, Lcom/android/quickstep/RecentsAnimationController;->screenshotTask(I)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    invoke-virtual {v4}, Lcom/android/systemui/shared/recents/model/ThumbnailData;->getThumbnail()Landroid/graphics/Bitmap;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-static {v2, v3, v4, v6, v15}, Lcom/android/quickstep/views/FloatingTaskView;->getFloatingTaskView(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)Lcom/android/quickstep/views/FloatingTaskView;

    .line 127
    .line 128
    .line 129
    move-result-object v13

    .line 130
    new-instance v2, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 131
    .line 132
    iget-object v3, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 133
    .line 134
    invoke-direct {v2, v3}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 135
    .line 136
    .line 137
    iget-object v3, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mRunningTaskInfo:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 138
    .line 139
    const/4 v4, 0x0

    .line 140
    invoke-static {v2, v3, v4}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    sget-object v3, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 145
    .line 146
    iget-object v4, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 147
    .line 148
    invoke-static {v4}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lcom/android/quickstep/RecentsModel;

    .line 161
    .line 162
    invoke-virtual {v3}, Lcom/android/quickstep/RecentsModel;->getIconCache()Lcom/android/quickstep/TaskIconCache;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    new-instance v4, Lcom/android/quickstep/util/i1;

    .line 167
    .line 168
    invoke-direct {v4, v13}, Lcom/android/quickstep/util/i1;-><init>(Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3, v2, v4}, Lcom/android/quickstep/TaskIconCache;->getIconInBackground(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/TaskIconCache$GetTaskIconCallback;)Lcom/android/launcher3/util/w;

    .line 172
    .line 173
    .line 174
    const/high16 v2, 0x3f800000    # 1.0f

    .line 175
    .line 176
    invoke-virtual {v13, v2}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 177
    .line 178
    .line 179
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->mTempRect:Landroid/graphics/Rect;

    .line 180
    .line 181
    const/16 v17, 0x0

    .line 182
    .line 183
    const/16 v18, 0x1

    .line 184
    .line 185
    move-object/from16 v16, v2

    .line 186
    .line 187
    invoke-virtual/range {v13 .. v18}, Lcom/android/quickstep/views/FloatingTaskView;->addStagingAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 188
    .line 189
    .line 190
    iget-object v2, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 191
    .line 192
    invoke-static {v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->c(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2, v13}, Lcom/android/quickstep/util/SplitSelectStateController;->setFirstFloatingTaskView(Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 197
    .line 198
    .line 199
    new-instance v2, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener$1;

    .line 200
    .line 201
    invoke-direct {v2, v0, v1, v13}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener$1;-><init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;Lcom/android/quickstep/RecentsAnimationController;Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v14, v2}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 205
    .line 206
    .line 207
    iget-object v1, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 208
    .line 209
    invoke-static {v1}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->c(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/quickstep/util/SplitSelectStateController;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iget-object v0, v0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;->this$0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 218
    .line 219
    invoke-static {v0}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v1, v0}, Lcom/android/quickstep/util/SplitAnimationController;->getShowSplitInstructionsAnim(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/anim/V;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v14, v0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v14}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 239
    .line 240
    .line 241
    return-void
.end method
