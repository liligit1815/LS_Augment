.class final LO4/D;
.super Ljava/lang/Object;
.source "RealCall.java"

# interfaces
.implements LO4/e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO4/D$a;
    }
.end annotation


# instance fields
.field final g:LO4/B;

.field private h:Lokhttp3/internal/connection/Transmitter;

.field final i:LO4/E;

.field final j:Z

.field private k:Z


# direct methods
.method private constructor <init>(LO4/B;LO4/E;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO4/D;->g:LO4/B;

    .line 5
    .line 6
    iput-object p2, p0, LO4/D;->i:LO4/E;

    .line 7
    .line 8
    iput-boolean p3, p0, LO4/D;->j:Z

    .line 9
    .line 10
    return-void
.end method

.method static synthetic a(LO4/D;)Lokhttp3/internal/connection/Transmitter;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    return-object p0
.end method

.method static d(LO4/B;LO4/E;Z)LO4/D;
    .locals 1

    .line 1
    new-instance v0, LO4/D;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, LO4/D;-><init>(LO4/B;LO4/E;Z)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lokhttp3/internal/connection/Transmitter;

    .line 7
    .line 8
    invoke-direct {p1, p0, v0}, Lokhttp3/internal/connection/Transmitter;-><init>(LO4/B;LO4/e;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, v0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public b()LO4/D;
    .locals 2

    .line 1
    iget-object v0, p0, LO4/D;->g:LO4/B;

    .line 2
    .line 3
    iget-object v1, p0, LO4/D;->i:LO4/E;

    .line 4
    .line 5
    iget-boolean p0, p0, LO4/D;->j:Z

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, LO4/D;->d(LO4/B;LO4/E;Z)LO4/D;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method c()LO4/G;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LO4/D;->g:LO4/B;

    .line 7
    .line 8
    invoke-virtual {v0}, LO4/B;->r()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    new-instance v0, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;

    .line 16
    .line 17
    iget-object v2, p0, LO4/D;->g:LO4/B;

    .line 18
    .line 19
    invoke-direct {v0, v2}, Lokhttp3/internal/http/RetryAndFollowUpInterceptor;-><init>(LO4/B;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v0, Lokhttp3/internal/http/BridgeInterceptor;

    .line 26
    .line 27
    iget-object v2, p0, LO4/D;->g:LO4/B;

    .line 28
    .line 29
    invoke-virtual {v2}, LO4/B;->k()LO4/o;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v0, v2}, Lokhttp3/internal/http/BridgeInterceptor;-><init>(LO4/o;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v0, Lokhttp3/internal/cache/CacheInterceptor;

    .line 40
    .line 41
    iget-object v2, p0, LO4/D;->g:LO4/B;

    .line 42
    .line 43
    invoke-virtual {v2}, LO4/B;->s()Lokhttp3/internal/cache/InternalCache;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v0, v2}, Lokhttp3/internal/cache/CacheInterceptor;-><init>(Lokhttp3/internal/cache/InternalCache;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    new-instance v0, Lokhttp3/internal/connection/ConnectInterceptor;

    .line 54
    .line 55
    iget-object v2, p0, LO4/D;->g:LO4/B;

    .line 56
    .line 57
    invoke-direct {v0, v2}, Lokhttp3/internal/connection/ConnectInterceptor;-><init>(LO4/B;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p0, LO4/D;->j:Z

    .line 64
    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    iget-object v0, p0, LO4/D;->g:LO4/B;

    .line 68
    .line 69
    invoke-virtual {v0}, LO4/B;->t()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 74
    .line 75
    .line 76
    :cond_0
    new-instance v0, Lokhttp3/internal/http/CallServerInterceptor;

    .line 77
    .line 78
    iget-boolean v2, p0, LO4/D;->j:Z

    .line 79
    .line 80
    invoke-direct {v0, v2}, Lokhttp3/internal/http/CallServerInterceptor;-><init>(Z)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    new-instance v0, Lokhttp3/internal/http/RealInterceptorChain;

    .line 87
    .line 88
    iget-object v2, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 89
    .line 90
    iget-object v5, p0, LO4/D;->i:LO4/E;

    .line 91
    .line 92
    iget-object v3, p0, LO4/D;->g:LO4/B;

    .line 93
    .line 94
    invoke-virtual {v3}, LO4/B;->f()I

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    iget-object v3, p0, LO4/D;->g:LO4/B;

    .line 99
    .line 100
    invoke-virtual {v3}, LO4/B;->B()I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    iget-object v3, p0, LO4/D;->g:LO4/B;

    .line 105
    .line 106
    invoke-virtual {v3}, LO4/B;->F()I

    .line 107
    .line 108
    .line 109
    move-result v9

    .line 110
    const/4 v3, 0x0

    .line 111
    const/4 v4, 0x0

    .line 112
    move-object v6, p0

    .line 113
    invoke-direct/range {v0 .. v9}, Lokhttp3/internal/http/RealInterceptorChain;-><init>(Ljava/util/List;Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/Exchange;ILO4/E;LO4/e;III)V

    .line 114
    .line 115
    .line 116
    const/4 p0, 0x0

    .line 117
    const/4 v1, 0x0

    .line 118
    :try_start_0
    iget-object v2, v6, LO4/D;->i:LO4/E;

    .line 119
    .line 120
    invoke-interface {v0, v2}, LO4/y$a;->proceed(LO4/E;)LO4/G;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iget-object v2, v6, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 125
    .line 126
    invoke-virtual {v2}, Lokhttp3/internal/connection/Transmitter;->isCanceled()Z

    .line 127
    .line 128
    .line 129
    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    if-nez v2, :cond_1

    .line 131
    .line 132
    iget-object v1, v6, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 133
    .line 134
    invoke-virtual {v1, p0}, Lokhttp3/internal/connection/Transmitter;->noMoreExchanges(Ljava/io/IOException;)Ljava/io/IOException;

    .line 135
    .line 136
    .line 137
    return-object v0

    .line 138
    :cond_1
    :try_start_1
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Ljava/io/IOException;

    .line 142
    .line 143
    const-string v2, "Canceled"

    .line 144
    .line 145
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    throw v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    :catchall_0
    move-exception v0

    .line 150
    goto :goto_0

    .line 151
    :catch_0
    move-exception v0

    .line 152
    const/4 v1, 0x1

    .line 153
    :try_start_2
    iget-object v2, v6, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 154
    .line 155
    invoke-virtual {v2, v0}, Lokhttp3/internal/connection/Transmitter;->noMoreExchanges(Ljava/io/IOException;)Ljava/io/IOException;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    :goto_0
    if-nez v1, :cond_2

    .line 161
    .line 162
    iget-object v1, v6, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 163
    .line 164
    invoke-virtual {v1, p0}, Lokhttp3/internal/connection/Transmitter;->noMoreExchanges(Ljava/io/IOException;)Ljava/io/IOException;

    .line 165
    .line 166
    .line 167
    :cond_2
    throw v0
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokhttp3/internal/connection/Transmitter;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, LO4/D;->b()LO4/D;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e(LO4/f;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, LO4/D;->k:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LO4/D;->k:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    iget-object v0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 11
    .line 12
    invoke-virtual {v0}, Lokhttp3/internal/connection/Transmitter;->callStart()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LO4/D;->g:LO4/B;

    .line 16
    .line 17
    invoke-virtual {v0}, LO4/B;->l()LO4/p;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, LO4/D$a;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, LO4/D$a;-><init>(LO4/D;LO4/f;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, LO4/p;->a(LO4/D$a;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 33
    .line 34
    const-string v0, "Already Executed"

    .line 35
    .line 36
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p1

    .line 40
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p1
.end method

.method public execute()LO4/G;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, LO4/D;->k:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LO4/D;->k:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    iget-object v0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 11
    .line 12
    invoke-virtual {v0}, Lokhttp3/internal/connection/Transmitter;->timeoutEnter()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 16
    .line 17
    invoke-virtual {v0}, Lokhttp3/internal/connection/Transmitter;->callStart()V

    .line 18
    .line 19
    .line 20
    :try_start_1
    iget-object v0, p0, LO4/D;->g:LO4/B;

    .line 21
    .line 22
    invoke-virtual {v0}, LO4/B;->l()LO4/p;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p0}, LO4/p;->b(LO4/D;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, LO4/D;->c()LO4/G;

    .line 30
    .line 31
    .line 32
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    iget-object v1, p0, LO4/D;->g:LO4/B;

    .line 34
    .line 35
    invoke-virtual {v1}, LO4/B;->l()LO4/p;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1, p0}, LO4/p;->f(LO4/D;)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :catchall_0
    move-exception v0

    .line 44
    iget-object v1, p0, LO4/D;->g:LO4/B;

    .line 45
    .line 46
    invoke-virtual {v1}, LO4/B;->l()LO4/p;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, p0}, LO4/p;->f(LO4/D;)V

    .line 51
    .line 52
    .line 53
    throw v0

    .line 54
    :catchall_1
    move-exception v0

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    :try_start_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 57
    .line 58
    const-string v1, "Already Executed"

    .line 59
    .line 60
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw v0

    .line 64
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 65
    throw v0
.end method

.method f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D;->i:LO4/E;

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/E;->i()LO4/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, LO4/x;->C()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method h()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LO4/D;->isCanceled()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const-string v1, "canceled "

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, ""

    .line 16
    .line 17
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p0, LO4/D;->j:Z

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, "web socket"

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    const-string v1, "call"

    .line 28
    .line 29
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, " to "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, LO4/D;->f()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public isCanceled()Z
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D;->h:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokhttp3/internal/connection/Transmitter;->isCanceled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public request()LO4/E;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/D;->i:LO4/E;

    .line 2
    .line 3
    return-object p0
.end method
