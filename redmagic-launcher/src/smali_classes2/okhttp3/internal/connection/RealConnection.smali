.class public final Lokhttp3/internal/connection/RealConnection;
.super Lokhttp3/internal/http2/Http2Connection$Listener;
.source "RealConnection.java"

# interfaces
.implements LO4/k;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final MAX_TUNNEL_ATTEMPTS:I = 0x15

.field private static final NPE_THROW_WITH_NULL:Ljava/lang/String; = "throw with null exception"


# instance fields
.field private allocationLimit:I

.field public final connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

.field private handshake:LO4/v;

.field private http2Connection:Lokhttp3/internal/http2/Http2Connection;

.field idleAtNanos:J

.field noNewExchanges:Z

.field private protocol:LO4/C;

.field private rawSocket:Ljava/net/Socket;

.field private refusedStreamCount:I

.field private final route:LO4/I;

.field routeFailureCount:I

.field private sink:Lokio/f;

.field private socket:Ljava/net/Socket;

.field private source:Lokio/g;

.field successCount:I

.field final transmitters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/Reference<",
            "Lokhttp3/internal/connection/Transmitter;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lokhttp3/internal/connection/RealConnectionPool;LO4/I;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lokhttp3/internal/http2/Http2Connection$Listener;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lokhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lokhttp3/internal/connection/RealConnection;->transmitters:Ljava/util/List;

    .line 13
    .line 14
    const-wide v0, 0x7fffffffffffffffL

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    iput-wide v0, p0, Lokhttp3/internal/connection/RealConnection;->idleAtNanos:J

    .line 20
    .line 21
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 22
    .line 23
    iput-object p2, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 24
    .line 25
    return-void
.end method

.method private connectSocket(IILO4/e;LO4/t;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 2
    .line 3
    invoke-virtual {v0}, LO4/I;->b()Ljava/net/Proxy;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 8
    .line 9
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v3, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 18
    .line 19
    if-eq v2, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v3, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 26
    .line 27
    if-ne v2, v3, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance v1, Ljava/net/Socket;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ljava/net/Socket;-><init>(Ljava/net/Proxy;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    invoke-virtual {v1}, LO4/a;->j()Ljavax/net/SocketFactory;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    :goto_1
    iput-object v1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 45
    .line 46
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 47
    .line 48
    invoke-virtual {v1}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p4, p3, v1, v0}, LO4/t;->g(LO4/e;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 53
    .line 54
    .line 55
    iget-object p3, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 56
    .line 57
    invoke-virtual {p3, p2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 58
    .line 59
    .line 60
    :try_start_0
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object p3, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 65
    .line 66
    iget-object p4, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 67
    .line 68
    invoke-virtual {p4}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 69
    .line 70
    .line 71
    move-result-object p4

    .line 72
    invoke-virtual {p2, p3, p4, p1}, Lokhttp3/internal/platform/Platform;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1

    .line 73
    .line 74
    .line 75
    :try_start_1
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 76
    .line 77
    invoke-static {p1}, Lokio/o;->m(Ljava/net/Socket;)Lokio/B;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Lokio/o;->d(Lokio/B;)Lokio/g;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 86
    .line 87
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 88
    .line 89
    invoke-static {p1}, Lokio/o;->i(Ljava/net/Socket;)Lokio/z;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lokio/o;->c(Lokio/z;)Lokio/f;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    .line 98
    .line 99
    return-void

    .line 100
    :catch_0
    move-exception p0

    .line 101
    const-string p1, "throw with null exception"

    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_2

    .line 112
    .line 113
    return-void

    .line 114
    :cond_2
    new-instance p1, Ljava/io/IOException;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :catch_1
    move-exception p1

    .line 121
    new-instance p2, Ljava/net/ConnectException;

    .line 122
    .line 123
    new-instance p3, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string p4, "Failed to connect to "

    .line 129
    .line 130
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 134
    .line 135
    invoke-virtual {p0}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-direct {p2, p0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p2, p1}, Ljava/net/ConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 150
    .line 151
    .line 152
    throw p2
.end method

.method private connectTls(Lokhttp3/internal/connection/ConnectionSpecSelector;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 2
    .line 3
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, LO4/a;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    :try_start_0
    iget-object v3, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 13
    .line 14
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v4}, LO4/x;->m()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {v5}, LO4/x;->z()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    const/4 v6, 0x1

    .line 31
    invoke-virtual {v1, v3, v4, v5, v6}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljavax/net/ssl/SSLSocket;
    :try_end_0
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 36
    .line 37
    :try_start_1
    invoke-virtual {p1, v1}, Lokhttp3/internal/connection/ConnectionSpecSelector;->configureSecureSocket(Ljavax/net/ssl/SSLSocket;)LO4/m;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, LO4/m;->f()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, LO4/x;->m()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v0}, LO4/a;->f()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v3, v1, v4, v5}, Lokhttp3/internal/platform/Platform;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    move-object v2, v1

    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :catch_0
    move-exception p0

    .line 72
    move-object v2, v1

    .line 73
    goto/16 :goto_2

    .line 74
    .line 75
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, LO4/v;->b(Ljavax/net/ssl/SSLSession;)LO4/v;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v0}, LO4/a;->e()Ljavax/net/ssl/HostnameVerifier;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-virtual {v6}, LO4/x;->m()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-interface {v5, v6, v3}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_2

    .line 103
    .line 104
    invoke-virtual {v4}, LO4/v;->d()Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result p1
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    const-string v2, "Hostname "

    .line 113
    .line 114
    if-nez p1, :cond_1

    .line 115
    .line 116
    const/4 p1, 0x0

    .line 117
    :try_start_2
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 122
    .line 123
    new-instance p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 124
    .line 125
    new-instance v3, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, LO4/x;->m()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v0, " not verified:\n    certificate: "

    .line 145
    .line 146
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-static {p0}, LO4/g;->c(Ljava/security/cert/Certificate;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v0, "\n    DN: "

    .line 157
    .line 158
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-interface {v0}, Ljava/security/Principal;->getName()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v0, "\n    subjectAltNames: "

    .line 173
    .line 174
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-static {p0}, Lokhttp3/internal/tls/OkHostnameVerifier;->allSubjectAltNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-direct {p1, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    throw p1

    .line 192
    :cond_1
    new-instance p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    .line 193
    .line 194
    new-instance p1, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-virtual {v0}, LO4/x;->m()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v0, " not verified (no certificates)"

    .line 214
    .line 215
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-direct {p0, p1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    throw p0

    .line 226
    :cond_2
    invoke-virtual {v0}, LO4/a;->a()LO4/g;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, LO4/x;->m()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v4}, LO4/v;->d()Ljava/util/List;

    .line 239
    .line 240
    .line 241
    move-result-object v5

    .line 242
    invoke-virtual {v3, v0, v5}, LO4/g;->a(Ljava/lang/String;Ljava/util/List;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p1}, LO4/m;->f()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_3

    .line 250
    .line 251
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-virtual {p1, v1}, Lokhttp3/internal/platform/Platform;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    :cond_3
    iput-object v1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 260
    .line 261
    invoke-static {v1}, Lokio/o;->m(Ljava/net/Socket;)Lokio/B;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    invoke-static {p1}, Lokio/o;->d(Lokio/B;)Lokio/g;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 270
    .line 271
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 272
    .line 273
    invoke-static {p1}, Lokio/o;->i(Ljava/net/Socket;)Lokio/z;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    invoke-static {p1}, Lokio/o;->c(Lokio/z;)Lokio/f;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 282
    .line 283
    iput-object v4, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 284
    .line 285
    if-eqz v2, :cond_4

    .line 286
    .line 287
    invoke-static {v2}, LO4/C;->a(Ljava/lang/String;)LO4/C;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    goto :goto_1

    .line 292
    :cond_4
    sget-object p1, LO4/C;->i:LO4/C;

    .line 293
    .line 294
    :goto_1
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;
    :try_end_2
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 295
    .line 296
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    invoke-virtual {p0, v1}, Lokhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :catchall_1
    move-exception p0

    .line 305
    goto :goto_3

    .line 306
    :catch_1
    move-exception p0

    .line 307
    :goto_2
    :try_start_3
    invoke-static {p0}, Lokhttp3/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    if-eqz p1, :cond_5

    .line 312
    .line 313
    new-instance p1, Ljava/io/IOException;

    .line 314
    .line 315
    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 316
    .line 317
    .line 318
    throw p1

    .line 319
    :cond_5
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 320
    :goto_3
    if-eqz v2, :cond_6

    .line 321
    .line 322
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    invoke-virtual {p1, v2}, Lokhttp3/internal/platform/Platform;->afterHandshake(Ljavax/net/ssl/SSLSocket;)V

    .line 327
    .line 328
    .line 329
    :cond_6
    invoke-static {v2}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 330
    .line 331
    .line 332
    throw p0
.end method

.method private connectTunnel(IIILO4/e;LO4/t;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-direct {p0}, Lokhttp3/internal/connection/RealConnection;->createTunnelRequest()LO4/E;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LO4/E;->i()LO4/x;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    const/16 v3, 0x15

    .line 11
    .line 12
    if-ge v2, v3, :cond_1

    .line 13
    .line 14
    invoke-direct {p0, p1, p2, p4, p5}, Lokhttp3/internal/connection/RealConnection;->connectSocket(IILO4/e;LO4/t;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p2, p3, v0, v1}, Lokhttp3/internal/connection/RealConnection;->createTunnel(IILO4/E;LO4/x;)LO4/E;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v3, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 25
    .line 26
    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 27
    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    iput-object v3, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 31
    .line 32
    iput-object v3, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 33
    .line 34
    iput-object v3, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 35
    .line 36
    iget-object v4, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 37
    .line 38
    invoke-virtual {v4}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object v5, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 43
    .line 44
    invoke-virtual {v5}, LO4/I;->b()Ljava/net/Proxy;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {p5, p4, v4, v5, v3}, LO4/t;->e(LO4/e;Ljava/net/InetSocketAddress;Ljava/net/Proxy;LO4/C;)V

    .line 49
    .line 50
    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    :goto_1
    return-void
.end method

.method private createTunnel(IILO4/E;LO4/x;)LO4/E;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "CONNECT "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {p4, v1}, Lokhttp3/internal/Util;->hostHeader(LO4/x;Z)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p4

    .line 16
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p4, " HTTP/1.1"

    .line 20
    .line 21
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    :goto_0
    new-instance v0, Lokhttp3/internal/http1/Http1ExchangeCodec;

    .line 29
    .line 30
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 31
    .line 32
    iget-object v2, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-direct {v0, v3, v3, v1, v2}, Lokhttp3/internal/http1/Http1ExchangeCodec;-><init>(LO4/B;Lokhttp3/internal/connection/RealConnection;Lokio/g;Lokio/f;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 39
    .line 40
    invoke-interface {v1}, Lokio/B;->timeout()Lokio/C;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    int-to-long v4, p1

    .line 45
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 46
    .line 47
    invoke-virtual {v1, v4, v5, v2}, Lokio/C;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/C;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 51
    .line 52
    invoke-interface {v1}, Lokio/z;->timeout()Lokio/C;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    int-to-long v4, p2

    .line 57
    invoke-virtual {v1, v4, v5, v2}, Lokio/C;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/C;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, LO4/E;->d()LO4/w;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1, p4}, Lokhttp3/internal/http1/Http1ExchangeCodec;->writeRequest(LO4/w;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Lokhttp3/internal/http1/Http1ExchangeCodec;->finishRequest()V

    .line 68
    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {v0, v1}, Lokhttp3/internal/http1/Http1ExchangeCodec;->readResponseHeaders(Z)LO4/G$a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1, p3}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3}, LO4/G$a;->c()LO4/G;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    invoke-virtual {v0, p3}, Lokhttp3/internal/http1/Http1ExchangeCodec;->skipConnectBody(LO4/G;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p3}, LO4/G;->d()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    const/16 v1, 0xc8

    .line 91
    .line 92
    if-eq v0, v1, :cond_3

    .line 93
    .line 94
    const/16 v1, 0x197

    .line 95
    .line 96
    if-ne v0, v1, :cond_2

    .line 97
    .line 98
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 99
    .line 100
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, LO4/a;->h()LO4/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 109
    .line 110
    invoke-interface {v0, v1, p3}, LO4/c;->b(LO4/I;LO4/G;)LO4/E;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_1

    .line 115
    .line 116
    const-string v1, "Connection"

    .line 117
    .line 118
    invoke-virtual {p3, v1}, LO4/G;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    const-string v1, "close"

    .line 123
    .line 124
    invoke-virtual {v1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result p3

    .line 128
    if-eqz p3, :cond_0

    .line 129
    .line 130
    return-object v0

    .line 131
    :cond_0
    move-object p3, v0

    .line 132
    goto :goto_0

    .line 133
    :cond_1
    new-instance p0, Ljava/io/IOException;

    .line 134
    .line 135
    const-string p1, "Failed to authenticate with proxy"

    .line 136
    .line 137
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p0

    .line 141
    :cond_2
    new-instance p0, Ljava/io/IOException;

    .line 142
    .line 143
    new-instance p1, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    const-string p2, "Unexpected response code for CONNECT: "

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p3}, LO4/G;->d()I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    throw p0

    .line 168
    :cond_3
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 169
    .line 170
    invoke-interface {p1}, Lokio/g;->i()Lokio/e;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Lokio/e;->O()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_4

    .line 179
    .line 180
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 181
    .line 182
    invoke-interface {p0}, Lokio/f;->a()Lokio/e;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-virtual {p0}, Lokio/e;->O()Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-eqz p0, :cond_4

    .line 191
    .line 192
    return-object v3

    .line 193
    :cond_4
    new-instance p0, Ljava/io/IOException;

    .line 194
    .line 195
    const-string p1, "TLS tunnel buffered too many bytes!"

    .line 196
    .line 197
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    throw p0
.end method

.method private createTunnelRequest()LO4/E;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    new-instance v0, LO4/E$a;

    .line 2
    .line 3
    invoke-direct {v0}, LO4/E$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 7
    .line 8
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, LO4/E$a;->g(LO4/x;)LO4/E$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "CONNECT"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, LO4/E$a;->e(Ljava/lang/String;LO4/F;)LO4/E$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 28
    .line 29
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-static {v1, v2}, Lokhttp3/internal/Util;->hostHeader(LO4/x;Z)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "Host"

    .line 43
    .line 44
    invoke-virtual {v0, v2, v1}, LO4/E$a;->c(Ljava/lang/String;Ljava/lang/String;)LO4/E$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "Proxy-Connection"

    .line 49
    .line 50
    const-string v2, "Keep-Alive"

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, LO4/E$a;->c(Ljava/lang/String;Ljava/lang/String;)LO4/E$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "User-Agent"

    .line 57
    .line 58
    invoke-static {}, Lokhttp3/internal/Version;->userAgent()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v1, v2}, LO4/E$a;->c(Ljava/lang/String;Ljava/lang/String;)LO4/E$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, LO4/E$a;->b()LO4/E;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, LO4/G$a;

    .line 71
    .line 72
    invoke-direct {v1}, LO4/G$a;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v0}, LO4/G$a;->q(LO4/E;)LO4/G$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget-object v2, LO4/C;->i:LO4/C;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, LO4/G$a;->o(LO4/C;)LO4/G$a;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    const/16 v2, 0x197

    .line 86
    .line 87
    invoke-virtual {v1, v2}, LO4/G$a;->g(I)LO4/G$a;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "Preemptive Authenticate"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, LO4/G$a;->l(Ljava/lang/String;)LO4/G$a;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget-object v2, Lokhttp3/internal/Util;->EMPTY_RESPONSE:LO4/H;

    .line 98
    .line 99
    invoke-virtual {v1, v2}, LO4/G$a;->b(LO4/H;)LO4/G$a;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    const-wide/16 v2, -0x1

    .line 104
    .line 105
    invoke-virtual {v1, v2, v3}, LO4/G$a;->r(J)LO4/G$a;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1, v2, v3}, LO4/G$a;->p(J)LO4/G$a;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "Proxy-Authenticate"

    .line 114
    .line 115
    const-string v3, "OkHttp-Preemptive"

    .line 116
    .line 117
    invoke-virtual {v1, v2, v3}, LO4/G$a;->i(Ljava/lang/String;Ljava/lang/String;)LO4/G$a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, LO4/G$a;->c()LO4/G;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v2, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 126
    .line 127
    invoke-virtual {v2}, LO4/I;->a()LO4/a;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v2}, LO4/a;->h()LO4/c;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 136
    .line 137
    invoke-interface {v2, p0, v1}, LO4/c;->b(LO4/I;LO4/G;)LO4/E;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    if-eqz p0, :cond_0

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_0
    return-object v0
.end method

.method private establishProtocol(Lokhttp3/internal/connection/ConnectionSpecSelector;ILO4/e;LO4/t;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 2
    .line 3
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, LO4/a;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 14
    .line 15
    invoke-virtual {p1}, LO4/I;->a()LO4/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, LO4/a;->f()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object p3, LO4/C;->l:LO4/C;

    .line 24
    .line 25
    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 32
    .line 33
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 34
    .line 35
    iput-object p3, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 36
    .line 37
    invoke-direct {p0, p2}, Lokhttp3/internal/connection/RealConnection;->startHttp2(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 42
    .line 43
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 44
    .line 45
    sget-object p1, LO4/C;->i:LO4/C;

    .line 46
    .line 47
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p4, p3}, LO4/t;->x(LO4/e;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RealConnection;->connectTls(Lokhttp3/internal/connection/ConnectionSpecSelector;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 57
    .line 58
    invoke-virtual {p4, p3, p1}, LO4/t;->w(LO4/e;LO4/v;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 62
    .line 63
    sget-object p3, LO4/C;->k:LO4/C;

    .line 64
    .line 65
    if-ne p1, p3, :cond_2

    .line 66
    .line 67
    invoke-direct {p0, p2}, Lokhttp3/internal/connection/RealConnection;->startHttp2(I)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method private routeMatchesAny(Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LO4/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    check-cast v3, LO4/I;

    .line 14
    .line 15
    invoke-virtual {v3}, LO4/I;->b()Ljava/net/Proxy;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    sget-object v5, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    .line 24
    .line 25
    if-ne v4, v5, :cond_0

    .line 26
    .line 27
    iget-object v4, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 28
    .line 29
    invoke-virtual {v4}, LO4/I;->b()Ljava/net/Proxy;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    if-ne v4, v5, :cond_0

    .line 38
    .line 39
    iget-object v4, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 40
    .line 41
    invoke-virtual {v4}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v3}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v4, v3}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    return v1
.end method

.method private startHttp2(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lokhttp3/internal/http2/Http2Connection$Builder;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-direct {v0, v1}, Lokhttp3/internal/http2/Http2Connection$Builder;-><init>(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 14
    .line 15
    iget-object v2, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 16
    .line 17
    invoke-virtual {v2}, LO4/I;->a()LO4/a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, LO4/a;->l()LO4/x;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, LO4/x;->m()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 30
    .line 31
    iget-object v4, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2, v3, v4}, Lokhttp3/internal/http2/Http2Connection$Builder;->socket(Ljava/net/Socket;Ljava/lang/String;Lokio/g;Lokio/f;)Lokhttp3/internal/http2/Http2Connection$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p0}, Lokhttp3/internal/http2/Http2Connection$Builder;->listener(Lokhttp3/internal/http2/Http2Connection$Listener;)Lokhttp3/internal/http2/Http2Connection$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Lokhttp3/internal/http2/Http2Connection$Builder;->pingIntervalMillis(I)Lokhttp3/internal/http2/Http2Connection$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lokhttp3/internal/http2/Http2Connection$Builder;->build()Lokhttp3/internal/http2/Http2Connection;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 50
    .line 51
    invoke-virtual {p1}, Lokhttp3/internal/http2/Http2Connection;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method static testConnection(Lokhttp3/internal/connection/RealConnectionPool;LO4/I;Ljava/net/Socket;J)Lokhttp3/internal/connection/RealConnection;
    .locals 1

    .line 1
    new-instance v0, Lokhttp3/internal/connection/RealConnection;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lokhttp3/internal/connection/RealConnection;-><init>(Lokhttp3/internal/connection/RealConnectionPool;LO4/I;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, v0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 7
    .line 8
    iput-wide p3, v0, Lokhttp3/internal/connection/RealConnection;->idleAtNanos:J

    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-static {p0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public connect(IIIIZLO4/e;LO4/t;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 6
    .line 7
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, LO4/a;->b()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v7, Lokhttp3/internal/connection/ConnectionSpecSelector;

    .line 16
    .line 17
    invoke-direct {v7, v0}, Lokhttp3/internal/connection/ConnectionSpecSelector;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 21
    .line 22
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, LO4/a;->k()Ljavax/net/ssl/SSLSocketFactory;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    sget-object v1, LO4/m;->j:LO4/m;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 41
    .line 42
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, LO4/x;->m()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, v0}, Lokhttp3/internal/platform/Platform;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 66
    .line 67
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 68
    .line 69
    new-instance p2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string p3, "CLEARTEXT communication to "

    .line 75
    .line 76
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p3, " not permitted by network security policy"

    .line 83
    .line 84
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 95
    .line 96
    .line 97
    throw p0

    .line 98
    :cond_1
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 99
    .line 100
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 101
    .line 102
    const-string p2, "CLEARTEXT communication not enabled for client"

    .line 103
    .line 104
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 108
    .line 109
    .line 110
    throw p0

    .line 111
    :cond_2
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 112
    .line 113
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, LO4/a;->f()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sget-object v1, LO4/C;->l:LO4/C;

    .line 122
    .line 123
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_a

    .line 128
    .line 129
    :goto_0
    const/4 v8, 0x0

    .line 130
    move-object v9, v8

    .line 131
    :goto_1
    :try_start_0
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 132
    .line 133
    invoke-virtual {v0}, LO4/I;->c()Z

    .line 134
    .line 135
    .line 136
    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    move-object v1, p0

    .line 140
    move v2, p1

    .line 141
    move v3, p2

    .line 142
    move v4, p3

    .line 143
    move-object/from16 v5, p6

    .line 144
    .line 145
    move-object/from16 v6, p7

    .line 146
    .line 147
    :try_start_1
    invoke-direct/range {v1 .. v6}, Lokhttp3/internal/connection/RealConnection;->connectTunnel(IIILO4/e;LO4/t;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 148
    .line 149
    .line 150
    move v10, v3

    .line 151
    move-object v2, v5

    .line 152
    move-object v1, v6

    .line 153
    :try_start_2
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 154
    .line 155
    if-nez v0, :cond_3

    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_3
    :goto_2
    move/from16 v11, p4

    .line 159
    .line 160
    goto :goto_5

    .line 161
    :catch_0
    move-exception v0

    .line 162
    :goto_3
    move/from16 v11, p4

    .line 163
    .line 164
    :goto_4
    move-object v6, v0

    .line 165
    goto/16 :goto_9

    .line 166
    .line 167
    :catch_1
    move-exception v0

    .line 168
    move v10, v3

    .line 169
    move-object v2, v5

    .line 170
    move-object v1, v6

    .line 171
    goto :goto_3

    .line 172
    :cond_4
    move v10, p2

    .line 173
    move-object/from16 v2, p6

    .line 174
    .line 175
    move-object/from16 v1, p7

    .line 176
    .line 177
    invoke-direct {p0, p1, p2, v2, v1}, Lokhttp3/internal/connection/RealConnection;->connectSocket(IILO4/e;LO4/t;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 178
    .line 179
    .line 180
    goto :goto_2

    .line 181
    :goto_5
    :try_start_3
    invoke-direct {p0, v7, v11, v2, v1}, Lokhttp3/internal/connection/RealConnection;->establishProtocol(Lokhttp3/internal/connection/ConnectionSpecSelector;ILO4/e;LO4/t;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 185
    .line 186
    invoke-virtual {v0}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object v3, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 191
    .line 192
    invoke-virtual {v3}, LO4/I;->b()Ljava/net/Proxy;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    iget-object v4, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 197
    .line 198
    invoke-virtual {v1, v2, v0, v3, v4}, LO4/t;->e(LO4/e;Ljava/net/InetSocketAddress;Ljava/net/Proxy;LO4/C;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 199
    .line 200
    .line 201
    :goto_6
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 202
    .line 203
    invoke-virtual {p1}, LO4/I;->c()Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_6

    .line 208
    .line 209
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 210
    .line 211
    if-eqz p1, :cond_5

    .line 212
    .line 213
    goto :goto_7

    .line 214
    :cond_5
    new-instance p0, Ljava/net/ProtocolException;

    .line 215
    .line 216
    const-string p1, "Too many tunnel connections attempted: 21"

    .line 217
    .line 218
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    new-instance p1, Lokhttp3/internal/connection/RouteException;

    .line 222
    .line 223
    invoke-direct {p1, p0}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 224
    .line 225
    .line 226
    throw p1

    .line 227
    :cond_6
    :goto_7
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 228
    .line 229
    if-eqz p1, :cond_7

    .line 230
    .line 231
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 232
    .line 233
    monitor-enter p1

    .line 234
    :try_start_4
    iget-object p2, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 235
    .line 236
    invoke-virtual {p2}, Lokhttp3/internal/http2/Http2Connection;->maxConcurrentStreams()I

    .line 237
    .line 238
    .line 239
    move-result p2

    .line 240
    iput p2, p0, Lokhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 241
    .line 242
    monitor-exit p1

    .line 243
    goto :goto_8

    .line 244
    :catchall_0
    move-exception v0

    .line 245
    move-object p0, v0

    .line 246
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 247
    throw p0

    .line 248
    :cond_7
    :goto_8
    return-void

    .line 249
    :catch_2
    move-exception v0

    .line 250
    goto :goto_4

    .line 251
    :catch_3
    move-exception v0

    .line 252
    move v10, p2

    .line 253
    move/from16 v11, p4

    .line 254
    .line 255
    move-object/from16 v2, p6

    .line 256
    .line 257
    move-object/from16 v1, p7

    .line 258
    .line 259
    goto :goto_4

    .line 260
    :goto_9
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 261
    .line 262
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 266
    .line 267
    invoke-static {v0}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 268
    .line 269
    .line 270
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 271
    .line 272
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->rawSocket:Ljava/net/Socket;

    .line 273
    .line 274
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 275
    .line 276
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 277
    .line 278
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 279
    .line 280
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 281
    .line 282
    iput-object v8, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 283
    .line 284
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 285
    .line 286
    invoke-virtual {v0}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 291
    .line 292
    invoke-virtual {v0}, LO4/I;->b()Ljava/net/Proxy;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    const/4 v5, 0x0

    .line 297
    invoke-virtual/range {v1 .. v6}, LO4/t;->f(LO4/e;Ljava/net/InetSocketAddress;Ljava/net/Proxy;LO4/C;Ljava/io/IOException;)V

    .line 298
    .line 299
    .line 300
    if-nez v9, :cond_8

    .line 301
    .line 302
    new-instance v9, Lokhttp3/internal/connection/RouteException;

    .line 303
    .line 304
    invoke-direct {v9, v6}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 305
    .line 306
    .line 307
    goto :goto_a

    .line 308
    :cond_8
    invoke-virtual {v9, v6}, Lokhttp3/internal/connection/RouteException;->addConnectException(Ljava/io/IOException;)V

    .line 309
    .line 310
    .line 311
    :goto_a
    if-eqz p5, :cond_9

    .line 312
    .line 313
    invoke-virtual {v7, v6}, Lokhttp3/internal/connection/ConnectionSpecSelector;->connectionFailed(Ljava/io/IOException;)Z

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    if-eqz v0, :cond_9

    .line 318
    .line 319
    goto/16 :goto_1

    .line 320
    .line 321
    :cond_9
    throw v9

    .line 322
    :cond_a
    new-instance p0, Lokhttp3/internal/connection/RouteException;

    .line 323
    .line 324
    new-instance p1, Ljava/net/UnknownServiceException;

    .line 325
    .line 326
    const-string p2, "H2_PRIOR_KNOWLEDGE cannot be used with HTTPS"

    .line 327
    .line 328
    invoke-direct {p1, p2}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    invoke-direct {p0, p1}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 332
    .line 333
    .line 334
    throw p0

    .line 335
    :cond_b
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 336
    .line 337
    const-string p1, "already connected"

    .line 338
    .line 339
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    throw p0
.end method

.method public handshake()LO4/v;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 2
    .line 3
    return-object p0
.end method

.method isEligible(LO4/a;Ljava/util/List;)Z
    .locals 3
    .param p2    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LO4/a;",
            "Ljava/util/List<",
            "LO4/I;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->transmitters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lokhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-ge v0, v1, :cond_7

    .line 11
    .line 12
    iget-boolean v0, p0, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object v0, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 18
    .line 19
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 20
    .line 21
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1, p1}, Lokhttp3/internal/Internal;->equalsNonHost(LO4/a;LO4/a;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    return v2

    .line 32
    :cond_1
    invoke-virtual {p1}, LO4/a;->l()LO4/x;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, LO4/x;->m()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, LO4/x;->m()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v1, 0x1

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    return v1

    .line 64
    :cond_2
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 65
    .line 66
    if-nez v0, :cond_3

    .line 67
    .line 68
    return v2

    .line 69
    :cond_3
    if-eqz p2, :cond_7

    .line 70
    .line 71
    invoke-direct {p0, p2}, Lokhttp3/internal/connection/RealConnection;->routeMatchesAny(Ljava/util/List;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_4

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    invoke-virtual {p1}, LO4/a;->e()Ljavax/net/ssl/HostnameVerifier;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    sget-object v0, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    .line 83
    .line 84
    if-eq p2, v0, :cond_5

    .line 85
    .line 86
    return v2

    .line 87
    :cond_5
    invoke-virtual {p1}, LO4/a;->l()LO4/x;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p0, p2}, Lokhttp3/internal/connection/RealConnection;->supportsUrl(LO4/x;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-nez p2, :cond_6

    .line 96
    .line 97
    return v2

    .line 98
    :cond_6
    :try_start_0
    invoke-virtual {p1}, LO4/a;->a()LO4/g;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p1}, LO4/a;->l()LO4/x;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, LO4/x;->m()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0}, Lokhttp3/internal/connection/RealConnection;->handshake()LO4/v;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, LO4/v;->d()Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p2, p1, p0}, LO4/g;->a(Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLPeerUnverifiedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    return v1

    .line 122
    :catch_0
    :cond_7
    :goto_0
    return v2
.end method

.method public isHealthy(Z)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/net/Socket;->isInputShutdown()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/net/Socket;->isOutputShutdown()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    invoke-virtual {v0, p0, p1}, Lokhttp3/internal/http2/Http2Connection;->isHealthy(J)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 v0, 0x1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    :try_start_0
    iget-object p1, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/net/Socket;->getSoTimeout()I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :try_start_1
    iget-object v2, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 55
    .line 56
    invoke-interface {v2}, Lokio/g;->O()Z

    .line 57
    .line 58
    .line 59
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    :try_start_2
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 65
    .line 66
    .line 67
    return v1

    .line 68
    :cond_2
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 71
    .line 72
    .line 73
    return v0

    .line 74
    :catchall_0
    move-exception v2

    .line 75
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 78
    .line 79
    .line 80
    throw v2
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 81
    :catch_0
    return v1

    .line 82
    :catch_1
    :cond_3
    return v0

    .line 83
    :cond_4
    :goto_0
    return v1
.end method

.method public isMultiplexed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method newCodec(LO4/B;LO4/y$a;)Lokhttp3/internal/http/ExchangeCodec;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lokhttp3/internal/http2/Http2ExchangeCodec;

    .line 6
    .line 7
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->http2Connection:Lokhttp3/internal/http2/Http2Connection;

    .line 8
    .line 9
    invoke-direct {v0, p1, p0, p2, v1}, Lokhttp3/internal/http2/Http2ExchangeCodec;-><init>(LO4/B;Lokhttp3/internal/connection/RealConnection;LO4/y$a;Lokhttp3/internal/http2/Http2Connection;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 14
    .line 15
    invoke-interface {p2}, LO4/y$a;->readTimeoutMillis()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 23
    .line 24
    invoke-interface {v0}, Lokio/B;->timeout()Lokio/C;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {p2}, LO4/y$a;->readTimeoutMillis()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-long v1, v1

    .line 33
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2, v3}, Lokio/C;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/C;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 39
    .line 40
    invoke-interface {v0}, Lokio/z;->timeout()Lokio/C;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p2}, LO4/y$a;->writeTimeoutMillis()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    int-to-long v1, p2

    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lokio/C;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/C;

    .line 50
    .line 51
    .line 52
    new-instance p2, Lokhttp3/internal/http1/Http1ExchangeCodec;

    .line 53
    .line 54
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 55
    .line 56
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 57
    .line 58
    invoke-direct {p2, p1, p0, v0, v1}, Lokhttp3/internal/http1/Http1ExchangeCodec;-><init>(LO4/B;Lokhttp3/internal/connection/RealConnection;Lokio/g;Lokio/f;)V

    .line 59
    .line 60
    .line 61
    return-object p2
.end method

.method newWebSocketStreams(Lokhttp3/internal/connection/Exchange;)Lokhttp3/internal/ws/RealWebSocket$Streams;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lokhttp3/internal/connection/RealConnection;->noNewExchanges()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Lokhttp3/internal/connection/RealConnection$1;

    .line 11
    .line 12
    iget-object v5, p0, Lokhttp3/internal/connection/RealConnection;->source:Lokio/g;

    .line 13
    .line 14
    iget-object v6, p0, Lokhttp3/internal/connection/RealConnection;->sink:Lokio/f;

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    move-object v3, p0

    .line 18
    move-object v7, p1

    .line 19
    invoke-direct/range {v2 .. v7}, Lokhttp3/internal/connection/RealConnection$1;-><init>(Lokhttp3/internal/connection/RealConnection;ZLokio/g;Lokio/f;Lokhttp3/internal/connection/Exchange;)V

    .line 20
    .line 21
    .line 22
    return-object v2
.end method

.method public noNewExchanges()V
    .locals 2

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public onSettings(Lokhttp3/internal/http2/Http2Connection;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p1}, Lokhttp3/internal/http2/Http2Connection;->maxConcurrentStreams()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lokhttp3/internal/connection/RealConnection;->allocationLimit:I

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public onStream(Lokhttp3/internal/http2/Http2Stream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    sget-object p0, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, v0}, Lokhttp3/internal/http2/Http2Stream;->close(Lokhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public protocol()LO4/C;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 2
    .line 3
    return-object p0
.end method

.method public route()LO4/I;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 2
    .line 3
    return-object p0
.end method

.method public socket()Ljava/net/Socket;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->socket:Ljava/net/Socket;

    .line 2
    .line 3
    return-object p0
.end method

.method public supportsUrl(LO4/x;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, LO4/x;->z()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 6
    .line 7
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, LO4/x;->z()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    return v2

    .line 23
    :cond_0
    invoke-virtual {p1}, LO4/x;->m()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 28
    .line 29
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, LO4/x;->m()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const/4 v1, 0x1

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    sget-object v0, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    .line 53
    .line 54
    invoke-virtual {p1}, LO4/x;->m()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 59
    .line 60
    invoke-virtual {p0}, LO4/v;->d()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    check-cast p0, Ljava/security/cert/X509Certificate;

    .line 69
    .line 70
    invoke-virtual {v0, p1, p0}, Lokhttp3/internal/tls/OkHostnameVerifier;->verify(Ljava/lang/String;Ljava/security/cert/X509Certificate;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_1

    .line 75
    .line 76
    return v1

    .line 77
    :cond_1
    return v2

    .line 78
    :cond_2
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "Connection{"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 12
    .line 13
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, LO4/x;->m()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, ":"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 34
    .line 35
    invoke-virtual {v1}, LO4/I;->a()LO4/a;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, LO4/a;->l()LO4/x;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, LO4/x;->z()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, ", proxy="

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 56
    .line 57
    invoke-virtual {v1}, LO4/I;->b()Ljava/net/Proxy;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, " hostAddress="

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 70
    .line 71
    invoke-virtual {v1}, LO4/I;->d()Ljava/net/InetSocketAddress;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v1, " cipherSuite="

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->handshake:LO4/v;

    .line 84
    .line 85
    if-eqz v1, :cond_0

    .line 86
    .line 87
    invoke-virtual {v1}, LO4/v;->a()LO4/j;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const-string v1, "none"

    .line 93
    .line 94
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, " protocol="

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lokhttp3/internal/connection/RealConnection;->protocol:LO4/C;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const/16 p0, 0x7d

    .line 108
    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method trackFailure(Ljava/io/IOException;)V
    .locals 4
    .param p1    # Ljava/io/IOException;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    instance-of v1, p1, Lokhttp3/internal/http2/StreamResetException;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lokhttp3/internal/http2/StreamResetException;

    .line 10
    .line 11
    iget-object p1, p1, Lokhttp3/internal/http2/StreamResetException;->errorCode:Lokhttp3/internal/http2/ErrorCode;

    .line 12
    .line 13
    sget-object v1, Lokhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lokhttp3/internal/http2/ErrorCode;

    .line 14
    .line 15
    if-ne p1, v1, :cond_0

    .line 16
    .line 17
    iget p1, p0, Lokhttp3/internal/connection/RealConnection;->refusedStreamCount:I

    .line 18
    .line 19
    add-int/2addr p1, v2

    .line 20
    iput p1, p0, Lokhttp3/internal/connection/RealConnection;->refusedStreamCount:I

    .line 21
    .line 22
    if-le p1, v2, :cond_4

    .line 23
    .line 24
    iput-boolean v2, p0, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 25
    .line 26
    iget p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 27
    .line 28
    add-int/2addr p1, v2

    .line 29
    iput p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    sget-object v1, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 35
    .line 36
    if-eq p1, v1, :cond_4

    .line 37
    .line 38
    iput-boolean v2, p0, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 39
    .line 40
    iget p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 41
    .line 42
    add-int/2addr p1, v2

    .line 43
    iput p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    instance-of v1, p1, Lokhttp3/internal/http2/ConnectionShutdownException;

    .line 53
    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    :cond_2
    iput-boolean v2, p0, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 57
    .line 58
    iget v1, p0, Lokhttp3/internal/connection/RealConnection;->successCount:I

    .line 59
    .line 60
    if-nez v1, :cond_4

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object v1, p0, Lokhttp3/internal/connection/RealConnection;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 65
    .line 66
    iget-object v3, p0, Lokhttp3/internal/connection/RealConnection;->route:LO4/I;

    .line 67
    .line 68
    invoke-virtual {v1, v3, p1}, Lokhttp3/internal/connection/RealConnectionPool;->connectFailed(LO4/I;Ljava/io/IOException;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    iget p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 72
    .line 73
    add-int/2addr p1, v2

    .line 74
    iput p1, p0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 75
    .line 76
    :cond_4
    :goto_0
    monitor-exit v0

    .line 77
    return-void

    .line 78
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    throw p0
.end method
