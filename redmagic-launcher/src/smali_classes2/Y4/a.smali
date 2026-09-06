.class public LY4/a;
.super Lrx/h;
.source "SafeSubscriber.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/h<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:Lrx/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/h<",
            "-TT;>;"
        }
    .end annotation
.end field

.field h:Z


# direct methods
.method public constructor <init>(Lrx/h;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lrx/h;-><init>(Lrx/h;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, LY4/a;->h:Z

    .line 6
    .line 7
    iput-object p1, p0, LY4/a;->g:Lrx/h;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-static {p1}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, LY4/a;->g:Lrx/h;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Lrx/c;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    :try_start_1
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, LS4/e;

    .line 18
    .line 19
    invoke-direct {p1, p0}, LS4/e;-><init>(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    throw p1

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    instance-of v1, v0, LS4/f;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    :try_start_2
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 29
    .line 30
    .line 31
    check-cast v0, LS4/f;

    .line 32
    .line 33
    throw v0

    .line 34
    :catchall_1
    move-exception p0

    .line 35
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ljava/lang/RuntimeException;

    .line 39
    .line 40
    new-instance v1, LS4/a;

    .line 41
    .line 42
    filled-new-array {p1, p0}, [Ljava/lang/Throwable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v1, p0}, LS4/a;-><init>(Ljava/util/Collection;)V

    .line 51
    .line 52
    .line 53
    const-string p0, "Observer.onError not implemented and error while unsubscribing."

    .line 54
    .line 55
    invoke-direct {v0, p0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    throw v0

    .line 59
    :cond_0
    invoke-static {v0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :try_start_3
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 63
    .line 64
    .line 65
    new-instance p0, LS4/e;

    .line 66
    .line 67
    new-instance v1, LS4/a;

    .line 68
    .line 69
    filled-new-array {p1, v0}, [Ljava/lang/Throwable;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {v1, p1}, LS4/a;-><init>(Ljava/util/Collection;)V

    .line 78
    .line 79
    .line 80
    const-string p1, "Error occurred when trying to propagate error to Observer.onError"

    .line 81
    .line 82
    invoke-direct {p0, p1, v1}, LS4/e;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    throw p0

    .line 86
    :catchall_2
    move-exception p0

    .line 87
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    new-instance v1, LS4/e;

    .line 91
    .line 92
    new-instance v2, LS4/a;

    .line 93
    .line 94
    filled-new-array {p1, v0, p0}, [Ljava/lang/Throwable;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-direct {v2, p0}, LS4/a;-><init>(Ljava/util/Collection;)V

    .line 103
    .line 104
    .line 105
    const-string p0, "Error occurred when trying to propagate error to Observer.onError and during unsubscription."

    .line 106
    .line 107
    invoke-direct {v1, p0, v2}, LS4/e;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    throw v1
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-boolean v0, p0, LY4/a;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, LY4/a;->h:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, LY4/a;->g:Lrx/h;

    .line 9
    .line 10
    invoke-interface {v0}, Lrx/c;->onCompleted()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    :try_start_1
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, LS4/h;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1, p0}, LS4/h;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    :try_start_2
    invoke-static {v0}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, LS4/d;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-direct {v1, v2, v0}, LS4/d;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 48
    :catchall_2
    move-exception v0

    .line 49
    :try_start_3
    invoke-virtual {p0}, Lrx/h;->unsubscribe()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 50
    .line 51
    .line 52
    throw v0

    .line 53
    :catchall_3
    move-exception p0

    .line 54
    invoke-static {p0}, LW4/c;->a(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, LS4/h;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-direct {v0, v1, p0}, LS4/h;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    throw v0

    .line 67
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, LS4/b;->d(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, LY4/a;->h:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, LY4/a;->h:Z

    .line 10
    .line 11
    invoke-virtual {p0, p1}, LY4/a;->a(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-boolean v0, p0, LY4/a;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LY4/a;->g:Lrx/h;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Lrx/c;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    invoke-static {p1, p0}, LS4/b;->e(Ljava/lang/Throwable;Lrx/c;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
