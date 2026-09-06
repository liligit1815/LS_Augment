.class public final LF4/U0;
.super Ljava/lang/Object;
.source "Timeout.kt"


# direct methods
.method public static final a(JLF4/S;LF4/u0;)LF4/S0;
    .locals 2

    .line 1
    instance-of v0, p2, LF4/U;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p2, LF4/U;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p2, 0x0

    .line 9
    :goto_0
    if-eqz p2, :cond_1

    .line 10
    .line 11
    sget-object v0, LE4/a;->g:LE4/a$a;

    .line 12
    .line 13
    sget-object v0, LE4/d;->j:LE4/d;

    .line 14
    .line 15
    invoke-static {p0, p1, v0}, LE4/c;->d(JLE4/d;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-interface {p2, v0, v1}, LF4/U;->B(J)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    if-nez p2, :cond_2

    .line 24
    .line 25
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v0, "Timed out waiting for "

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, " ms"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    :cond_2
    new-instance p0, LF4/S0;

    .line 48
    .line 49
    invoke-direct {p0, p2, p3}, LF4/S0;-><init>(Ljava/lang/String;LF4/u0;)V

    .line 50
    .line 51
    .line 52
    return-object p0
.end method

.method private static final b(LF4/T0;Lu4/p;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "T::TU;>(",
            "LF4/T0<",
            "TU;-TT;>;",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LK4/z;->j:Ll4/d;

    .line 2
    .line 3
    invoke-interface {v0}, Ll4/d;->getContext()Ll4/g;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, LF4/T;->a(Ll4/g;)LF4/S;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-wide v1, p0, LF4/T0;->k:J

    .line 12
    .line 13
    invoke-virtual {p0}, LF4/a;->getContext()Ll4/g;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-interface {v0, v1, v2, p0, v3}, LF4/S;->C(JLjava/lang/Runnable;Ll4/g;)LF4/b0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, LF4/x0;->f(LF4/u0;LF4/b0;)LF4/b0;

    .line 22
    .line 23
    .line 24
    invoke-static {p0, p0, p1}, LL4/b;->c(LK4/z;Ljava/lang/Object;Lu4/p;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static final c(JLu4/p;Ll4/d;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Ll4/d<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, LF4/T0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p3}, LF4/T0;-><init>(JLl4/d;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, p2}, LF4/U0;->b(LF4/T0;Lu4/p;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Lm4/b;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-ne p0, p1, :cond_0

    .line 21
    .line 22
    invoke-static {p3}, Lkotlin/coroutines/jvm/internal/h;->c(Ll4/d;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object p0

    .line 26
    :cond_1
    new-instance p0, LF4/S0;

    .line 27
    .line 28
    const-string p1, "Timed out immediately"

    .line 29
    .line 30
    invoke-direct {p0, p1}, LF4/S0;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0
.end method
