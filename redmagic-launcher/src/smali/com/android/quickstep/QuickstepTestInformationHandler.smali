.class public Lcom/android/quickstep/QuickstepTestInformationHandler;
.super Lcom/android/launcher3/testing/TestInformationHandler;
.source "QuickstepTestInformationHandler.java"


# instance fields
.field protected final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/testing/TestInformationHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic D(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->injectFakeTrackpadForTesting()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Lcom/android/quickstep/QuickstepTestInformationHandler;Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)Lcom/android/quickstep/util/TISBindHelper;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/QuickstepTestInformationHandler;->lambda$runOnTISBinder$16(Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic F(Lcom/android/quickstep/TouchInteractionService$TISBinder;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->D0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic G(Lcom/android/quickstep/QuickstepTestInformationHandler;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->lambda$call$8(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/android/quickstep/views/RecentsViewContainer;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getLastComputedGridTaskSize()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic I(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->ejectFakeTrackpadForTesting()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/android/quickstep/TouchInteractionService$TISBinder;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->E0()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic K(Lcom/android/quickstep/QuickstepTestInformationHandler;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->lambda$call$9(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/android/quickstep/views/RecentsViewContainer;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getLastComputedTaskSize()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic M(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/g3;->E0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic N(Lcom/android/launcher3/C2;)Ljava/lang/Integer;
    .locals 0

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
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic O(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->A2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic P(Lcom/android/quickstep/QuickstepTestInformationHandler;)Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->getRecentsViewContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic Q(Lcom/android/quickstep/TouchInteractionService$TISBinder;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->T0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic R(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->z2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/testing/TestInformationHandler$c;Landroid/os/Bundle;Ljava/util/function/Function;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 1

    .line 1
    const-string v0, "response"

    .line 2
    .line 3
    invoke-interface {p2, p3}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p0, p1, v0, p2}, Lcom/android/launcher3/testing/TestInformationHandler$c;->a(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic T(Landroid/os/Bundle;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/g3;->a0()Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->C0()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const-string v0, "response"

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic U(Ljava/util/ArrayList;Ljava/util/concurrent/CountDownLatch;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/android/quickstep/util/GroupTask;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/android/systemui/shared/recents/model/Task;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->baseIntent:Landroid/content/Intent;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic V(Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private enableBlockingTimeout(Lcom/android/quickstep/TouchInteractionService$TISBinder;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

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
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/launcher3/taskbar/I1;->l0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private enableTransientTaskbar(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/Z;->r:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/launcher3/util/Z;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/util/Z;->t(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private getRecentsViewContainer()Lcom/android/quickstep/views/RecentsViewContainer;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/OverviewComponentObserver;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/quickstep/OverviewComponentObserver;->getContainerInterface(I)Lcom/android/quickstep/BaseContainerInterface;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private getTISBinderUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/launcher3/testing/TestInformationHandler$c<",
            "TT;>;",
            "Ljava/util/function/Function<",
            "Lcom/android/quickstep/TouchInteractionService$TISBinder;",
            "TT;>;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/quickstep/d2;

    .line 7
    .line 8
    invoke-direct {v1, p1, v0, p2}, Lcom/android/quickstep/d2;-><init>(Lcom/android/launcher3/testing/TestInformationHandler$c;Landroid/os/Bundle;Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private synthetic lambda$call$8(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->enableBlockingTimeout(Lcom/android/quickstep/TouchInteractionService$TISBinder;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic lambda$call$9(Lcom/android/quickstep/TouchInteractionService$TISBinder;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->enableBlockingTimeout(Lcom/android/quickstep/TouchInteractionService$TISBinder;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic lambda$runOnTISBinder$16(Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)Lcom/android/quickstep/util/TISBindHelper;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/TISBindHelper;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    new-instance v1, Lcom/android/quickstep/c2;

    .line 6
    .line 7
    invoke-direct {v1, p1, p2}, Lcom/android/quickstep/c2;-><init>(Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, p0, v1}, Lcom/android/quickstep/util/TISBindHelper;-><init>(Landroid/content/Context;Ljava/util/function/Consumer;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    new-instance v1, Landroid/os/Bundle;

    .line 3
    .line 4
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const-string v3, "response"

    .line 12
    .line 13
    const/4 v4, -0x1

    .line 14
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    sparse-switch v5, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v5, "disable-block-timeout"

    .line 24
    .line 25
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-nez v5, :cond_0

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_0
    const/16 v4, 0x17

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v5, "refresh-overview-target"

    .line 38
    .line 39
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    if-nez v5, :cond_1

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_1
    const/16 v4, 0x16

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v5, "get-overivew-task-size"

    .line 52
    .line 53
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-nez v5, :cond_2

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_2
    const/16 v4, 0x15

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v5, "shell-drag-ready"

    .line 66
    .line 67
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-nez v5, :cond_3

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_3
    const/16 v4, 0x14

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_4
    const-string v5, "unstash-taskbar-if-stashed"

    .line 80
    .line 81
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-nez v5, :cond_4

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_4
    const/16 v4, 0x13

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :sswitch_5
    const-string v5, "recent-tasks-list"

    .line 94
    .line 95
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-nez v5, :cond_5

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_5
    const/16 v4, 0x12

    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :sswitch_6
    const-string v5, "taskbar-from-nav-threshold"

    .line 108
    .line 109
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    if-nez v5, :cond_6

    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :cond_6
    const/16 v4, 0x11

    .line 118
    .line 119
    goto/16 :goto_0

    .line 120
    .line 121
    :sswitch_7
    const-string v5, "home-to-overview-swipe-height"

    .line 122
    .line 123
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-nez v5, :cond_7

    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :cond_7
    const/16 v4, 0x10

    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :sswitch_8
    const-string v5, "taskbar-ime-docked"

    .line 136
    .line 137
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    if-nez v5, :cond_8

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_8
    const/16 v4, 0xf

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_9
    const-string v5, "get-overview-page-spacing"

    .line 150
    .line 151
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v5

    .line 155
    if-nez v5, :cond_9

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_9
    const/16 v4, 0xe

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_a
    const-string v5, "inject-fake-trackpad"

    .line 164
    .line 165
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    if-nez v5, :cond_a

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_a
    const/16 v4, 0xd

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_b
    const-string v5, "has-touch-interaction-service"

    .line 178
    .line 179
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    if-nez v5, :cond_b

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_b
    const/16 v4, 0xc

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_c
    const-string v5, "background-to-overview-swipe-height"

    .line 192
    .line 193
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    if-nez v5, :cond_c

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_c
    const/16 v4, 0xb

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_d
    const-string v5, "get-overivew-grid-task-size"

    .line 206
    .line 207
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    if-nez v5, :cond_d

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_d
    const/16 v4, 0xa

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_e
    const-string v5, "unstash-bubble-bar-if-stashed"

    .line 220
    .line 221
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v5

    .line 225
    if-nez v5, :cond_e

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :cond_e
    const/16 v4, 0x9

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_f
    const-string v5, "recreate-taskbar"

    .line 234
    .line 235
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v5

    .line 239
    if-nez v5, :cond_f

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :cond_f
    const/16 v4, 0x8

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_10
    const-string v5, "enable-block-timeout"

    .line 248
    .line 249
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v5

    .line 253
    if-nez v5, :cond_10

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_10
    const/4 v4, 0x7

    .line 257
    goto :goto_0

    .line 258
    :sswitch_11
    const-string v5, "eject-fake-trackpad"

    .line 259
    .line 260
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    if-nez v5, :cond_11

    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_11
    const/4 v4, 0x6

    .line 268
    goto :goto_0

    .line 269
    :sswitch_12
    const-string v5, "disable-transient-taskbar"

    .line 270
    .line 271
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v5

    .line 275
    if-nez v5, :cond_12

    .line 276
    .line 277
    goto :goto_0

    .line 278
    :cond_12
    const/4 v4, 0x5

    .line 279
    goto :goto_0

    .line 280
    :sswitch_13
    const-string v5, "enable-transient-taskbar"

    .line 281
    .line 282
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    if-nez v5, :cond_13

    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_13
    const/4 v4, 0x4

    .line 290
    goto :goto_0

    .line 291
    :sswitch_14
    const-string v5, "taskbar-all-apps-top-padding"

    .line 292
    .line 293
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v5

    .line 297
    if-nez v5, :cond_14

    .line 298
    .line 299
    goto :goto_0

    .line 300
    :cond_14
    const/4 v4, 0x3

    .line 301
    goto :goto_0

    .line 302
    :sswitch_15
    const-string v5, "get-overview-current-page-index"

    .line 303
    .line 304
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v5

    .line 308
    if-nez v5, :cond_15

    .line 309
    .line 310
    goto :goto_0

    .line 311
    :cond_15
    const/4 v4, 0x2

    .line 312
    goto :goto_0

    .line 313
    :sswitch_16
    const-string v5, "taskbar-apps-list-scroll-y"

    .line 314
    .line 315
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result v5

    .line 319
    if-nez v5, :cond_16

    .line 320
    .line 321
    goto :goto_0

    .line 322
    :cond_16
    move v4, v2

    .line 323
    goto :goto_0

    .line 324
    :sswitch_17
    const-string v5, "taskbar-stash-handle-scale"

    .line 325
    .line 326
    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-nez v5, :cond_17

    .line 331
    .line 332
    goto :goto_0

    .line 333
    :cond_17
    move v4, v0

    .line 334
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 335
    .line 336
    .line 337
    invoke-super {p0, p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    return-object p0

    .line 342
    :pswitch_0
    new-instance p1, Lcom/android/quickstep/h2;

    .line 343
    .line 344
    invoke-direct {p1, p0}, Lcom/android/quickstep/h2;-><init>(Lcom/android/quickstep/QuickstepTestInformationHandler;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 348
    .line 349
    .line 350
    return-object v1

    .line 351
    :pswitch_1
    new-instance p1, Lcom/android/quickstep/i2;

    .line 352
    .line 353
    invoke-direct {p1}, Lcom/android/quickstep/i2;-><init>()V

    .line 354
    .line 355
    .line 356
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 357
    .line 358
    .line 359
    return-object v1

    .line 360
    :pswitch_2
    new-instance p1, Lcom/android/quickstep/k2;

    .line 361
    .line 362
    invoke-direct {p1}, Lcom/android/quickstep/k2;-><init>()V

    .line 363
    .line 364
    .line 365
    new-instance p2, Lcom/android/quickstep/U1;

    .line 366
    .line 367
    invoke-direct {p2}, Lcom/android/quickstep/U1;-><init>()V

    .line 368
    .line 369
    .line 370
    new-instance p3, Lcom/android/quickstep/V1;

    .line 371
    .line 372
    invoke-direct {p3, p0}, Lcom/android/quickstep/V1;-><init>(Lcom/android/quickstep/QuickstepTestInformationHandler;)V

    .line 373
    .line 374
    .line 375
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    return-object p0

    .line 380
    :pswitch_3
    sget-object p1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 381
    .line 382
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 383
    .line 384
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 389
    .line 390
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->isDragAndDropReady()Z

    .line 391
    .line 392
    .line 393
    move-result p0

    .line 394
    invoke-virtual {v1, v3, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 395
    .line 396
    .line 397
    return-object v1

    .line 398
    :pswitch_4
    new-instance p1, Lcom/android/quickstep/Y1;

    .line 399
    .line 400
    invoke-direct {p1}, Lcom/android/quickstep/Y1;-><init>()V

    .line 401
    .line 402
    .line 403
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 404
    .line 405
    .line 406
    return-object v1

    .line 407
    :pswitch_5
    new-instance p1, Ljava/util/ArrayList;

    .line 408
    .line 409
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 410
    .line 411
    .line 412
    new-instance p2, Ljava/util/concurrent/CountDownLatch;

    .line 413
    .line 414
    invoke-direct {p2, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 415
    .line 416
    .line 417
    sget-object p3, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 418
    .line 419
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 420
    .line 421
    invoke-virtual {p3, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    check-cast p0, Lcom/android/quickstep/RecentsModel;

    .line 426
    .line 427
    new-instance p3, Lcom/android/quickstep/Q1;

    .line 428
    .line 429
    invoke-direct {p3, p1, p2}, Lcom/android/quickstep/Q1;-><init>(Ljava/util/ArrayList;Ljava/util/concurrent/CountDownLatch;)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {p0, p3}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;)I

    .line 433
    .line 434
    .line 435
    :try_start_0
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 436
    .line 437
    const-wide/16 v4, 0x2

    .line 438
    .line 439
    invoke-virtual {p2, v4, v5, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    .line 441
    .line 442
    invoke-virtual {v1, v3, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 443
    .line 444
    .line 445
    return-object v1

    .line 446
    :catch_0
    move-exception p0

    .line 447
    new-instance p1, Ljava/lang/RuntimeException;

    .line 448
    .line 449
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 450
    .line 451
    .line 452
    throw p1

    .line 453
    :pswitch_6
    iget-object p1, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 454
    .line 455
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 456
    .line 457
    .line 458
    move-result-object p1

    .line 459
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 460
    .line 461
    invoke-static {p1, p0}, Lcom/android/launcher3/taskbar/c4;->c(Landroid/content/res/Resources;Lcom/android/launcher3/h0;)I

    .line 462
    .line 463
    .line 464
    move-result p0

    .line 465
    invoke-virtual {v1, v3, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 466
    .line 467
    .line 468
    return-object v1

    .line 469
    :pswitch_7
    iget-object p1, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 470
    .line 471
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 472
    .line 473
    invoke-static {p1, p0}, Lcom/android/quickstep/util/LayoutUtils;->getDefaultSwipeHeight(Landroid/content/Context;Lcom/android/launcher3/h0;)F

    .line 474
    .line 475
    .line 476
    move-result p0

    .line 477
    float-to-int p0, p0

    .line 478
    invoke-virtual {v1, v3, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 479
    .line 480
    .line 481
    return-object v1

    .line 482
    :pswitch_8
    new-instance p1, Lcom/android/launcher3/testing/i;

    .line 483
    .line 484
    invoke-direct {p1}, Lcom/android/launcher3/testing/i;-><init>()V

    .line 485
    .line 486
    .line 487
    new-instance p2, Lcom/android/quickstep/l2;

    .line 488
    .line 489
    invoke-direct {p2}, Lcom/android/quickstep/l2;-><init>()V

    .line 490
    .line 491
    .line 492
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/QuickstepTestInformationHandler;->getTISBinderUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 493
    .line 494
    .line 495
    move-result-object p0

    .line 496
    return-object p0

    .line 497
    :pswitch_9
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 498
    .line 499
    iget p0, p0, Lcom/android/launcher3/h0;->W2:I

    .line 500
    .line 501
    invoke-virtual {v1, v3, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 502
    .line 503
    .line 504
    return-object v1

    .line 505
    :pswitch_a
    new-instance p1, Lcom/android/quickstep/S1;

    .line 506
    .line 507
    invoke-direct {p1}, Lcom/android/quickstep/S1;-><init>()V

    .line 508
    .line 509
    .line 510
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 511
    .line 512
    .line 513
    return-object v1

    .line 514
    :pswitch_b
    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 515
    .line 516
    .line 517
    return-object v1

    .line 518
    :pswitch_c
    iget-object p0, p0, Lcom/android/launcher3/testing/TestInformationHandler;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 519
    .line 520
    iget p0, p0, Lcom/android/launcher3/h0;->U0:I

    .line 521
    .line 522
    int-to-float p0, p0

    .line 523
    const/high16 p1, 0x40000000    # 2.0f

    .line 524
    .line 525
    div-float/2addr p0, p1

    .line 526
    float-to-int p0, p0

    .line 527
    invoke-virtual {v1, v3, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 528
    .line 529
    .line 530
    return-object v1

    .line 531
    :pswitch_d
    new-instance p1, Lcom/android/quickstep/k2;

    .line 532
    .line 533
    invoke-direct {p1}, Lcom/android/quickstep/k2;-><init>()V

    .line 534
    .line 535
    .line 536
    new-instance p2, Lcom/android/quickstep/W1;

    .line 537
    .line 538
    invoke-direct {p2}, Lcom/android/quickstep/W1;-><init>()V

    .line 539
    .line 540
    .line 541
    new-instance p3, Lcom/android/quickstep/V1;

    .line 542
    .line 543
    invoke-direct {p3, p0}, Lcom/android/quickstep/V1;-><init>(Lcom/android/quickstep/QuickstepTestInformationHandler;)V

    .line 544
    .line 545
    .line 546
    invoke-static {p1, p2, p3}, Lcom/android/launcher3/testing/TestInformationHandler;->getUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;Ljava/util/function/Supplier;)Landroid/os/Bundle;

    .line 547
    .line 548
    .line 549
    move-result-object p0

    .line 550
    return-object p0

    .line 551
    :pswitch_e
    new-instance p1, Lcom/android/quickstep/R1;

    .line 552
    .line 553
    invoke-direct {p1}, Lcom/android/quickstep/R1;-><init>()V

    .line 554
    .line 555
    .line 556
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 557
    .line 558
    .line 559
    return-object v1

    .line 560
    :pswitch_f
    new-instance p1, Lcom/android/quickstep/j2;

    .line 561
    .line 562
    invoke-direct {p1}, Lcom/android/quickstep/j2;-><init>()V

    .line 563
    .line 564
    .line 565
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 566
    .line 567
    .line 568
    return-object v1

    .line 569
    :pswitch_10
    new-instance p1, Lcom/android/quickstep/g2;

    .line 570
    .line 571
    invoke-direct {p1, p0}, Lcom/android/quickstep/g2;-><init>(Lcom/android/quickstep/QuickstepTestInformationHandler;)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 575
    .line 576
    .line 577
    return-object v1

    .line 578
    :pswitch_11
    new-instance p1, Lcom/android/quickstep/T1;

    .line 579
    .line 580
    invoke-direct {p1}, Lcom/android/quickstep/T1;-><init>()V

    .line 581
    .line 582
    .line 583
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 584
    .line 585
    .line 586
    return-object v1

    .line 587
    :pswitch_12
    invoke-direct {p0, v0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->enableTransientTaskbar(Z)V

    .line 588
    .line 589
    .line 590
    return-object v1

    .line 591
    :pswitch_13
    invoke-direct {p0, v2}, Lcom/android/quickstep/QuickstepTestInformationHandler;->enableTransientTaskbar(Z)V

    .line 592
    .line 593
    .line 594
    return-object v1

    .line 595
    :pswitch_14
    new-instance p1, Lcom/android/launcher3/testing/w;

    .line 596
    .line 597
    invoke-direct {p1}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 598
    .line 599
    .line 600
    new-instance p2, Lcom/android/quickstep/e2;

    .line 601
    .line 602
    invoke-direct {p2}, Lcom/android/quickstep/e2;-><init>()V

    .line 603
    .line 604
    .line 605
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/QuickstepTestInformationHandler;->getTISBinderUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 606
    .line 607
    .line 608
    move-result-object p0

    .line 609
    return-object p0

    .line 610
    :pswitch_15
    new-instance p0, Lcom/android/launcher3/testing/w;

    .line 611
    .line 612
    invoke-direct {p0}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 613
    .line 614
    .line 615
    new-instance p1, Lcom/android/quickstep/X1;

    .line 616
    .line 617
    invoke-direct {p1}, Lcom/android/quickstep/X1;-><init>()V

    .line 618
    .line 619
    .line 620
    invoke-static {p0, p1}, Lcom/android/launcher3/testing/TestInformationHandler;->getLauncherUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 621
    .line 622
    .line 623
    move-result-object p0

    .line 624
    return-object p0

    .line 625
    :pswitch_16
    new-instance p1, Lcom/android/launcher3/testing/w;

    .line 626
    .line 627
    invoke-direct {p1}, Lcom/android/launcher3/testing/w;-><init>()V

    .line 628
    .line 629
    .line 630
    new-instance p2, Lcom/android/quickstep/f2;

    .line 631
    .line 632
    invoke-direct {p2}, Lcom/android/quickstep/f2;-><init>()V

    .line 633
    .line 634
    .line 635
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/QuickstepTestInformationHandler;->getTISBinderUIProperty(Lcom/android/launcher3/testing/TestInformationHandler$c;Ljava/util/function/Function;)Landroid/os/Bundle;

    .line 636
    .line 637
    .line 638
    move-result-object p0

    .line 639
    return-object p0

    .line 640
    :pswitch_17
    new-instance p1, Lcom/android/quickstep/b2;

    .line 641
    .line 642
    invoke-direct {p1, v1}, Lcom/android/quickstep/b2;-><init>(Landroid/os/Bundle;)V

    .line 643
    .line 644
    .line 645
    invoke-virtual {p0, p1}, Lcom/android/quickstep/QuickstepTestInformationHandler;->runOnTISBinder(Ljava/util/function/Consumer;)V

    .line 646
    .line 647
    .line 648
    return-object v1

    .line 649
    :sswitch_data_0
    .sparse-switch
        -0x77e87c84 -> :sswitch_17
        -0x6f73b294 -> :sswitch_16
        -0x607c7c3b -> :sswitch_15
        -0x51016497 -> :sswitch_14
        -0x4adf5d9f -> :sswitch_13
        -0x45030f7a -> :sswitch_12
        -0x12b3811c -> :sswitch_11
        -0xf02b2a9 -> :sswitch_10
        0x9d1d90 -> :sswitch_f
        0x8ffc6ee -> :sswitch_e
        0x185113a5 -> :sswitch_d
        0x1ae46cdb -> :sswitch_c
        0x23b480f9 -> :sswitch_b
        0x29aadba4 -> :sswitch_a
        0x358667a2 -> :sswitch_9
        0x4210945d -> :sswitch_8
        0x482f264a -> :sswitch_7
        0x559ea71d -> :sswitch_6
        0x580c8e2f -> :sswitch_5
        0x66c861d4 -> :sswitch_4
        0x67f3b387 -> :sswitch_3
        0x6cf0df46 -> :sswitch_2
        0x729b0173 -> :sswitch_1
        0x7f9875fc -> :sswitch_0
    .end sparse-switch

    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getWindowInsets()Landroid/view/WindowInsets;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/QuickstepTestInformationHandler;->getRecentsViewContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getRootView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-super {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->getWindowInsets()Landroid/view/WindowInsets;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    return-object v0
.end method

.method protected isLauncherInitialized()Z
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->isLauncherInitialized()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/QuickstepTestInformationHandler;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/quickstep/SystemUiProxy;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->isActive()Z

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

.method protected runOnTISBinder(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/TouchInteractionService$TISBinder;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 8
    .line 9
    new-instance v2, Lcom/android/quickstep/Z1;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1, v0}, Lcom/android/quickstep/Z1;-><init>(Lcom/android/quickstep/QuickstepTestInformationHandler;Ljava/util/function/Consumer;Ljava/util/concurrent/CountDownLatch;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/util/concurrent/AbstractExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/android/quickstep/util/TISBindHelper;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    new-instance p1, Lcom/android/quickstep/a2;

    .line 31
    .line 32
    invoke-direct {p1, p0}, Lcom/android/quickstep/a2;-><init>(Lcom/android/quickstep/util/TISBindHelper;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    new-instance p1, Ljava/lang/RuntimeException;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    throw p1
.end method
