.class public final Lcom/android/quickstep/LauncherActivityInterface;
.super Lcom/android/quickstep/BaseActivityInterface;
.source "LauncherActivityInterface.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/BaseActivityInterface<",
        "Lcom/android/launcher3/V3;",
        "Lcom/android/launcher3/uioverrides/QuickstepLauncher;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/android/quickstep/LauncherActivityInterface;

.field private static final TAG:Ljava/lang/String; = "LauncherActivityInterface"


# instance fields
.field private mLastActivityInitListener:Lcom/android/launcher3/X2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/LauncherActivityInterface;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/quickstep/LauncherActivityInterface;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/quickstep/LauncherActivityInterface;->INSTANCE:Lcom/android/quickstep/LauncherActivityInterface;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {p0, v2, v0, v1}, Lcom/android/quickstep/BaseActivityInterface;-><init>(ZLcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Ljava/util/function/Predicate;Lcom/android/launcher3/C2;Ljava/lang/Boolean;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/LauncherActivityInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->notifyRecentsOfOrientation()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getVisibleLauncher()Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    sget-object v2, Lf1/a;->J:Lf1/a$a;

    .line 16
    .line 17
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->isInLiveTileMode()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_3

    .line 28
    .line 29
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->isInMinusOne()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_4

    .line 41
    .line 42
    :cond_3
    :goto_0
    return-object v0

    .line 43
    :cond_4
    return-object v1
.end method

.method private isInMinusOne()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    sget-object v1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/quickstep/TopTaskTracker;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplayId()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {v1, v0, p0}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isHomeTask()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    return v0
.end method

.method private notifyRecentsOfOrientation()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->reapplyActiveRotation()V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public closeOverlay()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/quickstep/BaseActivityInterface;->closeOverlay()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->o2()Lz2/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/quickstep/HomeVisibilityState;->isHomeVisible()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    invoke-interface {v0, p0}, Lz2/a;->e(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/16 p0, 0x96

    .line 39
    .line 40
    invoke-interface {v0, p0}, Lz2/a;->l(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public createActivityInitListener(Ljava/util/function/Predicate;)Lcom/android/launcher3/X2;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lcom/android/launcher3/X2;"
        }
    .end annotation

    .line 2
    const-string v0, "LauncherActivityInterface"

    const-string v1, "createActivityInitListener"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object v0, p0, Lcom/android/quickstep/LauncherActivityInterface;->mLastActivityInitListener:Lcom/android/launcher3/X2;

    if-eqz v0, :cond_0

    .line 4
    const-string v1, "LauncherActivityInterface.createActivityInitListener"

    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/ContextInitListener;->unregister(Ljava/lang/String;)V

    .line 5
    :cond_0
    new-instance v0, Lcom/android/launcher3/X2;

    new-instance v1, Lcom/android/quickstep/i1;

    invoke-direct {v1, p1}, Lcom/android/quickstep/i1;-><init>(Ljava/util/function/Predicate;)V

    invoke-direct {v0, v1}, Lcom/android/launcher3/X2;-><init>(Ljava/util/function/BiPredicate;)V

    iput-object v0, p0, Lcom/android/quickstep/LauncherActivityInterface;->mLastActivityInitListener:Lcom/android/launcher3/X2;

    return-object v0
.end method

.method public bridge synthetic createActivityInitListener(Ljava/util/function/Predicate;)Lcom/android/quickstep/util/ContextInitListener;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/LauncherActivityInterface;->createActivityInitListener(Ljava/util/function/Predicate;)Lcom/android/launcher3/X2;

    move-result-object p0

    return-object p0
.end method

.method public deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/BaseActivityInterface;->deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {v0, p2}, Lcom/android/launcher3/taskbar/o4;->r(Landroid/view/MotionEvent;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-super {p0, p1, p2}, Lcom/android/quickstep/BaseActivityInterface;->deferStartingActivity(Lcom/android/quickstep/RecentsAnimationDeviceState;Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public bridge synthetic getCreatedContainer()Lcom/android/launcher3/statemanager/h;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    move-result-object p0

    return-object p0
.end method

.method public getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 3
    sget-object p0, Lcom/android/launcher3/C2;->J0:Lcom/android/launcher3/util/H$a;

    invoke-virtual {p0}, Lcom/android/launcher3/util/H;->getCreatedContext()Lcom/android/launcher3/views/k;

    move-result-object p0

    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    return-object p0
.end method

.method public bridge synthetic getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    move-result-object p0

    return-object p0
.end method

.method public getDepthController()LP1/h;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method protected getOverviewScrimColorForState(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/V3;)I
    .locals 0

    .line 2
    invoke-virtual {p2, p1}, Lcom/android/launcher3/V3;->y(Lcom/android/launcher3/C2;)I

    move-result p0

    return p0
.end method

.method protected bridge synthetic getOverviewScrimColorForState(Lcom/android/quickstep/views/RecentsViewContainer;Lcom/android/launcher3/statemanager/a;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    check-cast p2, Lcom/android/launcher3/V3;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/LauncherActivityInterface;->getOverviewScrimColorForState(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/launcher3/V3;)I

    move-result p0

    return p0
.end method

.method public getOverviewWindowBounds(Landroid/graphics/Rect;Landroid/view/RemoteAnimationTarget;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    return-object p1
.end method

.method public getParallelAnimationToGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/quickstep/BaseContainerInterface;->getParallelAnimationToGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-nez p4, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/V;->j(Lcom/android/quickstep/GestureState$GestureEndTarget;JLcom/android/quickstep/RecentsAnimationCallbacks;)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_1
    new-instance p2, Landroid/animation/AnimatorSet;

    .line 22
    .line 23
    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 24
    .line 25
    .line 26
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p2, p0}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 31
    .line 32
    .line 33
    return-object p2

    .line 34
    :cond_2
    :goto_0
    return-object p0
.end method

.method public getSwipeUpDestinationAndLength(Lcom/android/launcher3/h0;Landroid/content/Context;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)I
    .locals 2

    .line 1
    invoke-virtual {p0, p2, p1, p3, p4}, Lcom/android/quickstep/BaseContainerInterface;->calculateTaskSize(Landroid/content/Context;Lcom/android/launcher3/h0;Landroid/graphics/Rect;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {p2}, Lcom/android/launcher3/util/Z;->y(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->S0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    iget p0, p3, Landroid/graphics/Rect;->left:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_0
    iget p0, p1, Lcom/android/launcher3/h0;->T0:I

    .line 28
    .line 29
    iget p1, p3, Landroid/graphics/Rect;->right:I

    .line 30
    .line 31
    sub-int/2addr p0, p1

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-static {p2, p1, p4, p0}, Lcom/android/quickstep/util/LayoutUtils;->getShelfTrackingDistance(Landroid/content/Context;Lcom/android/launcher3/h0;Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;Lcom/android/quickstep/BaseContainerInterface;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public getTaskbarController()Lcom/android/launcher3/taskbar/V;
    .locals 0

    .line 2
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->B5()Lcom/android/launcher3/taskbar/V;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getTaskbarController()Lcom/android/launcher3/taskbar/o4;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/V;

    move-result-object p0

    return-object p0
.end method

.method public getVisibleRecentsView()Lcom/android/quickstep/views/RecentsView;
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getVisibleLauncher()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/V3;

    .line 17
    .line 18
    iget-boolean v1, v1, Lcom/android/launcher3/V3;->c:Z

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/android/quickstep/views/RecentsView;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move-object v1, v0

    .line 30
    :goto_0
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/v;->hasBeenResumed()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/android/quickstep/views/RecentsView;->getRunningTaskViewId()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    const/4 v2, -0x1

    .line 43
    if-ne p0, v2, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    return-object v1

    .line 47
    :cond_2
    :goto_1
    return-object v0
.end method

.method public isInLiveTileMode()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 17
    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/android/launcher3/v;->isStarted()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    sget-object v1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/android/quickstep/TopTaskTracker;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getDisplayId()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {v1, v0, p0}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->isHomeTask()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_0
    return v0
.end method

.method public onAssistantVisibilityChanged(F)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->J3(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onExitOverview(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Lcom/android/quickstep/LauncherActivityInterface$2;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1, v0}, Lcom/android/quickstep/LauncherActivityInterface$2;-><init>(Lcom/android/quickstep/LauncherActivityInterface;Ljava/lang/Runnable;Lcom/android/launcher3/statemanager/d;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/statemanager/d;->j(Lcom/android/launcher3/statemanager/d$g;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onLaunchTaskFailed()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->H(Lcom/android/launcher3/statemanager/a;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onSwipeUpToHomeComplete()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    new-instance v3, Lcom/android/quickstep/j1;

    .line 22
    .line 23
    invoke-direct {v3, v2}, Lcom/android/quickstep/j1;-><init>(Lcom/android/launcher3/statemanager/d;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/h;->getRootView()Lcom/android/launcher3/LauncherRootView;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v1, v2}, Lcom/android/launcher3/LauncherRootView;->setForceHideBackArrow(Z)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->notifyRecentsOfOrientation()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p0, v0}, Lcom/android/quickstep/views/RecentsView;->setSwipeUpToRecnetLockedApp(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public prepareRecentsUI(ZLjava/util/function/Consumer;)Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/util/AnimatorControllerWithResistance;",
            ">;)",
            "Lcom/android/quickstep/BaseContainerInterface$AnimationFactory;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->notifyRecentsOfOrientation()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/quickstep/LauncherActivityInterface$1;

    .line 5
    .line 6
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/LauncherActivityInterface$1;-><init>(Lcom/android/quickstep/LauncherActivityInterface;Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/android/quickstep/BaseActivityInterface$DefaultAnimationFactory;->initBackgroundStateUI()Lcom/android/launcher3/statemanager/h;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p0, p2}, Lcom/android/launcher3/allapps/r;->u0(Z)V

    .line 21
    .line 22
    .line 23
    return-object p1
.end method

.method public setOnDeferredActivityLaunchCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getCreatedContainer()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->A4(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public shouldCancelCurrentGesture()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getTaskbarController()Lcom/android/launcher3/taskbar/V;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Lcom/android/quickstep/BaseContainerInterface;->shouldCancelCurrentGesture()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/V;->f0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/V3;
    .locals 0

    .line 2
    sget-object p0, Lcom/android/quickstep/LauncherActivityInterface$3;->$SwitchMap$com$android$quickstep$GestureState$GestureEndTarget:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    const/4 p1, 0x1

    if-eq p0, p1, :cond_2

    const/4 p1, 0x2

    if-eq p0, p1, :cond_1

    const/4 p1, 0x3

    if-eq p0, p1, :cond_1

    const/4 p1, 0x4

    if-eq p0, p1, :cond_0

    .line 3
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    return-object p0

    .line 4
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    return-object p0

    .line 5
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    return-object p0

    .line 6
    :cond_2
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    return-object p0
.end method

.method public bridge synthetic stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/LauncherActivityInterface;->stateFromGestureEndTarget(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/V3;

    move-result-object p0

    return-object p0
.end method

.method public stateFromGestureEndTargetCanceled(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/V3;
    .locals 0

    .line 2
    sget-object p0, Lcom/android/quickstep/LauncherActivityInterface$3;->$SwitchMap$com$android$quickstep$GestureState$GestureEndTarget:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    const/4 p1, 0x1

    if-eq p0, p1, :cond_1

    const/4 p1, 0x4

    if-eq p0, p1, :cond_0

    .line 3
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    return-object p0

    .line 4
    :cond_0
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    return-object p0

    .line 5
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    return-object p0
.end method

.method public bridge synthetic stateFromGestureEndTargetCanceled(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/statemanager/a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/LauncherActivityInterface;->stateFromGestureEndTargetCanceled(Lcom/android/quickstep/GestureState$GestureEndTarget;)Lcom/android/launcher3/V3;

    move-result-object p0

    return-object p0
.end method

.method public switchToRecentsIfVisible(Landroid/animation/Animator$AnimatorListener;)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getVisibleLauncher()Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v2, Lf1/a;->J:Lf1/a$a;

    .line 10
    .line 11
    invoke-virtual {v2}, Lf1/a$a;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->isInLiveTileMode()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->getVisibleRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/LauncherActivityInterface;->closeOverlay()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object v3, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 51
    .line 52
    if-ne p0, v3, :cond_3

    .line 53
    .line 54
    :cond_2
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 55
    .line 56
    .line 57
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getOverviewPanel()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 62
    .line 63
    if-eqz p0, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/android/quickstep/views/RecentsView;->setTasksTitleHidden(Z)V

    .line 66
    .line 67
    .line 68
    :cond_4
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->O2()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_5

    .line 81
    .line 82
    const/high16 p0, 0x1000000

    .line 83
    .line 84
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/a;->closeOpenViews(Lcom/android/launcher3/views/k;ZI)V

    .line 85
    .line 86
    .line 87
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->N1()Landroid/animation/AnimatorSet;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    if-eqz p0, :cond_6

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 100
    .line 101
    .line 102
    :cond_6
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    if-eqz p0, :cond_7

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/android/launcher3/uioverrides/QuickstepLauncher;->s5()LP1/h;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, LP1/h;->z()Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;->cancelDepthAnimImmediately()V

    .line 117
    .line 118
    .line 119
    :cond_7
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_8

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 134
    .line 135
    .line 136
    :cond_8
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->j0()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    invoke-virtual {p0, v1, v0, p1}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 151
    .line 152
    .line 153
    return v2
.end method
