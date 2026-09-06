.class public final Lcom/android/quickstep/SystemUiProxy;
.super Ljava/lang/Object;
.source "SystemUiProxy.kt"

# interfaces
.implements Lcom/android/quickstep/NavHandle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/SystemUiProxy$Companion;,
        Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;,
        Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/SystemUiProxy$Companion;

.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/SystemUiProxy;",
            ">;"
        }
    .end annotation
.end field

.field private static final MSG_SET_LAUNCHER_KEEP_CLEAR_AREA_HEIGHT:I = 0x2

.field private static final MSG_SET_SHELF_HEIGHT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "SystemUiProxy"


# instance fields
.field private final asyncHandler:Landroid/os/Handler;

.field private backAnimation:LI2/a;

.field private backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

.field private backToLauncherRunner:Landroid/view/IRemoteAnimationRunner;

.field private bubbles:LJ2/a;

.field private bubblesListener:LJ2/b;

.field private final context:Landroid/content/Context;

.field private desktopMode:Lcom/android/wm/shell/desktopmode/b;

.field private desktopTaskListener:Lcom/android/wm/shell/desktopmode/c;

.field private dragAndDrop:LK2/a;

.field private final focusState:Lcom/android/quickstep/FocusState;

.field private final homeVisibilityState:Lcom/android/quickstep/HomeVisibilityState;

.field private lastLauncherKeepClearAreaHeight:I

.field private lastLauncherKeepClearAreaHeightVisible:Z

.field private lastShelfHeight:I

.field private lastShelfVisible:Z

.field private lastSystemUiStateFlags:J

.field private launcherActivityClass:Ljava/lang/String;

.field private launcherUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;

.field private mConciseAssistantBundle:Landroid/os/Bundle;

.field private mConciseStartAssistantOnce:Z

.field private oneHanded:LL2/a;

.field private originalTransactionToken:Landroid/os/IBinder;

.field private pip:Lcom/android/wm/shell/common/pip/a;

.field private pipAnimationListener:Lcom/android/wm/shell/common/pip/b;

.field private recentTasks:Lcom/android/wm/shell/recents/a;

.field private recentTasksListener:Lcom/android/wm/shell/recents/b;

.field private final recentsPendingIntent$delegate:Lh4/e;

.field private final remoteTransitions:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Landroid/window/RemoteTransition;",
            "Landroid/window/TransitionFilter;",
            ">;"
        }
    .end annotation
.end field

.field private shellTransitions:Lcom/android/wm/shell/shared/l;

.field private splitScreen:Lcom/android/wm/shell/splitscreen/a;

.field private splitScreenListener:Lcom/android/wm/shell/splitscreen/b;

.field private splitSelectListener:Lcom/android/wm/shell/splitscreen/c;

.field private startingWindow:LV2/a;

.field private startingWindowListener:LV2/b;

.field private final stateChangeCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

.field private final systemUiProxyDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

.field private unfoldAnimation:Lcom/android/systemui/unfold/progress/a;

.field private unfoldAnimationListener:Lcom/android/systemui/unfold/progress/b;

.field private final unfoldTransitionProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/SystemUiProxy$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/SystemUiProxy$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/SystemUiProxy;->Companion:Lcom/android/quickstep/SystemUiProxy$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/O4;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/quickstep/O4;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/SystemUiProxy;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 10
    .line 11
    new-instance p1, Lcom/android/quickstep/Q4;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/android/quickstep/Q4;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxyDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 17
    .line 18
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->remoteTransitions:Ljava/util/LinkedHashMap;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->stateChangeCallbacks:Ljava/util/List;

    .line 31
    .line 32
    new-instance p1, Lcom/android/quickstep/HomeVisibilityState;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/android/quickstep/HomeVisibilityState;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->homeVisibilityState:Lcom/android/quickstep/HomeVisibilityState;

    .line 38
    .line 39
    new-instance p1, Lcom/android/quickstep/FocusState;

    .line 40
    .line 41
    invoke-direct {p1}, Lcom/android/quickstep/FocusState;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->focusState:Lcom/android/quickstep/FocusState;

    .line 45
    .line 46
    new-instance p1, Landroid/os/Handler;

    .line 47
    .line 48
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Lcom/android/quickstep/R4;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Lcom/android/quickstep/R4;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p1, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->asyncHandler:Landroid/os/Handler;

    .line 63
    .line 64
    new-instance p1, Lcom/android/quickstep/S4;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Lcom/android/quickstep/S4;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->recentsPendingIntent$delegate:Lh4/e;

    .line 74
    .line 75
    invoke-static {}, Lcom/android/launcher3/y0;->i0()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_0

    .line 80
    .line 81
    new-instance p1, LD2/e;

    .line 82
    .line 83
    invoke-direct {p1}, LD2/e;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, LD2/e;->isEnabled()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    new-instance p1, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 93
    .line 94
    invoke-direct {p1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;-><init>()V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const/4 p1, 0x0

    .line 99
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldTransitionProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 100
    .line 101
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/SystemUiProxy;->systemUiProxyDeathRecipient$lambda$1$lambda$0(Lcom/android/quickstep/SystemUiProxy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final asyncHandler$lambda$2(Lcom/android/quickstep/SystemUiProxy;Landroid/os/Message;)Z
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->handleMessageAsync(Landroid/os/Message;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public static synthetic b(Lcom/android/quickstep/SystemUiProxy;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/SystemUiProxy;->recentsPendingIntent_delegate$lambda$3(Lcom/android/quickstep/SystemUiProxy;)Landroid/app/PendingIntent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/SystemUiProxy;->systemUiProxyDeathRecipient$lambda$1(Lcom/android/quickstep/SystemUiProxy;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/SystemUiProxy;Landroid/os/Message;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->asyncHandler$lambda$2(Lcom/android/quickstep/SystemUiProxy;Landroid/os/Message;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final executeWithErrorLog(Lu4/a;Ljava/lang/String;Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lu4/a<",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p3}, Lu4/a;->invoke()Ljava/lang/Object;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method static synthetic executeWithErrorLog$default(Lcom/android/quickstep/SystemUiProxy;Lu4/a;Ljava/lang/String;Lu4/a;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p0, p4, 0x2

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p2, "SystemUiProxy"

    .line 6
    .line 7
    :cond_0
    :try_start_0
    invoke-interface {p3}, Lu4/a;->invoke()Ljava/lang/Object;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic getLastSystemUiStateFlags$annotations()V
    .locals 0

    .line 1
    return-void
.end method

.method private final getRecentsPendingIntent()Landroid/app/PendingIntent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->recentsPendingIntent$delegate:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/PendingIntent;

    .line 8
    .line 9
    return-object p0
.end method

.method private final handleMessageAsync(Landroid/os/Message;)Z
    .locals 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-eq v0, v2, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 12
    .line 13
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 14
    .line 15
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/SystemUiProxy;->setLauncherKeepClearAreaHeight(II)V

    .line 16
    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 20
    .line 21
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 22
    .line 23
    invoke-direct {p0, v0, p1}, Lcom/android/quickstep/SystemUiProxy;->setShelfHeightAsync(II)V

    .line 24
    .line 25
    .line 26
    return v1
.end method

.method private final linkToDeath()V
    .locals 4

    .line 1
    const-string v0, "SystemUiProxy"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-interface {v1}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxyDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-interface {v1, v2, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    const-string p0, "linkToDeath, mSystemUiProxy is null"

    .line 27
    .line 28
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :goto_1
    const-string v1, "Failed to link sysui proxy death recipient"

    .line 33
    .line 34
    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static synthetic onOverviewShown$default(Lcom/android/quickstep/SystemUiProxy;ZLjava/lang/String;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string p2, "SystemUiProxy"

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->onOverviewShown(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private static final recentsPendingIntent_delegate$lambda$3(Lcom/android/quickstep/SystemUiProxy;)Landroid/app/PendingIntent;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Landroid/app/ActivityOptions;->setPendingIntentCreatorBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    const v3, 0x3000008

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v2, p0, v3, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;)Landroid/app/PendingIntent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method private final setLauncherKeepClearAreaHeight(II)V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v0

    .line 4
    :goto_0
    iget-boolean v2, p0, Lcom/android/quickstep/SystemUiProxy;->lastLauncherKeepClearAreaHeightVisible:Z

    if-ne p1, v2, :cond_1

    .line 5
    iget v2, p0, Lcom/android/quickstep/SystemUiProxy;->lastLauncherKeepClearAreaHeight:I

    if-eq p2, v2, :cond_2

    :cond_1
    move v0, v1

    .line 6
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    .line 7
    iput-boolean p1, p0, Lcom/android/quickstep/SystemUiProxy;->lastLauncherKeepClearAreaHeightVisible:Z

    .line 8
    iput p2, p0, Lcom/android/quickstep/SystemUiProxy;->lastLauncherKeepClearAreaHeight:I

    .line 9
    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/android/wm/shell/common/pip/a;->s(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed call setLauncherKeepClearAreaHeight visible: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, " height: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 11
    const-string p2, "SystemUiProxy"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_3
    :goto_1
    return-void
.end method

.method private final setShelfHeightAsync(II)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move p1, v1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p1, v0

    .line 8
    :goto_0
    iget-boolean v2, p0, Lcom/android/quickstep/SystemUiProxy;->lastShelfVisible:Z

    .line 9
    .line 10
    if-ne p1, v2, :cond_1

    .line 11
    .line 12
    iget v2, p0, Lcom/android/quickstep/SystemUiProxy;->lastShelfHeight:I

    .line 13
    .line 14
    if-eq p2, v2, :cond_2

    .line 15
    .line 16
    :cond_1
    move v0, v1

    .line 17
    :cond_2
    iget-object v1, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 18
    .line 19
    if-eqz v1, :cond_3

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iput-boolean p1, p0, Lcom/android/quickstep/SystemUiProxy;->lastShelfVisible:Z

    .line 24
    .line 25
    iput p2, p0, Lcom/android/quickstep/SystemUiProxy;->lastShelfHeight:I

    .line 26
    .line 27
    :try_start_0
    invoke-interface {v1, p1, p2}, Lcom/android/wm/shell/common/pip/a;->h1(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :catch_0
    move-exception p0

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "Failed call setShelfHeight visible: "

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p1, " height: "

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string p2, "SystemUiProxy"

    .line 58
    .line 59
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    return-void
.end method

.method private final setupTransactionQueue()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/wm/shell/shared/l;->J()Landroid/os/IBinder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->originalTransactionToken:Landroid/os/IBinder;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-static {v0}, Landroid/view/SurfaceControl$Transaction;->setDefaultApplyToken(Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string v0, "Error getting Shell\'s apply token"

    .line 22
    .line 23
    const-string v1, "SystemUiProxy"

    .line 24
    .line 25
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    :goto_0
    return-void
.end method

.method private final shouldEnableRunningTasksForDesktopMode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, LO2/d;->c(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Landroid/window/DesktopModeFlags;->ENABLE_DESKTOP_WINDOWING_TASKBAR_RUNNING_APPS:Landroid/window/DesktopModeFlags;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static synthetic showAppBubble$default(Lcom/android/quickstep/SystemUiProxy;Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/SystemUiProxy;->showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic showBubbleDropTarget$default(Lcom/android/quickstep/SystemUiProxy;ZLN2/h;ILjava/lang/Object;)V
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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->showBubbleDropTarget(ZLN2/h;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic showShortcutBubble$default(Lcom/android/quickstep/SystemUiProxy;Landroid/content/pm/ShortcutInfo;LN2/h;ILjava/lang/Object;)V
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
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->showShortcutBubble(Landroid/content/pm/ShortcutInfo;LN2/h;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final systemUiProxyDeathRecipient$lambda$1(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/P4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/quickstep/P4;-><init>(Lcom/android/quickstep/SystemUiProxy;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final systemUiProxyDeathRecipient$lambda$1$lambda$0(Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/SystemUiProxy;->clearProxy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final unlinkToDeath()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "SystemUiProxy"

    .line 6
    .line 7
    const-string v1, "unlinkToDeath, mSystemUiProxy is null"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxyDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-interface {v0, p0, v1}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method


# virtual methods
.method public final abortSwipePipToHome(ILandroid/content/ComponentName;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/wm/shell/common/pip/a;->r0(ILandroid/content/ComponentName;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call abortSwipePipToHome"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final activateDesk(ILandroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/wm/shell/desktopmode/b;->F(ILandroid/window/RemoteTransition;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call activateDesk"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final addAllInterfaces(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "out"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 17
    .line 18
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 22
    .line 23
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 27
    .line 28
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->oneHanded:LL2/a;

    .line 32
    .line 33
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 37
    .line 38
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindow:LV2/a;

    .line 42
    .line 43
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 47
    .line 48
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 52
    .line 53
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 57
    .line 58
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimation:Lcom/android/systemui/unfold/progress/a;

    .line 62
    .line 63
    invoke-static {v0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->dragAndDrop:LK2/a;

    .line 67
    .line 68
    invoke-static {p0, p1}, Lcom/android/systemui/shared/system/QuickStepContract;->addInterface(Landroid/os/IInterface;Landroid/os/Bundle;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final addOnStateChangeListener(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->stateChangeCallbacks:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public animateNavBarLongPress(ZZJ)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->animateNavBarLongPress(ZZJ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call animateNavBarLongPress"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final clearBackToLauncherCallback(Landroid/window/IOnBackInvokedCallback;)V
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

    .line 7
    .line 8
    if-eq v0, p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherRunner:Landroid/view/IRemoteAnimationRunner;

    .line 15
    .line 16
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, LI2/a;->M0()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    const-string p1, "Failed call clearBackToLauncherCallback"

    .line 26
    .line 27
    const-string v0, "SystemUiProxy"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final clearProxy()V
    .locals 14

    .line 1
    const/4 v12, 0x0

    .line 2
    const/4 v13, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x0

    .line 6
    const/4 v4, 0x0

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v6, 0x0

    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v9, 0x0

    .line 12
    const/4 v10, 0x0

    .line 13
    const/4 v11, 0x0

    .line 14
    move-object v0, p0

    .line 15
    invoke-virtual/range {v0 .. v13}, Lcom/android/quickstep/SystemUiProxy;->setProxy(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final collapseBubbles()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, LJ2/a;->v()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call collapseBubbles"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final createDesk(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->o0(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call createDesk"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final customizeStatusBarAppearance(Lcom/android/internal/view/AppearanceRegion;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, LI2/a;->T0(Lcom/android/internal/view/AppearanceRegion;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call customizeStatusBarAppearance"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final dragBubbleToDismiss(Ljava/lang/String;J)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, LJ2/a;->g0(Ljava/lang/String;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call dragBubbleToDismiss"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final dump(Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "pw"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "SystemUiProxy:"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "\tmSystemUiProxy="

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v2, "\tmPip="

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->pipAnimationListener:Lcom/android/wm/shell/common/pip/b;

    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v2, "\tmPipAnimationListener="

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 78
    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v2, "\tmBubbles="

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->bubblesListener:LJ2/b;

    .line 100
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string v2, "\tmBubblesListener="

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 122
    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string v2, "\tmSplitScreen="

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreenListener:Lcom/android/wm/shell/splitscreen/b;

    .line 144
    .line 145
    new-instance v1, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string v2, "\tmSplitScreenListener="

    .line 151
    .line 152
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitSelectListener:Lcom/android/wm/shell/splitscreen/c;

    .line 166
    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    const-string v2, "\tmSplitSelectListener="

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->oneHanded:LL2/a;

    .line 188
    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    const-string v2, "\tmOneHanded="

    .line 195
    .line 196
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 210
    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    const-string v2, "\tmShellTransitions="

    .line 217
    .line 218
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->homeVisibilityState:Lcom/android/quickstep/HomeVisibilityState;

    .line 232
    .line 233
    new-instance v1, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v2, "\tmHomeVisibilityState="

    .line 239
    .line 240
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->focusState:Lcom/android/quickstep/FocusState;

    .line 254
    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 258
    .line 259
    .line 260
    const-string v2, "\tmFocusState="

    .line 261
    .line 262
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindow:LV2/a;

    .line 276
    .line 277
    new-instance v1, Ljava/lang/StringBuilder;

    .line 278
    .line 279
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 280
    .line 281
    .line 282
    const-string v2, "\tmStartingWindow="

    .line 283
    .line 284
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindowListener:LV2/b;

    .line 298
    .line 299
    new-instance v1, Ljava/lang/StringBuilder;

    .line 300
    .line 301
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 302
    .line 303
    .line 304
    const-string v2, "\tmStartingWindowListener="

    .line 305
    .line 306
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 320
    .line 321
    new-instance v1, Ljava/lang/StringBuilder;

    .line 322
    .line 323
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    .line 325
    .line 326
    const-string v2, "\tmSysuiUnlockAnimationController="

    .line 327
    .line 328
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->launcherActivityClass:Ljava/lang/String;

    .line 342
    .line 343
    new-instance v1, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 346
    .line 347
    .line 348
    const-string v2, "\tmLauncherActivityClass="

    .line 349
    .line 350
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->launcherUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;

    .line 364
    .line 365
    new-instance v1, Ljava/lang/StringBuilder;

    .line 366
    .line 367
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 368
    .line 369
    .line 370
    const-string v2, "\tmLauncherUnlockAnimationController="

    .line 371
    .line 372
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 386
    .line 387
    new-instance v1, Ljava/lang/StringBuilder;

    .line 388
    .line 389
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 390
    .line 391
    .line 392
    const-string v2, "\tmRecentTasks="

    .line 393
    .line 394
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasksListener:Lcom/android/wm/shell/recents/b;

    .line 408
    .line 409
    new-instance v1, Ljava/lang/StringBuilder;

    .line 410
    .line 411
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 412
    .line 413
    .line 414
    const-string v2, "\tmRecentTasksListener="

    .line 415
    .line 416
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 430
    .line 431
    new-instance v1, Ljava/lang/StringBuilder;

    .line 432
    .line 433
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 434
    .line 435
    .line 436
    const-string v2, "\tmBackAnimation="

    .line 437
    .line 438
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 449
    .line 450
    .line 451
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

    .line 452
    .line 453
    new-instance v1, Ljava/lang/StringBuilder;

    .line 454
    .line 455
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 456
    .line 457
    .line 458
    const-string v2, "\tmBackToLauncherCallback="

    .line 459
    .line 460
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    .line 462
    .line 463
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherRunner:Landroid/view/IRemoteAnimationRunner;

    .line 474
    .line 475
    new-instance v1, Ljava/lang/StringBuilder;

    .line 476
    .line 477
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 478
    .line 479
    .line 480
    const-string v2, "\tmBackToLauncherRunner="

    .line 481
    .line 482
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 496
    .line 497
    new-instance v1, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .line 501
    .line 502
    const-string v2, "\tmDesktopMode="

    .line 503
    .line 504
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v0

    .line 514
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 515
    .line 516
    .line 517
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopTaskListener:Lcom/android/wm/shell/desktopmode/c;

    .line 518
    .line 519
    new-instance v1, Ljava/lang/StringBuilder;

    .line 520
    .line 521
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 522
    .line 523
    .line 524
    const-string v2, "\tmDesktopTaskListener="

    .line 525
    .line 526
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v0

    .line 536
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 537
    .line 538
    .line 539
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimation:Lcom/android/systemui/unfold/progress/a;

    .line 540
    .line 541
    new-instance v1, Ljava/lang/StringBuilder;

    .line 542
    .line 543
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 544
    .line 545
    .line 546
    const-string v2, "\tmUnfoldAnimation="

    .line 547
    .line 548
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 552
    .line 553
    .line 554
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 559
    .line 560
    .line 561
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimationListener:Lcom/android/systemui/unfold/progress/b;

    .line 562
    .line 563
    new-instance v1, Ljava/lang/StringBuilder;

    .line 564
    .line 565
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 566
    .line 567
    .line 568
    const-string v2, "\tmUnfoldAnimationListener="

    .line 569
    .line 570
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->dragAndDrop:LK2/a;

    .line 584
    .line 585
    new-instance v0, Ljava/lang/StringBuilder;

    .line 586
    .line 587
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 588
    .line 589
    .line 590
    const-string v1, "\tmDragAndDrop="

    .line 591
    .line 592
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 596
    .line 597
    .line 598
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object p0

    .line 602
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 603
    .line 604
    .line 605
    return-void
.end method

.method public final exitSplitScreen(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/wm/shell/splitscreen/a;->v0(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call exitSplitScreen"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final expandNotificationPanel()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->expandNotificationPanel()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call expandNotificationPanel"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final getFocusState()Lcom/android/quickstep/FocusState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->focusState:Lcom/android/quickstep/FocusState;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getHomeTaskOverlayContainer()Landroid/view/SurfaceControl;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/android/wm/shell/shared/l;->s1()Landroid/view/SurfaceControl;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    return-object p0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-object v0

    .line 14
    :goto_0
    const-string v1, "Failed call getHomeTaskOverlayContainer"

    .line 15
    .line 16
    const-string v2, "SystemUiProxy"

    .line 17
    .line 18
    invoke-static {v2, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public final getHomeVisibilityState()Lcom/android/quickstep/HomeVisibilityState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->homeVisibilityState:Lcom/android/quickstep/HomeVisibilityState;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLastSystemUiStateFlags()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/quickstep/SystemUiProxy;->lastSystemUiStateFlags:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final getRecentTasks(II)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Lcom/android/wm/shell/shared/i;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 2
    .line 3
    const-string v0, "SystemUiProxy"

    .line 4
    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    const-string v1, "Failed call getRecentTasks"

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    :try_start_0
    invoke-interface {p0, p1, v2, p2}, Lcom/android/wm/shell/recents/a;->getRecentTasks(III)[Lcom/android/wm/shell/shared/i;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-static {p0}, Li4/g;->c([Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :catch_1
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_0
    new-instance p0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :goto_1
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    .line 41
    .line 42
    new-instance p1, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;

    .line 43
    .line 44
    invoke-direct {p1, v1, p0}, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    throw p1

    .line 48
    :goto_2
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 49
    .line 50
    .line 51
    new-instance p1, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;

    .line 52
    .line 53
    invoke-direct {p1, v1, p0}, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    throw p1

    .line 57
    :cond_2
    const-string p0, "getRecentTasks() failed due to null mRecentTasks"

    .line 58
    .line 59
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    new-instance p0, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;

    .line 63
    .line 64
    const-string p1, "null mRecentTasks"

    .line 65
    .line 66
    invoke-direct {p0, p1}, Lcom/android/quickstep/SystemUiProxy$GetRecentTasksException;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public final getRunningTasks(I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/app/ActivityManager$RunningTaskInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->shouldEnableRunningTasksForDesktopMode()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    invoke-interface {p0, p1}, Lcom/android/wm/shell/recents/a;->c2(I)[Landroid/app/ActivityManager$RunningTaskInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-static {p0}, Li4/g;->c([Ljava/lang/Object;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-object p0

    .line 30
    :cond_2
    :goto_0
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    return-object p0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    const-string p1, "Failed call getRunningTasks"

    .line 37
    .line 38
    const-string v0, "SystemUiProxy"

    .line 39
    .line 40
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final getUnfoldTransitionProvider()Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldTransitionProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isActive()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v4, "isActive: "

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v3, "SystemUiProxy"

    .line 28
    .line 29
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    return v1
.end method

.method public final isDragAndDropReady()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->dragAndDrop:LK2/a;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, LK2/a;->W()Z

    .line 7
    .line 8
    .line 9
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    return p0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v0

    .line 14
    :goto_0
    const-string v1, "Error querying drag state"

    .line 15
    .line 16
    const-string v2, "SystemUiProxy"

    .line 17
    .line 18
    invoke-static {v2, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    .line 20
    .line 21
    return v0
.end method

.method public final moveDraggedBubbleToFullscreen(Ljava/lang/String;Landroid/graphics/Point;)V
    .locals 1

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dropLocation"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1, p2}, LJ2/a;->X1(Ljava/lang/String;Landroid/graphics/Point;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    const-string p1, "Failed to call moveDraggedBubbleToFullscreen"

    .line 21
    .line 22
    const-string p2, "SystemUiProxy"

    .line 23
    .line 24
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final moveToDesktop(ILO2/e;Landroid/window/RemoteTransition;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const-string v0, "successCallback"

    .line 2
    .line 3
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/android/quickstep/SystemUiProxy$moveToDesktop$2$1;

    .line 11
    .line 12
    invoke-direct {v0, p4}, Lcom/android/quickstep/SystemUiProxy$moveToDesktop$2$1;-><init>(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3, v0}, Lcom/android/wm/shell/desktopmode/b;->y1(ILO2/e;Landroid/window/RemoteTransition;Lcom/android/wm/shell/desktopmode/d;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    const-string p1, "Failed call moveToDesktop"

    .line 21
    .line 22
    const-string p2, "SystemUiProxy"

    .line 23
    .line 24
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final moveToExternalDisplay(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->n0(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call moveToExternalDisplay"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final notifyAccessibilityButtonClicked(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyAccessibilityButtonClicked(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call notifyAccessibilityButtonClicked"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final notifyAccessibilityButtonLongClicked()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyAccessibilityButtonLongClicked()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call notifyAccessibilityButtonLongClicked"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final notifyGestureCourseIndentifiedCompleted(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public final notifyHomeGestureAnimationFinished()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public final notifyHomeGestureSuccess()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    return-void
.end method

.method public final notifyInjectAllEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/MotionEvent;",
            "Landroid/view/MotionEvent;",
            "Ljava/util/List<",
            "Landroid/view/MotionEvent;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyInjectAllEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Ljava/util/List;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call notifyInjectAllEvent"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final notifyInjectEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyInjectEvent(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call notifyInjectEvent"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final notifyKeyEvent(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyKeyEvent(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call notifyKeyEvent"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final notifyPrioritizedRotation(I)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyPrioritizedRotation(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "Failed call notifyPrioritizedRotation with arg: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "SystemUiProxy"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final notifySysuiSmartspaceStateUpdated(Lcom/android/systemui/shared/system/smartspace/SmartspaceState;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;->onLauncherSmartspaceStateUpdated(Lcom/android/systemui/shared/system/smartspace/SmartspaceState;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call notifySysuiSmartspaceStateUpdated"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final notifyTaskbarAutohideSuspend(Z)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyTaskbarAutohideSuspend(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "Failed call notifyTaskbarAutohideSuspend with arg: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "SystemUiProxy"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final notifyTaskbarStatus(ZZ)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->notifyTaskbarStatus(ZZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "Failed call notifyTaskbarStatus with arg: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, ", "

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string p2, "SystemUiProxy"

    .line 36
    .line 37
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final onAssistantGestureCompletion(F)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantGestureCompletion(F)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call onAssistantGestureCompletion"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final onAssistantGestureStart(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantGestureStart(FF)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call onAssistantGestureStart"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final onAssistantProgress(F)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onAssistantProgress(F)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "Failed call onAssistantProgress with progress: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "SystemUiProxy"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final onBackEvent(Landroid/view/KeyEvent;I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onBackEvent(Landroid/view/KeyEvent;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call onBackPressed"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final onDesktopSplitSelectAnimComplete(Landroid/app/ActivityManager$RunningTaskInfo;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->j0(Landroid/app/ActivityManager$RunningTaskInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call onDesktopSplitSelectAnimComplete"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final onGestureCourseIndentifiedCompleted(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onGestureCourseIndentifiedCompleted(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call onGestureCourseIndentifiedCompleted"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final onGestureCourseProgress(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onGestureCourseProgress(F)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string p1, "Failed call onGestureCourseProgress"

    .line 15
    .line 16
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final onImeSwitcherLongPress()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onImeSwitcherLongPress()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call onImeSwitcherLongPress"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final onImeSwitcherPressed()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onImeSwitcherPressed()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call onImeSwitcherPressed"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final onKeyEvent(II)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onKeyEvent(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p1}, Landroid/view/KeyEvent;->keyCodeToString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v0, "Failed call onKeyEvent "

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p2, "SystemUiProxy"

    .line 32
    .line 33
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final onLauncherDestroy()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onLauncherDestroy()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "SystemUiProxy"

    .line 13
    .line 14
    const-string v0, "Failed call onLauncherDestroy"

    .line 15
    .line 16
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final onOverviewShown(ZLjava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "tag"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onOverviewShown(Z)V
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
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p1, "home"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p1, "app"

    .line 21
    .line 22
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "Failed call onOverviewShown from: "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final onStatusBarTouchEvent(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onStatusBarTouchEvent(Landroid/view/MotionEvent;)V
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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "Failed call onStatusBarTouchEvent with arg: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "SystemUiProxy"

    .line 36
    .line 37
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final onStatusBarTrackpadEvent(Landroid/view/MotionEvent;)V
    .locals 2

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->onStatusBarTrackpadEvent(Landroid/view/MotionEvent;)V
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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "Failed call onStatusBarTrackpadEvent with arg: "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "SystemUiProxy"

    .line 33
    .line 34
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final registerRecentTasksListener(Lcom/android/wm/shell/recents/b;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/recents/a;->K(Lcom/android/wm/shell/recents/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call registerRecentTasksListener"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasksListener:Lcom/android/wm/shell/recents/b;

    .line 18
    .line 19
    return-void
.end method

.method public final registerRemoteTransition(Landroid/window/RemoteTransition;Landroid/window/TransitionFilter;)V
    .locals 3

    .line 1
    const-string v0, "filter"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {v0, p2, p1}, Lcom/android/wm/shell/shared/l;->V0(Landroid/window/TransitionFilter;Landroid/window/RemoteTransition;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    const-string v1, "Failed call registerRemoteTransition"

    .line 19
    .line 20
    const-string v2, "SystemUiProxy"

    .line 21
    .line 22
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->remoteTransitions:Ljava/util/LinkedHashMap;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Ljava/util/LinkedHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final registerSplitScreenListener(Lcom/android/wm/shell/splitscreen/b;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/splitscreen/a;->q1(Lcom/android/wm/shell/splitscreen/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call registerSplitScreenListener"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreenListener:Lcom/android/wm/shell/splitscreen/b;

    .line 18
    .line 19
    return-void
.end method

.method public final registerSplitSelectListener(Lcom/android/wm/shell/splitscreen/c;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/splitscreen/a;->m(Lcom/android/wm/shell/splitscreen/c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call registerSplitSelectListener"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitSelectListener:Lcom/android/wm/shell/splitscreen/c;

    .line 18
    .line 19
    return-void
.end method

.method public final removeAllBubbles()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, LJ2/a;->T1()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call removeAllBubbles"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final removeAllDesks()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/wm/shell/desktopmode/b;->F0()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call removeAllDesks"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final removeDefaultDeskInDisplay(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->P1(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call removeDefaultDeskInDisplay"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final removeDesk(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->a1(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call removeDesk"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final removeOnStateChangeListener(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    const-string v0, "callback"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->stateChangeCallbacks:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final setAssistantOverridesRequested([I)V
    .locals 1

    .line 1
    const-string v0, "invocationTypes"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setAssistantOverridesRequested([I)V
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
    const-string p1, "Failed call setAssistantOverridesRequested"

    .line 16
    .line 17
    const-string v0, "SystemUiProxy"

    .line 18
    .line 19
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final setBackToLauncherCallback(Landroid/window/IOnBackInvokedCallback;Landroid/view/IRemoteAnimationRunner;)V
    .locals 2

    .line 1
    const-string v0, "Failed call setBackToLauncherCallback"

    .line 2
    .line 3
    const-string v1, "SystemUiProxy"

    .line 4
    .line 5
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

    .line 6
    .line 7
    iput-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherRunner:Landroid/view/IRemoteAnimationRunner;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, p1, p2}, LI2/a;->F1(Landroid/window/IOnBackInvokedCallback;Landroid/view/IRemoteAnimationRunner;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :goto_0
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    goto :goto_2

    .line 28
    :goto_1
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_2
    return-void
.end method

.method public final setBubbleBarLocation(LN2/h;I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, LJ2/a;->E1(LN2/h;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call setBubbleBarLocation"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setBubblesListener(LJ2/b;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/SystemUiProxy;->bubblesListener:LJ2/b;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, v1}, LJ2/a;->I1(LJ2/b;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0, p1}, LJ2/a;->D1(LJ2/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_2

    .line 21
    :goto_1
    const-string v1, "Failed call registerBubblesListener"

    .line 22
    .line 23
    const-string v2, "SystemUiProxy"

    .line 24
    .line 25
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_2
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->bubblesListener:LJ2/b;

    .line 29
    .line 30
    return-void
.end method

.method public final setDesktopTaskListener(Lcom/android/wm/shell/desktopmode/c;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->desktopTaskListener:Lcom/android/wm/shell/desktopmode/c;

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/android/wm/shell/desktopmode/b;->S(Lcom/android/wm/shell/desktopmode/c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p1, "Failed call setDesktopTaskListener"

    .line 13
    .line 14
    const-string v0, "SystemUiProxy"

    .line 15
    .line 16
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final setHomeRotationEnabled(Z)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setHomeRotationEnabled(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call setHomeRotationEnabled"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setLastSystemUiStateFlags(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/quickstep/SystemUiProxy;->lastSystemUiStateFlags:J

    .line 2
    .line 3
    return-void
.end method

.method public final setLauncherAppIconSize(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/wm/shell/common/pip/a;->a0(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call setLauncherAppIconSize"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setLauncherKeepClearAreaHeight(ZI)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->asyncHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    .line 2
    invoke-static {p0, v0, p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object p0

    .line 3
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method public final setLauncherUnlockAnimationController(Ljava/lang/String;Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;->setLauncherUnlockController(Ljava/lang/String;Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;)V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-interface {p2}, Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;->dispatchSmartspaceStateToSysui()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    const-string v1, "Failed call setLauncherUnlockAnimationController"

    .line 16
    .line 17
    const-string v2, "SystemUiProxy"

    .line 18
    .line 19
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->launcherActivityClass:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->launcherUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;

    .line 25
    .line 26
    return-void
.end method

.method public final setOverrideHomeButtonLongPress(JFZ)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->setOverrideHomeButtonLongPress(JFZ)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call setOverrideHomeButtonLongPress"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setPipAnimationListener(Lcom/android/wm/shell/common/pip/b;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/common/pip/a;->b1(Lcom/android/wm/shell/common/pip/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call setPinnedStackAnimationListener"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->pipAnimationListener:Lcom/android/wm/shell/common/pip/b;

    .line 18
    .line 19
    return-void
.end method

.method public final setPipAnimationTypeToAlpha()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/wm/shell/common/pip/a;->B1()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call setPipAnimationTypeToAlpha"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final setProxy(Lcom/android/systemui/shared/recents/ISystemUiProxy;Lcom/android/wm/shell/common/pip/a;LJ2/a;Lcom/android/wm/shell/splitscreen/a;LL2/a;Lcom/android/wm/shell/shared/l;LV2/a;Lcom/android/wm/shell/recents/a;Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;LI2/a;Lcom/android/wm/shell/desktopmode/b;Lcom/android/systemui/unfold/progress/a;LK2/a;)V
    .locals 5

    .line 1
    move-object/from16 v0, p12

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->unlinkToDeath()Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    move p1, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move p1, v1

    .line 18
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v4, "setProxy "

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v3, "SystemUiProxy"

    .line 36
    .line 37
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseStartAssistantOnce:Z

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseAssistantBundle:Landroid/os/Bundle;

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseAssistantBundle:Landroid/os/Bundle;

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->startConciseAssistantOnce(Landroid/os/Bundle;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iput-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 64
    .line 65
    iput-object p3, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 66
    .line 67
    iput-object p4, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 68
    .line 69
    iput-object p5, p0, Lcom/android/quickstep/SystemUiProxy;->oneHanded:LL2/a;

    .line 70
    .line 71
    iput-object p6, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 72
    .line 73
    iput-object p7, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindow:LV2/a;

    .line 74
    .line 75
    iput-object p9, p0, Lcom/android/quickstep/SystemUiProxy;->sysuiUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ISysuiUnlockAnimationController;

    .line 76
    .line 77
    iput-object p8, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 78
    .line 79
    iput-object p10, p0, Lcom/android/quickstep/SystemUiProxy;->backAnimation:LI2/a;

    .line 80
    .line 81
    move-object/from16 p1, p11

    .line 82
    .line 83
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 84
    .line 85
    invoke-static {}, Lcom/android/launcher3/y0;->i0()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_2

    .line 90
    .line 91
    const/4 p1, 0x0

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move-object p1, v0

    .line 94
    :goto_1
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimation:Lcom/android/systemui/unfold/progress/a;

    .line 95
    .line 96
    move-object/from16 p1, p13

    .line 97
    .line 98
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->dragAndDrop:LK2/a;

    .line 99
    .line 100
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->linkToDeath()V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->pipAnimationListener:Lcom/android/wm/shell/common/pip/b;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setPipAnimationListener(Lcom/android/wm/shell/common/pip/b;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->bubblesListener:LJ2/b;

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setBubblesListener(LJ2/b;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreenListener:Lcom/android/wm/shell/splitscreen/b;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->registerSplitScreenListener(Lcom/android/wm/shell/splitscreen/b;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitSelectListener:Lcom/android/wm/shell/splitscreen/c;

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->registerSplitSelectListener(Lcom/android/wm/shell/splitscreen/c;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->homeVisibilityState:Lcom/android/quickstep/HomeVisibilityState;

    .line 124
    .line 125
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Lcom/android/quickstep/HomeVisibilityState;->init(Lcom/android/wm/shell/shared/l;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->focusState:Lcom/android/quickstep/FocusState;

    .line 131
    .line 132
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Lcom/android/quickstep/FocusState;->init(Lcom/android/wm/shell/shared/l;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindowListener:LV2/b;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setStartingWindowListener(LV2/b;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->launcherActivityClass:Ljava/lang/String;

    .line 143
    .line 144
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->launcherUnlockAnimationController:Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;

    .line 145
    .line 146
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->setLauncherUnlockAnimationController(Ljava/lang/String;Lcom/android/systemui/shared/system/smartspace/ILauncherUnlockAnimationController;)V

    .line 147
    .line 148
    .line 149
    new-instance p1, Ljava/util/LinkedHashMap;

    .line 150
    .line 151
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->remoteTransitions:Ljava/util/LinkedHashMap;

    .line 152
    .line 153
    invoke-direct {p1, p2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 154
    .line 155
    .line 156
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    if-eqz p2, :cond_3

    .line 169
    .line 170
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    check-cast p2, Ljava/util/Map$Entry;

    .line 175
    .line 176
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p3

    .line 180
    check-cast p3, Landroid/window/RemoteTransition;

    .line 181
    .line 182
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    check-cast p2, Landroid/window/TransitionFilter;

    .line 187
    .line 188
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, p3, p2}, Lcom/android/quickstep/SystemUiProxy;->registerRemoteTransition(Landroid/window/RemoteTransition;Landroid/window/TransitionFilter;)V

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_3
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->setupTransactionQueue()V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasksListener:Lcom/android/wm/shell/recents/b;

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->registerRecentTasksListener(Lcom/android/wm/shell/recents/b;)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherCallback:Landroid/window/IOnBackInvokedCallback;

    .line 204
    .line 205
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->backToLauncherRunner:Landroid/view/IRemoteAnimationRunner;

    .line 206
    .line 207
    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/SystemUiProxy;->setBackToLauncherCallback(Landroid/window/IOnBackInvokedCallback;Landroid/view/IRemoteAnimationRunner;)V

    .line 208
    .line 209
    .line 210
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimationListener:Lcom/android/systemui/unfold/progress/b;

    .line 211
    .line 212
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setUnfoldAnimationListener(Lcom/android/systemui/unfold/progress/b;)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->desktopTaskListener:Lcom/android/wm/shell/desktopmode/c;

    .line 216
    .line 217
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setDesktopTaskListener(Lcom/android/wm/shell/desktopmode/c;)V

    .line 218
    .line 219
    .line 220
    new-instance p1, Lcom/android/quickstep/util/ContextualSearchInvoker;

    .line 221
    .line 222
    iget-object p2, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 223
    .line 224
    invoke-direct {p1, p2}, Lcom/android/quickstep/util/ContextualSearchInvoker;-><init>(Landroid/content/Context;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1}, Lcom/android/quickstep/util/ContextualSearchInvoker;->getSysUiAssistOverrideInvocationTypes()[I

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-virtual {p0, p1}, Lcom/android/quickstep/SystemUiProxy;->setAssistantOverridesRequested([I)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->stateChangeCallbacks:Ljava/util/List;

    .line 235
    .line 236
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 241
    .line 242
    .line 243
    move-result p2

    .line 244
    if-eqz p2, :cond_4

    .line 245
    .line 246
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    check-cast p2, Ljava/lang/Runnable;

    .line 251
    .line 252
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 253
    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_4
    iget-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldTransitionProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 257
    .line 258
    if-eqz p1, :cond_6

    .line 259
    .line 260
    if-eqz v0, :cond_5

    .line 261
    .line 262
    :try_start_0
    invoke-interface {v0, p1}, Lcom/android/systemui/unfold/progress/a;->g2(Lcom/android/systemui/unfold/progress/b;)V

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldTransitionProvider:Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;

    .line 266
    .line 267
    invoke-virtual {p0, v2}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->setActive(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_5
    invoke-virtual {p1, v1}, Lcom/android/quickstep/util/unfold/ProxyUnfoldTransitionProvider;->setActive(Z)V

    .line 272
    .line 273
    .line 274
    :catch_0
    :cond_6
    return-void
.end method

.method public final setShelfHeight(ZI)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->asyncHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0, p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final setStartingWindowListener(LV2/b;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindow:LV2/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, LV2/a;->A1(LV2/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call setStartingWindowListener"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->startingWindowListener:LV2/b;

    .line 18
    .line 19
    return-void
.end method

.method public final setUnfoldAnimationListener(Lcom/android/systemui/unfold/progress/b;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimationListener:Lcom/android/systemui/unfold/progress/b;

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->unfoldAnimation:Lcom/android/systemui/unfold/progress/a;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/android/systemui/unfold/progress/a;->g2(Lcom/android/systemui/unfold/progress/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p1, "Failed call setUnfoldAnimationListener"

    .line 13
    .line 14
    const-string v0, "SystemUiProxy"

    .line 15
    .line 16
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final shareTransactionQueue()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->originalTransactionToken:Landroid/os/IBinder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/SurfaceControl$Transaction;->getDefaultApplyToken()Landroid/os/IBinder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->originalTransactionToken:Landroid/os/IBinder;

    .line 10
    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->setupTransactionQueue()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;)V
    .locals 7

    .line 1
    const-string v0, "user"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/android/quickstep/SystemUiProxy;->showAppBubble$default(Lcom/android/quickstep/SystemUiProxy;Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;ILjava/lang/Object;)V

    return-void
.end method

.method public final showAppBubble(Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;)V
    .locals 1

    const-string v0, "user"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1, p2, p3}, LJ2/a;->K1(Landroid/content/Intent;Landroid/os/UserHandle;LN2/h;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 3
    const-string p1, "Failed call showAppBubble"

    .line 4
    const-string p2, "SystemUiProxy"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public final showBubble(Ljava/lang/String;I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, LJ2/a;->J1(Ljava/lang/String;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call showBubble"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final showBubbleDropTarget(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/android/quickstep/SystemUiProxy;->showBubbleDropTarget$default(Lcom/android/quickstep/SystemUiProxy;ZLN2/h;ILjava/lang/Object;)V

    return-void
.end method

.method public final showBubbleDropTarget(ZLN2/h;)V
    .locals 0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1, p2}, LJ2/a;->K0(ZLN2/h;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 3
    const-string p1, "Failed call showDropTarget"

    .line 4
    const-string p2, "SystemUiProxy"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public final showDesktopApp(ILandroid/window/RemoteTransition;LO2/f;)V
    .locals 1

    .line 1
    const-string v0, "toFrontReason"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1, p2, p3}, Lcom/android/wm/shell/desktopmode/b;->O0(ILandroid/window/RemoteTransition;LO2/f;)V
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
    const-string p1, "Failed call showDesktopApp"

    .line 16
    .line 17
    const-string p2, "SystemUiProxy"

    .line 18
    .line 19
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final showDesktopApps(ILandroid/window/RemoteTransition;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/android/wm/shell/desktopmode/b;->Y0(ILandroid/window/RemoteTransition;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call showDesktopApps"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final showExpandedView()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, LJ2/a;->v1()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call showExpandedView"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final showShortcutBubble(Landroid/content/pm/ShortcutInfo;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lcom/android/quickstep/SystemUiProxy;->showShortcutBubble$default(Lcom/android/quickstep/SystemUiProxy;Landroid/content/pm/ShortcutInfo;LN2/h;ILjava/lang/Object;)V

    return-void
.end method

.method public final showShortcutBubble(Landroid/content/pm/ShortcutInfo;LN2/h;)V
    .locals 0

    .line 2
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1, p2}, LJ2/a;->V(Landroid/content/pm/ShortcutInfo;LN2/h;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 3
    const-string p1, "Failed call showShortcutBubble"

    .line 4
    const-string p2, "SystemUiProxy"

    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-void
.end method

.method public final showUserEducation(Landroid/graphics/Point;)V
    .locals 1

    .line 1
    const-string v0, "position"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget v0, p1, Landroid/graphics/Point;->x:I

    .line 11
    .line 12
    iget p1, p1, Landroid/graphics/Point;->y:I

    .line 13
    .line 14
    invoke-interface {p0, v0, p1}, LJ2/a;->D0(II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    const-string p1, "Failed call showUserEducation"

    .line 20
    .line 21
    const-string v0, "SystemUiProxy"

    .line 22
    .line 23
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final startAssistant(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "args"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->startAssistant(Landroid/os/Bundle;)V
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
    const-string p1, "Failed call startAssistant"

    .line 16
    .line 17
    const-string v0, "SystemUiProxy"

    .line 18
    .line 19
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final startBubbleDrag(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, LJ2/a;->G(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call startBubbleDrag"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final startConciseAssistantOnce(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    const-string v1, "SystemUiProxy"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "startConciseAssistantOnce: "

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 13
    .line 14
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->startAssistant(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    const-string v0, "Failed call startConciseAssistantOnce"

    .line 23
    .line 24
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :goto_0
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseStartAssistantOnce:Z

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseAssistantBundle:Landroid/os/Bundle;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string v0, "startConciseAssistantOnce: set mStartAssistantOnce true!"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseStartAssistantOnce:Z

    .line 41
    .line 42
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->mConciseAssistantBundle:Landroid/os/Bundle;

    .line 43
    .line 44
    return-void
.end method

.method public final startIntent(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p6}, Lcom/android/wm/shell/splitscreen/a;->X(Landroid/app/PendingIntent;ILandroid/content/Intent;ILandroid/os/Bundle;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startIntent"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final startIntentAndTask(Landroid/app/PendingIntent;ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    .locals 1
    .param p7    # I
        .annotation runtime Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p9}, Lcom/android/wm/shell/splitscreen/a;->k1(Landroid/app/PendingIntent;ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startIntentAndTask"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final startIntents(Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    .locals 1
    .param p10    # I
        .annotation runtime Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p12}, Lcom/android/wm/shell/splitscreen/a;->g1(Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;Landroid/app/PendingIntent;ILandroid/content/pm/ShortcutInfo;Landroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startIntents"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final startLaunchIntentTransition(Landroid/content/Intent;Landroid/os/Bundle;I)V
    .locals 1

    .line 1
    const-string v0, "intent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "options"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->desktopMode:Lcom/android/wm/shell/desktopmode/b;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3}, Lcom/android/wm/shell/desktopmode/b;->f1(Landroid/content/Intent;Landroid/os/Bundle;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    const-string p1, "Failed call startLaunchIntentTransition"

    .line 21
    .line 22
    const-string p2, "SystemUiProxy"

    .line 23
    .line 24
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final startOneHandedMode()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->oneHanded:LL2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, LL2/a;->m1()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call startOneHandedMode"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final startRecentsActivity(Landroid/content/Intent;Landroid/app/ActivityOptions;Lcom/android/systemui/shared/system/RecentsAnimationListener;Z)Z
    .locals 9

    .line 1
    const-string v0, "options"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "listener"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    invoke-static {}, Lcom/android/launcher3/anim/C;->n0()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 21
    .line 22
    const-string v2, "Launcher.startRecents"

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :try_start_0
    iget-object v3, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 28
    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/android/quickstep/SystemUiProxy;->getRecentsPendingIntent()Landroid/app/PendingIntent;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {p2}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    const/4 p2, 0x1

    .line 40
    if-eqz p4, :cond_1

    .line 41
    .line 42
    const-string p4, "is_synthetic_recents_transition"

    .line 43
    .line 44
    invoke-virtual {v6, p4, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    move-object p0, v0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    sget-object p4, Lh4/t;->a:Lh4/t;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->context:Landroid/content/Context;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/content/Context;->getIApplicationThread()Landroid/app/IApplicationThread;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    new-instance v8, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;

    .line 60
    .line 61
    invoke-direct {v8, p3}, Lcom/android/quickstep/SystemUiProxy$RecentsAnimationListenerStub;-><init>(Lcom/android/systemui/shared/system/RecentsAnimationListener;)V

    .line 62
    .line 63
    .line 64
    move-object v5, p1

    .line 65
    invoke-interface/range {v3 .. v8}, Lcom/android/wm/shell/recents/a;->P(Landroid/app/PendingIntent;Landroid/content/Intent;Landroid/os/Bundle;Landroid/app/IApplicationThread;Lcom/android/wm/shell/recents/d;)V

    .line 66
    .line 67
    .line 68
    return p2

    .line 69
    :cond_2
    invoke-static {}, Lcom/android/quickstep/util/ActiveGestureProtoLogProxy;->logRecentTasksMissing()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    return v1

    .line 73
    :goto_1
    const-string p1, "Error starting recents via shell"

    .line 74
    .line 75
    const-string p2, "SystemUiProxy"

    .line 76
    .line 77
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    .line 79
    .line 80
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 83
    .line 84
    .line 85
    return v1
.end method

.method public final startScreenPinning(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->startScreenPinning(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call startScreenPinning"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final startShortcut(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Bundle;Landroid/os/UserHandle;Lcom/android/internal/logging/InstanceId;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p6}, Lcom/android/wm/shell/splitscreen/a;->Z0(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Bundle;Landroid/os/UserHandle;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startShortcut"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final startShortcutAndTask(Landroid/content/pm/ShortcutInfo;Landroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    .locals 1
    .param p6    # I
        .annotation runtime Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p8}, Lcom/android/wm/shell/splitscreen/a;->c0(Landroid/content/pm/ShortcutInfo;Landroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startShortcutAndTask"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final startSwipePipToHome(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 1

    .line 1
    const-string v0, "taskInfo"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2, p3}, Lcom/android/wm/shell/common/pip/a;->w0(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return-object p0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0

    .line 19
    :goto_0
    const-string p1, "Failed call startSwipePipToHome"

    .line 20
    .line 21
    const-string p2, "SystemUiProxy"

    .line 22
    .line 23
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final startTasks(ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    .locals 1
    .param p6    # I
        .annotation runtime Lcom/android/wm/shell/shared/split/SplitScreenConstants$PersistentSnapPosition;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p8}, Lcom/android/wm/shell/splitscreen/a;->I0(ILandroid/os/Bundle;ILandroid/os/Bundle;IILandroid/window/RemoteTransition;Lcom/android/internal/logging/InstanceId;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call startTasks"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final stopBubbleDrag(LN2/h;I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, LJ2/a;->Q0(LN2/h;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call stopBubbleDrag"

    .line 11
    .line 12
    const-string p2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final stopOneHandedMode()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->oneHanded:LL2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, LL2/a;->i2()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call stopOneHandedMode"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final stopScreenPinning()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->stopScreenPinning()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call stopScreenPinning"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final stopSwipePipToHome(ILandroid/content/ComponentName;Landroid/graphics/Rect;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->pip:Lcom/android/wm/shell/common/pip/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p6}, Lcom/android/wm/shell/common/pip/a;->N0(ILandroid/content/ComponentName;Landroid/graphics/Rect;Landroid/view/SurfaceControl;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception v0

    .line 10
    move-object p0, v0

    .line 11
    const-string p1, "Failed call stopSwipePipToHome"

    .line 12
    .line 13
    const-string p2, "SystemUiProxy"

    .line 14
    .line 15
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final takeScreenshot(Lcom/android/internal/util/ScreenshotRequest;)V
    .locals 1

    .line 1
    const-string v0, "request"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->takeScreenshot(Lcom/android/internal/util/ScreenshotRequest;)V
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
    const-string p1, "Failed call takeScreenshot"

    .line 16
    .line 17
    const-string v0, "SystemUiProxy"

    .line 18
    .line 19
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final toggleNotificationPanel()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->toggleNotificationPanel()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call toggleNotificationPanel"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final toggleQuickSettingsPanel()V
    .locals 2

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->toggleQuickSettingsPanel()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string v0, "Failed call toggleQuickSettingsPanel"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final unregisterRecentTasksListener(Lcom/android/wm/shell/recents/b;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasks:Lcom/android/wm/shell/recents/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/recents/a;->o(Lcom/android/wm/shell/recents/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    const-string v0, "Failed call unregisterRecentTasksListener"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->recentTasksListener:Lcom/android/wm/shell/recents/b;

    .line 19
    .line 20
    return-void
.end method

.method public final unregisterRemoteTransition(Landroid/window/RemoteTransition;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->shellTransitions:Lcom/android/wm/shell/shared/l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/shared/l;->W1(Landroid/window/RemoteTransition;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    const-string v1, "Failed call unregisterRemoteTransition"

    .line 11
    .line 12
    const-string v2, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v2, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->remoteTransitions:Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    invoke-static {p0}, Lkotlin/jvm/internal/H;->c(Ljava/lang/Object;)Ljava/util/Map;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final unregisterSplitScreenListener(Lcom/android/wm/shell/splitscreen/b;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/splitscreen/a;->i1(Lcom/android/wm/shell/splitscreen/b;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    const-string v0, "Failed call unregisterSplitScreenListener"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreenListener:Lcom/android/wm/shell/splitscreen/b;

    .line 19
    .line 20
    return-void
.end method

.method public final unregisterSplitSelectListener(Lcom/android/wm/shell/splitscreen/c;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->splitScreen:Lcom/android/wm/shell/splitscreen/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/android/wm/shell/splitscreen/a;->x(Lcom/android/wm/shell/splitscreen/c;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    const-string v0, "Failed call unregisterSplitSelectListener"

    .line 11
    .line 12
    const-string v1, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 18
    iput-object p1, p0, Lcom/android/quickstep/SystemUiProxy;->splitSelectListener:Lcom/android/wm/shell/splitscreen/c;

    .line 19
    .line 20
    return-void
.end method

.method public final unshareTransactionQueue()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->originalTransactionToken:Landroid/os/IBinder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {v0}, Landroid/view/SurfaceControl$Transaction;->setDefaultApplyToken(Landroid/os/IBinder;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/quickstep/SystemUiProxy;->originalTransactionToken:Landroid/os/IBinder;

    .line 11
    .line 12
    return-void
.end method

.method public final updateBubbleBarTopOnScreen(I)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->bubbles:LJ2/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, LJ2/a;->C(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "Failed call updateBubbleBarTopOnScreen"

    .line 11
    .line 12
    const-string v0, "SystemUiProxy"

    .line 13
    .line 14
    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final updateContextualEduStats(ZLw2/a;)V
    .locals 1

    .line 1
    const-string v0, "gestureType"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/SystemUiProxy;->systemUiProxy:Lcom/android/systemui/shared/recents/ISystemUiProxy;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-interface {p0, p1, p2}, Lcom/android/systemui/shared/recents/ISystemUiProxy;->updateContextualEduStats(ZLjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    const-string p1, "Failed call updateContextualEduStats"

    .line 20
    .line 21
    const-string p2, "SystemUiProxy"

    .line 22
    .line 23
    invoke-static {p2, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
