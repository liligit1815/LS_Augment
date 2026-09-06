.class public Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;
.super Lcom/android/launcher3/popup/P;
.source "TaskShortcutFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TaskShortcutFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FreeformSystemShortcut"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/popup/P<",
        "Lcom/android/quickstep/views/RecentsViewContainer;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FreeformSystemShortcut"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private final mLauncherEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

.field private final mRecentsView:Lcom/android/quickstep/views/RecentsView;

.field private final mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

.field private final mTaskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public constructor <init>(IILcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/TaskContainer;Lcom/android/launcher3/logging/StatsLogManager$e;)V
    .locals 6

    .line 1
    invoke-virtual {p4}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    invoke-virtual {p4}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    move-object v0, p0

    .line 10
    move v1, p1

    .line 11
    move v2, p2

    .line 12
    move-object v3, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iput-object p5, v0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mLauncherEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 17
    .line 18
    new-instance p0, Landroid/os/Handler;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    iput-object p0, v0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mHandler:Landroid/os/Handler;

    .line 28
    .line 29
    invoke-virtual {p4}, Lcom/android/quickstep/views/TaskContainer;->getTaskView()Lcom/android/quickstep/views/TaskView;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, v0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 34
    .line 35
    invoke-interface {v3}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 40
    .line 41
    iput-object p0, v0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 42
    .line 43
    iput-object p4, v0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic J(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->lambda$startActivity$2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->startActivity()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->lambda$onClick$0(Lcom/android/quickstep/views/RecentsView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->lambda$onClick$1(Lcom/android/quickstep/views/RecentsView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onClick$0(Lcom/android/quickstep/views/RecentsView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->returnToHomescreen()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHandler()Landroid/os/Handler;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Lcom/android/quickstep/p5;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/quickstep/p5;-><init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic lambda$onClick$1(Lcom/android/quickstep/views/RecentsView;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/o5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/o5;-><init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Lcom/android/quickstep/views/RecentsView;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, p0, v1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic lambda$startActivity$2(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mRecentsView:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/RecentsView;->setIgnoreResetTask(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private makeLaunchOptions(Lcom/android/quickstep/views/RecentsViewContainer;)Landroid/app/ActivityOptions;
    .locals 4

    .line 1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x5

    .line 6
    invoke-virtual {p0, v0}, Landroid/app/ActivityOptions;->setLaunchWindowingMode(I)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    div-int/lit8 v2, v2, 0x2

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    div-int/lit8 p1, p1, 0x2

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-direct {v1, v3, v3, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    add-int/lit8 p1, p1, 0x32

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v0, v0, 0x32

    .line 50
    .line 51
    invoke-virtual {v1, p1, v0}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Landroid/app/ActivityOptions;->setLaunchBounds(Landroid/graphics/Rect;)Landroid/app/ActivityOptions;

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method private overridePendingAppTransitionMultiThumbFuture(Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture;Ljava/lang/Runnable;Landroid/os/Handler;ZI)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Landroid/view/WindowManagerGlobal;->getWindowManagerService()Landroid/view/IWindowManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture;->getFuture()Landroid/view/IAppTransitionAnimationSpecsFuture;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p3, p2}, Lcom/android/systemui/shared/recents/view/RecentsTransition;->wrapStartedListener(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/IRemoteCallback;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p0, p1, p2, p4, p5}, Landroid/view/IWindowManager;->overridePendingAppTransitionMultiThumbFuture(Landroid/view/IAppTransitionAnimationSpecsFuture;Landroid/os/IRemoteCallback;ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    const-string p1, "FreeformSystemShortcut"

    .line 19
    .line 20
    const-string p2, "Failed to override pending app transition (multi-thumbnail future): "

    .line 21
    .line 22
    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private startActivity()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    check-cast v0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->makeLaunchOptions(Lcom/android/quickstep/views/RecentsViewContainer;)Landroid/app/ActivityOptions;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskContainer;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 20
    .line 21
    iget v5, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v0, v2}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v3, v5, v0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->startActivityFromRecents(ILandroid/app/ActivityOptions;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    new-instance v8, Lcom/android/quickstep/n5;

    .line 38
    .line 39
    invoke-direct {v8, p0, v5}, Lcom/android/quickstep/n5;-><init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;I)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x2

    .line 43
    new-array v0, v0, [I

    .line 44
    .line 45
    iget-object v3, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 46
    .line 47
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getSnapshotView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    int-to-float v4, v4

    .line 59
    iget-object v6, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 60
    .line 61
    invoke-virtual {v6}, Landroid/widget/FrameLayout;->getScaleX()F

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    mul-float/2addr v4, v6

    .line 66
    float-to-int v4, v4

    .line 67
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    int-to-float v6, v6

    .line 72
    iget-object v7, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskView:Lcom/android/quickstep/views/TaskView;

    .line 73
    .line 74
    invoke-virtual {v7}, Landroid/widget/FrameLayout;->getScaleY()F

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    mul-float/2addr v6, v7

    .line 79
    float-to-int v6, v6

    .line 80
    new-instance v7, Landroid/graphics/Rect;

    .line 81
    .line 82
    const/4 v9, 0x0

    .line 83
    aget v9, v0, v9

    .line 84
    .line 85
    aget v0, v0, v2

    .line 86
    .line 87
    add-int/2addr v4, v9

    .line 88
    add-int/2addr v6, v0

    .line 89
    invoke-direct {v7, v9, v0, v4, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lcom/android/launcher3/y0;->S()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnail()Landroid/graphics/Bitmap;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    move-object v6, v0

    .line 105
    goto :goto_0

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->getDimAlpha()F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iget-object v2, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 117
    .line 118
    invoke-virtual {v2}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    const/4 v4, 0x0

    .line 123
    invoke-virtual {v2, v4}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setDimAlpha(F)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    const/high16 v6, 0x3f800000    # 1.0f

    .line 135
    .line 136
    const/high16 v9, -0x1000000

    .line 137
    .line 138
    invoke-static {v2, v4, v3, v6, v9}, Lcom/android/systemui/shared/recents/view/RecentsTransition;->drawViewIntoHardwareBitmap(IILandroid/view/View;FI)Landroid/graphics/Bitmap;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iget-object v3, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 143
    .line 144
    invoke-virtual {v3}, Lcom/android/quickstep/views/TaskContainer;->getThumbnailViewDeprecated()Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-virtual {v3, v0}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->setDimAlpha(F)V

    .line 149
    .line 150
    .line 151
    move-object v6, v2

    .line 152
    :goto_0
    new-instance v2, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;

    .line 153
    .line 154
    iget-object v4, p0, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mHandler:Landroid/os/Handler;

    .line 155
    .line 156
    move-object v3, p0

    .line 157
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut$1;-><init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Landroid/os/Handler;ILandroid/graphics/Bitmap;Landroid/graphics/Rect;)V

    .line 158
    .line 159
    .line 160
    iget-object v9, v3, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mHandler:Landroid/os/Handler;

    .line 161
    .line 162
    const/4 v10, 0x1

    .line 163
    iget v11, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->displayId:I

    .line 164
    .line 165
    move-object v7, v2

    .line 166
    move-object v6, v3

    .line 167
    invoke-direct/range {v6 .. v11}, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->overridePendingAppTransitionMultiThumbFuture(Lcom/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture;Ljava/lang/Runnable;Landroid/os/Handler;ZI)V

    .line 168
    .line 169
    .line 170
    iget-object p0, v3, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 171
    .line 172
    check-cast p0, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 173
    .line 174
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    iget-object v0, v3, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mTaskContainer:Lcom/android/quickstep/views/TaskContainer;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskContainer;->getItemInfo()Lcom/android/launcher3/model/data/E;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    iget-object v0, v3, Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;->mLauncherEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 193
    .line 194
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 195
    .line 196
    .line 197
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 5
    .line 6
    check-cast p1, Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    .line 8
    invoke-interface {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    new-instance v0, Lcom/android/quickstep/m5;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/m5;-><init>(Lcom/android/quickstep/TaskShortcutFactory$FreeformSystemShortcut;Lcom/android/quickstep/views/RecentsView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
