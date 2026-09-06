.class public abstract LF4/h0;
.super LF4/f0;
.source "EventLoop.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/f0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method protected abstract o0()Ljava/lang/Thread;
.end method

.method protected p0(JLF4/g0$b;)V
    .locals 0

    .line 1
    sget-object p0, LF4/N;->o:LF4/N;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, LF4/g0;->F0(JLF4/g0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method protected final q0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, LF4/h0;->o0()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eq v0, p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, LF4/c;->a()LF4/b;

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
