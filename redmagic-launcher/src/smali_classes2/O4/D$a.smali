.class final LO4/D$a;
.super Lokhttp3/internal/NamedRunnable;
.source "RealCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field private final g:LO4/f;

.field private volatile h:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic i:LO4/D;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(LO4/D;LO4/f;)V
    .locals 1

    .line 1
    iput-object p1, p0, LO4/D$a;->i:LO4/D;

    .line 2
    .line 3
    invoke-virtual {p1}, LO4/D;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "OkHttp %s"

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, LO4/D$a;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    iput-object p2, p0, LO4/D$a;->g:LO4/f;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method a()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D$a;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method b(Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-interface {p1, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p1

    .line 6
    goto :goto_0

    .line 7
    :catch_0
    move-exception p1

    .line 8
    :try_start_1
    new-instance v0, Ljava/io/InterruptedIOException;

    .line 9
    .line 10
    const-string v1, "executor rejected"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, LO4/D$a;->i:LO4/D;

    .line 19
    .line 20
    invoke-static {p1}, LO4/D;->a(LO4/D;)Lokhttp3/internal/connection/Transmitter;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v0}, Lokhttp3/internal/connection/Transmitter;->noMoreExchanges(Ljava/io/IOException;)Ljava/io/IOException;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, LO4/D$a;->g:LO4/f;

    .line 28
    .line 29
    iget-object v1, p0, LO4/D$a;->i:LO4/D;

    .line 30
    .line 31
    invoke-interface {p1, v1, v0}, LO4/f;->onFailure(LO4/e;Ljava/io/IOException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, LO4/D$a;->i:LO4/D;

    .line 35
    .line 36
    iget-object p1, p1, LO4/D;->g:LO4/B;

    .line 37
    .line 38
    invoke-virtual {p1}, LO4/B;->l()LO4/p;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, LO4/p;->e(LO4/D$a;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :goto_0
    iget-object v0, p0, LO4/D$a;->i:LO4/D;

    .line 47
    .line 48
    iget-object v0, v0, LO4/D;->g:LO4/B;

    .line 49
    .line 50
    invoke-virtual {v0}, LO4/B;->l()LO4/p;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, LO4/p;->e(LO4/D$a;)V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method c()LO4/D;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D$a;->i:LO4/D;

    .line 2
    .line 3
    return-object p0
.end method

.method d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D$a;->i:LO4/D;

    .line 2
    .line 3
    iget-object p0, p0, LO4/D;->i:LO4/E;

    .line 4
    .line 5
    invoke-virtual {p0}, LO4/E;->i()LO4/x;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, LO4/x;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method e(LO4/D$a;)V
    .locals 0

    .line 1
    iget-object p1, p1, LO4/D$a;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    iput-object p1, p0, LO4/D$a;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    return-void
.end method

.method protected execute()V
    .locals 5

    .line 1
    iget-object v0, p0, LO4/D$a;->i:LO4/D;

    .line 2
    .line 3
    invoke-static {v0}, LO4/D;->a(LO4/D;)Lokhttp3/internal/connection/Transmitter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lokhttp3/internal/connection/Transmitter;->timeoutEnter()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :try_start_0
    iget-object v1, p0, LO4/D$a;->i:LO4/D;

    .line 12
    .line 13
    invoke-virtual {v1}, LO4/D;->c()LO4/G;

    .line 14
    .line 15
    .line 16
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    const/4 v1, 0x1

    .line 18
    :try_start_1
    iget-object v2, p0, LO4/D$a;->g:LO4/f;

    .line 19
    .line 20
    iget-object v3, p0, LO4/D$a;->i:LO4/D;

    .line 21
    .line 22
    invoke-interface {v2, v3, v0}, LO4/f;->onResponse(LO4/e;LO4/G;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, LO4/D$a;->i:LO4/D;

    .line 26
    .line 27
    iget-object v0, v0, LO4/D;->g:LO4/B;

    .line 28
    .line 29
    invoke-virtual {v0}, LO4/B;->l()LO4/p;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p0}, LO4/p;->e(LO4/D$a;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception v0

    .line 40
    goto :goto_2

    .line 41
    :catchall_1
    move-exception v1

    .line 42
    move-object v4, v1

    .line 43
    move v1, v0

    .line 44
    move-object v0, v4

    .line 45
    goto :goto_0

    .line 46
    :catch_1
    move-exception v1

    .line 47
    move-object v4, v1

    .line 48
    move v1, v0

    .line 49
    move-object v0, v4

    .line 50
    goto :goto_2

    .line 51
    :goto_0
    :try_start_2
    iget-object v2, p0, LO4/D$a;->i:LO4/D;

    .line 52
    .line 53
    invoke-virtual {v2}, LO4/D;->cancel()V

    .line 54
    .line 55
    .line 56
    if-nez v1, :cond_0

    .line 57
    .line 58
    new-instance v1, Ljava/io/IOException;

    .line 59
    .line 60
    new-instance v2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "canceled due to "

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ljava/io/IOException;->addSuppressed(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, LO4/D$a;->g:LO4/f;

    .line 84
    .line 85
    iget-object v3, p0, LO4/D$a;->i:LO4/D;

    .line 86
    .line 87
    invoke-interface {v2, v3, v1}, LO4/f;->onFailure(LO4/e;Ljava/io/IOException;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catchall_2
    move-exception v0

    .line 92
    goto :goto_4

    .line 93
    :cond_0
    :goto_1
    throw v0

    .line 94
    :goto_2
    if-eqz v1, :cond_1

    .line 95
    .line 96
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .line 104
    .line 105
    const-string v3, "Callback failure for "

    .line 106
    .line 107
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-object v3, p0, LO4/D$a;->i:LO4/D;

    .line 111
    .line 112
    invoke-virtual {v3}, LO4/D;->h()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    const/4 v3, 0x4

    .line 124
    invoke-virtual {v1, v3, v2, v0}, Lokhttp3/internal/platform/Platform;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 125
    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_1
    iget-object v1, p0, LO4/D$a;->g:LO4/f;

    .line 129
    .line 130
    iget-object v2, p0, LO4/D$a;->i:LO4/D;

    .line 131
    .line 132
    invoke-interface {v1, v2, v0}, LO4/f;->onFailure(LO4/e;Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 133
    .line 134
    .line 135
    :goto_3
    iget-object v0, p0, LO4/D$a;->i:LO4/D;

    .line 136
    .line 137
    iget-object v0, v0, LO4/D;->g:LO4/B;

    .line 138
    .line 139
    invoke-virtual {v0}, LO4/B;->l()LO4/p;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0, p0}, LO4/p;->e(LO4/D$a;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :goto_4
    iget-object v1, p0, LO4/D$a;->i:LO4/D;

    .line 148
    .line 149
    iget-object v1, v1, LO4/D;->g:LO4/B;

    .line 150
    .line 151
    invoke-virtual {v1}, LO4/B;->l()LO4/p;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1, p0}, LO4/p;->e(LO4/D$a;)V

    .line 156
    .line 157
    .line 158
    throw v0
.end method
