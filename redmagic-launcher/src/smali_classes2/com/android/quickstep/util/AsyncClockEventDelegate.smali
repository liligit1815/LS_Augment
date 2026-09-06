.class public Lcom/android/quickstep/util/AsyncClockEventDelegate;
.super Landroid/widget/TextClock$ClockEventDelegate;
.source "AsyncClockEventDelegate.java"

# interfaces
.implements Lcom/android/launcher3/util/p2$a;
.implements Lcom/android/launcher3/util/a2;


# static fields
.field public static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/util/AsyncClockEventDelegate;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mDestroyed:Z

.field private final mFormatObservers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/database/ContentObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mFormatRegistered:Z

.field private final mFormatUri:Landroid/net/Uri;

.field private final mReceiver:Lcom/android/launcher3/util/x2;

.field private final mSettingsCache:Lcom/android/launcher3/util/p2;

.field private final mTimeEventReceivers:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/content/BroadcastReceiver;",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/B;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/util/B;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/p2;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/TextClock$ClockEventDelegate;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 17
    .line 18
    const-string v0, "time_12_24"

    .line 19
    .line 20
    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatUri:Landroid/net/Uri;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatRegistered:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p3, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 34
    .line 35
    new-instance p3, Lcom/android/launcher3/util/x2;

    .line 36
    .line 37
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 38
    .line 39
    new-instance v1, Lcom/android/quickstep/util/A;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/A;-><init>(Lcom/android/quickstep/util/AsyncClockEventDelegate;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p3, p1, v0, v1}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 45
    .line 46
    .line 47
    iput-object p3, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mReceiver:Lcom/android/launcher3/util/x2;

    .line 48
    .line 49
    const-string p1, "android.intent.action.TIME_SET"

    .line 50
    .line 51
    const-string v0, "android.intent.action.TIMEZONE_CHANGED"

    .line 52
    .line 53
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2, p0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static synthetic b(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/Intent;Landroid/content/BroadcastReceiver;Landroid/os/Handler;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/AsyncClockEventDelegate;->lambda$onClockEventReceived$2(Landroid/content/Intent;Landroid/content/BroadcastReceiver;Landroid/os/Handler;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/database/ContentObserver;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AsyncClockEventDelegate;->lambda$onSettingsChanged$0(Landroid/database/ContentObserver;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/BroadcastReceiver;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/util/AsyncClockEventDelegate;->lambda$onClockEventReceived$1(Landroid/content/BroadcastReceiver;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/AsyncClockEventDelegate;->onClockEventReceived(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$onClockEventReceived$1(Landroid/content/BroadcastReceiver;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0, p2}, Landroid/content/BroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onClockEventReceived$2(Landroid/content/Intent;Landroid/content/BroadcastReceiver;Landroid/os/Handler;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/util/C;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/android/quickstep/util/C;-><init>(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/BroadcastReceiver;Landroid/content/Intent;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic lambda$onSettingsChanged$0(Landroid/database/ContentObserver;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatUri:Landroid/net/Uri;

    .line 3
    .line 4
    invoke-virtual {p1, v0, p0}, Landroid/database/ContentObserver;->dispatchChange(ZLandroid/net/Uri;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private onClockEventReceived(Landroid/content/Intent;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mReceiver:Lcom/android/launcher3/util/x2;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 10
    .line 11
    new-instance v2, Lcom/android/quickstep/util/z;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1}, Lcom/android/quickstep/util/z;-><init>(Lcom/android/quickstep/util/AsyncClockEventDelegate;Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatUri:Landroid/net/Uri;

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mReceiver:Lcom/android/launcher3/util/x2;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onSettingsChanged(Z)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/util/D;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/D;-><init>(Lcom/android/quickstep/util/AsyncClockEventDelegate;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    .line 17
    .line 18
    .line 19
    monitor-exit p1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public registerFormatChangeObserver(Landroid/database/ContentObserver;I)V
    .locals 2

    .line 1
    iget-boolean p2, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p2, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 7
    .line 8
    monitor-enter p2

    .line 9
    :try_start_0
    iget-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatRegistered:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mDestroyed:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mSettingsCache:Lcom/android/launcher3/util/p2;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatUri:Landroid/net/Uri;

    .line 20
    .line 21
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatRegistered:Z

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    monitor-exit p2

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public registerTimeChangeReceiver(Landroid/content/BroadcastReceiver;Landroid/os/Handler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    new-instance p2, Landroid/os/Handler;

    .line 9
    .line 10
    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    invoke-virtual {p0, p1, p2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public unregisterFormatChangeObserver(Landroid/database/ContentObserver;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mFormatObservers:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

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

.method public unregisterTimeChangeReceiver(Landroid/content/BroadcastReceiver;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/quickstep/util/AsyncClockEventDelegate;->mTimeEventReceivers:Landroid/util/ArrayMap;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

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
