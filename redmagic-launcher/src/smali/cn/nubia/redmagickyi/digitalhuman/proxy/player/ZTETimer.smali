.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$PoolType;
    }
.end annotation


# static fields
.field public static final TYPE_POOL_CACHED:I = 0x3

.field public static final TYPE_POOL_FIXED:I = 0x1

.field public static final TYPE_POOL_SCHEDULED:I = 0x0

.field public static final TYPE_POOL_SINGLE:I = 0x2


# instance fields
.field private corePoolSize:I

.field private deamon:Z

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private name:Ljava/lang/Object;

.field private poolType:I

.field private priority:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->corePoolSize:I

    const/4 v1, 0x0

    .line 3
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 4
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->deamon:Z

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->poolType:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 7
    iput v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->corePoolSize:I

    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 9
    iput-boolean v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->deamon:Z

    .line 10
    iput p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->poolType:I

    return-void
.end method

.method private declared-synchronized getExecutorService()Ljava/util/concurrent/ExecutorService;
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 3
    .line 4
    if-nez v0, :cond_4

    .line 5
    .line 6
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->name:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    :try_start_1
    new-instance v0, Ljava/lang/Throwable;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    aget-object v0, v0, v1

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->name:Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :catch_0
    :try_start_2
    const-string v0, "ZTETimer"

    .line 33
    .line 34
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->name:Ljava/lang/Object;

    .line 35
    .line 36
    :cond_0
    :goto_0
    new-instance v0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;

    .line 37
    .line 38
    invoke-direct {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->name:Ljava/lang/Object;

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v3, "-pool-%d"

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v0, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->namingPattern(Ljava/lang/String;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->priority(Ljava/lang/Integer;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-boolean v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->deamon:Z

    .line 71
    .line 72
    invoke-virtual {v0, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->daemon(Z)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory$Builder;->build()Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer$BasicThreadFactory;

    .line 77
    .line 78
    .line 79
    move-result-object v9

    .line 80
    iget v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->poolType:I

    .line 81
    .line 82
    if-eq v0, v1, :cond_3

    .line 83
    .line 84
    const/4 v1, 0x2

    .line 85
    if-eq v0, v1, :cond_2

    .line 86
    .line 87
    const/4 v1, 0x3

    .line 88
    if-eq v0, v1, :cond_1

    .line 89
    .line 90
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 91
    .line 92
    iget v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->corePoolSize:I

    .line 93
    .line 94
    invoke-direct {v0, v1, v9}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 101
    .line 102
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 103
    .line 104
    new-instance v8, Ljava/util/concurrent/SynchronousQueue;

    .line 105
    .line 106
    invoke-direct {v8}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 107
    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    const v4, 0x7fffffff

    .line 111
    .line 112
    .line 113
    const-wide/16 v5, 0x3c

    .line 114
    .line 115
    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 116
    .line 117
    .line 118
    iput-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 122
    .line 123
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 124
    .line 125
    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 126
    .line 127
    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 128
    .line 129
    .line 130
    const/4 v3, 0x1

    .line 131
    const/4 v4, 0x1

    .line 132
    const-wide/16 v5, 0x0

    .line 133
    .line 134
    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 135
    .line 136
    .line 137
    iput-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_3
    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 141
    .line 142
    iget v3, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->corePoolSize:I

    .line 143
    .line 144
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 145
    .line 146
    new-instance v8, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 147
    .line 148
    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    .line 149
    .line 150
    .line 151
    const-wide/16 v5, 0x0

    .line 152
    .line 153
    move v4, v3

    .line 154
    invoke-direct/range {v2 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 155
    .line 156
    .line 157
    iput-object v2, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 158
    .line 159
    :cond_4
    :goto_1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    .line 161
    monitor-exit p0

    .line 162
    return-object v0

    .line 163
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 164
    throw v0
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 3
    .line 4
    if-eqz v1, :cond_0

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v1

    .line 11
    goto :goto_2

    .line 12
    :catch_0
    move-exception v1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 15
    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 21
    .line 22
    return-void

    .line 23
    :goto_2
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 24
    .line 25
    throw v1
.end method

.method public isInterrupted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isTerminated()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 14
    .line 15
    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public scheduleNow(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .locals 3

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 12
    .line 13
    :cond_0
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-virtual {p0, p1, v0, v1, v2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/Future;
    .locals 7

    .line 1
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move-object v0, p0

    .line 14
    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    move-wide v2, p2

    .line 18
    move-wide v4, p4

    .line 19
    move-object v6, p6

    .line 20
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    move-object v1, p1

    .line 26
    invoke-direct {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public setCorePoolSize(I)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
    .locals 0

    .line 1
    iput p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->corePoolSize:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setDeamon(Z)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->deamon:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setName(Ljava/lang/Object;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->name:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPriority(Ljava/lang/Integer;)Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/ZTETimer;->priority:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method
