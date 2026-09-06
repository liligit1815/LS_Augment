.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AppExecutors"

.field private static mAppExecutors:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;


# instance fields
.field private mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

.field private mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

.field private mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

.field private mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method private constructor <init>()V
    .locals 10

    .line 6
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 7
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    new-instance v8, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$1;

    invoke-direct {v8}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$1;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    invoke-direct/range {v0 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 8
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v8

    new-instance v9, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$2;

    invoke-direct {v9}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$2;-><init>()V

    const/16 v2, 0x8

    const/16 v3, 0x8

    move-object v6, v5

    const-wide/16 v4, 0x0

    invoke-direct/range {v1 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    new-instance v2, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    invoke-direct {v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;-><init>()V

    new-instance v3, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    invoke-direct {v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;-><init>()V

    .line 9
    invoke-direct {p0, v0, v1, v2, v3}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;-><init>(Ljava/util/concurrent/ThreadPoolExecutor;Ljava/util/concurrent/ThreadPoolExecutor;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;)V

    return-void
.end method

.method private constructor <init>(Ljava/util/concurrent/ThreadPoolExecutor;Ljava/util/concurrent/ThreadPoolExecutor;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 3
    iput-object p2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 4
    iput-object p3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 5
    iput-object p4, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;
    .locals 2

    .line 1
    const-class v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAppExecutors:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 9
    .line 10
    invoke-direct {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAppExecutors:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAppExecutors:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method


# virtual methods
.method public asyncThread()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public diskIO()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public mainThread()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public networkIO()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAppExecutors:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;

    .line 3
    .line 4
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    :goto_0
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :catchall_0
    move-exception v1

    .line 15
    goto :goto_1

    .line 16
    :catch_0
    move-exception v1

    .line 17
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mDiskIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 22
    .line 23
    throw v1

    .line 24
    :cond_0
    :goto_2
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    :try_start_2
    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 29
    .line 30
    .line 31
    :goto_3
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 32
    .line 33
    goto :goto_5

    .line 34
    :catchall_1
    move-exception v1

    .line 35
    goto :goto_4

    .line 36
    :catch_1
    move-exception v1

    .line 37
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 38
    .line 39
    .line 40
    goto :goto_3

    .line 41
    :goto_4
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mNetworkIO:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 42
    .line 43
    throw v1

    .line 44
    :cond_1
    :goto_5
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    :try_start_4
    invoke-virtual {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;->shutdownNow()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 49
    .line 50
    .line 51
    :goto_6
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 52
    .line 53
    goto :goto_8

    .line 54
    :catchall_2
    move-exception v1

    .line 55
    goto :goto_7

    .line 56
    :catch_2
    move-exception v1

    .line 57
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 58
    .line 59
    .line 60
    goto :goto_6

    .line 61
    :goto_7
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mMainThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$MainThreadExecutor;

    .line 62
    .line 63
    throw v1

    .line 64
    :cond_2
    :goto_8
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    :try_start_6
    invoke-virtual {v1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->shutdownNow()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 69
    .line 70
    .line 71
    :goto_9
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    .line 72
    .line 73
    goto :goto_b

    .line 74
    :catchall_3
    move-exception v1

    .line 75
    goto :goto_a

    .line 76
    :catch_3
    move-exception v1

    .line 77
    :try_start_7
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 78
    .line 79
    .line 80
    goto :goto_9

    .line 81
    :goto_a
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;->mAsyncThread:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;

    .line 82
    .line 83
    throw v1

    .line 84
    :cond_3
    :goto_b
    return-void
.end method
