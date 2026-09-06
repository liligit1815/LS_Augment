.class final synthetic LF4/y0;
.super Ljava/lang/Object;
.source "Job.kt"


# direct methods
.method public static final a(LF4/u0;)LF4/t;
    .locals 1

    .line 1
    new-instance v0, LF4/w0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LF4/w0;-><init>(LF4/u0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic b(LF4/u0;ILjava/lang/Object;)LF4/t;
    .locals 0

    .line 1
    and-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    invoke-static {p0}, LF4/x0;->a(LF4/u0;)LF4/t;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static final c(LF4/u0;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, LF4/k0;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, LF4/u0;->c(Ljava/util/concurrent/CancellationException;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static final d(Ll4/g;Ljava/util/concurrent/CancellationException;)V
    .locals 1

    .line 1
    sget-object v0, LF4/u0;->b:LF4/u0$b;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LF4/u0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1}, LF4/u0;->c(Ljava/util/concurrent/CancellationException;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic e(LF4/u0;Ljava/lang/String;Ljava/lang/Throwable;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-static {p0, p1, p2}, LF4/x0;->c(LF4/u0;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final f(LF4/u0;LF4/b0;)LF4/b0;
    .locals 3

    .line 1
    new-instance v0, LF4/d0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LF4/d0;-><init>(LF4/b0;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, v2, v0, p1, v1}, LF4/x0;->j(LF4/u0;ZLF4/z0;ILjava/lang/Object;)LF4/b0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static final g(LF4/u0;)V
    .locals 1

    .line 1
    invoke-interface {p0}, LF4/u0;->isActive()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p0}, LF4/u0;->n()Ljava/util/concurrent/CancellationException;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    throw p0
.end method

.method public static final h(Ll4/g;)V
    .locals 1

    .line 1
    sget-object v0, LF4/u0;->b:LF4/u0$b;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll4/g;->b(Ll4/g$c;)Ll4/g$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LF4/u0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, LF4/x0;->g(LF4/u0;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static final i(LF4/u0;ZLF4/z0;)LF4/b0;
    .locals 2

    .line 1
    instance-of v0, p0, LF4/A0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LF4/A0;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, LF4/A0;->j0(ZLF4/z0;)LF4/b0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p2}, LF4/z0;->t()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    new-instance v1, LF4/y0$a;

    .line 17
    .line 18
    invoke-direct {v1, p2}, LF4/y0$a;-><init>(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, v0, p1, v1}, LF4/u0;->A(ZZLu4/l;)LF4/b0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic j(LF4/u0;ZLF4/z0;ILjava/lang/Object;)LF4/b0;
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    and-int/2addr p3, p4

    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    move p1, p4

    .line 6
    :cond_0
    invoke-static {p0, p1, p2}, LF4/x0;->i(LF4/u0;ZLF4/z0;)LF4/b0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
