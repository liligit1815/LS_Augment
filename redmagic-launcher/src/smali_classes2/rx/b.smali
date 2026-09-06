.class public Lrx/b;
.super Ljava/lang/Object;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/b$b;,
        Lrx/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final b:LZ4/b;


# instance fields
.field final a:Lrx/b$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/b$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, LZ4/d;->b()LZ4/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LZ4/d;->c()LZ4/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lrx/b;->b:LZ4/b;

    .line 10
    .line 11
    return-void
.end method

.method protected constructor <init>(Lrx/b$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/b$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/b;->a:Lrx/b$a;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lrx/b$a;)Lrx/b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/b$a<",
            "TT;>;)",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/b;

    .line 2
    .line 3
    sget-object v1, Lrx/b;->b:LZ4/b;

    .line 4
    .line 5
    invoke-virtual {v1, p0}, LZ4/b;->a(Lrx/b$a;)Lrx/b$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, p0}, Lrx/b;-><init>(Lrx/b$a;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static b(Ljava/lang/Object;)Lrx/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, LW4/f;->n(Ljava/lang/Object;)LW4/f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static j(Lrx/h;Lrx/b;)Lrx/i;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/h<",
            "-TT;>;",
            "Lrx/b<",
            "TT;>;)",
            "Lrx/i;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    iget-object v0, p1, Lrx/b;->a:Lrx/b$a;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/h;->onStart()V

    .line 8
    .line 9
    .line 10
    instance-of v0, p0, LY4/a;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, LY4/a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, LY4/a;-><init>(Lrx/h;)V

    .line 17
    .line 18
    .line 19
    move-object p0, v0

    .line 20
    :cond_0
    :try_start_0
    sget-object v0, Lrx/b;->b:LZ4/b;

    .line 21
    .line 22
    iget-object v1, p1, Lrx/b;->a:Lrx/b$a;

    .line 23
    .line 24
    invoke-virtual {v0, p1, v1}, LZ4/b;->e(Lrx/b;Lrx/b$a;)Lrx/b$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1, p0}, LT4/b;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, LZ4/b;->d(Lrx/i;)Lrx/i;

    .line 32
    .line 33
    .line 34
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    return-object p0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    invoke-static {p1}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lrx/h;->isUnsubscribed()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    sget-object p0, Lrx/b;->b:LZ4/b;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, LZ4/b;->c(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    :try_start_1
    sget-object v0, Lrx/b;->b:LZ4/b;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, LZ4/b;->c(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p0, v0}, Lrx/c;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-static {}, Lb5/e;->c()Lrx/i;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :catchall_1
    move-exception p0

    .line 71
    invoke-static {p0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    new-instance v0, LS4/e;

    .line 75
    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v2, "Error occurred attempting to subscribe ["

    .line 82
    .line 83
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, "] and then again while trying to pass to onError."

    .line 94
    .line 95
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-direct {v0, p1, p0}, LS4/e;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 103
    .line 104
    .line 105
    sget-object p0, Lrx/b;->b:LZ4/b;

    .line 106
    .line 107
    invoke-virtual {p0, v0}, LZ4/b;->c(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 108
    .line 109
    .line 110
    throw v0

    .line 111
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 112
    .line 113
    const-string p1, "onSubscribe function can not be null."

    .line 114
    .line 115
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    throw p0

    .line 119
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 120
    .line 121
    const-string p1, "observer can not be null"

    .line 122
    .line 123
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    throw p0
.end method


# virtual methods
.method public final c(Lrx/b$b;)Lrx/b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/b$b<",
            "+TR;-TT;>;)",
            "Lrx/b<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/b;

    .line 2
    .line 3
    new-instance v1, LU4/c;

    .line 4
    .line 5
    iget-object p0, p0, Lrx/b;->a:Lrx/b$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, LU4/c;-><init>(Lrx/b$a;Lrx/b$b;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1}, Lrx/b;-><init>(Lrx/b$a;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final d(LT4/c;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "LT4/c<",
            "-TT;+TR;>;)",
            "Lrx/b<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LU4/e;

    .line 2
    .line 3
    invoke-direct {v0, p1}, LU4/e;-><init>(LT4/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/b;->c(Lrx/b$b;)Lrx/b;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final e(Lrx/e;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/e;",
            ")",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget v0, LW4/d;->i:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lrx/b;->f(Lrx/e;I)Lrx/b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final f(Lrx/e;I)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/e;",
            "I)",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0, p2}, Lrx/b;->g(Lrx/e;ZI)Lrx/b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final g(Lrx/e;ZI)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/e;",
            "ZI)",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LW4/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LW4/f;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, LW4/f;->p(Lrx/e;)Lrx/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, LU4/f;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, LU4/f;-><init>(Lrx/e;ZI)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lrx/b;->c(Lrx/b$b;)Lrx/b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final h(LT4/c;)Lrx/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LT4/c<",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, LU4/g;->b(LT4/c;)LU4/g;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/b;->c(Lrx/b$b;)Lrx/b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final i(Lrx/h;)Lrx/i;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)",
            "Lrx/i;"
        }
    .end annotation

    .line 1
    invoke-static {p1, p0}, Lrx/b;->j(Lrx/h;Lrx/b;)Lrx/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k(Lrx/e;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/e;",
            ")",
            "Lrx/b<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, LW4/f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LW4/f;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, LW4/f;->p(Lrx/e;)Lrx/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, LU4/h;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, LU4/h;-><init>(Lrx/b;Lrx/e;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lrx/b;->a(Lrx/b$a;)Lrx/b;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public l()Lrx/f;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/f<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/f;

    .line 2
    .line 3
    invoke-static {p0}, LU4/d;->b(Lrx/b;)LU4/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lrx/f;-><init>(Lrx/f$b;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final m(Lrx/h;)Lrx/i;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)",
            "Lrx/i;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Lrx/h;->onStart()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lrx/b;->b:LZ4/b;

    .line 5
    .line 6
    iget-object v1, p0, Lrx/b;->a:Lrx/b$a;

    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, LZ4/b;->e(Lrx/b;Lrx/b$a;)Lrx/b$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0, p1}, LT4/b;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, LZ4/b;->d(Lrx/i;)Lrx/i;

    .line 16
    .line 17
    .line 18
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    invoke-static {p0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :try_start_1
    sget-object v0, Lrx/b;->b:LZ4/b;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, LZ4/b;->c(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {p1, v0}, Lrx/c;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lb5/e;->c()Lrx/i;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :catchall_1
    move-exception p1

    .line 39
    invoke-static {p1}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ljava/lang/RuntimeException;

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    const-string v2, "Error occurred attempting to subscribe ["

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p0, "] and then again while trying to pass to onError."

    .line 62
    .line 63
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-direct {v0, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    sget-object p0, Lrx/b;->b:LZ4/b;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, LZ4/b;->c(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 76
    .line 77
    .line 78
    throw v0
.end method
