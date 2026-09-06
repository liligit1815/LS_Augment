.class public Lh1/e;
.super Ljava/lang/Object;
.source "ZteTrackManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lh1/e$d;,
        Lh1/e$c;,
        Lh1/e$b;
    }
.end annotation


# static fields
.field private static final e:Z

.field static f:Landroid/os/HandlerThread;

.field static g:Lh1/e$b;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/os/Messenger;

.field private c:Z

.field private d:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "ZTE_FEATURE_MINDSYNC_ANALYTICS"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lh1/e;->f(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lh1/e;->e:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    sput-object v0, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 12
    .line 13
    sput-object v0, Lh1/e;->g:Lh1/e$b;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lh1/e$a;

    invoke-direct {v0, p0}, Lh1/e$a;-><init>(Lh1/e;)V

    iput-object v0, p0, Lh1/e;->d:Landroid/content/ServiceConnection;

    return-void
.end method

.method synthetic constructor <init>(Lh1/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lh1/e;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lh1/e;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lh1/e;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic b(Lh1/e;Landroid/os/Messenger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lh1/e;->b:Landroid/os/Messenger;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic c(Lh1/e;Landroid/os/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lh1/e;->j(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d(Lh1/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lh1/e;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    const-string v0, "ZteTrackManager"

    .line 2
    .line 3
    const-string v1, "bindServiceInvoked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Landroid/content/ComponentName;

    .line 14
    .line 15
    const-string v2, "com.zte.analytics"

    .line 16
    .line 17
    const-string v3, "com.zte.analytics.datacollection.DataCollectionService"

    .line 18
    .line 19
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lh1/e;->a:Landroid/content/Context;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lh1/e;->d:Landroid/content/ServiceConnection;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, v0, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private static f(Ljava/lang/String;Z)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :try_start_0
    const-string v0, "com.zte.feature.Feature"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "getBoolean"

    .line 8
    .line 9
    const-class v2, Ljava/lang/String;

    .line 10
    .line 11
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 12
    .line 13
    filled-new-array {v2, v3}, [Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, v0, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p0
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    return p0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "Failed to invoke FeatureClass.getBoolean()"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, "ZteTrackManager"

    .line 63
    .line 64
    invoke-static {v0, p0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return p1
.end method

.method public static g()Lh1/e;
    .locals 1

    .line 1
    invoke-static {}, Lh1/e$d;->a()Lh1/e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private j(Landroid/os/Message;)V
    .locals 4

    .line 1
    const-string v0, "ZteTrackManager"

    .line 2
    .line 3
    const-string v1, "sendToService"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lx1/O;->A1()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const-string p0, "ZteTrackManager"

    .line 15
    .line 16
    const-string p1, "isUserAMonkey, not sendToService"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    :try_start_0
    sget-object v0, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 23
    .line 24
    monitor-enter v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    :try_start_1
    iget-boolean v1, p0, Lh1/e;->c:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lh1/e;->b:Landroid/os/Messenger;

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const-string v1, "ZteTrackManager"

    .line 37
    .line 38
    const-string v2, "need bindServiceInvoked"

    .line 39
    .line 40
    invoke-static {v1, v2}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lh1/e;->e()V

    .line 44
    .line 45
    .line 46
    sget-object v1, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 47
    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 51
    .line 52
    .line 53
    :cond_2
    iget-boolean v1, p0, Lh1/e;->c:Z

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    iget-object v1, p0, Lh1/e;->b:Landroid/os/Messenger;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    const-string v1, "ZteTrackManager"

    .line 62
    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v3, "sendToService "

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-static {v1, v2}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lh1/e;->b:Landroid/os/Messenger;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    monitor-exit v0

    .line 93
    return-void

    .line 94
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    :try_start_2
    throw p0
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 96
    :catch_0
    move-exception p0

    .line 97
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catch_1
    move-exception p0

    .line 102
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    .line 103
    .line 104
    .line 105
    :goto_2
    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    const-string v0, "ZteTrackManager"

    .line 2
    .line 3
    const-string v1, "unbindServiceInvoked"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-boolean v1, p0, Lh1/e;->c:Z

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lh1/e;->b:Landroid/os/Messenger;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-boolean v1, p0, Lh1/e;->c:Z

    .line 24
    .line 25
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    iget-object v0, p0, Lh1/e;->a:Landroid/content/Context;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lh1/e;->d:Landroid/content/ServiceConnection;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method


# virtual methods
.method public h(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "init"

    .line 2
    .line 3
    const-string v1, "ZteTrackManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-boolean v0, Lh1/e;->e:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string p0, "ZTE_FEATURE_MINDSYNC_ANALYTICS is false, init return."

    .line 13
    .line 14
    invoke-static {v1, p0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Lh1/e;->a:Landroid/content/Context;

    .line 19
    .line 20
    sget-object p1, Lh1/e;->g:Lh1/e$b;

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    new-instance p1, Landroid/os/HandlerThread;

    .line 25
    .line 26
    const-string v0, "ZteTrackEvent"

    .line 27
    .line 28
    const/16 v1, 0xa

    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    sput-object p1, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 36
    .line 37
    .line 38
    new-instance p1, Lh1/e$b;

    .line 39
    .line 40
    sget-object v0, Lh1/e;->f:Landroid/os/HandlerThread;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-direct {p1, p0, v0}, Lh1/e$b;-><init>(Lh1/e;Landroid/os/Looper;)V

    .line 47
    .line 48
    .line 49
    sput-object p1, Lh1/e;->g:Lh1/e$b;

    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public i(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "sendEvent "

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "ZteTrackManager"

    .line 23
    .line 24
    invoke-static {v0, p0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-boolean p0, Lh1/e;->e:Z

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const-string p0, "ZTE_FEATURE_MINDSYNC_ANALYTICS is false, sendEvent return."

    .line 32
    .line 33
    invoke-static {v0, p0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    sget-object p0, Lh1/e;->g:Lh1/e$b;

    .line 38
    .line 39
    if-nez p0, :cond_1

    .line 40
    .line 41
    const-string p0, "sTrackHandler is null , can not sendEvent"

    .line 42
    .line 43
    invoke-static {v0, p0}, Lh1/e$c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const/4 v0, 0x2

    .line 48
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 49
    .line 50
    .line 51
    sget-object p0, Lh1/e;->g:Lh1/e$b;

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-virtual {p0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 59
    .line 60
    .line 61
    sget-object p1, Lh1/e;->g:Lh1/e$b;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 64
    .line 65
    .line 66
    sget-object p0, Lh1/e;->g:Lh1/e$b;

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    const-wide/16 v0, 0xbb8

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 75
    .line 76
    .line 77
    return-void
.end method
