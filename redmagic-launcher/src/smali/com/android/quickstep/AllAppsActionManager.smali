.class public final Lcom/android/quickstep/AllAppsActionManager;
.super Ljava/lang/Object;
.source "AllAppsActionManager.kt"


# instance fields
.field private final bgExecutor:Ljava/util/concurrent/Executor;

.field private final context:Landroid/content/Context;

.field private final createAllAppsPendingIntent:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field private isActionRegistered:Z

.field private isHomeAndOverviewSame:Z

.field private isSetupUiVisible:Z

.field private isTaskbarPresent:Z

.field private isUserSetupComplete:Z

.field private final onSettingsChangeListener:Lcom/android/launcher3/util/p2$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Lu4/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/Executor;",
            "Lu4/a<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bgExecutor"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "createAllAppsPendingIntent"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/android/quickstep/AllAppsActionManager;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/android/quickstep/AllAppsActionManager;->createAllAppsPendingIntent:Lu4/a;

    .line 24
    .line 25
    new-instance p2, Lcom/android/quickstep/E0;

    .line 26
    .line 27
    invoke-direct {p2, p0}, Lcom/android/quickstep/E0;-><init>(Lcom/android/quickstep/AllAppsActionManager;)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Lcom/android/quickstep/AllAppsActionManager;->onSettingsChangeListener:Lcom/android/launcher3/util/p2$a;

    .line 31
    .line 32
    sget-object p3, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 33
    .line 34
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/android/launcher3/util/p2;

    .line 39
    .line 40
    invoke-static {}, Lcom/android/quickstep/AllAppsActionManagerKt;->access$getUSER_SETUP_COMPLETE_URI$p()Landroid/net/Uri;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1, p2}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/android/launcher3/util/p2;

    .line 52
    .line 53
    invoke-static {}, Lcom/android/quickstep/AllAppsActionManagerKt;->access$getUSER_SETUP_COMPLETE_URI$p()Landroid/net/Uri;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const/4 p3, 0x0

    .line 58
    invoke-virtual {p1, p2, p3}, Lcom/android/launcher3/util/p2;->g(Landroid/net/Uri;I)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput-boolean p1, p0, Lcom/android/quickstep/AllAppsActionManager;->isUserSetupComplete:Z

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/AllAppsActionManager;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/AllAppsActionManager;->updateSystemAction$lambda$1(Lcom/android/quickstep/AllAppsActionManager;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/AllAppsActionManager;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/AllAppsActionManager;->onSettingsChangeListener$lambda$0(Lcom/android/quickstep/AllAppsActionManager;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final onSettingsChangeListener$lambda$0(Lcom/android/quickstep/AllAppsActionManager;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/AllAppsActionManager;->setUserSetupComplete(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final setUserSetupComplete(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AllAppsActionManager;->isUserSetupComplete:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/AllAppsActionManager;->updateSystemAction()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final updateSystemAction()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/AllAppsActionManager;->isSetupUiVisible:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/android/quickstep/AllAppsActionManager;->isUserSetupComplete:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    move v0, v1

    .line 15
    :goto_1
    iget-boolean v3, p0, Lcom/android/quickstep/AllAppsActionManager;->isHomeAndOverviewSame:Z

    .line 16
    .line 17
    if-nez v3, :cond_2

    .line 18
    .line 19
    iget-boolean v3, p0, Lcom/android/quickstep/AllAppsActionManager;->isTaskbarPresent:Z

    .line 20
    .line 21
    if-eqz v3, :cond_3

    .line 22
    .line 23
    :cond_2
    if-nez v0, :cond_3

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_3
    move v1, v2

    .line 27
    :goto_2
    iget-boolean v0, p0, Lcom/android/quickstep/AllAppsActionManager;->isActionRegistered:Z

    .line 28
    .line 29
    if-ne v0, v1, :cond_4

    .line 30
    .line 31
    return-void

    .line 32
    :cond_4
    iput-boolean v1, p0, Lcom/android/quickstep/AllAppsActionManager;->isActionRegistered:Z

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/quickstep/AllAppsActionManager;->bgExecutor:Ljava/util/concurrent/Executor;

    .line 35
    .line 36
    new-instance v2, Lcom/android/quickstep/F0;

    .line 37
    .line 38
    invoke-direct {v2, p0, v1}, Lcom/android/quickstep/F0;-><init>(Lcom/android/quickstep/AllAppsActionManager;Z)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private static final updateSystemAction$lambda$1(Lcom/android/quickstep/AllAppsActionManager;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/view/accessibility/AccessibilityManager;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/16 v1, 0xe

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    new-instance p1, Landroid/app/RemoteAction;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 21
    .line 22
    const v3, 0x7f080cf5

    .line 23
    .line 24
    .line 25
    invoke-static {v2, v3}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 30
    .line 31
    const v4, 0x7f14006d

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v5, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 39
    .line 40
    invoke-virtual {v5, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    iget-object p0, p0, Lcom/android/quickstep/AllAppsActionManager;->createAllAppsPendingIntent:Lu4/a;

    .line 45
    .line 46
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Landroid/app/PendingIntent;

    .line 51
    .line 52
    invoke-direct {p1, v2, v3, v4, p0}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1, v1}, Landroid/view/accessibility/AccessibilityManager;->registerSystemAction(Landroid/app/RemoteAction;I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->unregisterSystemAction(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final isActionRegistered()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AllAppsActionManager;->isActionRegistered:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isHomeAndOverviewSame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AllAppsActionManager;->isHomeAndOverviewSame:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isSetupUiVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AllAppsActionManager;->isSetupUiVisible:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isTaskbarPresent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/AllAppsActionManager;->isTaskbarPresent:Z

    .line 2
    .line 3
    return p0
.end method

.method public final onDestroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/AllAppsActionManager;->isActionRegistered:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 5
    .line 6
    const-class v1, Landroid/view/accessibility/AccessibilityManager;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/16 v1, 0xe

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/accessibility/AccessibilityManager;->unregisterSystemAction(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object v0, Lcom/android/launcher3/util/p2;->n:Lcom/android/launcher3/util/I;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/quickstep/AllAppsActionManager;->context:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/android/launcher3/util/p2;

    .line 30
    .line 31
    invoke-static {}, Lcom/android/quickstep/AllAppsActionManagerKt;->access$getUSER_SETUP_COMPLETE_URI$p()Landroid/net/Uri;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object p0, p0, Lcom/android/quickstep/AllAppsActionManager;->onSettingsChangeListener:Lcom/android/launcher3/util/p2$a;

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final setHomeAndOverviewSame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AllAppsActionManager;->isHomeAndOverviewSame:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/AllAppsActionManager;->updateSystemAction()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setSetupUiVisible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AllAppsActionManager;->isSetupUiVisible:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/AllAppsActionManager;->updateSystemAction()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final setTaskbarPresent(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/AllAppsActionManager;->isTaskbarPresent:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/quickstep/AllAppsActionManager;->updateSystemAction()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
