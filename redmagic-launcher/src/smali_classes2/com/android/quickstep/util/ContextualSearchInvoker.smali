.class public final Lcom/android/quickstep/util/ContextualSearchInvoker;
.super Ljava/lang/Object;
.source "ContextualSearchInvoker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/ContextualSearchInvoker$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/ContextualSearchInvoker$Companion;

.field public static final KEYGUARD_SHOWING_SYSUI_FLAGS:J = 0x248L

.field public static final SHADE_EXPANDED_SYSUI_FLAGS:J = 0x804L

.field private static final TAG:Ljava/lang/String; = "ContextualSearchInvoker"


# instance fields
.field private final context:Landroid/content/Context;

.field private final contextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

.field private final contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

.field private final contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

.field private final statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

.field private final systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

.field private final topTaskTracker:Lcom/android/quickstep/TopTaskTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/ContextualSearchInvoker$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/ContextualSearchInvoker;->Companion:Lcom/android/quickstep/util/ContextualSearchInvoker$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 10

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "get(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, v0

    check-cast v4, Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 10
    sget-object v0, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v5, v0

    check-cast v5, Lcom/android/quickstep/TopTaskTracker;

    .line 11
    sget-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v6, v0

    check-cast v6, Lcom/android/quickstep/SystemUiProxy;

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v7

    const-string v0, "newInstance(...)"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchHapticManager;->INSTANCE:Lcom/android/launcher3/util/I;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v8, v0

    check-cast v8, Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 14
    const-class v0, Landroid/app/contextualsearch/ContextualSearchManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/app/contextualsearch/ContextualSearchManager;

    move-object v2, p0

    move-object v3, p1

    .line 15
    invoke-direct/range {v2 .. v9}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/util/ContextualSearchHapticManager;Landroid/app/contextualsearch/ContextualSearchManager;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/quickstep/TopTaskTracker;Lcom/android/quickstep/SystemUiProxy;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/quickstep/util/ContextualSearchHapticManager;Landroid/app/contextualsearch/ContextualSearchManager;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contextualSearchStateManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "topTaskTracker"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "systemUiProxy"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "statsLogManager"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "contextualSearchHapticManager"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 4
    iput-object p3, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 5
    iput-object p4, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 6
    iput-object p5, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 7
    iput-object p6, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 8
    iput-object p7, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->endLiveTileMode$lambda$1(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/ContextualSearchInvoker;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->invokeContextualSearchUnchecked$lambda$0(Lcom/android/quickstep/util/ContextualSearchInvoker;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final endLiveTileMode(Lcom/android/quickstep/BaseContainerInterface;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    if-nez p0, :cond_1

    .line 10
    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "getOverviewPanel(...)"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 25
    .line 26
    new-instance p1, Lcom/android/quickstep/util/K;

    .line 27
    .line 28
    invoke-direct {p1, p0, p2}, Lcom/android/quickstep/util/K;-><init>(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/RecentsView;->switchToScreenshot(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private static final endLiveTileMode$lambda$1(Lcom/android/quickstep/views/RecentsView;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, p1}, Lcom/android/quickstep/views/RecentsView;->finishRecentsAnimation(ZZLjava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final invokeContextualSearchUnchecked(IZ)Z
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Lcom/android/quickstep/DeviceConfigWrapper;->getEnableSearchHapticCommit()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchHapticManager:Lcom/android/quickstep/util/ContextualSearchHapticManager;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/android/quickstep/util/ContextualSearchHapticManager;->vibrateForSearch()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->getRecentsContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/android/quickstep/BaseContainerInterface;->isInLiveTileMode()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ne v1, v0, :cond_2

    .line 38
    .line 39
    const-string v1, "ContextualSearchInvoker"

    .line 40
    .line 41
    const-string v2, "Contextual Search invocation attempted: live tile"

    .line 42
    .line 43
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/android/quickstep/util/L;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Lcom/android/quickstep/util/L;-><init>(Lcom/android/quickstep/util/ContextualSearchInvoker;I)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, p2, v1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->endLiveTileMode(Lcom/android/quickstep/BaseContainerInterface;Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/app/contextualsearch/ContextualSearchManager;->startContextualSearch(I)V

    .line 58
    .line 59
    .line 60
    :goto_0
    return v0
.end method

.method static synthetic invokeContextualSearchUnchecked$default(Lcom/android/quickstep/util/ContextualSearchInvoker;IZILjava/lang/Object;)Z
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/ContextualSearchInvoker;->invokeContextualSearchUnchecked(IZ)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private static final invokeContextualSearchUnchecked$lambda$0(Lcom/android/quickstep/util/ContextualSearchInvoker;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/app/contextualsearch/ContextualSearchManager;->startContextualSearch(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final isFakeLandscape()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->getRecentsContainerInterface()Lcom/android/quickstep/BaseContainerInterface;

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
    invoke-virtual {p0}, Lcom/android/quickstep/BaseContainerInterface;->getCreatedContainer()Lcom/android/quickstep/views/RecentsViewContainer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/android/quickstep/views/RecentsViewContainer;->getOverviewPanel()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/quickstep/views/RecentsView;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/quickstep/views/RecentsView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-interface {p0}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->isLayoutNaturalToLauncher()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v0
.end method

.method private final isInSplitscreen()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->topTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/TopTaskTracker;->getRunningSplitTaskIds()[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "getRunningSplitTaskIds(...)"

    .line 8
    .line 9
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    array-length p0, p0

    .line 13
    const/4 v0, 0x1

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    move p0, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    xor-int/2addr p0, v0

    .line 20
    return p0
.end method

.method private final isKeyguardShowing()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x248

    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    cmp-long p0, v0, v2

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method private final isNotificationShadeShowing()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->systemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->getLastSystemUiStateFlags()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x804

    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    cmp-long p0, v0, v2

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method


# virtual methods
.method public final getRecentsContainerInterface()Lcom/android/quickstep/BaseContainerInterface;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/BaseContainerInterface<",
            "**>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/OverviewComponentObserver;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

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
    return-object p0
.end method

.method public final getSysUiAssistOverrideInvocationTypes()[I
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/x0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "com.google.android.feature.CONTEXTUAL_SEARCH"

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x5

    .line 21
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/util/x0;->A()[I

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "toArray(...)"

    .line 29
    .line 30
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method

.method public final invokeContextualSearchUncheckedWithHaptic(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->invokeContextualSearchUnchecked(IZ)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public final runContextualSearchInvocationChecksAndLogFailures()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchManager:Landroid/app/contextualsearch/ContextualSearchManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "ContextualSearchInvoker"

    .line 5
    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v3, "com.google.android.feature.CONTEXTUAL_SEARCH"

    .line 15
    .line 16
    invoke-virtual {v0, v3}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->isContextualSearchSettingEnabled()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string v0, "Contextual Search invocation failed: setting disabled"

    .line 33
    .line 34
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->H3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 46
    .line 47
    .line 48
    return v1

    .line 49
    :cond_1
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->isNotificationShadeShowing()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const-string v0, "Contextual Search invocation failed: notification shade"

    .line 56
    .line 57
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->L3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 67
    .line 68
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 69
    .line 70
    .line 71
    return v1

    .line 72
    :cond_2
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->isKeyguardShowing()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    const-string v0, "Contextual Search invocation attempted: keyguard"

    .line 79
    .line 80
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->N3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 90
    .line 91
    invoke-interface {v0, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->isInvocationAllowedOnKeyguard()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_3

    .line 101
    .line 102
    const-string p0, "Contextual Search invocation failed: keyguard not allowed"

    .line 103
    .line 104
    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    return v1

    .line 108
    :cond_3
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->supportsShowWhenLocked()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_4

    .line 115
    .line 116
    const-string p0, "Contextual Search invocation failed: AGA doesn\'t support keyguard"

    .line 117
    .line 118
    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    return v1

    .line 122
    :cond_4
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->isInSplitscreen()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_5

    .line 127
    .line 128
    const-string v0, "Contextual Search invocation attempted: splitscreen"

    .line 129
    .line 130
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->O3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 140
    .line 141
    invoke-interface {v0, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 145
    .line 146
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->isInvocationAllowedInSplitscreen()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_5

    .line 151
    .line 152
    const-string p0, "Contextual Search invocation failed: splitscreen not allowed"

    .line 153
    .line 154
    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    return v1

    .line 158
    :cond_5
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->contextualSearchStateManager:Lcom/android/quickstep/util/ContextualSearchStateManager;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->isContextualSearchIntentAvailable()Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-nez v0, :cond_6

    .line 165
    .line 166
    const-string v0, "Contextual Search invocation failed: no matching CSS intent filter"

    .line 167
    .line 168
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->G3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 178
    .line 179
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 180
    .line 181
    .line 182
    return v1

    .line 183
    :cond_6
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->isFakeLandscape()Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_7

    .line 188
    .line 189
    return v1

    .line 190
    :cond_7
    const/4 p0, 0x1

    .line 191
    return p0

    .line 192
    :cond_8
    :goto_0
    const-string v0, "Contextual Search invocation failed: no ContextualSearchManager"

    .line 193
    .line 194
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->E3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 204
    .line 205
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 206
    .line 207
    .line 208
    return v1
.end method

.method public final show(I)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchInvoker;->runContextualSearchInvocationChecksAndLogFailures()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {p0, p1, v1, v0, v2}, Lcom/android/quickstep/util/ContextualSearchInvoker;->invokeContextualSearchUnchecked$default(Lcom/android/quickstep/util/ContextualSearchInvoker;IZILjava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final tryStartAssistOverride(I)Z
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p1, v0, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "com.google.android.feature.CONTEXTUAL_SEARCH"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    const/4 p1, 0x2

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->show(I)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    sget-object p1, Lcom/android/quickstep/TopTaskTracker;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->context:Landroid/content/Context;

    .line 31
    .line 32
    invoke-virtual {p1, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/android/quickstep/TopTaskTracker;

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/android/quickstep/TopTaskTracker;->getCachedTopTask(ZI)Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1}, Lcom/android/quickstep/TopTaskTracker$CachedTaskInfo;->getPackageName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchInvoker;->statsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withPackageName(Ljava/lang/String;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->I3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 57
    .line 58
    invoke-interface {p0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return v0

    .line 62
    :cond_2
    return v1
.end method
