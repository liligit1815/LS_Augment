.class public final Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;
.super Ljava/lang/Object;
.source "DigitalHumanManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$OnServiceBindCallback;
    }
.end annotation


# static fields
.field public static final CONNECTION_LOCK:Ljava/lang/Object;

.field private static final TAG:Ljava/lang/String; = "DigitalHumanManager"

.field private static final sConnectionCallbackExecutor:Ljava/util/concurrent/Executor;

.field private static final sContextBound:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private static final sIModel:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;",
            ">;"
        }
    .end annotation
.end field

.field private static final sOnServiceBindCallback:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$OnServiceBindCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static final sProxy:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;",
            ">;"
        }
    .end annotation
.end field

.field private static final sServerIdCreator:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;",
            ">;"
        }
    .end annotation
.end field

.field private static final sServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    const-string v1, "DigitalHumanManager-ConnectionCallbackThread"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/utils/HandlerExecutor;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lcn/nubia/redmagickyi/digitalhuman/utils/HandlerExecutor;-><init>(Landroid/os/Handler;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sConnectionCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/Object;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->CONNECTION_LOCK:Ljava/lang/Object;

    .line 33
    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sContextBound:Ljava/util/concurrent/atomic/AtomicReference;

    .line 40
    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 44
    .line 45
    .line 46
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 47
    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sProxy:Ljava/util/concurrent/atomic/AtomicReference;

    .line 54
    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServerIdCreator:Ljava/util/concurrent/atomic/AtomicReference;

    .line 61
    .line 62
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sOnServiceBindCallback:Ljava/util/concurrent/atomic/AtomicReference;

    .line 68
    .line 69
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$1;

    .line 70
    .line 71
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$1;-><init>()V

    .line 72
    .line 73
    .line 74
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServiceConnection:Landroid/content/ServiceConnection;

    .line 75
    .line 76
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/RuntimeException;

    .line 5
    .line 6
    const-string v0, "NOT allowed to create DigitalHumanManager instance"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    throw p0
.end method

.method static synthetic access$000()Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sContextBound:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic access$100()Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServerIdCreator:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic access$200()Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic access$300()Ljava/util/concurrent/atomic/AtomicReference;
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sOnServiceBindCallback:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    return-object v0
.end method

.method static synthetic access$400()V
    .locals 0

    .line 1
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->resetConnection()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic access$500(Z)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
    .locals 0

    .line 1
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->model(Z)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bindService(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;)Z
    .locals 5

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->CONNECTION_LOCK:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServerIdCreator:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sContextBound:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    const-string p1, "DigitalHumanManager"

    .line 18
    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v3, "model service already bound with context "

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", no need to bind again with context "

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    return p0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_2

    .line 56
    :cond_0
    :try_start_1
    invoke-static {p0, p1}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->connect(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;)Z

    .line 57
    .line 58
    .line 59
    move-result p1
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    :try_start_2
    const-string v1, "DigitalHumanManager"

    .line 63
    .line 64
    const-string v2, "failed to bind model service"

    .line 65
    .line 66
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :catch_0
    move-exception v1

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    const-string v2, "DigitalHumanManager"

    .line 73
    .line 74
    const-string v3, "successfully bound model service"

    .line 75
    .line 76
    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catch_1
    move-exception v1

    .line 84
    const/4 p1, 0x0

    .line 85
    :goto_0
    :try_start_3
    const-string v2, "DigitalHumanManager"

    .line 86
    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v4, "failed to bind model service, exception = "

    .line 93
    .line 94
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    :goto_1
    if-nez p1, :cond_2

    .line 108
    .line 109
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServiceConnection:Landroid/content/ServiceConnection;

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 112
    .line 113
    .line 114
    :cond_2
    monitor-exit v0

    .line 115
    return p1

    .line 116
    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 117
    throw p0
.end method

.method private static connect(Landroid/content/Context;Lcn/nubia/redmagickyi/digitalhuman/utils/ServerIdCreator;)Z
    .locals 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/content/ComponentName;

    .line 7
    .line 8
    const-string v2, "cn.nubia.redmagickyi.digitalhuman.server.DigitalHumanService"

    .line 9
    .line 10
    const-string v3, "cn.nubia.redmagickyi"

    .line 11
    .line 12
    invoke-direct {v1, v3, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string v1, "ServerId"

    .line 19
    .line 20
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    sget-object p1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sConnectionCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServiceConnection:Landroid/content/ServiceConnection;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {p0, v0, v2, p1, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;ILjava/util/concurrent/Executor;Landroid/content/ServiceConnection;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public static get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;
    .locals 2

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sProxy:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$2;

    .line 10
    .line 11
    invoke-direct {v1}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$2;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 22
    .line 23
    return-object v0
.end method

.method public static isReady()Z
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    return v0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    return v0
.end method

.method private static model(Z)Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;
    .locals 5

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sContextBound:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "DigitalHumanManager"

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "model failed sContextBound: "

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_0
    if-eqz p0, :cond_1

    .line 38
    .line 39
    sget-object p0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 46
    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    const-string v1, "model failed sIModel: "

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v2, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    :cond_1
    sget-object p0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    :goto_0
    if-nez p0, :cond_3

    .line 77
    .line 78
    add-int/lit8 v1, v0, 0x1

    .line 79
    .line 80
    const/16 v3, 0x14

    .line 81
    .line 82
    if-ge v0, v3, :cond_2

    .line 83
    .line 84
    const-wide/16 v3, 0x32

    .line 85
    .line 86
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :catch_0
    sget-object p0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanService;

    .line 96
    .line 97
    move v0, v1

    .line 98
    goto :goto_0

    .line 99
    :cond_2
    move v0, v1

    .line 100
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v3, "model result: "

    .line 106
    .line 107
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v3, ", tryCount: "

    .line 114
    .line 115
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    return-object p0
.end method

.method private static resetConnection()V
    .locals 2

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static setOnServiceBindCallback(Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager$OnServiceBindCallback;)V
    .locals 1

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sOnServiceBindCallback:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static unbindService(Landroid/content/Context;)Z
    .locals 4

    .line 1
    sget-object v0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->CONNECTION_LOCK:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sContextBound:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const-string p0, "DigitalHumanManager"

    .line 14
    .line 15
    const-string v1, "NO context bound, can\'t unbind model service"

    .line 16
    .line 17
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return v3

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eq p0, v2, :cond_1

    .line 29
    .line 30
    const-string p0, "DigitalHumanManager"

    .line 31
    .line 32
    const-string v1, "NOT the context bound before, can\'t unbind tunnel service"

    .line 33
    .line 34
    invoke-static {p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    monitor-exit v0

    .line 38
    return v3

    .line 39
    :cond_1
    sget-object p0, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sIModel:Ljava/util/concurrent/atomic/AtomicReference;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    const-string p0, "DigitalHumanManager"

    .line 48
    .line 49
    const-string v2, "unbindService: model service"

    .line 50
    .line 51
    invoke-static {p0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->get()Lcn/nubia/redmagickyi/digitalhuman/proxy/IProxyDigitalHumanService;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/ProxyDigitalHumanService;->release()V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->resetConnection()V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const-string p0, "DigitalHumanManager"

    .line 68
    .line 69
    const-string v2, "unbindService: model service NOT connected, no need to reset"

    .line 70
    .line 71
    invoke-static {p0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    :goto_0
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Landroid/content/Context;

    .line 79
    .line 80
    const/4 v2, 0x0

    .line 81
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/DigitalHumanManager;->sServiceConnection:Landroid/content/ServiceConnection;

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 87
    .line 88
    .line 89
    const-string p0, "DigitalHumanManager"

    .line 90
    .line 91
    const-string v1, "successfully unbound model service"

    .line 92
    .line 93
    invoke-static {p0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x1

    .line 97
    monitor-exit v0

    .line 98
    return p0

    .line 99
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    throw p0
.end method
