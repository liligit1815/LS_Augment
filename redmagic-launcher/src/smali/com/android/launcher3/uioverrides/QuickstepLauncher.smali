.class public Lcom/android/launcher3/uioverrides/QuickstepLauncher;
.super Lcom/android/launcher3/C2;
.source "QuickstepLauncher.java"

# interfaces
.implements Lcom/android/quickstep/views/RecentsViewContainer;
.implements Lcom/android/launcher3/popup/P$c;


# static fields
.field private static final o1:Z

.field private static final p1:Ljava/lang/String;


# instance fields
.field private O0:Lz1/y0$c;

.field private P0:Lcom/android/launcher3/hybridhotseat/b;

.field private Q0:LP1/h;

.field private R0:Lcom/android/launcher3/q5;

.field private S0:Lcom/android/quickstep/views/OverviewActionsView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation
.end field

.field private T0:Lcom/android/quickstep/util/TISBindHelper;

.field private U0:Lcom/android/launcher3/taskbar/V;

.field private V0:LC2/i;

.field private W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

.field private X0:Lcom/android/quickstep/util/SplitSelectStateController;

.field private Y0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

.field private Z0:Lcom/android/quickstep/util/SplitToWorkspaceController;

.field private a1:LN2/h;

.field private b1:Lcom/android/launcher3/util/P1;

.field private c1:Lj1/k;

.field private d1:Landroid/media/permission/SafeCloseable;

.field private e1:Z

.field private f1:Z

.field private g1:Z

.field private h1:Z

.field private final i1:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

.field private final j1:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

.field private k1:Lcom/android/quickstep/views/MiniWindowTipsView;

.field private l1:Lcom/android/quickstep/RecentsAnimationDeviceState;

.field private m1:Z

.field private n1:Lcom/android/quickstep/anim/LauncherContentAnimManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "persist.debug.trace_layouts"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->o1:Z

    .line 9
    .line 10
    const-string v0, "persist.debug.trace_request_layout_class"

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->p1:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/C2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b1:Lcom/android/launcher3/util/P1;

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/uioverrides/u;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/u;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->i1:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 13
    .line 14
    new-instance v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher$a;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->j1:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 20
    .line 21
    new-instance v0, Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/android/quickstep/anim/LauncherContentAnimManager;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->n1:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 27
    .line 28
    return-void
.end method

.method private A5(Lcom/android/launcher3/model/data/y;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/popup/P$i<",
            "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getSplitPositionOptions(Lcom/android/launcher3/h0;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    sget-object v2, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, LF1/b;

    .line 49
    .line 50
    invoke-virtual {v2}, LF1/b;->d()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_1

    .line 55
    .line 56
    new-instance v0, Lcom/android/launcher3/util/y2$b;

    .line 57
    .line 58
    const v2, 0x7f080d72

    .line 59
    .line 60
    .line 61
    const v3, 0x7f140328

    .line 62
    .line 63
    .line 64
    const/4 v4, 0x0

    .line 65
    invoke-direct {v0, v2, v3, v4, v4}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Lcom/android/launcher3/popup/v;->b(Lcom/android/launcher3/util/y2$b;)Lcom/android/launcher3/popup/P$i;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v2, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 73
    .line 74
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->G0:Z

    .line 75
    .line 76
    invoke-static {p0, p1, v2}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkItemSupportSplit(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Z)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    sget-object v2, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->APP_LONG_CLICK_SPLIT_BLACK_LIST:[Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v2}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    new-instance v3, Lcom/android/launcher3/uioverrides/i;

    .line 89
    .line 90
    invoke-direct {v3, p1}, Lcom/android/launcher3/uioverrides/i;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->noneMatch(Ljava/util/function/Predicate;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_3

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p0, p1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkPackageInWindow(Landroid/content/Context;Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_3

    .line 108
    .line 109
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    return-object v1

    .line 113
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lcom/android/launcher3/util/y2$b;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/android/launcher3/popup/v;->b(Lcom/android/launcher3/util/y2$b;)Lcom/android/launcher3/popup/P$i;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    instance-of v2, p1, Lcom/android/launcher3/model/data/A;

    .line 134
    .line 135
    if-nez v2, :cond_2

    .line 136
    .line 137
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_3
    return-object v1

    .line 142
    :cond_4
    :goto_1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 143
    .line 144
    return-object p0
.end method

.method private D5()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/C2;->G:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getActivityFlags()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    and-int/lit8 v0, v0, 0x4

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget v0, p0, Lcom/android/launcher3/C2;->G:I

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, v0, v1, v2}, Lcom/android/launcher3/C2;->onActivityResult(IILandroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v2}, Lcom/android/launcher3/proxy/ProxyActivityStarter;->a(Landroid/content/Context;Lcom/android/launcher3/util/A2;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private F5(LD2/f;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getMainExecutor()Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getMainThreadHandler()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    sget-object v4, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    invoke-virtual {v4}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    const-class v0, Landroid/hardware/display/DisplayManager;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    move-object v7, v0

    .line 22
    check-cast v7, Landroid/hardware/display/DisplayManager;

    .line 23
    .line 24
    const-string v6, "launcher"

    .line 25
    .line 26
    move-object v0, p0

    .line 27
    move-object v1, p1

    .line 28
    invoke-static/range {v0 .. v7}, LC2/h;->a(Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/lang/String;Landroid/hardware/display/DisplayManager;)LC2/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, LC2/c;->b()Ljava/util/Optional;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v1, Lcom/android/launcher3/uioverrides/g;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/android/launcher3/uioverrides/g;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Ljava/util/Optional;->orElseThrow(Ljava/util/function/Supplier;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/android/systemui/unfold/progress/i;

    .line 46
    .line 47
    iput-object p1, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 48
    .line 49
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Lcom/android/quickstep/SystemUiProxy;->setUnfoldAnimationListener(Lcom/android/systemui/unfold/progress/b;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, v0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 61
    .line 62
    invoke-interface {p0}, LC2/c;->a()LE2/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {v0, p1, p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->G5(LC2/i;LE2/c;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private G5(LC2/i;LE2/c;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p0, v1, p1, p2}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/WindowManager;LC2/i;LE2/c;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 11
    .line 12
    return-void
.end method

.method private H5()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->i0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, LD2/e;

    .line 8
    .line 9
    invoke-direct {v0}, LD2/e;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0}, LD2/f;->isEnabled()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->F5(LD2/f;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/quickstep/SystemUiProxy;->getUnfoldTransitionProvider()Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v1, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;

    .line 37
    .line 38
    invoke-direct {v1, p0, v0}, Lcom/android/quickstep/util/unfold/LauncherUnfoldTransitionController;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method private synthetic J5(Landroid/animation/AnimatorSet;Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->o3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, p2}, Lcom/android/quickstep/util/SplitAnimationController;->createPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;Ljava/lang/Long;)Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private synthetic K5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->y0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic L5(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->resetState()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic M5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->m1:Z

    .line 3
    .line 4
    return-void
.end method

.method private synthetic N5(Ljava/lang/Boolean;)Lh4/t;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->S()V

    .line 22
    .line 23
    .line 24
    :goto_0
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 25
    .line 26
    return-object p0
.end method

.method private O3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    const-string v1, "QuickstepLauncher"

    .line 8
    .line 9
    const-string v2, "onDestroyMFV"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->clearRecentsAnimationTargetsMFV()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->clearOnScrollChangedListener()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getIPipAnimationListener()Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0, v1, v1}, Lcom/android/quickstep/views/RecentsView$PinnedStackAnimationListener;->setActivityAndRecentsView(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/quickstep/views/RecentsView;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setPipAnimationListener(Lcom/android/wm/shell/common/pip/b;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 46
    .line 47
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 52
    .line 53
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->k1:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/MiniWindowTipsView;->setLauncher(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->k1:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 63
    .line 64
    :cond_1
    iput-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->l1:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 65
    .line 66
    return-void
.end method

.method private synthetic O5()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->getInstance()Lcom/android/systemui/shared/system/ActivityManagerWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/systemui/shared/system/ActivityManagerWrapper;->invalidateHomeTaskSnapshot(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic P5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->a4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Q5(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Z5(FI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic R5(Lcom/android/launcher3/appprediction/PredictionRowView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/hybridhotseat/b;->L(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictionUiUpdatePaused(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic S5(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object p3, p3, v0

    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object p3, p3, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iget p3, p3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p3, -0x1

    .line 12
    :goto_0
    iput p3, p1, Lcom/android/launcher3/util/y2$c;->g:I

    .line 13
    .line 14
    sget-object p3, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p3, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    check-cast p3, LF1/b;

    .line 25
    .line 26
    invoke-virtual {p3}, LF1/b;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->e6(Lcom/android/launcher3/util/y2$c;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p2, p1}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelect(Lcom/android/launcher3/util/y2$c;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic T5(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/android/quickstep/util/SplitAnimationController;->playAnimPlaceholderToFullscreen(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Ljava/util/Optional;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic V4(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->L5(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V5(I)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->m1:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->m1:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Lcom/android/launcher3/uioverrides/v;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/v;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v1, 0x7d0

    .line 28
    .line 29
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static synthetic W4(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/appprediction/PredictionRowView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R5(Lcom/android/launcher3/appprediction/PredictionRowView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X4(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/animation/AnimatorSet;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->J5(Landroid/animation/AnimatorSet;Ljava/lang/Long;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private X5(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->P0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic Y4(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y5(Z)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getActivityFlags()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    and-int/2addr v1, v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v4, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 25
    .line 26
    if-eq v0, v4, :cond_0

    .line 27
    .line 28
    sget-object v4, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 29
    .line 30
    if-ne v0, v4, :cond_1

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isUserActive()Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-nez v4, :cond_1

    .line 43
    .line 44
    iget-boolean v4, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->h1:Z

    .line 45
    .line 46
    if-nez v4, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move v2, v3

    .line 50
    :goto_0
    sget-object v4, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 51
    .line 52
    invoke-virtual {v4, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/android/quickstep/SystemUiProxy;

    .line 57
    .line 58
    iget v1, v1, Lcom/android/launcher3/h0;->f2:I

    .line 59
    .line 60
    invoke-virtual {v4, v2, v1}, Lcom/android/quickstep/SystemUiProxy;->setLauncherKeepClearAreaHeight(ZI)V

    .line 61
    .line 62
    .line 63
    :cond_2
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 64
    .line 65
    if-ne v0, v1, :cond_3

    .line 66
    .line 67
    if-nez p1, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 74
    .line 75
    invoke-virtual {p0, v3}, Lcom/android/quickstep/views/RecentsView;->setSwipeDownShouldLaunchApp(Z)V

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void
.end method

.method public static synthetic Z4(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->K5(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Z5(FI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/V;->s0(FI)V

    .line 25
    .line 26
    .line 27
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic a5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b5()Ljava/lang/IllegalStateException;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string v1, "Trying to create getRemoteTransitionProgress when the transition is disabled"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic c5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->O5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S5(Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->M5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e6(Lcom/android/launcher3/util/y2$c;)V
    .locals 14

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f070a90

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f070a8f

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    new-instance v7, Landroid/graphics/Rect;

    .line 27
    .line 28
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v8, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 32
    .line 33
    iget-object v9, p1, Lcom/android/launcher3/util/y2$c;->c:Landroid/content/Intent;

    .line 34
    .line 35
    iget-object v0, p1, Lcom/android/launcher3/util/y2$c;->d:Lcom/android/launcher3/util/y2$b;

    .line 36
    .line 37
    iget v10, v0, Lcom/android/launcher3/util/y2$b;->c:I

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->b()Lcom/android/launcher3/model/data/y;

    .line 40
    .line 41
    .line 42
    move-result-object v11

    .line 43
    iget-object v12, p1, Lcom/android/launcher3/util/y2$c;->f:Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 44
    .line 45
    iget v13, p1, Lcom/android/launcher3/util/y2$c;->g:I

    .line 46
    .line 47
    invoke-virtual/range {v8 .. v13}, Lcom/android/quickstep/util/SplitSelectStateController;->setInitialTaskSelect(Landroid/content/Intent;ILcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/StatsLogManager$d;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 67
    .line 68
    .line 69
    move-result v6

    .line 70
    invoke-interface/range {v2 .. v7}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getInitialSplitPlaceholderBounds(IILcom/android/launcher3/h0;ILandroid/graphics/Rect;)V

    .line 71
    .line 72
    .line 73
    new-instance v6, Lcom/android/launcher3/anim/V;

    .line 74
    .line 75
    sget-object v0, Lcom/android/quickstep/util/SplitAnimationTimings;->TABLET_HOME_TO_SPLIT:Lcom/android/quickstep/util/SplitAnimationTimings;

    .line 76
    .line 77
    invoke-interface {v0}, Lcom/android/quickstep/util/SplitAnimationTimings;->getDuration()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-long v0, v0

    .line 82
    invoke-direct {v6, v0, v1}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 83
    .line 84
    .line 85
    move-object v8, v7

    .line 86
    new-instance v7, Landroid/graphics/RectF;

    .line 87
    .line 88
    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->c()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->a()Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-static {p0, v0, v1, v2, v7}, Lcom/android/quickstep/views/FloatingTaskView;->getFloatingTaskView(Lcom/android/quickstep/views/RecentsViewContainer;Landroid/view/View;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Landroid/graphics/RectF;)Lcom/android/quickstep/views/FloatingTaskView;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    const/high16 v0, 0x3f800000    # 1.0f

    .line 105
    .line 106
    invoke-virtual {v5, v0}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 107
    .line 108
    .line 109
    const/4 v9, 0x0

    .line 110
    const/4 v10, 0x1

    .line 111
    invoke-virtual/range {v5 .. v10}, Lcom/android/quickstep/views/FloatingTaskView;->addStagingAnimation(Lcom/android/launcher3/anim/V;Landroid/graphics/RectF;Landroid/graphics/Rect;ZZ)V

    .line 112
    .line 113
    .line 114
    new-instance v0, Lcom/android/launcher3/uioverrides/k;

    .line 115
    .line 116
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/k;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v5, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->b()Lcom/android/launcher3/model/data/y;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 127
    .line 128
    invoke-virtual {v5, p1}, Landroid/widget/FrameLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 132
    .line 133
    invoke-virtual {p1, v5}, Lcom/android/quickstep/util/SplitSelectStateController;->setFirstFloatingTaskView(Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 134
    .line 135
    .line 136
    new-instance p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;

    .line 137
    .line 138
    invoke-direct {p1, p0, v5}, Lcom/android/launcher3/uioverrides/QuickstepLauncher$b;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/views/FloatingTaskView;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v6, p1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {p1, p0}, Lcom/android/quickstep/util/SplitAnimationController;->getShowSplitInstructionsAnim(Lcom/android/quickstep/views/RecentsViewContainer;)Lcom/android/launcher3/anim/V;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v6, p0}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v6}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public static synthetic f5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T5(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f6(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/KeyEvent;->isCanceled()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->l2()Landroid/window/OnBackAnimationCallback;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Landroid/window/OnBackAnimationCallback;->onBackInvoked()V

    .line 27
    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public static synthetic g5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/lang/Boolean;)Lh4/t;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->N5(Ljava/lang/Boolean;)Lh4/t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h5(Lcom/android/launcher3/util/z2;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->isAggregatedVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of v0, p1, Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z2;->b(Lcom/android/launcher3/model/data/y;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public static synthetic i5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X5(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j5(Landroid/os/UserHandle;Ljava/lang/String;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isAggregatedVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    instance-of v0, p2, Lcom/android/launcher3/model/data/y;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 16
    .line 17
    iget v0, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public static synthetic k5(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static synthetic l5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q5(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic m5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Lcom/android/quickstep/util/SplitSelectStateController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic n5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Landroid/window/OnBackAnimationCallback;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->l2()Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static synthetic o5(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)Landroid/window/OnBackAnimationCallback;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->l2()Landroid/window/OnBackAnimationCallback;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private onTISConnected(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/g3;->N0(Lcom/android/launcher3/statemanager/h;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->f1:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/TISBindHelper;->setPredictiveBackToHomeInProgress(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getDeviceState()Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->l1:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 24
    .line 25
    return-void
.end method

.method public static w5(Landroid/content/Context;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public A1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->d0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public B3(Lcom/android/launcher3/apppairs/AppPairIcon;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getAppPairsController()Lcom/android/quickstep/util/AppPairsController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/uioverrides/n;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/n;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 10
    .line 11
    .line 12
    const/16 p0, 0x5b

    .line 13
    .line 14
    invoke-virtual {v0, p1, p0, v1}, Lcom/android/quickstep/util/AppPairsController;->launchAppPair(Lcom/android/launcher3/apppairs/AppPairIcon;ILjava/util/function/Consumer;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public B5()Lcom/android/launcher3/taskbar/V;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    return-object p0
.end method

.method public C5()LC2/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 2
    .line 3
    return-object p0
.end method

.method protected D4(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "showAllAppsFromIntent CLOSE_SYSTEM_WINDOWS_REASON_HOME_KEY: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    new-instance v1, Ljava/lang/Throwable;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "QuickstepLauncher"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    const-string v0, "homekey"

    .line 41
    .line 42
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->D4(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method protected E2(Landroid/content/Intent;)V
    .locals 1

    .line 1
    sget-object v0, Lf1/a;->s:Lf1/a$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lf1/a$a;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->E2(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public E5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b1:Lcom/android/launcher3/util/P1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method protected F2(Lcom/android/launcher3/logging/StatsLogManager$d;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->F2(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0, p1}, Lcom/android/quickstep/util/SplitAnimationController;->playPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected G2(Lcom/android/launcher3/F1;)Z
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->G2(Lcom/android/launcher3/F1;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/pm/ApplicationInfo;->isOnBackInvokedCallbackEnabled()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput-boolean v1, v0, Lcom/android/launcher3/h0;->L0:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 28
    .line 29
    iget p0, p0, Lcom/android/launcher3/h0;->B1:I

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/android/quickstep/SystemUiProxy;->setLauncherAppIconSize(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return p1
.end method

.method public I(Ljava/util/function/Predicate;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->I(Ljava/util/function/Predicate;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/android/launcher3/hybridhotseat/b;->E(Ljava/util/function/Predicate;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lx1/O;->C3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-static {p0}, Lx1/O;->H2(Lcom/android/launcher3/C2;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->T()Lcom/android/launcher3/MFVDockExpandSupport;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/MFVDockExpandSupport;->r()Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lcom/android/launcher3/model/data/I;

    .line 62
    .line 63
    invoke-interface {p1, v2}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v4, "bindWorkspaceComponentsRemoved "

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object v4, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    const-string v4, "QuickstepLauncher"

    .line 89
    .line 90
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_3

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 118
    .line 119
    const/4 v1, 0x0

    .line 120
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/C2;->Q3(Lcom/android/launcher3/model/data/I;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    :goto_2
    return-void
.end method

.method public I3(F)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->I3(F)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Z5(FI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I5()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->g1:Z

    .line 2
    .line 3
    return p0
.end method

.method public K4()V
    .locals 11

    .line 1
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    move v1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/view/Display;->getDisplayId()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :goto_0
    invoke-virtual {v0, v2, v1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTask()Landroid/app/TaskInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_6

    .line 35
    .line 36
    new-instance v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 37
    .line 38
    invoke-direct {v3, v1}, Lcom/android/systemui/shared/recents/model/Task$TaskKey;-><init>(Landroid/app/TaskInfo;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v3, v1, v2}, Lcom/android/systemui/shared/recents/model/Task;->from(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Landroid/app/TaskInfo;Z)Lcom/android/systemui/shared/recents/model/Task;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {v6}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v6}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    array-length v0, v0

    .line 74
    const/4 v1, 0x1

    .line 75
    if-le v0, v1, :cond_3

    .line 76
    .line 77
    :cond_2
    const v0, 0x7f140270

    .line 78
    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V5(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    iget-boolean v0, v6, Lcom/android/systemui/shared/recents/model/Task;->isDockable:Z

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->G0:Z

    .line 93
    .line 94
    invoke-static {p0, v6, v0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkTaskSupportSplit(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;Z)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    move-object v4, p0

    .line 106
    check-cast v4, Lcom/android/quickstep/views/RecentsView;

    .line 107
    .line 108
    if-eqz v4, :cond_6

    .line 109
    .line 110
    invoke-static {v2}, Lcom/android/launcher3/util/y2;->a(I)Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    const/4 v10, 0x0

    .line 115
    const/4 v5, 0x0

    .line 116
    const/4 v7, 0x0

    .line 117
    const/4 v8, 0x0

    .line 118
    invoke-virtual/range {v4 .. v10}, Lcom/android/quickstep/views/RecentsView;->initiateSplitSelectMFV(Lcom/android/quickstep/views/TaskView;Lcom/android/systemui/shared/recents/model/Task;IZLcom/android/launcher3/logging/StatsLogManager$d;Z)Z

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_5
    :goto_1
    const v0, 0x7f140408

    .line 123
    .line 124
    .line 125
    invoke-direct {p0, v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V5(I)V

    .line 126
    .line 127
    .line 128
    :cond_6
    return-void
.end method

.method public L2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/q5;->E:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public L4(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public M1()Lcom/android/quickstep/anim/LauncherContentAnimManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->n1:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public O()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->O()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/hybridhotseat/b;->Q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public T3(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->T3(Z)V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->h1:Z

    .line 5
    .line 6
    return-void
.end method

.method public U5(Lcom/android/quickstep/util/SplitTask;Landroid/window/RemoteTransition;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getTopLeftTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 8
    .line 9
    iget v2, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getBottomRightTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 16
    .line 17
    iget v3, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 18
    .line 19
    new-instance v5, Lcom/android/launcher3/uioverrides/o;

    .line 20
    .line 21
    invoke-direct {v5, p0}, Lcom/android/launcher3/uioverrides/o;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/quickstep/util/SplitTask;->getSplitBounds()Lcom/android/launcher3/util/y2$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget v7, p0, Lcom/android/launcher3/util/y2$a;->h:I

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v6, 0x0

    .line 33
    move-object v8, p2

    .line 34
    invoke-virtual/range {v0 .. v8}, Lcom/android/quickstep/util/SplitSelectStateController;->launchExistingSplitPair(Lcom/android/quickstep/views/GroupedTaskView;IIILjava/util/function/Consumer;ZILandroid/window/RemoteTransition;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method protected W5(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Z0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/quickstep/util/SplitToWorkspaceController;->handleSecondAppSelectionForSplit(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Lcom/android/launcher3/C2;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public Y2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/q5;->D:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->h0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public Z0()Z
    .locals 1

    .line 1
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LP1/k;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplayId()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, LP1/k;->s(I)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public Z2()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public a6(LN2/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->a1:LN2/h;

    .line 2
    .line 3
    return-void
.end method

.method public b6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->g1:Z

    .line 2
    .line 3
    return-void
.end method

.method public c4(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->c4(Lcom/android/launcher3/V3;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->D5()V

    .line 5
    .line 6
    .line 7
    iget p1, p1, Lcom/android/launcher3/V3;->a:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    const/16 v1, 0x8

    .line 11
    .line 12
    if-eq p1, v0, :cond_7

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    if-eq p1, v0, :cond_3

    .line 16
    .line 17
    const/4 v0, 0x7

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    if-eq p1, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->performHapticFeedback(I)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lx1/Z;->d()Landroid/util/Pair;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p0, Ljava/lang/Integer;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eq v0, p0, :cond_2

    .line 75
    .line 76
    new-instance p0, Lcom/android/launcher3/I1;

    .line 77
    .line 78
    invoke-direct {p0, p1}, Lcom/android/launcher3/I1;-><init>(Lcom/android/launcher3/Workspace;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 82
    .line 83
    .line 84
    :cond_2
    :goto_0
    return-void

    .line 85
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/android/quickstep/views/RecentsView;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getCurrentPageTaskView()Lcom/android/quickstep/views/TaskView;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p1}, Lcom/android/quickstep/views/RecentsView;->getFirstTaskView()Lcom/android/quickstep/views/TaskView;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    if-nez v0, :cond_5

    .line 100
    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_4
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logQuickSwitchFromHomeFailed(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    :goto_1
    if-nez v0, :cond_6

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-static {p1}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logQuickSwitchFromHomeFallback(I)V

    .line 128
    .line 129
    .line 130
    move-object v0, v1

    .line 131
    :cond_6
    new-instance p1, Lcom/android/launcher3/uioverrides/q;

    .line 132
    .line 133
    invoke-direct {p1, p0}, Lcom/android/launcher3/uioverrides/q;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p1}, Lcom/android/quickstep/views/TaskView;->launchWithoutAnimation(Lu4/l;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->getPageAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    const/4 p1, 0x0

    .line 155
    invoke-static {p0, v1, p1}, Lcom/android/launcher3/compat/AccessibilityManagerCompat;->sendCustomAccessibilityEvent(Landroid/view/View;ILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public c6(Lcom/android/quickstep/views/MiniWindowTipsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->k1:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 2
    .line 3
    return-void
.end method

.method public canStartHomeSafely()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper;->canStartHomeSafely()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public checkStateIfGesture()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public collectStateHandlers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/statemanager/d$f<",
            "Lcom/android/launcher3/V3;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->collectStateHandlers(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/uioverrides/U;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/U;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public createAtomicAnimationFactory()Lcom/android/launcher3/statemanager/d$d;
    .locals 1

    .line 1
    new-instance v0, Lf2/h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lf2/h;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(Landroid/content/pm/ShortcutInfo;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->showShortcutBubble(Landroid/content/pm/ShortcutInfo;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->f1:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TISBindHelper;->setPredictiveBackToHomeInProgress(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public dispatchDeviceProfileChanged()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->dispatchDeviceProfileChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->g1()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-wide/16 v1, 0x1000

    .line 13
    .line 14
    const-string v3, "QuickstepLauncher#DeviceProfileChanged"

    .line 15
    .line 16
    invoke-static {v1, v2, v3, v0}, Landroid/os/Trace;->instantForTrack(JLjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 28
    .line 29
    iget v1, v1, Lcom/android/launcher3/h0;->B1:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/SystemUiProxy;->setLauncherAppIconSize(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    const-string v0, "QuickstepLauncher#onDeviceProfileChanged"

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/taskbar/g3;->P(Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->f6(Landroid/view/KeyEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/C2;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, p1, p3}, LP1/h;->w(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Lcom/android/quickstep/views/RecentsView;

    .line 16
    .line 17
    const-string p4, "\nQuickstepLauncher:"

    .line 18
    .line 19
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance p4, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v0, "\tmOrientationState: "

    .line 31
    .line 32
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    const-string v0, "recentsNull"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_0
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/android/quickstep/views/RecentsView;->getSplitSelectController()Lcom/android/quickstep/util/SplitSelectStateController;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2, p1, p3}, Lcom/android/quickstep/util/SplitSelectStateController;->dump(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    new-instance p4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, "\t"

    .line 76
    .line 77
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v0, "RingAppearAnimation\t"

    .line 81
    .line 82
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    invoke-virtual {p2, p4, p3}, Lcom/android/launcher3/q5;->W(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object p2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 93
    .line 94
    if-eqz p2, :cond_4

    .line 95
    .line 96
    invoke-virtual {p2, p1, p3}, Lcom/android/launcher3/hybridhotseat/b;->n(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-class p2, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 108
    .line 109
    invoke-virtual {p0, p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 114
    .line 115
    invoke-virtual {p0, p1, p3}, Lcom/android/launcher3/appprediction/PredictionRowView;->i(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public e4(Lcom/android/launcher3/V3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/V;->r0(Lcom/android/launcher3/V3;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public enterStageSplitFromRunningApp(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Y0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->enterStageSplit(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public finishAppClosingAnim(ZLjava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->c0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 13
    .line 14
    if-eqz v0, :cond_7

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {v1, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/android/quickstep/TaskAnimationManager;->isRecentsAnimationRunning()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p1, v0, v0, p2}, Lcom/android/quickstep/TaskAnimationManager;->finishRunningRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    if-eqz p2, :cond_2

    .line 56
    .line 57
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->r5()Lcom/android/launcher3/q5;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/4 p2, 0x0

    .line 65
    if-eqz p1, :cond_5

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/android/launcher3/q5;->g0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-nez v2, :cond_4

    .line 78
    .line 79
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/q5;->v0()Lcom/android/quickstep/util/animation/AnimationRecord;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->isRectFSpringAnimRunning()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_5

    .line 90
    .line 91
    :cond_4
    invoke-virtual {v1}, Lcom/android/quickstep/util/animation/AnimationRecord;->getMMultiAnimatorSet()Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const/4 v1, 0x7

    .line 96
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->end(I)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 100
    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Lcom/android/quickstep/util/BaseDepthController;->resetWallpaperScale(F)V

    .line 104
    .line 105
    .line 106
    :cond_5
    invoke-static {p0}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 115
    .line 116
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->g0:Z

    .line 117
    .line 118
    if-eqz p1, :cond_6

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    const/4 v0, 0x0

    .line 122
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 123
    .line 124
    if-eqz p1, :cond_7

    .line 125
    .line 126
    invoke-virtual {p1}, LP1/h;->y()F

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    cmpl-float p1, p1, p2

    .line 131
    .line 132
    if-lez p1, :cond_7

    .line 133
    .line 134
    if-nez v0, :cond_7

    .line 135
    .line 136
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 137
    .line 138
    invoke-interface {p0, p1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_7

    .line 143
    .line 144
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 145
    .line 146
    invoke-virtual {p0, p2}, Lcom/android/quickstep/util/BaseDepthController;->setDepth(F)V

    .line 147
    .line 148
    .line 149
    :cond_7
    return-void
.end method

.method public finishFolderAnim()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/launcher3/folder/Folder;->c1()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, LP1/h;->z()Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->cancelImmediately()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public getActionsView()Lcom/android/quickstep/views/OverviewActionsView;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/views/OverviewActionsView<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    move-object v1, p2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    instance-of v1, v1, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/q5;->f0(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_1

    .line 30
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/v;->getActivityLaunchOptions(Landroid/view/View;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/b;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_1
    iget-wide v1, p0, Lcom/android/launcher3/C2;->N:J

    .line 35
    .line 36
    const-wide/16 v3, 0x0

    .line 37
    .line 38
    cmp-long v3, v1, v3

    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    if-lez v3, :cond_3

    .line 42
    .line 43
    iget-object v3, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 44
    .line 45
    invoke-virtual {v3, v4, v1, v2}, Landroid/app/ActivityOptions;->setSourceInfo(IJ)V

    .line 46
    .line 47
    .line 48
    :cond_3
    invoke-static {p0, p2}, Lx1/S;->l(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    iget-object p0, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_4
    if-eqz p2, :cond_6

    .line 62
    .line 63
    iget p0, p2, Lcom/android/launcher3/model/data/y;->animationType:I

    .line 64
    .line 65
    const/4 p2, 0x2

    .line 66
    if-eq p0, p2, :cond_5

    .line 67
    .line 68
    if-ne p0, v4, :cond_6

    .line 69
    .line 70
    :cond_5
    iget-object p0, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_6
    iget-object p0, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 77
    .line 78
    invoke-virtual {p0, v4}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 79
    .line 80
    .line 81
    :goto_2
    iget-object p0, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 82
    .line 83
    if-eqz p1, :cond_7

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    if-eqz p2, :cond_7

    .line 90
    .line 91
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    :cond_7
    invoke-virtual {p0, v1}, Landroid/app/ActivityOptions;->setLaunchDisplayId(I)Landroid/app/ActivityOptions;

    .line 100
    .line 101
    .line 102
    iget-object p0, v0, Lcom/android/launcher3/util/b;->a:Landroid/app/ActivityOptions;

    .line 103
    .line 104
    invoke-virtual {p0, v4}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 105
    .line 106
    .line 107
    return-object v0
.end method

.method public getIfIgnorestylusGesture()Z
    .locals 1

    .line 1
    sget-boolean v0, Lx1/O;->T:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->l1:Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getIgnorestylusGesture()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/uioverrides/p;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/p;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic getTaskbarUIController()Lcom/android/launcher3/taskbar/o4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/android/launcher3/util/z0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->h(Lcom/android/launcher3/util/z0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lz1/W4;->r:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->updateRegisteredViewsIfNeeded()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public h1(Landroid/app/TaskInfo;)Z
    .locals 0

    .line 1
    iget p1, p1, Landroid/app/TaskInfo;->taskId:I

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->checkTaskIdInSmallWindow(Landroid/content/Context;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public handleIncorrectSplitTargetSelection()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitInstructionsView()Lcom/android/quickstep/views/SplitInstructionsView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/SplitInstructionsView;->goBoing()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public hasBubbles()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->c0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isBubbleBarEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->d0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isRecentsViewVisible()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/V3;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/V3;->c:Z

    .line 12
    .line 13
    return p0
.end method

.method public isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/Display;->getDisplayId()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TaskAnimationManager;->isSpecifiedPackageRecentsClosing(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public isSplitSelectionActive()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->isSplitSelectActive()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public k2()[F
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/android/launcher3/util/C1;->g:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x2

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    new-array p0, v2, [F

    .line 13
    .line 14
    const/high16 v2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    aput v2, p0, v1

    .line 17
    .line 18
    aput v2, p0, v0

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-array p0, v2, [F

    .line 22
    .line 23
    const v2, 0x3f8ccccd    # 1.1f

    .line 24
    .line 25
    .line 26
    aput v2, p0, v1

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    aput v1, p0, v0

    .line 30
    .line 31
    return-object p0
.end method

.method protected l1(ZZZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/C2;->l1(ZZZ)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    const-string p0, "homekey"

    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public logAppLaunch(Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2;->P:Lcom/android/launcher3/logging/d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p3, p0, Lcom/android/launcher3/C2;->P:Lcom/android/launcher3/logging/d;

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1, p2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1, p3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->O0:Lz1/y0$c;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iget v1, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 40
    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    const/4 v2, 0x6

    .line 44
    if-ne v1, v2, :cond_3

    .line 45
    .line 46
    :cond_1
    iget-object v0, v0, Lz1/y0$c;->b:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x0

    .line 53
    :goto_0
    if-ge v1, v0, :cond_3

    .line 54
    .line 55
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->O0:Lz1/y0$c;

    .line 56
    .line 57
    iget-object v2, v2, Lz1/y0$c;->b:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    iget v3, v2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 66
    .line 67
    iget v4, p2, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 68
    .line 69
    if-ne v3, v4, :cond_2

    .line 70
    .line 71
    iget-object v3, v2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 72
    .line 73
    iget-object v4, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 74
    .line 75
    invoke-virtual {v3, v4}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_2

    .line 80
    .line 81
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    invoke-interface {p1, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withRank(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    :goto_1
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 103
    .line 104
    invoke-interface {p1, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 108
    .line 109
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/hybridhotseat/b;->A(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/logging/d;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public makeDefaultActivityOptions(I)Lcom/android/launcher3/util/b;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/Y1;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, v1, v1}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Landroid/app/ActivityOptions;->setSplashScreenStyle(I)Landroid/app/ActivityOptions;

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    invoke-virtual {v1, p1}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p0}, Lcom/android/quickstep/util/AnimUtils;->completeRunnableListCallback(Lcom/android/launcher3/util/Y1;Lcom/android/launcher3/views/k;)Landroid/os/IRemoteCallback;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v1, p0}, Landroid/app/ActivityOptions;->setOnAnimationAbortListener(Landroid/os/IRemoteCallback;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Landroid/app/ActivityOptions;->setOnAnimationFinishedListener(Landroid/os/IRemoteCallback;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Lcom/android/launcher3/util/b;

    .line 29
    .line 30
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/util/b;-><init>(Landroid/app/ActivityOptions;Lcom/android/launcher3/util/Y1;)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public n2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "orientedStateLog: "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedViewOrientedState()Lcom/android/quickstep/util/RecentsOrientedState;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "QuickstepLauncher"

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method protected onActivityFlagsChanged(I)V
    .locals 2

    .line 1
    and-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, LP1/h;->G(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    and-int/lit8 v0, p1, 0x2

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lf1/a;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/V;->F(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onActivityFlagsChanged(I)V

    .line 36
    .line 37
    .line 38
    and-int/lit8 p1, p1, 0x55

    .line 39
    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getActivityFlags()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    and-int/lit8 p1, p1, 0x40

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p1, 0x0

    .line 53
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Y5(Z)V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Y5(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string v0, "launcher.pending_split_select_info"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/util/F1;->b(Landroid/os/IBinder;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/android/launcher3/util/P1;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b1:Lcom/android/launcher3/util/P1;

    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/android/launcher3/v;->addMultiWindowModeChangedListener(Lcom/android/launcher3/v$a;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->H5()V

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, LL0/u;->d(Landroid/content/Context;)LL0/n;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, LL0/n;->r(Landroid/view/Window;)Landroid/media/permission/SafeCloseable;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->d1:Landroid/media/permission/SafeCloseable;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const/16 v0, 0x200

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/view/Window;->addPrivateFlags(I)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Lcom/android/quickstep/util/QuickstepOnboardingPrefs;->setup(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 52
    .line 53
    .line 54
    sget-boolean p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->o1:Z

    .line 55
    .line 56
    invoke-static {p1}, Landroid/view/View;->setTraceLayoutSteps(Z)V

    .line 57
    .line 58
    .line 59
    sget-object p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->p1:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Landroid/view/View;->setTracedRequestLayoutClassClass(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p1, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/android/quickstep/OverviewComponentObserver;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->i1:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Lcom/android/quickstep/OverviewComponentObserver;->addOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sparse-switch v1, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v1, "AnalogClock"

    .line 14
    .line 15
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x3

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v1, "TextClock"

    .line 25
    .line 26
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v0, 0x2

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v1, "android.widget.TextClock"

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v0, 0x1

    .line 45
    goto :goto_0

    .line 46
    :sswitch_3
    const-string v1, "android.widget.AnalogClock"

    .line 47
    .line 48
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v0, 0x0

    .line 56
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 57
    .line 58
    .line 59
    invoke-super {p0, p1, p2, p3, p4}, Landroid/app/Activity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :pswitch_0
    new-instance p1, Landroid/widget/TextClock;

    .line 65
    .line 66
    invoke-direct {p1, p3, p4}, Landroid/widget/TextClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    .line 68
    .line 69
    sget-object p2, Lcom/android/quickstep/util/AsyncClockEventDelegate;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Landroid/widget/TextClock$ClockEventDelegate;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Landroid/widget/TextClock;->setClockEventDelegate(Landroid/widget/TextClock$ClockEventDelegate;)V

    .line 78
    .line 79
    .line 80
    return-object p1

    .line 81
    :pswitch_1
    new-instance p1, Landroid/widget/AnalogClock;

    .line 82
    .line 83
    invoke-direct {p1, p3, p4}, Landroid/widget/AnalogClock;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 84
    .line 85
    .line 86
    sget-object p2, Lcom/android/quickstep/util/AsyncClockEventDelegate;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Landroid/widget/TextClock$ClockEventDelegate;

    .line 93
    .line 94
    invoke-virtual {p1, p0}, Landroid/widget/AnalogClock;->setClockEventDelegate(Landroid/widget/TextClock$ClockEventDelegate;)V

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    nop

    .line 99
    :sswitch_data_0
    .sparse-switch
        -0x6115e5ed -> :sswitch_3
        0x1cee1d36 -> :sswitch_2
        0x380bfac1 -> :sswitch_1
        0x6a06c0de -> :sswitch_0
    .end sparse-switch

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onDeferredResumed()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->onDeferredResumed()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->D5()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/q5;->O0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->f1:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 19
    .line 20
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Lcom/android/quickstep/SystemUiProxy;->setUnfoldAnimationListener(Lcom/android/systemui/unfold/progress/b;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->V0:LC2/i;

    .line 30
    .line 31
    invoke-interface {v0}, LC2/i;->destroy()V

    .line 32
    .line 33
    .line 34
    :cond_1
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->i1:Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/android/quickstep/OverviewComponentObserver;->removeOverviewChangeListener(Lcom/android/quickstep/OverviewComponentObserver$OverviewChangeListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/quickstep/util/TISBindHelper;->onDestroy()V

    .line 52
    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 55
    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->onDestroy()V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->onDestroy()V

    .line 66
    .line 67
    .line 68
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->destroy()V

    .line 77
    .line 78
    .line 79
    :cond_5
    invoke-direct {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->O3()V

    .line 80
    .line 81
    .line 82
    invoke-super {p0}, Lcom/android/launcher3/C2;->onDestroy()V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/android/launcher3/hybridhotseat/b;->m()V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->d1:Landroid/media/permission/SafeCloseable;

    .line 91
    .line 92
    if-eqz v0, :cond_6

    .line 93
    .line 94
    invoke-interface {v0}, Landroid/media/permission/SafeCloseable;->close()V

    .line 95
    .line 96
    .line 97
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitBackHandler()Lcom/android/launcher3/util/l;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->m4(Lcom/android/launcher3/util/l;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/v;->onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V

    .line 2
    .line 3
    .line 4
    and-int/lit8 p1, p3, 0x1

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/statemanager/d;->T(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    and-int/lit8 p1, p3, 0x10

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/DragLayer;->recreateControllers()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public onEnterAnimationComplete()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->onEnterAnimationComplete()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/RecentsModel;->getThumbnailCache()Lcom/android/quickstep/TaskThumbnailCache;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/TaskThumbnailCache;->getHighResLoadingState()Lcom/android/quickstep/HighResLoadingState;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Lcom/android/quickstep/HighResLoadingState;->setVisible(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/quickstep/util/TISBindHelper;->getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewCommandHelper;->clearPendingCommands()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->onPause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/C2;->onPause()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isBothSplitAppsConfirmed()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->isLaunchingFirstAppFullscreen()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 28
    .line 29
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->q3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/SplitSelectStateController;->logExitReason(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitAnimationController()Lcom/android/quickstep/util/SplitAnimationController;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p0, v1}, Lcom/android/quickstep/util/SplitAnimationController;->playPlaceholderDismissAnim(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lf1/a;->b()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->k0()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->W0:Lcom/android/quickstep/util/LauncherUnfoldAnimationController;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/quickstep/util/LauncherUnfoldAnimationController;->onResume()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lf1/a;->b()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->m0()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/V3;->z:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/util/P1;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/android/quickstep/util/SplitSelectStateController;->getInitialTaskId()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/android/quickstep/util/SplitSelectStateController;->getActiveSplitStagePosition()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitEvent()Lcom/android/launcher3/logging/StatsLogManager$d;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-direct {v0, v1, v2, p0}, Lcom/android/launcher3/util/P1;-><init>(IILcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/util/F1;->c(Ljava/lang/Object;)Landroid/os/IBinder;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "launcher.pending_split_select_info"

    .line 40
    .line 41
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putIBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 45
    .line 46
    iget p0, p0, Lcom/android/launcher3/V3;->a:I

    .line 47
    .line 48
    const-string v0, "launcher.state"

    .line 49
    .line 50
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public bridge synthetic onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->c4(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/C2;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lf1/a;->b()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/V;->n0()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->onTrimMemory(I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/android/quickstep/RecentsModel;->onTrimMemory(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onUiChangedWhileSleeping()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/uioverrides/s;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/s;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected p1(Landroid/content/Intent;IIIILcom/android/launcher3/util/O1;)V
    .locals 1

    .line 1
    const/16 v0, -0x65

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 6
    .line 7
    invoke-virtual {v0, p4, p5}, Lcom/android/launcher3/hybridhotseat/b;->B(II)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super/range {p0 .. p6}, Lcom/android/launcher3/C2;->p1(Landroid/content/Intent;IIIILcom/android/launcher3/util/O1;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method protected p5()Lcom/android/launcher3/q5;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/q5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/q5;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public q5()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b1:Lcom/android/launcher3/util/P1;

    .line 3
    .line 4
    return-void
.end method

.method public r5()Lcom/android/launcher3/q5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 2
    .line 3
    return-object p0
.end method

.method protected registerBackDispatcher()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher$c;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-interface {v0, p0, v1}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public returnToHomescreen()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/TISBindHelper;->runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method protected s1()LO0/r;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/Z4;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/Z4;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public s5()LP1/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public setResumed()V
    .locals 2

    .line 1
    sget-object v0, LP1/k;->o:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, LP1/k;

    .line 8
    .line 9
    sget-object v1, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_WALLPAPER_ACTIVITY:Landroid/window/DesktopModeFlags;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplayId()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, LP1/k;->s(I)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, LP1/k;->t()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-super {p0}, Lcom/android/launcher3/v;->setResumed()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public setTaskbarUIController(Lcom/android/launcher3/taskbar/o4;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->U0:Lcom/android/launcher3/taskbar/V;

    .line 4
    .line 5
    return-void
.end method

.method protected setupViews()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/android/launcher3/uioverrides/QuickstepInteractionHandler;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/l0;->T(Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Lcom/android/launcher3/C2;->setupViews()V

    .line 14
    .line 15
    .line 16
    const v0, 0x7f0b045d

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/h;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/android/quickstep/views/OverviewActionsView;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 32
    .line 33
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    move-object v7, v1

    .line 40
    check-cast v7, Lcom/android/quickstep/SystemUiProxy;

    .line 41
    .line 42
    new-instance v2, Lcom/android/quickstep/util/SplitSelectStateController;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    sget-object v1, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    move-object v8, v1

    .line 63
    check-cast v8, Lcom/android/quickstep/RecentsModel;

    .line 64
    .line 65
    new-instance v9, Lcom/android/launcher3/uioverrides/w;

    .line 66
    .line 67
    invoke-direct {v9, p0}, Lcom/android/launcher3/uioverrides/w;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 68
    .line 69
    .line 70
    move-object v3, p0

    .line 71
    invoke-direct/range {v2 .. v9}, Lcom/android/quickstep/util/SplitSelectStateController;-><init>(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/d;LP1/h;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/RecentsModel;Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    iput-object v2, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 75
    .line 76
    invoke-static {v3}, LO2/d;->c(Landroid/content/Context;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_0

    .line 81
    .line 82
    new-instance p0, Lj1/k;

    .line 83
    .line 84
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v3}, Landroid/app/Activity;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-direct {p0, v1, v7, v2, v4}, Lj1/k;-><init>(Lcom/android/launcher3/statemanager/d;Lcom/android/quickstep/SystemUiProxy;Landroid/app/IApplicationThread;LP1/h;)V

    .line 97
    .line 98
    .line 99
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->c1:Lj1/k;

    .line 100
    .line 101
    :cond_0
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 102
    .line 103
    iget-object v1, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 104
    .line 105
    iget-object v2, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->c1:Lj1/k;

    .line 106
    .line 107
    invoke-virtual {v0, p0, v1, v2}, Lcom/android/quickstep/views/RecentsView;->init(Lcom/android/quickstep/views/OverviewActionsView;Lcom/android/quickstep/util/SplitSelectStateController;Lj1/k;)V

    .line 108
    .line 109
    .line 110
    new-instance p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 111
    .line 112
    iget-object v1, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 113
    .line 114
    invoke-direct {p0, v3, v1}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/SplitSelectStateController;)V

    .line 115
    .line 116
    .line 117
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Y0:Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;

    .line 118
    .line 119
    new-instance p0, Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 120
    .line 121
    iget-object v1, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 122
    .line 123
    invoke-direct {p0, v3, v1}, Lcom/android/quickstep/util/SplitToWorkspaceController;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/SplitSelectStateController;)V

    .line 124
    .line 125
    .line 126
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Z0:Lcom/android/quickstep/util/SplitToWorkspaceController;

    .line 127
    .line 128
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 129
    .line 130
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {p0, v1, v0}, Lcom/android/quickstep/views/OverviewActionsView;->updateDimension(Lcom/android/launcher3/h0;Landroid/graphics/Rect;)V

    .line 139
    .line 140
    .line 141
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->S0:Lcom/android/quickstep/views/OverviewActionsView;

    .line 142
    .line 143
    invoke-static {v3}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/OverviewActionsView;->updateVerticalMargin(Lcom/android/launcher3/util/C1;)I

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->p5()Lcom/android/launcher3/q5;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->R0()V

    .line 157
    .line 158
    .line 159
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->R0:Lcom/android/launcher3/q5;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/android/launcher3/q5;->S0()V

    .line 162
    .line 163
    .line 164
    new-instance p0, Lcom/android/quickstep/util/TISBindHelper;

    .line 165
    .line 166
    new-instance v0, Lcom/android/launcher3/uioverrides/x;

    .line 167
    .line 168
    invoke-direct {v0, v3}, Lcom/android/launcher3/uioverrides/x;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 169
    .line 170
    .line 171
    invoke-direct {p0, v3, v0}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 172
    .line 173
    .line 174
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->T0:Lcom/android/quickstep/util/TISBindHelper;

    .line 175
    .line 176
    new-instance p0, LP1/h;

    .line 177
    .line 178
    invoke-direct {p0, v3}, LP1/h;-><init>(Lcom/android/launcher3/C2;)V

    .line 179
    .line 180
    .line 181
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->Q0:LP1/h;

    .line 182
    .line 183
    invoke-static {v3}, LO2/d;->d(Landroid/content/Context;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_1

    .line 188
    .line 189
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 190
    .line 191
    invoke-virtual {p0, v3}, Lcom/android/quickstep/util/SplitSelectStateController;->initSplitFromDesktopController(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 192
    .line 193
    .line 194
    :cond_1
    new-instance p0, Lcom/android/launcher3/hybridhotseat/b;

    .line 195
    .line 196
    invoke-direct {p0, v3}, Lcom/android/launcher3/hybridhotseat/b;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 197
    .line 198
    .line 199
    iput-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 200
    .line 201
    const-string p0, "ro.launcher.depth.widget"

    .line 202
    .line 203
    const/4 v0, 0x1

    .line 204
    invoke-static {p0, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    iput-boolean p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->e1:Z

    .line 209
    .line 210
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    new-instance v0, Lcom/android/launcher3/uioverrides/h;

    .line 215
    .line 216
    invoke-direct {v0, v3}, Lcom/android/launcher3/uioverrides/h;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->B0(Lz2/a$b;)V

    .line 220
    .line 221
    .line 222
    iget-object p0, v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 223
    .line 224
    invoke-virtual {p0}, Lcom/android/quickstep/util/SplitSelectStateController;->getSplitBackHandler()Lcom/android/launcher3/util/l;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {v3, p0}, Lcom/android/launcher3/C2;->V0(Lcom/android/launcher3/util/l;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    const/16 v0, 0x3e9

    .line 5
    .line 6
    if-eq p2, v0, :cond_0

    .line 7
    .line 8
    iput p2, p0, Lcom/android/launcher3/C2;->G:I

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/util/A2;

    .line 11
    .line 12
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/util/A2;-><init>(Landroid/app/Activity;I)V

    .line 13
    .line 14
    .line 15
    iput-object p1, v0, Lcom/android/launcher3/util/A2;->i:Landroid/content/Intent;

    .line 16
    .line 17
    iput-object p3, v0, Lcom/android/launcher3/util/A2;->o:Landroid/os/Bundle;

    .line 18
    .line 19
    invoke-static {p0, v0}, Lcom/android/launcher3/proxy/ProxyActivityStarter;->a(Landroid/content/Context;Lcom/android/launcher3/util/A2;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/C2;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    move v1, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v1, v3

    .line 14
    :goto_0
    invoke-virtual {v0, v1}, Lcom/android/launcher3/hybridhotseat/b;->L(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-class v1, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictionUiUpdatePaused(Z)V

    .line 34
    .line 35
    .line 36
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/C2;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 43
    .line 44
    invoke-virtual {p0, v3}, Lcom/android/launcher3/hybridhotseat/b;->L(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v3}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictionUiUpdatePaused(Z)V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :cond_1
    new-instance p2, Lcom/android/launcher3/uioverrides/t;

    .line 52
    .line 53
    invoke-direct {p2, p0, v0}, Lcom/android/launcher3/uioverrides/t;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/appprediction/PredictionRowView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/Y1;->a(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    return-object p1
.end method

.method public startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V
    .locals 8

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    iput p2, p0, Lcom/android/launcher3/C2;->G:I

    .line 5
    .line 6
    new-instance v0, Lcom/android/launcher3/util/A2;

    .line 7
    .line 8
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/util/A2;-><init>(Landroid/app/Activity;I)V

    .line 9
    .line 10
    .line 11
    iput-object p1, v0, Lcom/android/launcher3/util/A2;->j:Landroid/content/IntentSender;

    .line 12
    .line 13
    iput-object p3, v0, Lcom/android/launcher3/util/A2;->k:Landroid/content/Intent;

    .line 14
    .line 15
    iput p4, v0, Lcom/android/launcher3/util/A2;->l:I

    .line 16
    .line 17
    iput p5, v0, Lcom/android/launcher3/util/A2;->m:I

    .line 18
    .line 19
    iput p6, v0, Lcom/android/launcher3/util/A2;->n:I

    .line 20
    .line 21
    iput-object p7, v0, Lcom/android/launcher3/util/A2;->o:Landroid/os/Bundle;

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/android/launcher3/proxy/ProxyActivityStarter;->a(Landroid/content/Context;Lcom/android/launcher3/util/A2;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    move-object v0, p0

    .line 32
    move-object v1, p1

    .line 33
    move v2, p2

    .line 34
    move-object v3, p3

    .line 35
    move v4, p4

    .line 36
    move v5, p5

    .line 37
    move v6, p6

    .line 38
    move-object v7, p7

    .line 39
    invoke-super/range {v0 .. v7}, Lcom/android/launcher3/C2;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;IIILandroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public startSplitSelection(Lcom/android/launcher3/util/y2$c;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->X0:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/util/y2$c;->b()Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/y;->getComponentKey()Lcom/android/launcher3/util/E;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Lcom/android/launcher3/uioverrides/j;

    .line 22
    .line 23
    invoke-direct {v3, p0, p1, v0}, Lcom/android/launcher3/uioverrides/j;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/util/y2$c;Lcom/android/quickstep/views/RecentsView;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v1, v2, p0, v3}, Lcom/android/quickstep/util/SplitSelectStateController;->findLastActiveTasksAndRunCallback(Ljava/util/List;ZLjava/util/function/Consumer;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public t2()[I
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t5(Lcom/android/launcher3/util/z2;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/view/View;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    new-instance v2, Lcom/android/launcher3/uioverrides/l;

    .line 21
    .line 22
    invoke-direct {v2, p1}, Lcom/android/launcher3/uioverrides/l;-><init>(Lcom/android/launcher3/util/z2;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewByPredicate(Ljava/util/function/Predicate;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move-object p1, v1

    .line 31
    :goto_0
    if-nez p1, :cond_1

    .line 32
    .line 33
    new-instance p1, Lcom/android/launcher3/uioverrides/m;

    .line 34
    .line 35
    invoke-direct {p1, p3, p2}, Lcom/android/launcher3/uioverrides/m;-><init>(Landroid/os/UserHandle;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->findViewByPredicate(Ljava/util/function/Predicate;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    :cond_1
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-lez p2, :cond_2

    .line 49
    .line 50
    new-instance p2, Landroid/graphics/RectF;

    .line 51
    .line 52
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 53
    .line 54
    .line 55
    new-instance p3, Landroid/graphics/Rect;

    .line 56
    .line 57
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-static {p0, p1, v0, p2, p3}, Lcom/android/launcher3/views/FloatingIconView;->y(Lcom/android/launcher3/C2;Landroid/view/View;ZLandroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 62
    .line 63
    .line 64
    iget p2, p2, Landroid/graphics/RectF;->top:F

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getHeaderBottom()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    int-to-float p0, p0

    .line 75
    cmpg-float p0, p2, p0

    .line 76
    .line 77
    if-gez p0, :cond_2

    .line 78
    .line 79
    return-object v1

    .line 80
    :cond_2
    return-object p1

    .line 81
    :cond_3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/C2;->S1(Lcom/android/launcher3/util/z2;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method protected u4(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->u4(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lf1/a;->J:Lf1/a$a;

    .line 7
    .line 8
    invoke-virtual {p1}, Lf1/a$a;->c()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZLjava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public u5(Lcom/android/launcher3/model/data/y;)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->isBubbleBarEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->a1:LN2/h;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 24
    .line 25
    invoke-virtual {v1, p0, v0}, Lcom/android/launcher3/h0;->u0(Landroid/content/Context;Z)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->isBubbleBarEnabled()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 38
    .line 39
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->hasBubbles()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/h0;->X0(Landroid/content/Context;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 54
    .line 55
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->asContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget p1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 60
    .line 61
    invoke-virtual {v1, p0, p1}, Lcom/android/launcher3/h0;->q0(Landroid/content/Context;I)F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    float-to-int p0, p0

    .line 66
    add-int/2addr v0, p0

    .line 67
    :cond_1
    return v0
.end method

.method public v5()Lcom/android/launcher3/hybridhotseat/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public x1()[Lcom/android/launcher3/util/G2;
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v2, LC1/a;

    .line 11
    .line 12
    invoke-direct {v2, p0}, LC1/a;-><init>(Lcom/android/launcher3/C2;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll1/b;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll1/b;-><init>(Lcom/android/launcher3/C2;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v2, Lcom/android/launcher3/uioverrides/r;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Lcom/android/launcher3/uioverrides/r;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 36
    .line 37
    .line 38
    sget-object v3, Lcom/android/launcher3/uioverrides/QuickstepLauncher$d;->a:[I

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    aget v0, v3, v0

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    if-eq v0, v3, :cond_3

    .line 48
    .line 49
    const/4 v3, 0x2

    .line 50
    if-eq v0, v3, :cond_1

    .line 51
    .line 52
    const/4 v3, 0x3

    .line 53
    if-eq v0, v3, :cond_0

    .line 54
    .line 55
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;

    .line 56
    .line 57
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;-><init>(Lcom/android/launcher3/C2;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_0
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;

    .line 73
    .line 74
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;-><init>(Lcom/android/launcher3/C2;Ljava/util/function/BiConsumer;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;

    .line 81
    .line 82
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/util/function/BiConsumer;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;-><init>(Lcom/android/launcher3/C2;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_1
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/M;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/M;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/L;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/L;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_2
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/z;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/z;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/x;

    .line 130
    .line 131
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/x;-><init>(Lcom/android/launcher3/C2;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_3
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/v;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/v;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/h;

    .line 147
    .line 148
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;-><init>(Lcom/android/launcher3/C2;Ljava/util/function/BiConsumer;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/p;

    .line 155
    .line 156
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/p;-><init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Ljava/util/function/BiConsumer;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    :goto_1
    invoke-static {v1, p0}, Lcom/android/launcher3/uioverrides/touchcontrollers/a;->a(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V

    .line 163
    .line 164
    .line 165
    invoke-static {}, Lcom/android/launcher3/y0;->q()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_4

    .line 170
    .line 171
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/H;

    .line 172
    .line 173
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->j1:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 174
    .line 175
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/H;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/F;

    .line 182
    .line 183
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->j1:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 184
    .line 185
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/F;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_4
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/K;

    .line 193
    .line 194
    iget-object v2, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->j1:Lcom/android/launcher3/uioverrides/touchcontrollers/I;

    .line 195
    .line 196
    invoke-direct {v0, p0, v2}, Lcom/android/launcher3/uioverrides/touchcontrollers/K;-><init>(Landroid/content/Context;Lcom/android/launcher3/uioverrides/touchcontrollers/I;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    new-array p0, p0, [Lcom/android/launcher3/util/G2;

    .line 207
    .line 208
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    check-cast p0, [Lcom/android/launcher3/util/G2;

    .line 213
    .line 214
    return-object p0
.end method

.method public x5()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->k1:Lcom/android/quickstep/views/MiniWindowTipsView;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method

.method public y2(Lcom/android/launcher3/model/data/y;)Ljava/util/stream/Stream;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            ")",
            "Ljava/util/stream/Stream<",
            "Lcom/android/launcher3/popup/P$i;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v2, v2, [Lcom/android/launcher3/popup/P$i;

    .line 7
    .line 8
    sget-object v3, Lz1/W4;->s:Lcom/android/launcher3/popup/P$i;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v3, v2, v4

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    aput-object v1, v2, v3

    .line 15
    .line 16
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p1}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->A5(Lcom/android/launcher3/model/data/y;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-super {p0, p1}, Lcom/android/launcher3/C2;->y2(Lcom/android/launcher3/model/data/y;)Ljava/util/stream/Stream;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {v0, p0}, Ljava/util/stream/Stream;->concat(Ljava/util/stream/Stream;Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public y5()Lcom/android/launcher3/util/P1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->b1:Lcom/android/launcher3/util/P1;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Lz1/y0$c;)V
    .locals 2

    .line 1
    iget v0, p1, Lz1/y0$c;->a:I

    .line 2
    .line 3
    const/16 v1, -0x66

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->O0:Lz1/y0$c;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-class v0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 24
    .line 25
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictedApps(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/16 v1, -0x67

    .line 32
    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->P0:Lcom/android/launcher3/hybridhotseat/b;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/android/launcher3/hybridhotseat/b;->M(Lz1/y0$c;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const/16 v1, -0x6f

    .line 42
    .line 43
    if-ne v0, v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getPopupDataProvider()Lcom/android/launcher3/popup/n;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getWidgetPickerDataProvider()Ln2/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ln2/c;->n(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public z2()Landroid/app/TaskInfo;
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    move v1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Landroid/view/Display;->getDisplayId()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :goto_0
    invoke-virtual {v0, v2, v1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplay()Landroid/view/Display;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/view/Display;->getDisplayId()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {v0, p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getTopTaskWithDisplayId(I)Landroid/app/TaskInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public z5()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->f1:Z

    .line 2
    .line 3
    return p0
.end method
