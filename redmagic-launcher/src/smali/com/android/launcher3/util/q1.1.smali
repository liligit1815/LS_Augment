.class public Lcom/android/launcher3/util/q1;
.super Ljava/lang/Object;
.source "LooperIdleLock.java"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# instance fields
.field private final a:Ljava/lang/Object;

.field private b:Z

.field private c:Landroid/os/Looper;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/q1;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/q1;->c:Landroid/os/Looper;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/android/launcher3/util/q1;->b:Z

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a(J)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/util/q1;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/q1;->a:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :catch_0
    :cond_0
    iget-boolean p0, p0, Lcom/android/launcher3/util/q1;->b:Z

    .line 11
    .line 12
    return p0
.end method

.method public queueIdle()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/q1;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/android/launcher3/util/q1;->b:Z

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/util/q1;->a:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 10
    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    iget-object v0, p0, Lcom/android/launcher3/util/q1;->c:Landroid/os/Looper;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p0
.end method
