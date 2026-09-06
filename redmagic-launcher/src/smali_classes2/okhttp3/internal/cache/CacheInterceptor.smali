.class public final Lokhttp3/internal/cache/CacheInterceptor;
.super Ljava/lang/Object;
.source "CacheInterceptor.java"

# interfaces
.implements LO4/y;


# instance fields
.field final cache:Lokhttp3/internal/cache/InternalCache;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lokhttp3/internal/cache/InternalCache;)V
    .locals 0
    .param p1    # Lokhttp3/internal/cache/InternalCache;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 5
    .line 6
    return-void
.end method

.method private cacheWritingResponse(Lokhttp3/internal/cache/CacheRequest;LO4/G;)LO4/G;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-interface {p1}, Lokhttp3/internal/cache/CacheRequest;->body()Lokio/z;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :goto_0
    return-object p2

    .line 11
    :cond_1
    invoke-virtual {p2}, LO4/G;->b()LO4/H;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, LO4/H;->source()Lokio/g;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0}, Lokio/o;->c(Lokio/z;)Lokio/f;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v2, Lokhttp3/internal/cache/CacheInterceptor$1;

    .line 24
    .line 25
    invoke-direct {v2, p0, v1, p1, v0}, Lokhttp3/internal/cache/CacheInterceptor$1;-><init>(Lokhttp3/internal/cache/CacheInterceptor;Lokio/g;Lokhttp3/internal/cache/CacheRequest;Lokio/f;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "Content-Type"

    .line 29
    .line 30
    invoke-virtual {p2, p0}, LO4/G;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p2}, LO4/G;->b()LO4/H;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, LO4/H;->contentLength()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    invoke-virtual {p2}, LO4/G;->w()LO4/G$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance p2, Lokhttp3/internal/http/RealResponseBody;

    .line 47
    .line 48
    invoke-static {v2}, Lokio/o;->d(Lokio/B;)Lokio/g;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-direct {p2, p0, v0, v1, v2}, Lokhttp3/internal/http/RealResponseBody;-><init>(Ljava/lang/String;JLokio/g;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, LO4/G$a;->b(LO4/H;)LO4/G$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, LO4/G$a;->c()LO4/G;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method private static combine(LO4/w;LO4/w;)LO4/w;
    .locals 7

    .line 1
    new-instance v0, LO4/w$a;

    .line 2
    .line 3
    invoke-direct {v0}, LO4/w$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, LO4/w;->h()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v3, v2

    .line 12
    :goto_0
    if-ge v3, v1, :cond_3

    .line 13
    .line 14
    invoke-virtual {p0, v3}, LO4/w;->e(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {p0, v3}, LO4/w;->i(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    const-string v6, "Warning"

    .line 23
    .line 24
    invoke-virtual {v6, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    if-eqz v6, :cond_0

    .line 29
    .line 30
    const-string v6, "1"

    .line 31
    .line 32
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    if-eqz v6, :cond_0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    invoke-static {v4}, Lokhttp3/internal/cache/CacheInterceptor;->isContentSpecificHeader(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-nez v6, :cond_1

    .line 44
    .line 45
    invoke-static {v4}, Lokhttp3/internal/cache/CacheInterceptor;->isEndToEnd(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_1

    .line 50
    .line 51
    invoke-virtual {p1, v4}, LO4/w;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    if-nez v6, :cond_2

    .line 56
    .line 57
    :cond_1
    sget-object v6, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 58
    .line 59
    invoke-virtual {v6, v0, v4, v5}, Lokhttp3/internal/Internal;->addLenient(LO4/w$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_3
    invoke-virtual {p1}, LO4/w;->h()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    :goto_2
    if-ge v2, p0, :cond_5

    .line 70
    .line 71
    invoke-virtual {p1, v2}, LO4/w;->e(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Lokhttp3/internal/cache/CacheInterceptor;->isContentSpecificHeader(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-nez v3, :cond_4

    .line 80
    .line 81
    invoke-static {v1}, Lokhttp3/internal/cache/CacheInterceptor;->isEndToEnd(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_4

    .line 86
    .line 87
    sget-object v3, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 88
    .line 89
    invoke-virtual {p1, v2}, LO4/w;->i(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v3, v0, v1, v4}, Lokhttp3/internal/Internal;->addLenient(LO4/w$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_4
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_5
    invoke-virtual {v0}, LO4/w$a;->d()LO4/w;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method static isContentSpecificHeader(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "Content-Length"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "Content-Encoding"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "Content-Type"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method static isEndToEnd(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "Connection"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "Keep-Alive"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "Proxy-Authenticate"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "Proxy-Authorization"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const-string v0, "TE"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    const-string v0, "Trailers"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    const-string v0, "Transfer-Encoding"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    const-string v0, "Upgrade"

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_0

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_0
    const/4 p0, 0x0

    .line 68
    return p0
.end method

.method private static stripBody(LO4/G;)LO4/G;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, LO4/G;->b()LO4/H;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, LO4/G;->w()LO4/G$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, LO4/G$a;->b(LO4/H;)LO4/G$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, LO4/G$a;->c()LO4/G;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_0
    return-object p0
.end method


# virtual methods
.method public intercept(LO4/y$a;)LO4/G;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, LO4/y$a;->request()LO4/E;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Lokhttp3/internal/cache/InternalCache;->get(LO4/E;)LO4/G;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    new-instance v3, Lokhttp3/internal/cache/CacheStrategy$Factory;

    .line 20
    .line 21
    invoke-interface {p1}, LO4/y$a;->request()LO4/E;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-direct {v3, v1, v2, v4, v0}, Lokhttp3/internal/cache/CacheStrategy$Factory;-><init>(JLO4/E;LO4/G;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Lokhttp3/internal/cache/CacheStrategy$Factory;->get()Lokhttp3/internal/cache/CacheStrategy;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, v1, Lokhttp3/internal/cache/CacheStrategy;->networkRequest:LO4/E;

    .line 33
    .line 34
    iget-object v3, v1, Lokhttp3/internal/cache/CacheStrategy;->cacheResponse:LO4/G;

    .line 35
    .line 36
    iget-object v4, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 37
    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    invoke-interface {v4, v1}, Lokhttp3/internal/cache/InternalCache;->trackResponse(Lokhttp3/internal/cache/CacheStrategy;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    if-eqz v0, :cond_2

    .line 44
    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, LO4/G;->b()LO4/H;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 52
    .line 53
    .line 54
    :cond_2
    if-nez v2, :cond_3

    .line 55
    .line 56
    if-nez v3, :cond_3

    .line 57
    .line 58
    new-instance p0, LO4/G$a;

    .line 59
    .line 60
    invoke-direct {p0}, LO4/G$a;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-interface {p1}, LO4/y$a;->request()LO4/E;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget-object p1, LO4/C;->i:LO4/C;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, LO4/G$a;->o(LO4/C;)LO4/G$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/16 p1, 0x1f8

    .line 78
    .line 79
    invoke-virtual {p0, p1}, LO4/G$a;->g(I)LO4/G$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "Unsatisfiable Request (only-if-cached)"

    .line 84
    .line 85
    invoke-virtual {p0, p1}, LO4/G$a;->l(Ljava/lang/String;)LO4/G$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object p1, Lokhttp3/internal/Util;->EMPTY_RESPONSE:LO4/H;

    .line 90
    .line 91
    invoke-virtual {p0, p1}, LO4/G$a;->b(LO4/H;)LO4/G$a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-wide/16 v0, -0x1

    .line 96
    .line 97
    invoke-virtual {p0, v0, v1}, LO4/G$a;->r(J)LO4/G$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    invoke-virtual {p0, v0, v1}, LO4/G$a;->p(J)LO4/G$a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, LO4/G$a;->c()LO4/G;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_3
    if-nez v2, :cond_4

    .line 115
    .line 116
    invoke-virtual {v3}, LO4/G;->w()LO4/G$a;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {v3}, Lokhttp3/internal/cache/CacheInterceptor;->stripBody(LO4/G;)LO4/G;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, LO4/G$a;->d(LO4/G;)LO4/G$a;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0}, LO4/G$a;->c()LO4/G;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    return-object p0

    .line 133
    :cond_4
    :try_start_0
    invoke-interface {p1, v2}, LO4/y$a;->proceed(LO4/E;)LO4/G;

    .line 134
    .line 135
    .line 136
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    if-nez p1, :cond_5

    .line 138
    .line 139
    if-eqz v0, :cond_5

    .line 140
    .line 141
    invoke-virtual {v0}, LO4/G;->b()LO4/H;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 146
    .line 147
    .line 148
    :cond_5
    if-eqz v3, :cond_7

    .line 149
    .line 150
    invoke-virtual {p1}, LO4/G;->d()I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    const/16 v1, 0x130

    .line 155
    .line 156
    if-ne v0, v1, :cond_6

    .line 157
    .line 158
    invoke-virtual {v3}, LO4/G;->w()LO4/G$a;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v3}, LO4/G;->n()LO4/w;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {p1}, LO4/G;->n()LO4/w;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-static {v1, v2}, Lokhttp3/internal/cache/CacheInterceptor;->combine(LO4/w;LO4/w;)LO4/w;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v0, v1}, LO4/G$a;->j(LO4/w;)LO4/G$a;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p1}, LO4/G;->E()J

    .line 179
    .line 180
    .line 181
    move-result-wide v1

    .line 182
    invoke-virtual {v0, v1, v2}, LO4/G$a;->r(J)LO4/G$a;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1}, LO4/G;->C()J

    .line 187
    .line 188
    .line 189
    move-result-wide v1

    .line 190
    invoke-virtual {v0, v1, v2}, LO4/G$a;->p(J)LO4/G$a;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {v3}, Lokhttp3/internal/cache/CacheInterceptor;->stripBody(LO4/G;)LO4/G;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v0, v1}, LO4/G$a;->d(LO4/G;)LO4/G$a;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {p1}, Lokhttp3/internal/cache/CacheInterceptor;->stripBody(LO4/G;)LO4/G;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v0, v1}, LO4/G$a;->m(LO4/G;)LO4/G$a;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0}, LO4/G$a;->c()LO4/G;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    invoke-virtual {p1}, LO4/G;->b()LO4/H;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-virtual {p1}, LO4/H;->close()V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 222
    .line 223
    invoke-interface {p1}, Lokhttp3/internal/cache/InternalCache;->trackConditionalCacheHit()V

    .line 224
    .line 225
    .line 226
    iget-object p0, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 227
    .line 228
    invoke-interface {p0, v3, v0}, Lokhttp3/internal/cache/InternalCache;->update(LO4/G;LO4/G;)V

    .line 229
    .line 230
    .line 231
    return-object v0

    .line 232
    :cond_6
    invoke-virtual {v3}, LO4/G;->b()LO4/H;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 237
    .line 238
    .line 239
    :cond_7
    invoke-virtual {p1}, LO4/G;->w()LO4/G$a;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-static {v3}, Lokhttp3/internal/cache/CacheInterceptor;->stripBody(LO4/G;)LO4/G;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v0, v1}, LO4/G$a;->d(LO4/G;)LO4/G$a;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-static {p1}, Lokhttp3/internal/cache/CacheInterceptor;->stripBody(LO4/G;)LO4/G;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-virtual {v0, p1}, LO4/G$a;->m(LO4/G;)LO4/G$a;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {p1}, LO4/G$a;->c()LO4/G;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    iget-object v0, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 264
    .line 265
    if-eqz v0, :cond_9

    .line 266
    .line 267
    invoke-static {p1}, Lokhttp3/internal/http/HttpHeaders;->hasBody(LO4/G;)Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-eqz v0, :cond_8

    .line 272
    .line 273
    invoke-static {p1, v2}, Lokhttp3/internal/cache/CacheStrategy;->isCacheable(LO4/G;LO4/E;)Z

    .line 274
    .line 275
    .line 276
    move-result v0

    .line 277
    if-eqz v0, :cond_8

    .line 278
    .line 279
    iget-object v0, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 280
    .line 281
    invoke-interface {v0, p1}, Lokhttp3/internal/cache/InternalCache;->put(LO4/G;)Lokhttp3/internal/cache/CacheRequest;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-direct {p0, v0, p1}, Lokhttp3/internal/cache/CacheInterceptor;->cacheWritingResponse(Lokhttp3/internal/cache/CacheRequest;LO4/G;)LO4/G;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    return-object p0

    .line 290
    :cond_8
    invoke-virtual {v2}, LO4/E;->g()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-static {v0}, Lokhttp3/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_9

    .line 299
    .line 300
    :try_start_1
    iget-object p0, p0, Lokhttp3/internal/cache/CacheInterceptor;->cache:Lokhttp3/internal/cache/InternalCache;

    .line 301
    .line 302
    invoke-interface {p0, v2}, Lokhttp3/internal/cache/InternalCache;->remove(LO4/E;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 303
    .line 304
    .line 305
    :catch_0
    :cond_9
    return-object p1

    .line 306
    :catchall_0
    move-exception p0

    .line 307
    if-eqz v0, :cond_a

    .line 308
    .line 309
    invoke-virtual {v0}, LO4/G;->b()LO4/H;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    invoke-static {p1}, Lokhttp3/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 314
    .line 315
    .line 316
    :cond_a
    throw p0
.end method
