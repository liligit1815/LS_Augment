.class public final Lrx/internal/schedulers/e;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ScheduledAction.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lrx/i;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/schedulers/e$b;,
        Lrx/internal/schedulers/e$c;,
        Lrx/internal/schedulers/e$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Ljava/lang/Thread;",
        ">;",
        "Ljava/lang/Runnable;",
        "Lrx/i;"
    }
.end annotation


# instance fields
.field final g:LW4/g;

.field final h:LT4/a;


# direct methods
.method public constructor <init>(LT4/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 2
    iput-object p1, p0, Lrx/internal/schedulers/e;->h:LT4/a;

    .line 3
    new-instance p1, LW4/g;

    invoke-direct {p1}, LW4/g;-><init>()V

    iput-object p1, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    return-void
.end method

.method public constructor <init>(LT4/a;LW4/g;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 8
    iput-object p1, p0, Lrx/internal/schedulers/e;->h:LT4/a;

    .line 9
    new-instance p1, LW4/g;

    new-instance v0, Lrx/internal/schedulers/e$b;

    invoke-direct {v0, p0, p2}, Lrx/internal/schedulers/e$b;-><init>(Lrx/internal/schedulers/e;LW4/g;)V

    invoke-direct {p1, v0}, LW4/g;-><init>(Lrx/i;)V

    iput-object p1, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    return-void
.end method

.method public constructor <init>(LT4/a;Lb5/b;)V
    .locals 1

    .line 4
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 5
    iput-object p1, p0, Lrx/internal/schedulers/e;->h:LT4/a;

    .line 6
    new-instance p1, LW4/g;

    new-instance v0, Lrx/internal/schedulers/e$c;

    invoke-direct {v0, p0, p2}, Lrx/internal/schedulers/e$c;-><init>(Lrx/internal/schedulers/e;Lb5/b;)V

    invoke-direct {p1, v0}, LW4/g;-><init>(Lrx/i;)V

    iput-object p1, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    return-void
.end method


# virtual methods
.method public a(Ljava/util/concurrent/Future;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 2
    .line 3
    new-instance v1, Lrx/internal/schedulers/e$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/e$a;-><init>(Lrx/internal/schedulers/e;Ljava/util/concurrent/Future;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, LW4/g;->a(Lrx/i;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Lrx/i;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LW4/g;->a(Lrx/i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lb5/b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 2
    .line 3
    new-instance v1, Lrx/internal/schedulers/e$c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lrx/internal/schedulers/e$c;-><init>(Lrx/internal/schedulers/e;Lb5/b;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, LW4/g;->a(Lrx/i;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {p0}, LW4/g;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public run()V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lrx/internal/schedulers/e;->h:LT4/a;

    .line 9
    .line 10
    invoke-interface {v0}, LT4/a;->call()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/schedulers/e;->unsubscribe()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    instance-of v1, v0, LS4/f;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 23
    .line 24
    const-string v2, "Exception thrown on Scheduler.Worker thread. Add `onError` handling."

    .line 25
    .line 26
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_1
    move-exception v0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    const-string v2, "Fatal Exception thrown on Scheduler.Worker thread."

    .line 35
    .line 36
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-static {}, LZ4/d;->b()LZ4/d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, LZ4/d;->a()LZ4/a;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, v1}, LZ4/a;->a(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2, v0, v1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lrx/internal/schedulers/e;->unsubscribe()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :goto_1
    invoke-virtual {p0}, Lrx/internal/schedulers/e;->unsubscribe()V

    .line 66
    .line 67
    .line 68
    throw v0
.end method

.method public unsubscribe()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 2
    .line 3
    invoke-virtual {v0}, LW4/g;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lrx/internal/schedulers/e;->g:LW4/g;

    .line 10
    .line 11
    invoke-virtual {p0}, LW4/g;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
