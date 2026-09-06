.class public Lcom/android/quickstep/util/TISBindHelper;
.super Ljava/lang/Object;
.source "TISBindHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# static fields
.field private static final BACKOFF_MILLIS:J = 0x3e8L

.field private static final MAX_BACKOFF_MILLIS:J = 0x927c0L

.field private static final TAG:Ljava/lang/String; = "TISBindHelper"


# instance fields
.field private mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

.field private mConnectionAttempts:S

.field private final mConnectionCallback:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/TouchInteractionService$TISBinder;",
            ">;"
        }
    .end annotation
.end field

.field private final mConnectionRunnable:Ljava/lang/Runnable;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mIsConnected:Z

.field private final mPendingConnectedCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mTisServiceBound:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/function/Consumer<",
            "Lcom/android/quickstep/TouchInteractionService$TISBinder;",
            ">;)V"
        }
    .end annotation

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
    iput-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mHandler:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v0, Lcom/android/quickstep/util/s1;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/s1;-><init>(Lcom/android/quickstep/util/TISBindHelper;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionRunnable:Ljava/lang/Runnable;

    .line 21
    .line 22
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mPendingConnectedCallbacks:Ljava/util/ArrayList;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mContext:Landroid/content/Context;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionCallback:Ljava/util/function/Consumer;

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->internalBindToTIS()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/TISBindHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->internalBindToTIS()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private internalBindToTIS()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v1, Landroid/content/Intent;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/util/TISBindHelper;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    const-class v3, Lcom/android/quickstep/TouchInteractionService;

    .line 8
    .line 9
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput-boolean v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mTisServiceBound:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->resetServiceBindRetryState()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "Retrying TIS Binder connection attempt: "

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-short v1, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionAttempts:S

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "TISBindHelper"

    .line 45
    .line 46
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const/high16 v0, 0x447a0000    # 1000.0f

    .line 50
    .line 51
    iget-short v1, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionAttempts:S

    .line 52
    .line 53
    invoke-static {v0, v1}, Ljava/lang/Math;->scalb(FI)F

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const v1, 0x49127c00    # 600000.0f

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    float-to-long v0, v0

    .line 65
    iget-object v2, p0, Lcom/android/quickstep/util/TISBindHelper;->mHandler:Landroid/os/Handler;

    .line 66
    .line 67
    iget-object v3, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionRunnable:Ljava/lang/Runnable;

    .line 68
    .line 69
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .line 71
    .line 72
    iget-short v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionAttempts:S

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    int-to-short v0, v0

    .line 77
    iput-short v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionAttempts:S

    .line 78
    .line 79
    return-void
.end method

.method private internalUnbindToTIS()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mTisServiceBound:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mTisServiceBound:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private resetServiceBindRetryState()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionRunnable:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mHandler:Landroid/os/Handler;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionRunnable:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-short v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionAttempts:S

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getBinder()Lcom/android/quickstep/TouchInteractionService$TISBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getOverviewCommandHelper()Lcom/android/quickstep/OverviewCommandHelper;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getTaskbarManager()Lcom/android/launcher3/taskbar/g3;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->getTaskbarManager()Lcom/android/launcher3/taskbar/g3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onBindingDied(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "TISBindHelper"

    .line 2
    .line 3
    const-string v0, "TIS binding died"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->internalBindToTIS()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->internalUnbindToTIS()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->resetServiceBindRetryState()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mIsConnected:Z

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mPendingConnectedCallbacks:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    instance-of p1, p2, Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->internalUnbindToTIS()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mHandler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-wide/16 v0, 0x3e8

    .line 13
    .line 14
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string p1, "TISBindHelper"

    .line 19
    .line 20
    const-string v0, "TIS service connected"

    .line 21
    .line 22
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mIsConnected:Z

    .line 27
    .line 28
    check-cast p2, Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mConnectionCallback:Ljava/util/function/Consumer;

    .line 33
    .line 34
    invoke-interface {p1, p2}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mPendingConnectedCallbacks:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    check-cast p2, Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mPendingConnectedCallbacks:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 62
    .line 63
    .line 64
    invoke-direct {p0}, Lcom/android/quickstep/util/TISBindHelper;->resetServiceBindRetryState()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "TISBindHelper"

    .line 2
    .line 3
    const-string v0, "TIS service disconnected"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/android/quickstep/util/TISBindHelper;->mIsConnected:Z

    .line 13
    .line 14
    return-void
.end method

.method public runOnBindToTouchInteractionService(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/util/TISBindHelper;->mIsConnected:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mPendingConnectedCallbacks:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setPredictiveBackToHomeInProgress(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/TISBindHelper;->mBinder:Lcom/android/quickstep/TouchInteractionService$TISBinder;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TouchInteractionService$TISBinder;->setPredictiveBackToHomeInProgress(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
