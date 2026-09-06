.class public Lcom/android/quickstep/util/ContextualSearchStateManager;
.super Ljava/lang/Object;
.source "ContextualSearchStateManager.java"


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/util/ContextualSearchStateManager;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_DEBUG_EVENT_SIZE:I = 0x14

.field private static final SEARCH_ALL_ENTRYPOINTS_ENABLED_URI:Landroid/net/Uri;

.field private static final TAG:Ljava/lang/String; = "ContextualSearchStMgr"


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected final mContextualSearchPackage:Ljava/lang/String;

.field private final mContextualSearchPackageReceiver:Lcom/android/launcher3/util/x2;

.field protected final mEventLogArray:Lcom/android/launcher3/util/j0;

.field private mIsContextualSearchIntentAvailable:Z

.field private mIsContextualSearchSettingEnabled:Z

.field private final mSysUiStateChangeListener:Ljava/lang/Runnable;

.field protected final mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

.field protected final mTopTaskTracker:Lcom/android/quickstep/TopTaskTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/M;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/util/M;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    const-string v0, "search_all_entrypoints_enabled"

    .line 14
    .line 15
    invoke-static {v0}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->SEARCH_ALL_ENTRYPOINTS_ENABLED_URI:Landroid/net/Uri;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/p2;Lcom/android/quickstep/SystemUiProxy;Lcom/android/quickstep/TopTaskTracker;Lcom/android/launcher3/util/K;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/quickstep/util/O;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/O;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mSysUiStateChangeListener:Ljava/lang/Runnable;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/j0;

    .line 12
    .line 13
    const-string v2, "ContextualSearchStMgr"

    .line 14
    .line 15
    const/16 v3, 0x14

    .line 16
    .line 17
    invoke-direct {v1, v2, v3}, Lcom/android/launcher3/util/j0;-><init>(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    new-instance v1, Lcom/android/launcher3/util/x2;

    .line 25
    .line 26
    sget-object v2, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 27
    .line 28
    new-instance v3, Lcom/android/quickstep/util/P;

    .line 29
    .line 30
    invoke-direct {v3, p0}, Lcom/android/quickstep/util/P;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {v1, p1, v2, v3}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContextualSearchPackageReceiver:Lcom/android/launcher3/util/x2;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const v3, 0x1040240

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput-object v2, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContextualSearchPackage:Ljava/lang/String;

    .line 50
    .line 51
    iput-object p3, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 52
    .line 53
    iput-object p4, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mTopTaskTracker:Lcom/android/quickstep/TopTaskTracker;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->areAllContextualSearchFlagsDisabled()Z

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    if-nez p4, :cond_1

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string p4, "com.google.android.feature.CONTEXTUAL_SEARCH"

    .line 66
    .line 67
    invoke-virtual {p1, p4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->requestUpdateProperties()V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->registerSearchScreenSystemAction()V

    .line 78
    .line 79
    .line 80
    const-string p1, "android.intent.action.PACKAGE_CHANGED"

    .line 81
    .line 82
    const-string p4, "android.intent.action.PACKAGE_REMOVED"

    .line 83
    .line 84
    const-string v3, "android.intent.action.PACKAGE_ADDED"

    .line 85
    .line 86
    filled-new-array {v3, p1, p4}, [Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v1, v2, p1}, Lcom/android/launcher3/util/x2;->u(Ljava/lang/String;[Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Lcom/android/quickstep/util/Q;

    .line 94
    .line 95
    invoke-direct {p1, p0}, Lcom/android/quickstep/util/Q;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V

    .line 96
    .line 97
    .line 98
    sget-object p4, Lcom/android/quickstep/util/ContextualSearchStateManager;->SEARCH_ALL_ENTRYPOINTS_ENABLED_URI:Landroid/net/Uri;

    .line 99
    .line 100
    invoke-virtual {p2, p4, p1}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2, p4}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 104
    .line 105
    .line 106
    move-result p4

    .line 107
    iput-boolean p4, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mIsContextualSearchSettingEnabled:Z

    .line 108
    .line 109
    invoke-virtual {p3, v0}, Lcom/android/quickstep/SystemUiProxy;->addOnStateChangeListener(Ljava/lang/Runnable;)Z

    .line 110
    .line 111
    .line 112
    new-instance p4, Lcom/android/quickstep/util/S;

    .line 113
    .line 114
    invoke-direct {p4, p0, p2, p1, p3}, Lcom/android/quickstep/util/S;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;Lcom/android/quickstep/SystemUiProxy;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p5, p4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->unregisterSearchScreenSystemAction()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/ContextualSearchStateManager;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->lambda$new$0(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/ContextualSearchStateManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->lambda$requestUpdateProperties$3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/ContextualSearchStateManager;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/ContextualSearchStateManager;->lambda$new$1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/util/ContextualSearchStateManager;Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/ContextualSearchStateManager;->lambda$new$2(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;Lcom/android/quickstep/SystemUiProxy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->requestUpdateProperties()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mIsContextualSearchSettingEnabled:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic lambda$new$2(Lcom/android/launcher3/util/p2;Lcom/android/launcher3/util/p2$a;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContextualSearchPackageReceiver:Lcom/android/launcher3/util/x2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/x2;->v()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->unregisterSearchScreenSystemAction()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/android/quickstep/util/ContextualSearchStateManager;->SEARCH_ALL_ENTRYPOINTS_ENABLED_URI:Landroid/net/Uri;

    .line 10
    .line 11
    invoke-virtual {p1, v0, p2}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mSysUiStateChangeListener:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-virtual {p3, p0}, Lcom/android/quickstep/SystemUiProxy;->removeOnStateChangeListener(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic lambda$requestUpdateProperties$3()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.app.contextualsearch.action.LAUNCH_CONTEXTUAL_SEARCH"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContextualSearchPackage:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/high16 v2, 0xc0000

    .line 21
    .line 22
    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    xor-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mIsContextualSearchIntentAvailable:Z

    .line 33
    .line 34
    const-string v1, "Updated isContextualSearchIntentAvailable"

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->addEventLog(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private registerSearchScreenSystemAction()V
    .locals 6

    .line 1
    new-instance v0, Landroid/app/PendingIntent;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/ContextualSearchStateManager$1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/ContextualSearchStateManager$1;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/app/PendingIntent;-><init>(Landroid/content/IIntentSender;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    const-class v2, Landroid/view/accessibility/AccessibilityManager;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/view/accessibility/AccessibilityManager;

    .line 20
    .line 21
    new-instance v2, Landroid/app/RemoteAction;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 24
    .line 25
    const v4, 0x7f080cf4

    .line 26
    .line 27
    .line 28
    invoke-static {v3, v4}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iget-object v4, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    const v5, 0x7f140351

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 42
    .line 43
    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v2, v3, v4, p0, v0}, Landroid/app/RemoteAction;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x1f4

    .line 51
    .line 52
    invoke-virtual {v1, v2, p0}, Landroid/view/accessibility/AccessibilityManager;->registerSystemAction(Landroid/app/RemoteAction;I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private unregisterSearchScreenSystemAction()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-class v0, Landroid/view/accessibility/AccessibilityManager;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/accessibility/AccessibilityManager;

    .line 10
    .line 11
    const/16 v0, 0x1f4

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/accessibility/AccessibilityManager;->unregisterSystemAction(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method protected final addEventLog(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    monitor-enter v0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/j0;->b(Ljava/lang/String;)V

    .line 3
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method protected final addEventLog(Ljava/lang/String;Z)V
    .locals 1

    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    monitor-enter v0

    .line 5
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/j0;->c(Ljava/lang/String;Z)V

    .line 6
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method protected areAllContextualSearchFlagsDisabled()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper;->getEnableLongPressNavHandle()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public final dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mEventLogArray:Lcom/android/launcher3/util/j0;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/j0;->d(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public getDurationDataSource()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getLPHCustomSlopMultiplier()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getLPHDurationMillis()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getLPNHCustomSlopMultiplier()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getLPNHDurationMillis()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getLPUserGroup()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getShouldPlayHapticOverride()Ljava/util/Optional;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Optional<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getSlopDataSource()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected final isContextualSearchIntentAvailable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mIsContextualSearchIntentAvailable:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isContextualSearchSettingEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mIsContextualSearchSettingEnabled:Z

    .line 2
    .line 3
    return p0
.end method

.method protected isInvocationAllowedInSplitscreen()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method protected isInvocationAllowedOnKeyguard()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected requestUpdateProperties()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/N;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/N;-><init>(Lcom/android/quickstep/util/ContextualSearchStateManager;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected supportsShowWhenLocked()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected final updateOverridesToSysUi()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/ContextualSearchStateManager;->mSystemUiProxy:Lcom/android/quickstep/SystemUiProxy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPHDurationMillis()Ljava/util/Optional;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v1, v2}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPHCustomSlopMultiplier()Ljava/util/Optional;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v5, 0x0

    .line 28
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v1, v5}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/Float;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v6, 0x1

    .line 43
    invoke-virtual {v0, v3, v4, v1, v6}, Lcom/android/quickstep/SystemUiProxy;->setOverrideHomeButtonLongPress(JFZ)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v1, "Sent LPH override to sysui: "

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPHDurationMillis()Ljava/util/Optional;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1, v2}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, ";"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/android/quickstep/util/ContextualSearchStateManager;->getLPHCustomSlopMultiplier()Ljava/util/Optional;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, v5}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string v0, "ContextualSearchStMgr"

    .line 88
    .line 89
    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    return-void
.end method
