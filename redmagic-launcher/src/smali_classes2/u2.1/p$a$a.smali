.class Lu2/p$a$a;
.super Ljava/lang/Object;
.source "RemoteAnimationRunnerCompat.java"

# interfaces
.implements Landroid/view/IRemoteAnimationFinishedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/p$a;->startAnimation(Landroid/os/IBinder;Landroid/window/TransitionInfo;Landroid/view/SurfaceControl$Transaction;Landroid/window/IRemoteTransitionFinishedCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/os/IBinder;

.field final synthetic h:Ljava/lang/Runnable;

.field final synthetic i:Lu2/p$a;


# direct methods
.method constructor <init>(Lu2/p$a;Landroid/os/IBinder;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lu2/p$a$a;->i:Lu2/p$a;

    .line 2
    .line 3
    iput-object p2, p0, Lu2/p$a$a;->g:Landroid/os/IBinder;

    .line 4
    .line 5
    iput-object p3, p0, Lu2/p$a$a;->h:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public onAnimationFinished()V
    .locals 3

    .line 1
    iget-object v0, p0, Lu2/p$a$a;->i:Lu2/p$a;

    .line 2
    .line 3
    iget-object v0, v0, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Lu2/p$a$a;->i:Lu2/p$a;

    .line 7
    .line 8
    iget-object v1, v1, Lu2/p$a;->g:Landroid/util/ArrayMap;

    .line 9
    .line 10
    iget-object v2, p0, Lu2/p$a$a;->g:Landroid/os/IBinder;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    iget-object p0, p0, Lu2/p$a$a;->h:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p0
.end method
