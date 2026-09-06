.class public Lcom/android/quickstep/TouchInteractionService$TISBinder;
.super Lcom/android/systemui/shared/recents/ILauncherProxy$Stub;
.source "TouchInteractionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TouchInteractionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TISBinder"
.end annotation


# instance fields
.field private final mTis:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/quickstep/TouchInteractionService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Lcom/android/systemui/shared/recents/ILauncherProxy$Stub;-><init>()V

    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;Lcom/android/quickstep/i7;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    return-void
.end method

.method public static synthetic A2(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->toggleSmallWindowToMini(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B2(ZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->v0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C2(IILcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->z0(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D2(ILcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->tryStartAssistOverride(I)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const-string p0, "TouchInteractionService"

    .line 13
    .line 14
    const-string p1, "Failed to invoke Assist override"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic E2(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onTaskbarToggled$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F2(ILcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->E(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic G2(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->w2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic H2(ILcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setGestureBlockingTaskId(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I2(IIIZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p4, p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/g3;->V(IIIZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J2(Lcom/android/quickstep/TouchInteractionService$TISBinder;Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p13}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onInitialize$1(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K2(IZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->Q0(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L2(ZLcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setPredictiveBackToHomeInProgress(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic M2(Ljava/util/function/Function;Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    new-instance p0, Lcom/android/quickstep/I6;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/I6;-><init>()V

    .line 7
    .line 8
    .line 9
    :goto_0
    invoke-static {p1, p0}, Lcom/android/quickstep/TouchInteractionService;->v(Lcom/android/quickstep/TouchInteractionService;Ljava/util/function/Function;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic N2(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZLcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onAssistantAvailable$9(ZZLcom/android/quickstep/TouchInteractionService;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O2(IIZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p0, p1, p2}, Lcom/android/launcher3/taskbar/g3;->V0(IIZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P2(Lcom/android/quickstep/TouchInteractionService$TISBinder;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$executeForTaskbarManager$36(Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q2(IZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->B0(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R2(IZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->y0(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S2(FLcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setAssistantVisibility(F)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->z(Lcom/android/quickstep/TouchInteractionService;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic T2(ZLcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->q(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewComponentObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1, p0}, Lcom/android/quickstep/views/RecentsViewContainer;->enterStageSplitFromRunningApp(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic U2(Lcom/android/quickstep/TouchInteractionService$TISBinder;JI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onSystemUiStateChanged$15(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V2(FLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->w0(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W2(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onAssistantAvailable$10(ZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X2(IZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->x0(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y2(ZLcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "recentapps"

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object p1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->KEYBOARD_INPUT:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->SHOW:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic Z2(Lcom/android/quickstep/TouchInteractionService$TISBinder;Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onOverviewToggle$5(Lcom/android/quickstep/TouchInteractionService;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a3(Lcom/android/quickstep/TouchInteractionService$TISBinder;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onActiveNavBarRegionChanges$17(Landroid/graphics/Region;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b3(JILcom/android/quickstep/TouchInteractionService;)V
    .locals 3

    .line 1
    invoke-static {p3}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->getSysuiStateFlag()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {p3}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2, p0, p1, p2}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setSysUIStateFlagsForDisplay(JI)V

    .line 14
    .line 15
    .line 16
    invoke-static {p3, v0, v1, p2}, Lcom/android/quickstep/TouchInteractionService;->C(Lcom/android/quickstep/TouchInteractionService;JI)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic c3(Ljava/util/function/Consumer;Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d3(ILcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->s(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyAddSystemDecorations(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private executeForTaskbarManager(Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/taskbar/g3;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/T6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/T6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;Ljava/util/function/Consumer;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private executeForTouchInteractionService(Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/TouchInteractionService;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic lambda$executeForTaskbarManager$36(Ljava/util/function/Consumer;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/H6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/H6;-><init>(Ljava/util/function/Consumer;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onActiveNavBarRegionChanges$17(Landroid/graphics/Region;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/F6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/F6;-><init>(Landroid/graphics/Region;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onAssistantAvailable$10(ZZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/S6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/quickstep/S6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onAssistantAvailable$9(ZZLcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    invoke-static {p3}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setAssistantAvailable(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {p3}, Lcom/android/quickstep/TouchInteractionService;->z(Lcom/android/quickstep/TouchInteractionService;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Lcom/android/quickstep/L6;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Lcom/android/quickstep/L6;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic lambda$onAssistantVisibilityChanged$12(F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/B6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/B6;-><init>(F)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onInitialize$1(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V
    .locals 14

    .line 1
    new-instance v0, Lcom/android/quickstep/f7;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move-object/from16 v2, p2

    .line 5
    .line 6
    move-object/from16 v3, p3

    .line 7
    .line 8
    move-object/from16 v4, p4

    .line 9
    .line 10
    move-object/from16 v5, p5

    .line 11
    .line 12
    move-object/from16 v6, p6

    .line 13
    .line 14
    move-object/from16 v7, p7

    .line 15
    .line 16
    move-object/from16 v8, p8

    .line 17
    .line 18
    move-object/from16 v9, p9

    .line 19
    .line 20
    move-object/from16 v10, p10

    .line 21
    .line 22
    move-object/from16 v11, p11

    .line 23
    .line 24
    move-object/from16 v12, p12

    .line 25
    .line 26
    move-object/from16 v13, p13

    .line 27
    .line 28
    invoke-direct/range {v0 .. v13}, Lcom/android/quickstep/f7;-><init>(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic lambda$onOverviewToggle$5(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->isScreenPinningActive()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "TouchInteractionService"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "onOverviewToggle: ScreenPinningActive return !"

    .line 14
    .line 15
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "recentapps"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/android/quickstep/TaskUtils;->closeSystemWindowsAsync(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 31
    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    const-string p0, "onOverviewToggle, touchInteractionService is null"

    .line 35
    .line 36
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p0}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v2}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    sget-object v0, LF1/b;->n:Lcom/android/launcher3/util/I;

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, LF1/b;

    .line 67
    .line 68
    invoke-virtual {v0}, LF1/b;->d()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    new-instance p1, Landroid/content/Intent;

    .line 75
    .line 76
    const-class v0, Lcom/android/quickstep/SplitActivity;

    .line 77
    .line 78
    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .line 80
    .line 81
    const/high16 v0, 0x10000000

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    if-nez v0, :cond_2

    .line 91
    .line 92
    const/4 v0, 0x0

    .line 93
    goto :goto_0

    .line 94
    :cond_2
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    :goto_0
    invoke-virtual {p0, p1, v0}, Landroid/app/Service;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 99
    .line 100
    .line 101
    const-string p1, "onOverviewToggle: start SplitActivity"

    .line 102
    .line 103
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    const-string v0, "onOverviewToggle: addCommand CommandType.TOGGLE"

    .line 108
    .line 109
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v0, v0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mDefaultHomePackage:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p0, v0}, Lx1/S;->x(Landroid/content/Context;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_4

    .line 123
    .line 124
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->D(Lcom/android/quickstep/TouchInteractionService;)V

    .line 125
    .line 126
    .line 127
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    sget-object v0, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->TOGGLE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 134
    .line 135
    .line 136
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->r(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RotationTouchHelper;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    if-eqz p1, :cond_4

    .line 141
    .line 142
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->r(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RotationTouchHelper;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1}, Lcom/android/quickstep/RotationTouchHelper;->setActivityTouchRotationAsDisplay()V

    .line 147
    .line 148
    .line 149
    :cond_4
    :goto_1
    invoke-static {}, Lx1/O;->T1()Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_7

    .line 154
    .line 155
    invoke-static {}, Lx1/O;->C2()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_5

    .line 160
    .line 161
    invoke-static {}, Lx1/O;->k1()Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_7

    .line 166
    .line 167
    :cond_5
    invoke-static {}, Lx1/O;->I2()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_7

    .line 172
    .line 173
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->y0()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-eqz p1, :cond_6

    .line 182
    .line 183
    invoke-virtual {p0}, Landroid/app/Service;->getBaseContext()Landroid/content/Context;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget-boolean p1, p1, Lcom/android/launcher3/r4;->e0:Z

    .line 192
    .line 193
    if-eqz p1, :cond_7

    .line 194
    .line 195
    :cond_6
    invoke-static {p0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->G0()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_7

    .line 204
    .line 205
    invoke-static {}, Lcom/android/quickstep/util/MiniWindowSplitScreenUtils;->isEnableFeatureSmallWindowToMini()Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_7

    .line 210
    .line 211
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 212
    .line 213
    new-instance v0, Lcom/android/quickstep/Q6;

    .line 214
    .line 215
    invoke-direct {v0, p0}, Lcom/android/quickstep/Q6;-><init>(Lcom/android/quickstep/TouchInteractionService;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 219
    .line 220
    .line 221
    :cond_7
    return-void
.end method

.method private synthetic lambda$onSystemUiStateChanged$15(JI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/E6;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/android/quickstep/E6;-><init>(JI)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onTaskbarToggled$3()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/r6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/r6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onUnbind$34(Landroid/os/IRemoteCallback;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/K6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/K6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    :try_start_0
    invoke-interface {p1, p0}, Landroid/os/IRemoteCallback;->sendResult(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string p1, "TouchInteractionService"

    .line 16
    .line 17
    const-string v0, "onUnbind: Failed to reply to LauncherProxyService"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->m(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/AllAppsActionManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/quickstep/AllAppsActionManager;->onDestroy()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->q(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewComponentObserver;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/quickstep/OverviewComponentObserver;->isHomeAndOverviewSame()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->B(Lcom/android/quickstep/TouchInteractionService;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic p2(ILcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->s(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyDisplayRemoveSystemDecorations(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q2(Lcom/android/quickstep/TouchInteractionService$TISBinder;Landroid/os/IRemoteCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onUnbind$34(Landroid/os/IRemoteCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(ILcom/android/quickstep/TouchInteractionService;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->s(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/SystemDecorationChangeObserver;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/quickstep/SystemDecorationChangeObserver;->notifyOnDisplayRemoved(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->clearSysUIStateFlagsForDisplay(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic s2(ZZLcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Lcom/android/quickstep/TouchInteractionService;->p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object p1, Lcom/android/quickstep/OverviewCommandHelper$CommandType;->HIDE:Lcom/android/quickstep/OverviewCommandHelper$CommandType;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/android/quickstep/OverviewCommandHelper;->addCommand(Lcom/android/quickstep/OverviewCommandHelper$CommandType;)Lcom/android/quickstep/OverviewCommandHelper$CommandInfo;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic t2(Lcom/android/quickstep/GestureState;)Lcom/android/launcher3/anim/d;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic u2(Landroid/graphics/Region;Lcom/android/quickstep/TouchInteractionService;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Lcom/android/quickstep/RecentsAnimationDeviceState;->setDeferredGestureRegion(Landroid/graphics/Region;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic v2(ZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->D(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w2(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;Lcom/android/quickstep/TouchInteractionService;)V
    .locals 16

    .line 1
    move-object/from16 v0, p13

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    move-object v2, v1

    .line 10
    check-cast v2, Lcom/android/quickstep/SystemUiProxy;

    .line 11
    .line 12
    move-object/from16 v3, p0

    .line 13
    .line 14
    move-object/from16 v4, p1

    .line 15
    .line 16
    move-object/from16 v5, p2

    .line 17
    .line 18
    move-object/from16 v6, p3

    .line 19
    .line 20
    move-object/from16 v7, p4

    .line 21
    .line 22
    move-object/from16 v8, p5

    .line 23
    .line 24
    move-object/from16 v9, p6

    .line 25
    .line 26
    move-object/from16 v10, p7

    .line 27
    .line 28
    move-object/from16 v11, p8

    .line 29
    .line 30
    move-object/from16 v12, p9

    .line 31
    .line 32
    move-object/from16 v13, p10

    .line 33
    .line 34
    move-object/from16 v14, p11

    .line 35
    .line 36
    move-object/from16 v15, p12

    .line 37
    .line 38
    invoke-virtual/range {v2 .. v15}, Lcom/android/quickstep/SystemUiProxy;->setProxy(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V

    .line 39
    .line 40
    .line 41
    const-string v1, "TISBinder#onInitialize()"

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/android/quickstep/TouchInteractionService;->y(Lcom/android/quickstep/TouchInteractionService;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    invoke-static {v0, v1}, Lcom/android/quickstep/util/ActivityPreloadUtil;->preloadOverviewForTIS(Landroid/content/Context;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic x2(IZLcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Lcom/android/launcher3/taskbar/g3;->U0(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y2(Lcom/android/quickstep/TouchInteractionService$TISBinder;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->lambda$onAssistantVisibilityChanged$12(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z2(ILcom/android/launcher3/taskbar/g3;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/g3;->Y(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public appTransitionPending(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/c7;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/c7;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public checkNavBarModes(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/R6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/R6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method clearTisReference()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public disable(IIIZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/b7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/quickstep/b7;-><init>(IIIZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public ejectFakeTrackpadForTesting()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->u(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/util/z0;->clear()V

    .line 17
    .line 18
    .line 19
    const-string v0, "tapl testing"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->y(Lcom/android/quickstep/TouchInteractionService;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public enterStageSplitFromRunningApp(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/A6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/A6;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public finishBarAnimations(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/X6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/X6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getDeviceState()Lcom/android/quickstep/RecentsAnimationDeviceState;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "TouchInteractionService"

    .line 12
    .line 13
    const-string v0, "getDeviceState, touchInteractionService is null"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->p(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/OverviewCommandHelper;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getTaskbarManager()Lcom/android/launcher3/taskbar/g3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->t(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/launcher3/taskbar/g3;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public injectFakeTrackpadForTesting()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->u(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/util/ActiveTrackpadList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/16 v1, 0x3e8

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 19
    .line 20
    .line 21
    const-string v0, "tapl testing"

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/android/quickstep/TouchInteractionService;->y(Lcom/android/quickstep/TouchInteractionService;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onActiveNavBarRegionChanges(Landroid/graphics/Region;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/x6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/x6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;Landroid/graphics/Region;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAssistantAvailable(ZZ)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/G6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/quickstep/G6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;ZZ)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onAssistantOverrideInvoked(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/D6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/D6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onAssistantVisibilityChanged(F)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/C6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/C6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDisplayAddSystemDecorations(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/W6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/W6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDisplayRemoveSystemDecorations(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/u6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/u6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDisplayRemoved(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/e7;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/e7;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onInitialize(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const-string v1, "com.android.systemui.shared.recents.ISystemUiProxy"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/android/systemui/shared/recents/ISystemUiProxy$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v1, "com.android.wm.shell.common.pip.IPip"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/android/wm/shell/common/pip/a$a;->o2(Landroid/os/IBinder;)Lcom/android/wm/shell/common/pip/a;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const-string v1, "com.android.wm.shell.bubbles.IBubbles"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, LJ2/a$a;->o2(Landroid/os/IBinder;)LJ2/a;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const-string v1, "com.android.wm.shell.splitscreen.ISplitScreen"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1}, Lcom/android/wm/shell/splitscreen/a$a;->o2(Landroid/os/IBinder;)Lcom/android/wm/shell/splitscreen/a;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    const-string v1, "com.android.wm.shell.onehanded.IOneHanded"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v1}, LL2/a$a;->o2(Landroid/os/IBinder;)LL2/a;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    const-string v1, "com.android.wm.shell.shared.IShellTransitions"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v1}, Lcom/android/wm/shell/shared/l$a;->o2(Landroid/os/IBinder;)Lcom/android/wm/shell/shared/l;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    const-string v1, "com.android.wm.shell.startingsurface.IStartingWindow"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {v1}, LV2/a$a;->o2(Landroid/os/IBinder;)LV2/a;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    const-string v1, "com.android.systemui.shared.system.smartspace.ISysuiUnlockAnimationController"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 80
    .line 81
    .line 82
    move-result-object v12

    .line 83
    const-string v1, "com.android.wm.shell.recents.IRecentTasks"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-static {v1}, Lcom/android/wm/shell/recents/a$a;->o2(Landroid/os/IBinder;)Lcom/android/wm/shell/recents/a;

    .line 90
    .line 91
    .line 92
    move-result-object v11

    .line 93
    const-string v1, "com.android.wm.shell.back.IBackAnimation"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-static {v1}, LI2/a$a;->o2(Landroid/os/IBinder;)LI2/a;

    .line 100
    .line 101
    .line 102
    move-result-object v13

    .line 103
    const-string v1, "com.android.wm.shell.desktopmode.IDesktopMode"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v1}, Lcom/android/wm/shell/desktopmode/b$a;->o2(Landroid/os/IBinder;)Lcom/android/wm/shell/desktopmode/b;

    .line 110
    .line 111
    .line 112
    move-result-object v14

    .line 113
    const-string v1, "com.android.systemui.unfold.progress.IUnfoldAnimation"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-static {v1}, Lcom/android/systemui/unfold/progress/a$a;->o2(Landroid/os/IBinder;)Lcom/android/systemui/unfold/progress/a;

    .line 120
    .line 121
    .line 122
    move-result-object v15

    .line 123
    const-string v1, "com.android.wm.shell.draganddrop.IDragAndDrop"

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, LK2/a$a;->o2(Landroid/os/IBinder;)LK2/a;

    .line 130
    .line 131
    .line 132
    move-result-object v16

    .line 133
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 134
    .line 135
    new-instance v2, Lcom/android/quickstep/y6;

    .line 136
    .line 137
    move-object/from16 v3, p0

    .line 138
    .line 139
    invoke-direct/range {v2 .. v16}, Lcom/android/quickstep/y6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public onNavButtonsDarkIntensityChanged(F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/M6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/M6;-><init>(F)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNavigationBarLumaSamplingEnabled(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/U6;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/U6;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNotificationEventUp()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public onOverviewHidden(ZZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/a7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/a7;-><init>(ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onOverviewShown(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/Y6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/Y6;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onOverviewToggle()V
    .locals 2

    .line 1
    const-string v0, "Main"

    .line 2
    .line 3
    const-string v1, "onOverviewToggle"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/testing/K;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 9
    .line 10
    const-string v1, "Launcher.recentsToggle"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/Z6;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/quickstep/Z6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onRotationProposal(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/s6;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/s6;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStatusBarVisibleChanged(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onStatusBarVisibleChanged "

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "TouchInteractionService"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$TISBinder;->mTis:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/android/quickstep/TouchInteractionService;

    .line 30
    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const-string p0, "onStatusBarVisibleChanged, touchInteractionService is null"

    .line 34
    .line 35
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-static {p0}, Lcom/android/quickstep/TouchInteractionService;->n(Lcom/android/quickstep/TouchInteractionService;)Lcom/android/quickstep/RecentsAnimationDeviceState;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    xor-int/lit8 p1, p1, 0x1

    .line 44
    .line 45
    iput-boolean p1, p0, Lcom/android/quickstep/RecentsAnimationDeviceState;->mStatusBarHidden:Z

    .line 46
    .line 47
    return-void
.end method

.method public onSystemBarAttributesChanged(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/g7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/g7;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSystemUiStateChanged(JI)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/N6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/quickstep/N6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;JI)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTaskbarToggled()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/J6;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/J6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onTransitionModeUpdated(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/t6;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/t6;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onUnbind(Landroid/os/IRemoteCallback;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/V6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/V6;-><init>(Lcom/android/quickstep/TouchInteractionService$TISBinder;Landroid/os/IRemoteCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public refreshOverviewTarget()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/O6;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/O6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setGestureBlockedTaskId(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/v6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/v6;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPredictiveBackToHomeInProgress(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/z6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/z6;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setSwipeUpProxy(Ljava/util/function/Function;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Function<",
            "Lcom/android/quickstep/GestureState;",
            "Lcom/android/launcher3/anim/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/P6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/quickstep/P6;-><init>(Ljava/util/function/Function;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTouchInteractionService(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public touchAutoDim(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/d7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/d7;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public transitionTo(IIZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/h7;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/android/quickstep/h7;-><init>(IIZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public updateWallpaperVisibility(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/w6;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/android/quickstep/w6;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->executeForTaskbarManager(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
