.class final Lokhttp3/internal/connection/ExchangeFinder;
.super Ljava/lang/Object;
.source "ExchangeFinder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final address:LO4/a;

.field private final call:LO4/e;

.field private connectingConnection:Lokhttp3/internal/connection/RealConnection;

.field private final connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

.field private final eventListener:LO4/t;

.field private hasStreamFailure:Z

.field private nextRouteToTry:LO4/I;

.field private routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

.field private final routeSelector:Lokhttp3/internal/connection/RouteSelector;

.field private final transmitter:Lokhttp3/internal/connection/Transmitter;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method constructor <init>(Lokhttp3/internal/connection/Transmitter;Lokhttp3/internal/connection/RealConnectionPool;LO4/a;LO4/e;LO4/t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 5
    .line 6
    iput-object p2, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 7
    .line 8
    iput-object p3, p0, Lokhttp3/internal/connection/ExchangeFinder;->address:LO4/a;

    .line 9
    .line 10
    iput-object p4, p0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 11
    .line 12
    iput-object p5, p0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 13
    .line 14
    new-instance p1, Lokhttp3/internal/connection/RouteSelector;

    .line 15
    .line 16
    iget-object p2, p2, Lokhttp3/internal/connection/RealConnectionPool;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    .line 17
    .line 18
    invoke-direct {p1, p3, p2, p4, p5}, Lokhttp3/internal/connection/RouteSelector;-><init>(LO4/a;Lokhttp3/internal/connection/RouteDatabase;LO4/e;LO4/t;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    .line 22
    .line 23
    return-void
.end method

.method private findConnection(IIIIZ)Lokhttp3/internal/connection/RealConnection;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 7
    .line 8
    invoke-virtual {v2}, Lokhttp3/internal/connection/Transmitter;->isCanceled()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_11

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->hasStreamFailure:Z

    .line 16
    .line 17
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 18
    .line 19
    iget-object v4, v3, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 20
    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v4, :cond_0

    .line 23
    .line 24
    iget-boolean v6, v4, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 25
    .line 26
    if-eqz v6, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Lokhttp3/internal/connection/Transmitter;->releaseConnectionNoEvents()Ljava/net/Socket;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto/16 :goto_9

    .line 35
    .line 36
    :cond_0
    move-object v3, v5

    .line 37
    :goto_0
    iget-object v6, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 38
    .line 39
    iget-object v7, v6, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    move-object v4, v5

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move-object v7, v5

    .line 46
    :goto_1
    const/4 v8, 0x1

    .line 47
    if-nez v7, :cond_4

    .line 48
    .line 49
    iget-object v9, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 50
    .line 51
    iget-object v10, v0, Lokhttp3/internal/connection/ExchangeFinder;->address:LO4/a;

    .line 52
    .line 53
    invoke-virtual {v9, v10, v6, v5, v2}, Lokhttp3/internal/connection/RealConnectionPool;->transmitterAcquirePooledConnection(LO4/a;Lokhttp3/internal/connection/Transmitter;Ljava/util/List;Z)Z

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eqz v6, :cond_2

    .line 58
    .line 59
    iget-object v6, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 60
    .line 61
    iget-object v7, v6, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 62
    .line 63
    move-object v6, v5

    .line 64
    move v9, v8

    .line 65
    goto :goto_3

    .line 66
    :cond_2
    iget-object v6, v0, Lokhttp3/internal/connection/ExchangeFinder;->nextRouteToTry:LO4/I;

    .line 67
    .line 68
    if-eqz v6, :cond_3

    .line 69
    .line 70
    iput-object v5, v0, Lokhttp3/internal/connection/ExchangeFinder;->nextRouteToTry:LO4/I;

    .line 71
    .line 72
    :goto_2
    move v9, v2

    .line 73
    goto :goto_3

    .line 74
    :cond_3
    invoke-direct {v0}, Lokhttp3/internal/connection/ExchangeFinder;->retryCurrentRoute()Z

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eqz v6, :cond_4

    .line 79
    .line 80
    iget-object v6, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 81
    .line 82
    iget-object v6, v6, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 83
    .line 84
    invoke-virtual {v6}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move v9, v2

    .line 90
    move-object v6, v5

    .line 91
    :goto_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    invoke-static {v3}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 93
    .line 94
    .line 95
    if-eqz v4, :cond_5

    .line 96
    .line 97
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 98
    .line 99
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 100
    .line 101
    invoke-virtual {v1, v3, v4}, LO4/t;->i(LO4/e;LO4/k;)V

    .line 102
    .line 103
    .line 104
    :cond_5
    if-eqz v9, :cond_6

    .line 105
    .line 106
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 107
    .line 108
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 109
    .line 110
    invoke-virtual {v1, v3, v7}, LO4/t;->h(LO4/e;LO4/k;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    if-eqz v7, :cond_7

    .line 114
    .line 115
    return-object v7

    .line 116
    :cond_7
    if-nez v6, :cond_9

    .line 117
    .line 118
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 119
    .line 120
    if-eqz v1, :cond_8

    .line 121
    .line 122
    invoke-virtual {v1}, Lokhttp3/internal/connection/RouteSelector$Selection;->hasNext()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_9

    .line 127
    .line 128
    :cond_8
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    .line 129
    .line 130
    invoke-virtual {v1}, Lokhttp3/internal/connection/RouteSelector;->next()Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iput-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 135
    .line 136
    move v1, v8

    .line 137
    goto :goto_4

    .line 138
    :cond_9
    move v1, v2

    .line 139
    :goto_4
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 140
    .line 141
    monitor-enter v3

    .line 142
    :try_start_1
    iget-object v4, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 143
    .line 144
    invoke-virtual {v4}, Lokhttp3/internal/connection/Transmitter;->isCanceled()Z

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    if-nez v4, :cond_10

    .line 149
    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 153
    .line 154
    invoke-virtual {v1}, Lokhttp3/internal/connection/RouteSelector$Selection;->getAll()Ljava/util/List;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    iget-object v4, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 159
    .line 160
    iget-object v10, v0, Lokhttp3/internal/connection/ExchangeFinder;->address:LO4/a;

    .line 161
    .line 162
    iget-object v11, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 163
    .line 164
    invoke-virtual {v4, v10, v11, v1, v2}, Lokhttp3/internal/connection/RealConnectionPool;->transmitterAcquirePooledConnection(LO4/a;Lokhttp3/internal/connection/Transmitter;Ljava/util/List;Z)Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_b

    .line 169
    .line 170
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 171
    .line 172
    iget-object v7, v2, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 173
    .line 174
    move v9, v8

    .line 175
    goto :goto_5

    .line 176
    :catchall_1
    move-exception v0

    .line 177
    goto/16 :goto_8

    .line 178
    .line 179
    :cond_a
    move-object v1, v5

    .line 180
    :cond_b
    :goto_5
    if-nez v9, :cond_d

    .line 181
    .line 182
    if-nez v6, :cond_c

    .line 183
    .line 184
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 185
    .line 186
    invoke-virtual {v2}, Lokhttp3/internal/connection/RouteSelector$Selection;->next()LO4/I;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    :cond_c
    new-instance v7, Lokhttp3/internal/connection/RealConnection;

    .line 191
    .line 192
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 193
    .line 194
    invoke-direct {v7, v2, v6}, Lokhttp3/internal/connection/RealConnection;-><init>(Lokhttp3/internal/connection/RealConnectionPool;LO4/I;)V

    .line 195
    .line 196
    .line 197
    iput-object v7, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectingConnection:Lokhttp3/internal/connection/RealConnection;

    .line 198
    .line 199
    :cond_d
    move-object v10, v7

    .line 200
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 201
    if-eqz v9, :cond_e

    .line 202
    .line 203
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 204
    .line 205
    iget-object v0, v0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 206
    .line 207
    invoke-virtual {v1, v0, v10}, LO4/t;->h(LO4/e;LO4/k;)V

    .line 208
    .line 209
    .line 210
    return-object v10

    .line 211
    :cond_e
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 212
    .line 213
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 214
    .line 215
    move/from16 v11, p1

    .line 216
    .line 217
    move/from16 v12, p2

    .line 218
    .line 219
    move/from16 v13, p3

    .line 220
    .line 221
    move/from16 v14, p4

    .line 222
    .line 223
    move/from16 v15, p5

    .line 224
    .line 225
    move-object/from16 v16, v2

    .line 226
    .line 227
    move-object/from16 v17, v3

    .line 228
    .line 229
    invoke-virtual/range {v10 .. v17}, Lokhttp3/internal/connection/RealConnection;->connect(IIIIZLO4/e;LO4/t;)V

    .line 230
    .line 231
    .line 232
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 233
    .line 234
    iget-object v2, v2, Lokhttp3/internal/connection/RealConnectionPool;->routeDatabase:Lokhttp3/internal/connection/RouteDatabase;

    .line 235
    .line 236
    invoke-virtual {v10}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v2, v3}, Lokhttp3/internal/connection/RouteDatabase;->connected(LO4/I;)V

    .line 241
    .line 242
    .line 243
    iget-object v2, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 244
    .line 245
    monitor-enter v2

    .line 246
    :try_start_2
    iput-object v5, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectingConnection:Lokhttp3/internal/connection/RealConnection;

    .line 247
    .line 248
    iget-object v3, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 249
    .line 250
    iget-object v4, v0, Lokhttp3/internal/connection/ExchangeFinder;->address:LO4/a;

    .line 251
    .line 252
    iget-object v7, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 253
    .line 254
    invoke-virtual {v3, v4, v7, v1, v8}, Lokhttp3/internal/connection/RealConnectionPool;->transmitterAcquirePooledConnection(LO4/a;Lokhttp3/internal/connection/Transmitter;Ljava/util/List;Z)Z

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    if-eqz v1, :cond_f

    .line 259
    .line 260
    iput-boolean v8, v10, Lokhttp3/internal/connection/RealConnection;->noNewExchanges:Z

    .line 261
    .line 262
    invoke-virtual {v10}, Lokhttp3/internal/connection/RealConnection;->socket()Ljava/net/Socket;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 267
    .line 268
    iget-object v10, v1, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 269
    .line 270
    iput-object v6, v0, Lokhttp3/internal/connection/ExchangeFinder;->nextRouteToTry:LO4/I;

    .line 271
    .line 272
    goto :goto_6

    .line 273
    :catchall_2
    move-exception v0

    .line 274
    goto :goto_7

    .line 275
    :cond_f
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 276
    .line 277
    invoke-virtual {v1, v10}, Lokhttp3/internal/connection/RealConnectionPool;->put(Lokhttp3/internal/connection/RealConnection;)V

    .line 278
    .line 279
    .line 280
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 281
    .line 282
    invoke-virtual {v1, v10}, Lokhttp3/internal/connection/Transmitter;->acquireConnectionNoEvents(Lokhttp3/internal/connection/RealConnection;)V

    .line 283
    .line 284
    .line 285
    :goto_6
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 286
    invoke-static {v5}, Lokhttp3/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 287
    .line 288
    .line 289
    iget-object v1, v0, Lokhttp3/internal/connection/ExchangeFinder;->eventListener:LO4/t;

    .line 290
    .line 291
    iget-object v0, v0, Lokhttp3/internal/connection/ExchangeFinder;->call:LO4/e;

    .line 292
    .line 293
    invoke-virtual {v1, v0, v10}, LO4/t;->h(LO4/e;LO4/k;)V

    .line 294
    .line 295
    .line 296
    return-object v10

    .line 297
    :goto_7
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 298
    throw v0

    .line 299
    :cond_10
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    .line 300
    .line 301
    const-string v1, "Canceled"

    .line 302
    .line 303
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    throw v0

    .line 307
    :goto_8
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 308
    throw v0

    .line 309
    :cond_11
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    .line 310
    .line 311
    const-string v2, "Canceled"

    .line 312
    .line 313
    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    throw v0

    .line 317
    :goto_9
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 318
    throw v0
.end method

.method private findHealthyConnection(IIIIZZ)Lokhttp3/internal/connection/RealConnection;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    :goto_0
    invoke-direct/range {p0 .. p5}, Lokhttp3/internal/connection/ExchangeFinder;->findConnection(IIIIZ)Lokhttp3/internal/connection/RealConnection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget v2, v0, Lokhttp3/internal/connection/RealConnection;->successCount:I

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lokhttp3/internal/connection/RealConnection;->isMultiplexed()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    monitor-exit v1

    .line 19
    return-object v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    move-object p0, v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    invoke-virtual {v0, p6}, Lokhttp3/internal/connection/RealConnection;->isHealthy(Z)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lokhttp3/internal/connection/RealConnection;->noNewExchanges()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-object v0

    .line 35
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method

.method private retryCurrentRoute()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    iget-object v0, v0, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, v0, Lokhttp3/internal/connection/RealConnection;->routeFailureCount:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, LO4/I;->a()LO4/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, LO4/a;->l()LO4/x;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Lokhttp3/internal/connection/ExchangeFinder;->address:LO4/a;

    .line 24
    .line 25
    invoke-virtual {p0}, LO4/a;->l()LO4/x;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v0, p0}, Lokhttp3/internal/Util;->sameConnection(LO4/x;LO4/x;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method


# virtual methods
.method connectingConnection()Lokhttp3/internal/connection/RealConnection;
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectingConnection:Lokhttp3/internal/connection/RealConnection;

    .line 2
    .line 3
    return-object p0
.end method

.method public find(LO4/B;LO4/y$a;Z)Lokhttp3/internal/http/ExchangeCodec;
    .locals 8

    .line 1
    invoke-interface {p2}, LO4/y$a;->connectTimeoutMillis()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-interface {p2}, LO4/y$a;->readTimeoutMillis()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    invoke-interface {p2}, LO4/y$a;->writeTimeoutMillis()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    invoke-virtual {p1}, LO4/B;->w()I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    invoke-virtual {p1}, LO4/B;->C()Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    move-object v1, p0

    .line 22
    move v7, p3

    .line 23
    :try_start_0
    invoke-direct/range {v1 .. v7}, Lokhttp3/internal/connection/ExchangeFinder;->findHealthyConnection(IIIIZZ)Lokhttp3/internal/connection/RealConnection;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1, p2}, Lokhttp3/internal/connection/RealConnection;->newCodec(LO4/B;LO4/y$a;)Lokhttp3/internal/http/ExchangeCodec;

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Lokhttp3/internal/connection/RouteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_0

    .line 35
    :catch_1
    move-exception v0

    .line 36
    move-object p0, v0

    .line 37
    goto :goto_1

    .line 38
    :goto_0
    invoke-virtual {v1}, Lokhttp3/internal/connection/ExchangeFinder;->trackFailure()V

    .line 39
    .line 40
    .line 41
    new-instance p1, Lokhttp3/internal/connection/RouteException;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Lokhttp3/internal/connection/RouteException;-><init>(Ljava/io/IOException;)V

    .line 44
    .line 45
    .line 46
    throw p1

    .line 47
    :goto_1
    invoke-virtual {v1}, Lokhttp3/internal/connection/ExchangeFinder;->trackFailure()V

    .line 48
    .line 49
    .line 50
    throw p0
.end method

.method hasRouteToTry()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->nextRouteToTry:LO4/I;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return v2

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-direct {p0}, Lokhttp3/internal/connection/ExchangeFinder;->retryCurrentRoute()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->transmitter:Lokhttp3/internal/connection/Transmitter;

    .line 20
    .line 21
    iget-object v1, v1, Lokhttp3/internal/connection/Transmitter;->connection:Lokhttp3/internal/connection/RealConnection;

    .line 22
    .line 23
    invoke-virtual {v1}, Lokhttp3/internal/connection/RealConnection;->route()LO4/I;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->nextRouteToTry:LO4/I;

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return v2

    .line 31
    :cond_1
    iget-object v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelection:Lokhttp3/internal/connection/RouteSelector$Selection;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Lokhttp3/internal/connection/RouteSelector$Selection;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_4

    .line 40
    .line 41
    :cond_2
    iget-object p0, p0, Lokhttp3/internal/connection/ExchangeFinder;->routeSelector:Lokhttp3/internal/connection/RouteSelector;

    .line 42
    .line 43
    invoke-virtual {p0}, Lokhttp3/internal/connection/RouteSelector;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    const/4 v2, 0x0

    .line 51
    :cond_4
    :goto_0
    monitor-exit v0

    .line 52
    return v2

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0
.end method

.method hasStreamFailure()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Lokhttp3/internal/connection/ExchangeFinder;->hasStreamFailure:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method trackFailure()V
    .locals 2

    .line 1
    iget-object v0, p0, Lokhttp3/internal/connection/ExchangeFinder;->connectionPool:Lokhttp3/internal/connection/RealConnectionPool;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lokhttp3/internal/connection/ExchangeFinder;->hasStreamFailure:Z

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
