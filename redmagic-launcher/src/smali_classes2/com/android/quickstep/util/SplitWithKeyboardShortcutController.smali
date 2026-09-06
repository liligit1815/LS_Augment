.class public Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;
.super Ljava/lang/Object;
.source "SplitWithKeyboardShortcutController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;
    }
.end annotation


# instance fields
.field private final mController:Lcom/android/quickstep/util/SplitSelectStateController;

.field private final mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

.field private final mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

.field private final mSplitPlaceholderInset:I

.field private final mSplitPlaceholderSize:I


# direct methods
.method public constructor <init>(Lcom/android/launcher3/uioverrides/QuickstepLauncher;Lcom/android/quickstep/util/SplitSelectStateController;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 7
    .line 8
    sget-object p2, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 9
    .line 10
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Lcom/android/quickstep/OverviewComponentObserver;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const v0, 0x7f070a90

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mSplitPlaceholderSize:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const p2, 0x7f070a8f

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mSplitPlaceholderInset:I

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->lambda$enterStageSplit$0(Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->lambda$enterStageSplit$1(Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/quickstep/util/SplitSelectStateController;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mController:Lcom/android/quickstep/util/SplitSelectStateController;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)Lcom/android/launcher3/uioverrides/QuickstepLauncher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mSplitPlaceholderInset:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mSplitPlaceholderSize:I

    .line 2
    .line 3
    return p0
.end method

.method private synthetic lambda$enterStageSplit$0(Lcom/android/quickstep/RecentsAnimationCallbacks;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/app/ActivityOptions;->setTransientLaunch()Landroid/app/ActivityOptions;

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/android/quickstep/SystemUiProxy;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mOverviewComponentObserver:Lcom/android/quickstep/OverviewComponentObserver;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/quickstep/OverviewComponentObserver;->getOverviewIntent()Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, p0, v1, p1, v2}, Lcom/android/quickstep/SystemUiProxy;->startRecentsActivity(Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/systemui/shared/system/RecentsAnimationListener;Z)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic lambda$enterStageSplit$1(Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Lcom/android/quickstep/RecentsAnimationCallbacks;->addListener(Lcom/android/quickstep/RecentsAnimationCallbacks$RecentsAnimationListener;)V

    .line 2
    .line 3
    .line 4
    sget-object p2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 5
    .line 6
    new-instance v0, Lcom/android/quickstep/util/g1;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lcom/android/quickstep/util/g1;-><init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public enterStageSplit(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/quickstep/TopTaskTracker;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    array-length v0, v0

    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Lcom/android/quickstep/RecentsAnimationCallbacks;

    .line 21
    .line 22
    sget-object v1, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;->mLauncher:Lcom/android/launcher3/uioverrides/QuickstepLauncher;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/android/quickstep/SystemUiProxy;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Lcom/android/quickstep/RecentsAnimationCallbacks;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-direct {v1, p0, p1, v2}, Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;-><init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;ZLcom/android/quickstep/util/k1;)V

    .line 43
    .line 44
    .line 45
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 46
    .line 47
    new-instance v2, Lcom/android/quickstep/util/h1;

    .line 48
    .line 49
    invoke-direct {v2, p0, v0, v1}, Lcom/android/quickstep/util/h1;-><init>(Lcom/android/quickstep/util/SplitWithKeyboardShortcutController;Lcom/android/quickstep/RecentsAnimationCallbacks;Lcom/android/quickstep/util/SplitWithKeyboardShortcutController$SplitWithKeyboardShortcutRecentsAnimationListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
