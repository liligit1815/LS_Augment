.class public Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;
.super Ljava/lang/Object;
.source "Counter.java"

# interfaces
.implements Ljava/util/concurrent/Executor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AsyncThreadExecutor"
.end annotation


# instance fields
.field private asyncThread:Landroid/os/HandlerThread;

.field private asyncThreadHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 14
    .line 15
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Landroid/os/HandlerThread;

    .line 20
    .line 21
    const-string v1, "AsyncThreadExecutor"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 27
    .line 28
    const/16 v1, 0xa

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/os/HandlerThread;->setPriority(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 44
    .line 45
    .line 46
    :cond_1
    new-instance v0, Landroid/os/Handler;

    .line 47
    .line 48
    iget-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 49
    .line 50
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public executeDelayed(Ljava/lang/Runnable;J)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, p2, v0

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public isPending(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public removeExecute(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public shutdownNow()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThreadHandler:Landroid/os/Handler;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/AppExecutors$AsyncThreadExecutor;->asyncThread:Landroid/os/HandlerThread;

    .line 19
    .line 20
    :cond_1
    return-void
.end method
