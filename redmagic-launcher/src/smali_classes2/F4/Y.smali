.class final LF4/Y;
.super Ljava/lang/Object;
.source "Executors.kt"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final g:LF4/E;


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, LF4/Y;->g:LF4/E;

    .line 2
    .line 3
    sget-object v1, Ll4/h;->g:Ll4/h;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, LF4/E;->c0(Ll4/g;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, LF4/Y;->g:LF4/E;

    .line 12
    .line 13
    invoke-virtual {p0, v1, p1}, LF4/E;->a0(Ll4/g;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LF4/Y;->g:LF4/E;

    .line 2
    .line 3
    invoke-virtual {p0}, LF4/E;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
